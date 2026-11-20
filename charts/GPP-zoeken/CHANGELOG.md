# Changelog

## 0.4.0-rc.3 (2026-11-20)

- Security mitigation for CVE-2026-114938 (Java4Shell), an RCE in the JDK bundled with Elasticsearch 7.17.3 and later ([Elastic advisory](https://www.elastic.co/blog/java4shell-remote-code-execution-rce-vulnerability)). The default `eck-elasticsearch` nodeSet now sets `ES_JAVA_OPTS: "-XX:-UseBASE64Intrinsics"` on the `elasticsearch` container, Elastic's documented workaround. ECK rolls the Elasticsearch pods to apply it. Only x86-64 nodes with AVX512_VBMI (Intel Ice Lake and later, AMD Zen 4 and later) are vulnerable; on other nodes the flag is harmless. Releases that override `eck-elasticsearch.nodeSets` replace the whole list and must add the flag to each nodeSet themselves (append it to an existing `ES_JAVA_OPTS`, don't add a second one).
- Elasticsearch `8.19.12` -> `8.19.25` (`eck-elasticsearch.version`), the latest 8.19 patch. It does not fix CVE-2026-114938 yet: Elastic ships the fix in 8.19.26, which is not released at the time of writing. A follow-up release moves to 8.19.26. Remove the `-XX:-UseBASE64Intrinsics` flag again with the upgrade to Elasticsearch 8.19.26 or later, which fixes CVE-2026-114938; doing both in one release rolls the Elasticsearch pods only once.

## 0.4.0-rc.2 (2026-11-10)

- Fix the worker `livenessProbe` default command, which pointed at `openforms.celery` - an Open Forms leftover that doesn't exist in this image. The probe now targets the actual Celery app, `woo_search.celery`, matching `bin/celery_worker.sh`. With `worker.livenessProbe.enabled: true` the old default failed to import and crash-looped an otherwise healthy indexing worker.
- Pin the Redis image to an exact patch with an immutable digest: `redis:8.0` (a floating minor tag) is now `redis:8.0.6@sha256:ae471bdc...`. The `<version>@<digest>` form keeps the ref reproducible and lets Renovate update both.
- Patch-level dependency bumps, no template or values changes: redis 22.0.1 -> 22.0.7, eck-operator 3.3.1 -> 3.3.2 and eck-elasticsearch 0.18.1 -> 0.18.2.

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