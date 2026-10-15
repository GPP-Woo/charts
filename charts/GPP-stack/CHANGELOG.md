# Changelog

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