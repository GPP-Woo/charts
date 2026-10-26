# Changelog

## 0.4.0-rc.4 (2026-10-26)

Fourth release candidate of the 0.4.x line, now with GPP-publicatiebank 3.0.0 and Open
Zaak 1.31. Every GPP component runs its subchart's default image (`appVersion`); only Open
Zaak's image tag comes from the umbrella.

- Bumped GPP-publicatiebank to 3.0.0-rc.0 (`appVersion` 3.0.0, was 2.1.0). The subchart
  now enables Celery beat itself, so the umbrella's `gpp-publicatiebank.beat.enabled: true`
  is gone; the effective default stays `true`.
- Bumped GPP-app to 0.5.0-rc.0 (`appVersion` 4.0.0-rc.0, was 3.1.0). GPP-app 4.0 requires
  GPP-publicatiebank >= 3.0.0, and migrates its database on startup.
- Bumped GPP-burgerportaal to 2.1.0-rc.0 (`appVersion` 5.1.0-rc.0, was 5.0.0).
- Bumped GPP-zoeken to 0.4.0-rc.0 (`appVersion` 2.2.1, was 2.2.0): the index Job waits up
  to `gpp-zoeken.settings.job.waitForElasticTimeout` (300 s) for Elasticsearch and fails
  instead of reporting success without indices; `gpp-zoeken.settings.elastic.iniIndices`
  now defaults to `false`, which keeps index initialisation in the Job (up to 2.2.0 the web
  containers ignored the old `"True"`); `gpp-zoeken.settings.uwsgi.harakiri` and
  `UWSGI_*` variables in `extraEnvVars` take effect.
- Bumped openzaak to 1.16.0-rc.1 (`appVersion` unchanged, 1.30.0): a per-component
  Deployment update `strategy`, and `beat.enabled`.
- Open Zaak image `1.31.1-perftest` (`openzaak.image.tag`; was empty, i.e. 1.30.0), the
  upstream pre-release cut of 1.31.1. It contains open-zaak#2592 (1.31.0: concurrent
  unlocks of same-named uploads could overwrite each other's content) and open-zaak#2607
  (1.31.1), which GPP-publicatiebank 3.0.0 needs to re-link existing documents to its own
  informatieobjecttypen. The override goes once the openzaak chart ships a matching
  `appVersion`.
- Disabled Open Zaak's Celery beat (`openzaak.beat.enabled: false`). Its only own periodic
  task removes finished bulk imports, a feature GPP doesn't use. `false` renders no beat
  Deployment; set `true` to keep it.
