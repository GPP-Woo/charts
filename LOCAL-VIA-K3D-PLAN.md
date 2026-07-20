# Option A — charts as the single source, run locally + in CI via k3d/kind

Goal: delete `GPP-deploy` (docker-compose) and make the Helm charts the **only**
definition of the stack. Local dev, e2e-CI, and prod all run the same charts;
the test-only scaffolding becomes a values overlay + a few Jobs.

Branch: `explore/local-via-k3d` (charts repo).

## Why this is feasible

The charts already model every backing service as either a bundled subchart
(redis in publicatiebank; redis + ECK Elasticsearch in zoeken) or an **external
dependency** (Postgres via `settings.database.*`, IdP via `settings.oidc.*`).
`GPP-deploy` only ever provided those externals + seed data. So option A is
"supply the externals and seed data as chart-side test fixtures," not a rewrite.

## Gap map (deploy → chart-side)

| deploy piece | option-A equivalent | where |
|---|---|---|
| `keycloak` + `keycloak/import/gpp-local-realm.json` | in-cluster Keycloak + realm `--import-realm` from a ConfigMap | new `dev/` subchart or bitnami/keycloak dep |
| `init-db.sql`, `init-extensions.sh` | PostGIS + init ConfigMap (3 DBs + postgis/pg_trgm) | bitnami/postgresql dep, `values-e2e.yaml` |
| `load_information_categories`, `fixtures/odrc/*` | post-install hook Jobs | `dev/templates/seed-*.yaml` |
| `OIDC_REQUIRE_HTTPS=false`, test image tags, no ingress/TLS | overlay | `values-e2e.yaml` |
| local-built `odpc`/`odbp` | `k3d image import` OR published image (see OPEN Q1) | runner script |
| issuer-hostname trick (`--host-resolver-rules`) | fixed Keycloak host + nodeport + hostAlias/CoreDNS rewrite | `values-e2e.yaml`, Playwright config |

## Required chart changes (upstreamable — a point *for* option A)

Confirmed by reading the templates: GPP-app + GPP-burgerportaal containers receive
env **only** via `envFrom` (their own configmap + secret). There is **no `extraEnv`
passthrough**, and the configmap renders every OIDC var **except `OIDC_REQUIRE_HTTPS`**
— the one knob deploy needs for a plain-http local Keycloak. So option A cannot be
overlay-only; it needs a small chart change, one of:

- **(preferred)** render `OIDC_REQUIRE_HTTPS` from `settings.oidc.requireHttps`
  (default `true`) in both charts' `configmap.yaml`. Legit prod knob for internal
  non-HTTPS IdPs, not just a test hack → upstreamable.
- or add a generic `extraEnv` block to both deployments (more general, useful anyway).

This is a *feature*, not a cost: the gaps option A surfaces are real chart
deficiencies. Fixing them improves the published charts for everyone.

## Open questions (resolve before building the runner)

1. **Do the published `ghcr.io/gpp-woo/gpp-app` + `gpp-burgerportaal` images
   already support plain-http OIDC (`OIDC_REQUIRE_HTTPS=false`)?** deploy built
   `odpc`/`odbp` locally because that support "lands via the `feat/local-dev-stack`
   branches." If merged → **no local image build needed**, runner halves. If not →
   keep a build+`k3d image import` step (or an image override in `values-e2e.yaml`).
2. **Issuer parity.** Tokens' `iss` must match for both the Playwright browser and
   the in-cluster backends. Plan: give Keycloak a stable host (e.g.
   `keycloak.gpp.local`), expose via nodeport/ingress, add a `hostAliases` (or
   CoreDNS rewrite) so backends resolve the same name to the Service ClusterIP, and
   keep Playwright's `--host-resolver-rules=MAP keycloak.gpp.local 127.0.0.1`.
   This is the highest-risk bit; prototype it first.
3. **k3d vs kind.** k3d (k3s) is lighter and has built-in loadbalancer + registry;
   kind is what GitHub Actions examples default to. Pick one and use it both places.

## Proposed layout (chart repo)

```
charts/
  charts/GPP-stack/           # unchanged prod umbrella
  dev/                        # NEW — test-only overlay chart (never published)
    Chart.yaml                #   deps: GPP-stack (file://), postgresql, keycloak
    values-e2e.yaml           #   plain-http OIDC, test creds, nodeports, image tags
    templates/
      db-init-configmap.yaml  #   init-db.sql + init-extensions.sh
      seed-categories-job.yaml
      seed-odrc-fixtures-job.yaml
      keycloak-realm-configmap.yaml
  hack/
    up.sh                     # k3d cluster create + (build/import) + helm dep build + install + wait + seed
    down.sh
```

`dev/` keeps every prod chart untouched — it only *composes* them with test
fixtures. Publishing pipeline ignores `dev/`.

## CI (e2e-tests repo)

Replace the "point at shared remote dev env" job with: spin kind → `helm dep build`
→ `helm install ./charts/dev -f values-e2e.yaml` → wait ready → run seed hooks →
`npm run test` against nodeport URLs. Same manifests as local. Validates the real
charts on every PR — the actual win over compose-in-CI.

## Cost / risk

- One-time: Keycloak subchart + realm import, PostGIS init, 2 seed Jobs, issuer
  parity, runner. Medium.
- arm64: k3d on Mac still emulates amd64 images — no improvement over compose there.
- Ongoing: **one** definition to maintain. That is the whole point.

## Next steps

1. Resolve OPEN Q1 (published-image OIDC support) — cuts scope in half either way.
2. Prototype OPEN Q2 (issuer parity) in a throwaway kind cluster — it's the risk.
3. Scaffold `dev/` + `hack/up.sh`; get one `@smoke` e2e scenario green locally.
4. Port the CI job; delete `GPP-deploy` once green.
