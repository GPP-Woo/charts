# Changelog

## 0.2.8 (2026-09-08)

- The `gpp-zoeken-index` Job now passes a wait budget to `initialize_mappings --wait`, via a new
  `settings.job.waitForElasticTimeout` (default 300s). The Job is created in the same release as
  the ECK cluster, so on a fresh install it ran before Elasticsearch was listening; because
  `initialize_mappings` used to exit 0 when it could not connect, the Job reported success and
  the instance came up with no indices.
- **Requires a gpp-zoeken image containing [GPP-Woo/GPP-zoeken#138][zoeken-138]** (merged after
  2.2.0), which taught `--wait` to take an optional timeout and to fail loudly. On 2.2.0 `--wait`
  accepts no argument, so `appVersion` must move to a release that includes it.

[zoeken-138]: https://github.com/GPP-Woo/GPP-zoeken/pull/138

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