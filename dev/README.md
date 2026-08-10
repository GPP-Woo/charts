# dev/ — run the GPP charts locally & in CI (kind)

Single source of truth: the production charts under `charts/`. This `dev/` tree adds
only the **test-only** pieces the charts intentionally leave external, so the same
charts run on a laptop, in CI, and in production.

```
dev/
  infra/     tiny dependency-free chart: PostGIS, pre-seeded Keycloak, NodePorts
  openzaak/  dev-only OpenZaak (Documenten API): web + celery, fixture-provisioned
  seed/      post-install Job: ODRC API token, admin OIDC config, information categories
  values/    per-app overlays (odrc/odpc/odbp/zoeken) — plain-http OIDC, test creds, local images
../hack/
  kind-config.yaml   host<->NodePort mappings (identical local & CI)
  up.sh / down.sh     one-command bring-up / teardown
```

## Run it

```bash
cd charts
bash hack/up.sh                 # full stack (kind + build images + charts + seed)
ZOEKEN=0 bash hack/up.sh        # skip gpp-zoeken/ECK, faster
OPENZAAK=0 bash hack/up.sh      # skip openzaak
SKIP_BUILD=1 bash hack/up.sh    # reuse existing *:local images
bash hack/down.sh               # delete the cluster
```

First run builds five images from source (incl. cloning `open-zaak`), so expect ~10-15 min;
subsequent runs with `SKIP_BUILD=1` are fast.

Services on localhost: keycloak `:8080`, odrc `:8000`, openzaak `:8001`, zoeken `:8110`,
odpc `:8130`, odbp `:8140`.
Point the e2e suite at those (see `.github/workflows/e2e-k8s.yml` in the e2e-tests repo).

## What the charts already own vs. what dev/ supplies

| Concern | Owner |
|---|---|
| the 4 GPP apps + redis + Elasticsearch (ECK) | the charts (unchanged) |
| Postgres (external `settings.database.*`) | `dev/infra` (single PostGIS) |
| IdP (external `settings.oidc.*`) | `dev/infra` (Keycloak + realm import) |
| OpenZaak / Documenten API (no upstream chart) | `dev/openzaak` |
| plain-http OIDC, test creds, local image tags | `dev/values/*` |
| API token / OIDC / category seed data | `dev/seed` |

Only **one** chart change was needed to make this work with an internal non-HTTPS IdP:
an `OIDC_REQUIRE_HTTPS` knob (`settings.oidc.requireHttps`) added to GPP-app + GPP-burgerportaal
— an upstreamable feature, not a test hack.

## Gotchas baked into hack/up.sh (learned the hard way)

- **Everything is built natively — no emulation anywhere.** The published GPP Django
  images (publicatiebank/zoeken) and openzaak are **amd64-only**, and under qemu their
  *compiled* binaries misbehave on arm64: uWSGI reports a garbage `listen queue full`
  counter and never serves, and openzaak's `pg_isready` never sees the database. So
  up.sh builds all five apps from the sibling source checkouts (`openzaak` is cloned on
  demand) and `kind load`s them with `imagePullPolicy: Never`. Same path on CI (amd64),
  so local and CI run identical images. **No Rosetta or binfmt required.**
- **containerd nofile → 6GB OOM.** kind runs containerd with `LimitNOFILE=infinity`
  (1073741816) and containers inherit it. uWSGI sizes internal tables from
  `RLIMIT_NOFILE`, so a single worker balloons to ~6GB and the node OOM-killer takes the
  whole pod cgroup (`memory.oom.group`) — it looks like a crashloop with exit 137 and no
  `OOMKilled` reason. up.sh caps containerd to 1048576 on every kind node before
  installing anything. This is why odrc/zoeken/openzaak web pods stay up.
- **`DB_PORT` collides with the `db` Service.** Kubernetes injects `DB_PORT=tcp://<ip>:5432`
  into every pod for the Service named `db`; openzaak's `wait_for_db.sh` does
  `PGPORT=${DB_PORT:-5432}`, so it waits forever on an invalid port. `dev/openzaak`
  sets `DB_PORT: "5432"` explicitly to win over the injected value.
- **ECK needs CRDs installed first.** The eck-operator chart ships its CRDs as *templates*,
  so Helm can't create the `Elasticsearch` CR in the same release that registers its CRD.
  up.sh installs the (vendored, version-locked) eck-operator as its own release first, and
  `dev/values/zoeken.yaml` sets `eck-operator.enabled: false`. The zoeken upgrade also uses
  `--force-conflicts` because the operator co-owns `.spec.nodeSets` via server-side apply.
- **ES auth/TLS.** ECK serves ES over TLS with a self-signed CA and auto-generates the
  `elastic` password. The chart never provisions its own `gpp-elastic` user (its CR leaves
  `spec.auth` empty), so zoeken uses the built-in `elastic` superuser: the CA is mounted
  from `…-es-http-certs-public` and the password injected from `…-es-elastic-user`.
- **PostGIS:** `postgis/postgis` is amd64-only; we use the multi-arch `imresamu/postgis`.
- **Bitnami:** the redis subchart's *chart* comes from the bitnami repo (up.sh adds it);
  the *image* is the official `redis` (the chart already migrated off Bitnami's image).
- **Elasticsearch (ECK):** needs `vm.max_map_count=262144`. Docker Desktop's VM has it;
  CI sets it via `sudo sysctl`.
- **ODPC Documenten API Host.** `settings.gppPublicatiebank.baseUrl` must be the
  in-cluster FQDN (`gpp-publicatiebank-nginx.<ns>.svc.cluster.local`). A bare
  svc name makes ODRC mint informatieobjecttype URLs OpenZaak rejects (`bad-url`),
  so ODPC `POST /api/v2/documenten` 500s.
- **OpenZaak SENDFILE.** The default `django_sendfile.backends.nginx` assumes an
  nginx `X-Accel-Redirect` consumer. Kind has none, so document downloads hang or
  return empty bodies and zoeken never ingests file text. `dev/openzaak` sets
  `SENDFILE_BACKEND=django_sendfile.backends.development`.
- **ODRC `gpp_search_service` + zoeken download Services.** Without these, publish
  indexes nothing into ES (celery logs `no_gpp_search_service_configured`) and
  document *body* search stays empty (`gpp_publicatiebank_service_not_found`).
  `dev/seed` wires both idempotently.
- **Burgerportaal sitemap cache.** Prod default is 23h; e2e membership/propagation
  needs `settings.sitemapCacheDurationHours: 0` in `dev/values/odbp.yaml`.
- **NodePort selectors:** odrc's nginx and gpp-zoeken pods carry only
  `app.kubernetes.io/name` (no `instance` label), so `dev/infra`'s nodeport entries omit
  `instance` for those two — otherwise the Service selects nothing.

## Issuer parity (the subtle bit)

Keycloak stamps a fixed issuer `http://keycloak.woo-search.local:8080/realms/gpp-local`
regardless of caller (via `KC_HOSTNAME`). Both sides must reach it under that exact name:
- **browser:** kind maps host `:8080` → keycloak; Playwright maps the hostname to `127.0.0.1`.
- **backends:** up.sh adds a **CoreDNS rewrite** so in-cluster pods resolve
  `keycloak.woo-search.local` → the keycloak Service. Same issuer string on both paths →
  token validation passes.
