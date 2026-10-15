# gpp-publicatiebank

![Version: 2.6.0](https://img.shields.io/badge/Version-2.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.1.0](https://img.shields.io/badge/AppVersion-2.1.0-informational?style=flat-square)

Een registratie die voorziet in de "Openbare Documenten opslag"-functionaliteiten

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 22.0.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| azureVaultSecret.contentType | string | `""` |  |
| azureVaultSecret.objectName | string | `""` |  |
| azureVaultSecret.secretName | string | `"{{ .Values.existingSecret }}"` |  |
| azureVaultSecret.vaultName | string | `nil` |  |
| beat.enabled | bool | `false` | Run the Celery beat scheduler (`/celery_beat.sh`) as a single-replica Deployment. <details><summary>More information</summary> Required from app version 3.0.0 on: beat schedules the daily task that revokes publications whose inspection period ("inzagetermijn") has ended (GPP-Woo/GPP-publicatiebank#460). Without it that task silently never runs. Always exactly one replica, because a second beat would schedule every task twice. Off by default while appVersion is 2.x, whose beat schedule is empty.</details> |
| beat.podLabels | object | `{}` |  |
| beat.resources | object | `{}` |  |
| existingSecret | string | `nil` |  |
| extraEnvVars | list | `[]` | Array with extra environment variables to add |
| extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes |
| flower.basicAuth | string | `""` | Basic auth credentials in format `user:password` |
| flower.enabled | bool | `true` |  |
| flower.livenessProbe.failureThreshold | int | `6` |  |
| flower.livenessProbe.initialDelaySeconds | int | `60` |  |
| flower.livenessProbe.periodSeconds | int | `10` |  |
| flower.livenessProbe.successThreshold | int | `1` |  |
| flower.livenessProbe.timeoutSeconds | int | `5` |  |
| flower.podLabels | object | `{}` |  |
| flower.readinessProbe.failureThreshold | int | `6` |  |
| flower.readinessProbe.initialDelaySeconds | int | `30` |  |
| flower.readinessProbe.periodSeconds | int | `10` |  |
| flower.readinessProbe.successThreshold | int | `1` |  |
| flower.readinessProbe.timeoutSeconds | int | `5` |  |
| flower.replicaCount | int | `1` |  |
| flower.resources | object | `{}` |  |
| flower.service.annotations | object | `{}` |  |
| flower.service.port | int | `5555` |  |
| flower.service.type | string | `"ClusterIP"` |  |
| flower.strategy | object | `{}` | Update strategy of the Flower Deployment (`.spec.strategy`), see `strategy`. |
| flower.urlPrefix | string | `"/flower/"` |  |
| fullnameOverride | string | `""` |  |
| global.settings.databaseHost | string | `""` | Global databasehost, overrides setting.database.host |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/gpp-woo/gpp-publicatiebank"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` | ingress hosts |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| logVolume.enabled | bool | `true` | Mount a writable `emptyDir` at `logVolume.mountPath` in every container that runs the app: web, Celery worker, beat and Flower (not nginx). <details><summary>More information</summary> open-api-framework's logging configuration always creates its rotating log files there (`application.jsonl`, `performance.log`, `requests.log`, each up to 10 x 10 MB), also when the app logs to stdout (`LOG_STDOUT`, the default). Wherever the image's `/app/log` is not writable the app fails to start: under a `readOnlyRootFilesystem`, or with an arbitrary UID such as OpenShift's restricted-v2 SCC assigns. Skipped when `extraVolumeMounts` already mount something at `mountPath` (the values-only workaround before this chart had it), so existing values keep working. Harmless elsewhere: it also keeps those files out of the container's writable layer.</details> |
| logVolume.mountPath | string | `"/app/log"` | Where the app writes its log files (open-api-framework: `BASE_DIR / "log"`). |
| logVolume.sizeLimit | string | `""` | Optional `sizeLimit` of the emptyDir, e.g. `1Gi`; exceeding it evicts the pod. Empty sets none. |
| nameOverride | string | `""` |  |
| nginx.autoscaling.enabled | bool | `false` |  |
| nginx.config.clientMaxBodySize | string | `"4G"` | Default client_max_body_size for all endpoints (unless overridden). Examples: "10M", "100M", "1G", "4G", "10G". |
| nginx.config.proxyConnectTimeoutSeconds | int | `300` | Proxy connection timeout in seconds. How long nginx waits to establish a connection with the backend. |
| nginx.config.proxyReadTimeoutSeconds | int | `300` | Proxy read timeout in seconds. How long nginx waits for a backend response. |
| nginx.existingConfigmap | string | `nil` |  |
| nginx.image.pullPolicy | string | `"IfNotPresent"` |  |
| nginx.image.repository | string | `"nginxinc/nginx-unprivileged"` |  |
| nginx.image.tag | string | `"stable"` |  |
| nginx.livenessProbe | object | `{}` |  |
| nginx.podLabels | object | `{}` |  |
| nginx.readinessProbe | object | `{}` |  |
| nginx.replicaCount | int | `1` |  |
| nginx.resources | object | `{}` |  |
| nginx.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| nginx.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| nginx.securityContext.runAsNonRoot | bool | `true` |  |
| nginx.securityContext.runAsUser | int | `101` |  |
| nginx.service.annotations | object | `{}` |  |
| nginx.service.port | int | `80` |  |
| nginx.service.type | string | `"ClusterIP"` |  |
| nginx.strategy | object | `{}` | Update strategy of the nginx Deployment (`.spec.strategy`), see `strategy`. |
| nodeSelector | object | `{}` |  |
| pdb.create | bool | `false` |  |
| pdb.maxUnavailable | string | `""` |  |
| pdb.minAvailable | int | `1` |  |
| persistence.enabled | bool | `true` | If persistence is enabled, a PVC is used. Otherwise, the app container will use an emptyDir volume. Note: data in emptyDir volumes is lost when the pod is removed. |
| persistence.existingClaim | string | `nil` | If persistence.existingClaim is set, no PVC will be created, but the referenced PVC will be used to mount a volume in the app container. |
| persistence.mediaMountSubpath | string | `"gpp-publicatiebank/media"` | Specifies a subpath for where to mount the media volume. This will be appended to the the fixed path `/app/media`. |
| persistence.privateMediaMountSubpath | string | `"gpp-publicatiebank/private_media"` | Specifies a subpath for where to mount the private media volume. This will be appended to the the fixed path `/app/private_media`. |
| persistence.size | string | `"1Gi"` |  |
| persistence.storageClassName | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.initialDelaySeconds | int | `30` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `false` |  |
| redis.image | object | `{"registry":"docker.io","repository":"redis","tag":"8.0"}` | Redis image configuration - Migration from Bitnami to official Redis image         |
| redis.master.persistence.enabled | bool | `true` |  |
| redis.master.persistence.size | string | `"8Gi"` |  |
| redis.master.persistence.storageClass | string | `""` |  |
| redis.master.resources.requests.cpu | string | `"10m"` |  |
| redis.master.resources.requests.memory | string | `"20Mi"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| settings.allowedHosts | string | `""` |  |
| settings.cache.axes | string | `""` |  |
| settings.cache.default | string | `""` |  |
| settings.celery.brokerUrl | string | `""` |  |
| settings.celery.logLevel | string | `"debug"` |  |
| settings.celery.resultBackend | string | `""` |  |
| settings.cookieSamesite | string | `""` | Choises Strict or Lax |
| settings.database.host | string | `""` |  |
| settings.database.name | string | `""` |  |
| settings.database.password | string | `""` |  |
| settings.database.port | int | `5432` |  |
| settings.database.sslmode | string | `"prefer"` |  |
| settings.database.username | string | `""` |  |
| settings.debug | bool | `false` |  |
| settings.disable2fa | bool | `false` | Disable two factor authentication |
| settings.djangoSettingsModule | string | `"woo_publications.conf.docker"` |  |
| settings.documentMaxBodySize | string | `"4G"` |  |
| settings.documentsApiSlowOperationsTimeout | string | `""` | Read timeout (seconds) for the Documents API calls whose duration scales with document size: uploading a file part, and unlocking a document (which merges its parts). <details><summary>More information</summary> Rendered as `DOCUMENTS_API_SLOW_OPERATIONS_TIMEOUT`; needs app version 3.0.0 or later. Empty keeps the app default (`300`). A higher timeout configured on the Documents API service itself takes precedence. Keep `nginx.config.proxyReadTimeoutSeconds` at least this high.</details> |
| settings.elasticapm.serviceName | string | `""` |  |
| settings.elasticapm.token | string | `""` |  |
| settings.elasticapm.url | string | `""` |  |
| settings.email.defaultFrom | string | `""` |  |
| settings.email.host | string | `"localhost"` |  |
| settings.email.password | string | `""` |  |
| settings.email.port | int | `25` |  |
| settings.email.useTLS | bool | `false` |  |
| settings.email.username | string | `""` |  |
| settings.environment | string | `""` | sets the 'ENVIRONMENT' variable |
| settings.environmentLabelBackgroundColor | string | `""` | CSS color value for the environment information background color. Defaults to orange, example values can be specified in HEX format too, e.g.: #FF0000 for red. |
| settings.environmentLabelForegroundColor | string | `""` | CSS color value for the environment information text color. Defaults to black. Follows the same rules as ENVIRONMENT_BACKGROUND_COLOR. |
| settings.environmentLabelName | string | `""` | Environment information to display, defaults to the value of ENVIRONMENT. Only displayed when SHOW_ENVIRONMENT is set to True. You can set this to strings like OpenGem PROD or simply PROD, depending on your needs. |
| settings.isHttps | bool | `true` |  |
| settings.secretKey | string | `""` | Generate secret key at https://djecrety.ir/ |
| settings.sentry.dsn | string | `""` |  |
| settings.showLabelEnvironment | bool | `false` | Display environment information in the header in the admin. Defaults to True. Environment information is only displayed to logged in users. |
| settings.useXForwardedHost | bool | `false` |  |
| settings.uwsgi.harakiri | string | `""` |  |
| settings.uwsgi.master | string | `""` |  |
| settings.uwsgi.maxRequests | string | `""` |  |
| settings.uwsgi.processes | string | `""` |  |
| settings.uwsgi.threads | string | `""` |  |
| strategy | object | `{}` | Update strategy of the web Deployment (`.spec.strategy`), rendered verbatim when set. <details><summary>More information</summary> Empty keeps the Kubernetes default (`RollingUpdate` with maxSurge and maxUnavailable 25%), which at one replica starts the new pod before stopping the old one, so every rollout briefly needs the resources of both. `{type: RollingUpdate, rollingUpdate: {maxSurge: 0, maxUnavailable: 1}}` stops the old pod first: no extra resources during the rollout, but a gap while the new pod starts. `{type: Recreate}` does that for all replicas at once. The same setting exists as `worker.strategy`, `nginx.strategy` and `flower.strategy`; Celery beat always uses `Recreate`.</details> |
| tags.redis | bool | `true` |  |
| tolerations | list | `[]` |  |
| worker.autoscaling.behavior | object | `{}` |  |
| worker.autoscaling.enabled | bool | `false` |  |
| worker.autoscaling.maxReplicas | int | `100` |  |
| worker.autoscaling.minReplicas | int | `1` |  |
| worker.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| worker.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| worker.concurrency | int | `4` |  |
| worker.label | string | `"1"` |  |
| worker.livenessProbe.enabled | bool | `false` |  |
| worker.livenessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| worker.livenessProbe.exec.command[1] | string | `"-c"` |  |
| worker.livenessProbe.exec.command[2] | string | `"celery --workdir src --app woo_publications.celery inspect --destination celery@${HOSTNAME} active"` |  |
| worker.livenessProbe.failureThreshold | int | `3` |  |
| worker.livenessProbe.initialDelaySeconds | int | `60` |  |
| worker.livenessProbe.periodSeconds | int | `30` |  |
| worker.livenessProbe.successThreshold | int | `1` |  |
| worker.livenessProbe.timeoutSeconds | int | `10` |  |
| worker.maxMemoryPerChildKiB | string | `nil` | Recycle a celery pool child once its resident memory passes this many KiB (celery's `--max-memory-per-child`). <details><summary>More information</summary> Unset means no memory limit; the image bounds child growth by task count instead (`CELERY_WORKER_MAX_TASKS_PER_CHILD`, default `50`). Pick a value below `worker.resources.limits.memory` so a bloated child is retired between tasks instead of the pod being OOMKilled mid-task, e.g. `786432` (768Mi) under a 1Gi limit. Recycling happens between tasks, so no work is lost. Set to `0` to disable the limit explicitly.</details> |
| worker.maxTasksPerChild | string | `nil` | Recycle a celery pool child after this many tasks (celery's `--max-tasks-per-child`). <details><summary>More information</summary> Rendered as `CELERY_WORKER_MAX_TASKS_PER_CHILD` on the celery worker container only. Unset keeps the image default: `50` from app version 3.0.0 on, no recycling before that.</details> |
| worker.name | string | `""` |  |
| worker.podLabels | object | `{}` |  |
| worker.queueName | string | `""` |  |
| worker.replicaCount | int | `1` |  |
| worker.resources | object | `{}` |  |
| worker.strategy | object | `{}` | Update strategy of the Celery worker Deployment (`.spec.strategy`), see `strategy`. <details><summary>More information</summary> The cheapest place to skip the rollout overlap, e.g. `{type: RollingUpdate, rollingUpdate: {maxSurge: 0, maxUnavailable: 1}}`: while no worker runs, new tasks wait in the broker, and a task interrupted by the shutdown is redelivered because the app acknowledges tasks only after they ran (`CELERY_TASK_ACKS_LATE`). The default overlap stops the old worker in the same way, just after the new one is up.</details> |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
