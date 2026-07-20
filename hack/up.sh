#!/usr/bin/env bash
# Bring up the full GPP stack on a local/CI kind cluster from the Helm charts.
# One source of truth: the charts under charts/ + the test-only overlay under dev/.
#
#   ZOEKEN=0     skip gpp-zoeken (ECK Elasticsearch) — faster core-only bring-up
#   OPENZAAK=0   skip openzaak (Documenten API) — on by default
#   SKIP_BUILD=1 reuse existing *:local images
#   USE_EXISTING_CLUSTER=1  install into the current kubectl context (e.g. CI kind, docker-desktop)
set -euo pipefail

CLUSTER=gpp-e2e
NS=gpp-e2e
HACK=$(cd "$(dirname "$0")" && pwd)
CH=$(cd "$HACK/.." && pwd)          # charts/
ROOT=$(cd "$CH/.." && pwd)          # gpp-woo/
APPS="$CH/charts"
DEV="$CH/dev"

step(){ printf '\n\033[1;34m==> %s\033[0m\n' "$1"; }

# 1. Cluster --------------------------------------------------------------
if [ "${USE_EXISTING_CLUSTER:-}" != "1" ]; then
  step "kind cluster $CLUSTER"
  kind get clusters | grep -qx "$CLUSTER" || kind create cluster --name "$CLUSTER" --config "$HACK/kind-config.yaml"
  kubectl config use-context "kind-$CLUSTER"
fi

# 1b. Cap the kind node's file-descriptor limit. kind runs containerd with
#     LimitNOFILE=infinity (1073741816); containers inherit it, and uWSGI (odrc/zoeken
#     web) sizes internal tables by RLIMIT_NOFILE → one worker balloons to ~6GB and the
#     node OOM-killer takes the whole pod. Cap it to a sane value on every kind node.
step "cap containerd nofile on kind nodes"
for node in $(kubectl get nodes -o jsonpath='{.items[*].metadata.name}'); do
  docker exec "$node" bash -c '
    mkdir -p /etc/systemd/system/containerd.service.d
    printf "[Service]\nLimitNOFILE=1048576\n" > /etc/systemd/system/containerd.service.d/nofile.conf
    systemctl daemon-reload && systemctl restart containerd' 2>/dev/null \
    && echo "  capped $node" || echo "  skipped $node (not a kind docker node)"
done

# 2. App images — all four GPP apps built natively from the sibling source repos,
#    so no image is emulated (the amd64 published Django images crash uWSGI under qemu).
if [ "${SKIP_BUILD:-}" != "1" ]; then
  step "build odpc/odbp (.NET)"
  docker build -t odpc:local -f "$ROOT/GPP-app/ODPC.Server/Dockerfile" "$ROOT/GPP-app"
  docker build -t odbp:local -f "$ROOT/GPP-burgerportaal/ODBP.Server/Dockerfile" "$ROOT/GPP-burgerportaal"
  step "build gpp-publicatiebank/gpp-zoeken (Django)"
  # zoeken needs its shared/dotgithub submodule (fileTypes.json) checked out
  git -C "$ROOT/GPP-zoeken" submodule update --init shared/dotgithub >/dev/null 2>&1 || true
  docker build -t gpp-publicatiebank:local "$ROOT/GPP-publicatiebank"
  docker build -t gpp-zoeken:local "$ROOT/GPP-zoeken"
  if [ "${OPENZAAK:-1}" = "1" ]; then
    step "build openzaak (Django) — native, from source (published image is amd64-only)"
    [ -d "$ROOT/open-zaak" ] || git clone --depth 1 --branch "${OPENZAAK_VERSION:-1.14.0}" \
      https://github.com/open-zaak/open-zaak.git "$ROOT/open-zaak"
    docker build -t openzaak:local "$ROOT/open-zaak"
  fi
fi
IMAGES="odpc:local odbp:local gpp-publicatiebank:local gpp-zoeken:local"
[ "${OPENZAAK:-1}" = "1" ] && IMAGES="$IMAGES openzaak:local"
if [ "${USE_EXISTING_CLUSTER:-}" != "1" ] || kubectl config current-context | grep -q "kind-"; then
  step "load images into kind"
  kind load docker-image $IMAGES --name "$CLUSTER"
