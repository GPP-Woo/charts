# Changelog

## 0.4.0-rc.1 (2026-10-28)

- Set appVersion to 2.2.2, a security release: brotli 1.2.1 (CVE-2026-111497), Django 5.2.18, urllib3 2.8.0 and tornado 6.6. The app reads no new or changed settings, so templates and values are unchanged.

## 0.4.0-rc.0 (2026-10-26)

- Set appVersion to 2.2.1.
- The index Job passes a time budget to `initialize_mappings --wait` (`settings.job.waitForElasticTimeout`, default 300 s). On a fresh install the Job starts together with the Elasticsearch cluster. Up to 2.2.0 the command reported success without creating any index when Elasticsearch wasn't up yet; from 2.2.1 on it waits until the cluster is healthy, or fails so the Job retries. Needs app version 2.2.1 or later: on 2.2.0 `--wait` takes no argument (#79).
- `settings.elastic.iniIndices` now defaults to `false`, which keeps the existing behaviour: the index Job initialises the indices. Up to 2.2.0 the image ignored the chart's `INIT_ES_INDICES: "True"` (it compared it case-sensitively with `true`), so web containers never initialised them. 2.2.1 honours the setting, and with `true` every web start would wait for Elasticsearch and exit when it isn't healthy within 60 s.
- `settings.uwsgi.harakiri` takes effect from 2.2.1 on; up to 2.2.0 the image's own `--harakiri=1800` flag overrode it. The same goes for `UWSGI_HARAKIRI`, `UWSGI_POST_BUFFERING` and `UWSGI_BUFFER_SIZE` set through `extraEnvVars`.

## 0.3.1 (2026-10-16)

- Make the index Job optional (`settings.job.enabled`, default `true`) and allow extra Job annotations (`settings.job.annotations`). The Job is a plain, unconditional resource, so under GitOps (Argo CD / Flux) any chart bump that changes its pod template - e.g. the 0.3.0 `/app/log` volume or an image-tag bump - fails the sync with `Job.batch "...-index" spec.template: field is immutable`. Set `settings.job.enabled: false` when an external job runs `initialize_mappings` (e.g. a PostSync hook), or add `settings.job.annotations: {argocd.argoproj.io/sync-options: "Replace=true,Force=true"}` to let Argo CD recreate instead of patch. Existing releases render unchanged.

## 0.3.0 (2026-10-14)

- Expose the Deployment update strategy per component: `strategy` (web), `worker.strategy` and `flower.strategy`, rendered verbatim as `.spec.strategy` when set. Empty (the default) keeps the Kubernetes default, so existing releases render unchanged. Typical use: `{type: RollingUpdate, rollingUpdate: {maxSurge: 0, maxUnavailable: 1}}` on the worker, so a rollout no longer briefly runs two worker pods, which counts double against a namespace ResourceQuota. Same setting as GPP-publicatiebank 2.5.0.
- Mount a writable `emptyDir` at `/app/log` in the web, worker and Flower containers and the index Job by default (`logVolume.enabled`, `logVolume.mountPath`, `logVolume.sizeLimit`). open-api-framework always creates its rotating log files there, also when logging to stdout, so the app failed to start wherever the image's `/app/log` is not writable: under a `readOnlyRootFilesystem`, or with an arbitrary UID such as OpenShift's restricted-v2 SCC assigns. A release that already mounts something at that path through `extraVolumeMounts` keeps its own mount and gets no second one. Same setting as GPP-publicatiebank 2.6.0.

## 0.2.8 (2026-10-13)

- Mount `extraVolumes`/`extraVolumeMounts` in the index Job as well, as the Deployments already do (e.g. a writable `/app/log` emptyDir on OpenShift).

## 0.2.7 (2026-08-27)

- Allow the web container's `livenessProbe`/`readinessProbe` handler to be overridden via Helm values. Supplying `exec`, `httpGet`, `tcpSocket` or `grpc` now replaces the hardcoded `httpGet: /` default instead of being rendered alongside it (which the API server rejected as more than one handler type). Probes that set only timing fields are unaffected. Mirrors the same change in GPP-publicatiebank 2.2.0.

## 0.2.6 (2026-04-22)

- Set appVersion to 2.2.0
- update chart dependencies
- move to offical redis image

## 0.2.5 (2025-09-26)

- Fix elastic password not being quoted. 

## 0.2.4 (2025-09-03)

- Set appVersion to 2.1.0

## 0.2.3 (2025-08-13)

- make dependencies conditional

## 0.2.2 (2025-07-18)

- Set appVersion to 2.1.0.rc.0

## 0.2.1 (2025-03-25)

- Allow leaving the ingress backend empty.

## 0.2.0 (2025-03-21)

- Add Flower. 

## 0.1.0 (2025-03-19)

First chart release.