- Upgrade notes:
  - A values file that pins a component's `image.tag` keeps that pin and overrides the
    versions above. Remove the pin to run the version this umbrella ships, and move
    GPP-app to 4.0 only together with GPP-publicatiebank 3.0.0.
  - GPP-publicatiebank 3.0.0 is a major release with manual steps in GPP-publicatiebank
    and Open Zaak: document uploads fail until the Catalogi API is configured. See its
    [3.0.0 upgrade procedure](https://github.com/GPP-Woo/GPP-publicatiebank/blob/3.0.0/CHANGELOG.rst);
    the app's `setup_catalogi_api` management command can do the setup.
  - After the move to Open Zaak 1.31, run the read-only
    `python src/manage.py detect_overwritten_documents` in an openzaak pod (Open Zaak's
    1.31.0 changelog).
  - Releases that stopped Open Zaak's beat with `openzaak.beat.replicaCount: 0` can drop
    that value: the beat Deployment is now removed altogether.

## 0.4.0-rc.3 (2026-10-16)

- Bumped GPP-zoeken to 0.3.1 (`appVersion` unchanged, 2.2.0): the index Job can be turned
  off (`gpp-zoeken.settings.job.enabled: false`, e.g. when an Argo CD / Flux PostSync hook
  runs `initialize_mappings` instead) or carry extra annotations
  (`gpp-zoeken.settings.job.annotations`, e.g. `argocd.argoproj.io/sync-options:
  Replace=true,Force=true`). Under Argo CD a chart or image bump otherwise fails the sync,
  because the Job's pod template is immutable.
- Upgrade note: the Job's pod template carries the chart version label, so this bump
  changes it too. Under Argo CD, set either value in the same sync that moves to this
  version. Helm-managed releases with the default `ttlSecondsAfterFinished: 0` are
  unaffected: their finished Job is already gone.

## 0.4.0-rc.2 (2026-10-14)

Second release candidate of the 0.4.x line, which targets GPP-publicatiebank 3.0.0 and
Open Zaak 1.31.

- Enabled GPP-publicatiebank's Celery beat by default (`gpp-publicatiebank.beat.enabled: true`).
  GPP-publicatiebank 3.0.0 needs exactly one beat for the daily revocation of publications
  whose inspection period has ended (GPP-Woo/GPP-publicatiebank#460); without it that task
  silently never runs. The subchart itself keeps `false` while its `appVersion` is 2.x. On a
  2.x image beat runs with an empty schedule. Set it to `false` to opt out.
- Bumped GPP-publicatiebank to 2.6.0 (`appVersion` unchanged, 2.1.0): a writable `emptyDir`
  at `/app/log` in the web, worker, beat and Flower containers by default (`logVolume`).
- Bumped GPP-app to 0.4.0 (`appVersion` unchanged, 3.1.0): `gpp-app.settings.uploadTimeoutMinutes`
  and `gpp-app.settings.downloadTimeoutMinutes` (`UPLOAD_TIMEOUT_MINUTES` /
  `DOWNLOAD_TIMEOUT_MINUTES`; empty keeps the app default of 10 minutes). The app aborts a
  file-part upload that takes longer, so slow clients need a longer timeout or smaller
  parts (Open Zaak's `DOCUMENTEN_UPLOAD_CHUNK_SIZE`, default 4 GiB = one part per file).
- Bumped GPP-zoeken to 0.3.0 (`appVersion` unchanged, 2.2.0): the same `/app/log` emptyDir
  in the web, worker and Flower containers and the index Job (`logVolume`), and a
  per-component Deployment update `strategy` (e.g. `worker.strategy` with `maxSurge: 0`).
- Upgrade notes:
  - Releases that already mount something at `/app/log` through `extraVolumeMounts` keep
    their own mount; the subcharts then add none. Those values can be dropped for
    GPP-publicatiebank and GPP-zoeken, but not yet for Open Zaak (below).
  - GPP-publicatiebank's and GPP-zoeken's pods roll (new volume), and a beat pod appears
    where it was not enabled yet: allow for it in namespace ResourceQuotas.
- Open Zaak stays on chart 1.15.0, which has neither a built-in `/app/log` volume nor a
  configurable update strategy yet: keep setting `openzaak.extraVolumes` /
  `openzaak.extraVolumeMounts` where `/app/log` is not writable.

## 0.4.0-rc.1 (2026-10-13)

Release candidate bundling the subchart updates validated on a development instance
running GPP-publicatiebank `3.0.0-rc.0` and Open Zaak `1.31.0-perftest` (both set as
image tags in values; the subcharts' default `appVersion`s are listed below).

- Bumped openzaak to 1.15.0 (`appVersion` 1.30.0; was 1.13.1 / 1.26.0).
  **Requires an Open Zaak image >= 1.30.0.** The web probes now call `/_healthz/`,
  `/_healthz/livez/` and `/_healthz/readyz/`, and the worker gets startup and liveness
  probes (enabled by default) built on `maykin-common` and `/celery_worker_liveness_probe.sh`.
  None of these exist in older images, so a deployment that pins `openzaak.image.tag`
  (e.g. `1.26.0`) must raise it in the same upgrade. Also in 1.14.x and 1.15.0:
  the configuration Job runs as a `post-install,post-upgrade` hook (`backoffLimit: 0`),
  `LOG_REQUESTS` / `LOG_OUTGOING_REQUESTS_*` are rendered explicitly (body saving off),
  `enableServiceLinks: false`, and Azure Blob / S3 Documenten API backends.
- Bumped GPP-publicatiebank to 2.5.0 (`appVersion` unchanged, 2.1.0):
  - optional single-replica Celery beat Deployment, `beat.enabled` (default `false`).
    GPP-publicatiebank 3.0.0 requires exactly one beat;
  - `settings.documentsApiSlowOperationsTimeout`;
  - `worker.maxTasksPerChild` and `worker.maxMemoryPerChildKiB`;
  - per-component Deployment update `strategy`.
- Bumped GPP-zoeken to 0.2.8 (`appVersion` unchanged, 2.2.0): the index Job honours
  `extraVolumes` / `extraVolumeMounts`.
- Removed the umbrella's `openzaak.worker.livenessProbe` and `openzaak.worker.readinessProbe`
  defaults. They were written for the old worker probe, which was disabled by default.
  openzaak 1.15.0 enables a new one (it starts a Python process and pings the broker), and
  the umbrella's `timeoutSeconds: 5` / `failureThreshold: 3` overrode the subchart's
  `15` / `6`. The subchart has no worker readiness probe at all.

## 0.3.3 (2026-08-31)
- Bumped GPP-burgerportaal to 2.0.2 (`SITEMAP_CACHE_DURATION_HOURS` and
  `DOWNLOAD_TIMEOUT_MINUTES` now render when set to `0`).

## 0.3.2 (2026-08-28)
- Bumped GPP-publicatiebank to 2.2.0 (overridable liveness/readiness probe handler).
- Bumped GPP-zoeken to 0.2.7 (overridable liveness/readiness probe handler).
- Bumped GPP-burgerportaal to 2.0.1 (tab-free `RESOURCES__*` ConfigMap keys).

## 0.3.1 (2026-06-04)
- Bumped GPP-publicatiebank to 2.1.0.
- Bumped GPP-stack appVersion to 1.0.1.

## 0.3.0 (2026-04-22)

- Bumped GPP-app to 0.3.2.
- Bumped GPP-publicatiebank to 2.0.8.
- Bumped GPP-burgerportaal to 2.0.0.
- Bumped GPP-zoeken to 0.2.6.
- Bumped openzaak to 1.13.1.

## 0.2.10 (2026-02-23)

- re-enable name overrides for eck charts

## 0.2.9 (2026-02-23)

- re-enable name overrides for redis chart

## 0.2.8 (2026-02-23)

- Keep docs up to date with github action, using values from subcharts

## 0.2.7 (2026-01-21)

- Bumped GPP-app to 0.3.1.
- Bumped GPP-publicatiebank to 2.0.7.

## 0.2.6 (2025-09-03)

- Bumped GPP-zoeken to 0.2.5.

## 0.2.5 (2025-09-03)

- Bumped GPP-app to 0.3.0.
- Bumped GPP-publicatiebank to 2.0.6.
- Bumped GPP-burgerportaal to 1.2.0.
- Bumped GPP-zoeken to 0.2.4.
- Bumped openzaak to 1.10.1.

## 0.2.4 (2025-08-13)

- Bumped GPP-zoeken to 0.2.3.

## 0.2.3 (2025-07-21)

- Bumped GPP-app to 0.2.0.
- Bumped GPP-publicatiebank to 2.0.5.
- Bumped GPP-burgerportaal to 1.1.0.
- Bumped GPP-zoeken to 0.2.2.

## 0.2.2 (2025-05-20)

- Bumped openzaak to 1.8.2.
- Bumped GPP-publicatiebank to 2.0.4.
- Bumped GPP-burgerportaal to 1.0.2.

## 0.2.1 (2025-03-26)

- Bumped GPP-publicatiebank to 2.0.2.

## 0.2.0 (2025-03-24)

- Bumped the existing charts and updated their values.
- Added gpp-zoeken to the umbrella chart.