fi

kubectl create namespace "$NS" --dry-run=client -o yaml | kubectl apply -f -

# 3. CoreDNS rewrite: pods must resolve the OIDC issuer host to the keycloak svc,
#    so backend token validation sees the same issuer as the browser. -----
step "CoreDNS rewrite keycloak.woo-search.local -> keycloak.$NS.svc"
python3 - "$NS" <<'PY'
import subprocess, sys, json
ns = sys.argv[1]
cf = subprocess.check_output(["kubectl","-n","kube-system","get","cm","coredns","-o","jsonpath={.data.Corefile}"]).decode()
rule = f"rewrite name keycloak.woo-search.local keycloak.{ns}.svc.cluster.local"
if rule not in cf:
    cf = cf.replace("ready\n", f"ready\n    {rule}\n", 1)
    subprocess.run(["kubectl","-n","kube-system","create","cm","coredns",
                    f"--from-literal=Corefile={cf}","--dry-run=client","-o","yaml"],
                   check=True, stdout=open("/tmp/coredns.yaml","w"))
    subprocess.run(["kubectl","-n","kube-system","apply","-f","/tmp/coredns.yaml"], check=True)
    subprocess.run(["kubectl","-n","kube-system","rollout","restart","deploy/coredns"], check=True)
print("coredns rewrite applied")
PY

# 4. Infra: postgis + keycloak + nodeports -------------------------------
step "infra (postgis, keycloak, nodeports)"
helm upgrade --install infra "$DEV/infra" -n "$NS" --wait --timeout 5m

# 5. App charts ----------------------------------------------------------
helm repo add bitnami https://charts.bitnami.com/bitnami >/dev/null 2>&1 || true
helm repo add elastic https://helm.elastic.co >/dev/null 2>&1 || true   # eck-operator/eck-elasticsearch (zoeken)
helm repo update bitnami elastic >/dev/null
for c in GPP-publicatiebank GPP-app GPP-burgerportaal; do
  helm dependency build "$APPS/$c" >/dev/null
done
step "odrc (gpp-publicatiebank)"
helm upgrade --install odrc "$APPS/GPP-publicatiebank" -n "$NS" -f "$DEV/values/odrc.yaml" --wait --timeout 5m
step "odpc (gpp-app)"
helm upgrade --install odpc "$APPS/GPP-app" -n "$NS" -f "$DEV/values/odpc.yaml" --wait --timeout 5m
step "odbp (gpp-burgerportaal)"
helm upgrade --install odbp "$APPS/GPP-burgerportaal" -n "$NS" -f "$DEV/values/odbp.yaml" --wait --timeout 5m

if [ "${ZOEKEN:-1}" = "1" ]; then
  helm dependency build "$APPS/GPP-zoeken" >/dev/null
  # ECK CRDs must exist before the zoeken release creates its Elasticsearch CR, so install
  # the (vendored, version-locked) eck-operator — which ships the CRDs — as its own release first.
  step "eck-operator (ECK CRDs + operator)"
  helm upgrade --install eck-operator "$APPS/GPP-zoeken/charts/eck-operator-3.3.1.tgz" -n "$NS" --wait --timeout 5m
  step "zoeken (gpp-zoeken + Elasticsearch)"
  # --force-conflicts: the ECK operator co-owns the Elasticsearch CR's .spec.nodeSets via
  # server-side apply; without this a re-run of up.sh conflicts on that field.
  helm upgrade --install zoeken "$APPS/GPP-zoeken" -n "$NS" -f "$DEV/values/zoeken.yaml" \
    --force-conflicts --wait --timeout 12m
fi

if [ "${OPENZAAK:-1}" = "1" ]; then
  step "openzaak (Documenten API — dev chart)"
  helm upgrade --install openzaak "$DEV/openzaak" -n "$NS" --wait --timeout 8m
fi

# 6. Seed (API token, admin OIDC, information categories) ----------------
step "seed"
helm upgrade --install seed "$DEV/seed" -n "$NS"
kubectl -n "$NS" wait --for=condition=complete job/odrc-seed --timeout=300s

step "done — services on localhost: keycloak :8080  odrc :8000  odpc :8130  odbp :8140  zoeken :8110  openzaak :8001"
