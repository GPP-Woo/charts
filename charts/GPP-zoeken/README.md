# gpp-zoeken

![Version: 0.4.0-rc.0](https://img.shields.io/badge/Version-0.4.0--rc.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.2.1](https://img.shields.io/badge/AppVersion-2.2.1-informational?style=flat-square)

Een zoek-component die voorziet in een "Openbare documenten"-index.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 22.0.1 |
| https://helm.elastic.co | eck-elasticsearch | 0.18.1 |
| https://helm.elastic.co | eck-operator | 3.3.1 |

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
| eck-elasticsearch.annotations | object | `{}` |  |
| eck-elasticsearch.auth | object | `{}` |  |
| eck-elasticsearch.enabled | bool | `true` |  |
| eck-elasticsearch.fullnameOverride | string | `"gpp-eck-elasticsearch"` |  |
| eck-elasticsearch.http | object | `{}` |  |
| eck-elasticsearch.ingress.annotations | object | `{}` |  |
| eck-elasticsearch.ingress.enabled | bool | `false` |  |
| eck-elasticsearch.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| eck-elasticsearch.ingress.hosts[0].path | string | `"/"` |  |
| eck-elasticsearch.ingress.labels | object | `{}` |  |
| eck-elasticsearch.ingress.pathType | string | `"Prefix"` |  |
| eck-elasticsearch.ingress.tls.enabled | bool | `false` |  |
| eck-elasticsearch.labels | object | `{}` |  |
| eck-elasticsearch.monitoring | object | `{}` |  |
| eck-elasticsearch.nameOverride | string | `"gpp-eck-elasticsearch"` |  |
| eck-elasticsearch.nodeSets[0].config."node.store.allow_mmap" | bool | `false` |  |
| eck-elasticsearch.nodeSets[0].count | int | `1` |  |
| eck-elasticsearch.nodeSets[0].name | string | `"default"` |  |
| eck-elasticsearch.nodeSets[0].podTemplate.spec.containers[0].name | string | `"elasticsearch"` |  |
| eck-elasticsearch.nodeSets[0].podTemplate.spec.containers[0].resources.limits.memory | string | `"2Gi"` |  |
| eck-elasticsearch.nodeSets[0].podTemplate.spec.containers[0].resources.requests.memory | string | `"2Gi"` |  |
| eck-elasticsearch.remoteClusters | object | `{}` |  |
| eck-elasticsearch.secureSettings | list | `[]` |  |
| eck-elasticsearch.transport | object | `{}` |  |
| eck-elasticsearch.updateStrategy | object | `{}` |  |
| eck-elasticsearch.version | string | `"8.19.12"` |  |
| eck-elasticsearch.volumeClaimDeletePolicy | string | `""` |  |
| eck-operator.affinity | object | `{}` |  |
| eck-operator.automountServiceAccountToken | bool | `true` |  |
| eck-operator.config.caDir | string | `""` |  |
| eck-operator.config.caRotateBefore | string | `"24h"` |  |
| eck-operator.config.caValidity | string | `"8760h"` |  |
| eck-operator.config.certificatesRotateBefore | string | `"24h"` |  |
| eck-operator.config.certificatesValidity | string | `"8760h"` |  |
| eck-operator.config.containerRegistry | string | `"docker.elastic.co"` |  |
| eck-operator.config.disableConfigWatch | bool | `false` |  |
| eck-operator.config.elasticsearchClientTimeout | string | `"180s"` |  |
| eck-operator.config.elasticsearchObservationInterval | string | `"10s"` |  |
| eck-operator.config.enableLeaderElection | bool | `true` |  |
| eck-operator.config.exposedNodeLabels[0] | string | `"topology.kubernetes.io/.*"` |  |
| eck-operator.config.exposedNodeLabels[1] | string | `"failure-domain.beta.kubernetes.io/.*"` |  |
| eck-operator.config.ipFamily | string | `""` |  |
| eck-operator.config.kubeClientTimeout | string | `"60s"` |  |
| eck-operator.config.logVerbosity | string | `"0"` |  |
| eck-operator.config.maxConcurrentReconciles | string | `"3"` |  |
| eck-operator.config.metrics.port | string | `"0"` |  |
| eck-operator.config.metrics.secureMode.enabled | bool | `false` |  |
| eck-operator.config.metrics.secureMode.tls.certificateSecret | string | `""` |  |
| eck-operator.config.metricsPort | int | `0` |  |
| eck-operator.config.setDefaultSecurityContext | string | `"auto-detect"` |  |
| eck-operator.config.ubiOnly | bool | `false` |  |
| eck-operator.config.validateStorageClass | bool | `true` |  |
| eck-operator.createClusterScopedResources | bool | `true` |  |
| eck-operator.enabled | bool | `true` |  |
| eck-operator.env | list | `[]` |  |
| eck-operator.fullnameOverride | string | `"gpp-eck-operator"` |  |
| eck-operator.hostNetwork | bool | `false` |  |
| eck-operator.image.fips | bool | `false` |  |
| eck-operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| eck-operator.image.repository | string | `"docker.elastic.co/eck/eck-operator"` |  |
| eck-operator.image.tag | string | `nil` |  |
| eck-operator.imagePullSecrets | list | `[]` |  |
| eck-operator.installCRDs | bool | `false` |  |
| eck-operator.kubeAPIServerIP | string | `nil` |  |
| eck-operator.managedNamespaces | list | `[]` |  |
| eck-operator.nameOverride | string | `"gpp-eck-operator"` |  |
| eck-operator.nodeSelector | object | `{}` |  |
| eck-operator.podAnnotations | object | `{}` |  |
| eck-operator.podDisruptionBudget.enabled | bool | `false` |  |
| eck-operator.podDisruptionBudget.minAvailable | int | `1` |  |
| eck-operator.podLabels | object | `{}` |  |
| eck-operator.podMonitor.annotations | object | `{}` |  |
| eck-operator.podMonitor.enabled | bool | `false` |  |
| eck-operator.podMonitor.interval | string | `"5m"` |  |
| eck-operator.podMonitor.labels | object | `{}` |  |
| eck-operator.podMonitor.podMetricsEndpointConfig | object | `{}` |  |
| eck-operator.podMonitor.podTargetLabels | list | `[]` |  |
| eck-operator.podMonitor.scrapeTimeout | string | `"30s"` |  |
| eck-operator.podSecurityContext.runAsNonRoot | bool | `true` |  |
| eck-operator.priorityClassName | string | `""` |  |
| eck-operator.refs.enforceRBAC | bool | `false` |  |
| eck-operator.replicaCount | int | `1` |  |
| eck-operator.resources.limits.cpu | int | `1` |  |
| eck-operator.resources.limits.memory | string | `"1Gi"` |  |
| eck-operator.resources.requests.cpu | string | `"100m"` |  |
| eck-operator.resources.requests.memory | string | `"150Mi"` |  |
| eck-operator.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| eck-operator.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| eck-operator.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| eck-operator.securityContext.runAsNonRoot | bool | `true` |  |
| eck-operator.serviceAccount.annotations | object | `{}` |  |
| eck-operator.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| eck-operator.serviceAccount.create | bool | `true` |  |
| eck-operator.serviceAccount.name | string | `""` |  |
| eck-operator.serviceMonitor.caMountDirectory | string | `"/etc/prometheus/secrets/"` |  |
| eck-operator.serviceMonitor.caSecret | string | `""` |  |
| eck-operator.serviceMonitor.enabled | bool | `true` |  |
| eck-operator.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| eck-operator.softMultiTenancy.enabled | bool | `false` |  |
| eck-operator.statefulsetAnnotations | object | `{}` |  |
| eck-operator.statefulsetLabels | object | `{}` |  |
| eck-operator.telemetry.disabled | bool | `false` |  |
| eck-operator.telemetry.distributionChannel | string | `"helm"` |  |
| eck-operator.tolerations | list | `[]` |  |
| eck-operator.tracing.config.ELASTIC_APM_SERVER_TIMEOUT | string | `"30s"` |  |
| eck-operator.tracing.config.ELASTIC_APM_SERVER_URL | string | `"http://localhost:8200"` |  |
| eck-operator.tracing.enabled | bool | `false` |  |
| eck-operator.volumeMounts | list | `[]` |  |
| eck-operator.volumes | list | `[]` |  |
| eck-operator.webhook.caBundle | string | `"Cg=="` |  |
| eck-operator.webhook.certManagerCert | string | `nil` |  |
| eck-operator.webhook.certsDir | string | `"/tmp/k8s-webhook-server/serving-certs"` |  |
| eck-operator.webhook.certsSecret | string | `""` |  |
| eck-operator.webhook.enabled | bool | `true` |  |
| eck-operator.webhook.failurePolicy | string | `"Ignore"` |  |
| eck-operator.webhook.manageCerts | bool | `true` |  |
| eck-operator.webhook.namespaceSelector | object | `{}` |  |
| eck-operator.webhook.objectSelector | object | `{}` |  |
| eck-operator.webhook.port | int | `9443` |  |
| existingSecret | string | `nil` |  |
| existingSecretElastic | string | `nil` |  |
| extraEnvVars | list | `[]` | Array with extra environment variables to add |
| extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes |
| flower.basicAuth | string | `""` | Basic auth credentials in format `user:password` |
| flower.enabled | bool | `false` |  |
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
| flower.urlPrefix | string | `""` |  |
| fullnameOverride | string | `""` |  |
| global.settings.databaseHost | string | `""` | Global databasehost, overrides setting.database.host |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/gpp-woo/gpp-zoeken"` |  |
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
| logVolume.enabled | bool | `true` | Mount a writable `emptyDir` at `logVolume.mountPath` in every container that runs the app: web, Celery worker, Flower and the index Job. <details><summary>More information</summary> open-api-framework's logging configuration always creates its rotating log files there (`application.jsonl`, `performance.log`, `requests.log`, each up to 10 x 10 MB), also when the app logs to stdout (`LOG_STDOUT`, the default). Wherever the image's `/app/log` is not writable the app fails to start: under a `readOnlyRootFilesystem`, or with an arbitrary UID such as OpenShift's restricted-v2 SCC assigns. Skipped when `extraVolumeMounts` already mount something at `mountPath` (the values-only workaround before this chart had it), so existing values keep working. Harmless elsewhere: it also keeps those files out of the container's writable layer.</details> |
| logVolume.mountPath | string | `"/app/log"` | Where the app writes its log files (open-api-framework: `BASE_DIR / "log"`). |
| logVolume.sizeLimit | string | `""` | Optional `sizeLimit` of the emptyDir, e.g. `1Gi`; exceeding it evicts the pod. Empty sets none. |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| pdb.create | bool | `false` |  |
| pdb.maxUnavailable | string | `""` |  |
| pdb.minAvailable | int | `1` |  |
| persistence.existingClaim | string | `nil` |  |
| persistence.logsMountSubpath | string | `"gpp-zoeken/logs"` |  |
| persistence.mediaMountSubpath | string | `"gpp-zoeken/media"` |  |
| persistence.privateMediaMountSubpath | string | `"gpp-zoeken/private_media"` |  |
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
| settings.djangoSettingsModule | string | `"woo_search.conf.docker"` |  |
| settings.elastic.caCertsPath | string | `""` | Path to CA bundle (in PEM) format if self-signed certificates or a private CA are used to connect to the ES cluster |
| settings.elastic.iniIndices | bool | `false` | Initialise the Elasticsearch indices in every web container at start-up (`INIT_ES_INDICES`). <details><summary>More information</summary> Off by default: the index Job (`settings.job`) does this once per release. Up to app version 2.2.0 the image ignored this setting (it compared the rendered `"True"` case-sensitively with `true`). From 2.2.1 on it runs `initialize_mappings` before uWSGI starts, and the web container exits when Elasticsearch isn't healthy within `ES_WAIT_TIMEOUT` seconds (default 60, settable through `extraEnvVars`), so web pods crash-loop while Elasticsearch is down. Only turn it on when neither the index Job nor an external job initialises the indices.</details> |
| settings.elastic.password | string | `""` |  |
| settings.elastic.roles | string | `"superuser"` |  |
| settings.elastic.user | string | `"gpp-elastic"` |  |
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
| settings.job.annotations | object | `{}` | Extra annotations for the index Job's metadata, e.g. `argocd.argoproj.io/sync-options: Replace=true,Force=true` so Argo CD recreates instead of patching the immutable Job. |
| settings.job.backoffLimit | int | `6` |  |
| settings.job.enabled | bool | `true` | Render the built-in index Job. Disable it when an external job runs `initialize_mappings` instead (e.g. an Argo CD / Flux PostSync hook), to avoid a redundant Job that also fails GitOps syncs with "spec.template is immutable" when a chart or image bump changes its pod template. |
| settings.job.resources | object | `{}` |  |
| settings.job.restartPolicy | string | `"OnFailure"` |  |
| settings.job.ttlSecondsAfterFinished | int | `0` | 0 Will clean the job after it is finished |
| settings.job.waitForElasticTimeout | int | `300` | Seconds the index Job waits for Elasticsearch to answer and report itself healthy (the `--wait` option of `initialize_mappings`), then it fails and the Job retries. <details><summary>More information</summary> On a fresh install the Job starts together with the Elasticsearch cluster, which took 65 s to answer in a test, so this allows more than the app's own default of 60. `0` checks once. Needs app version 2.2.1 or later (GPP-Woo/GPP-zoeken#138); on 2.2.0 `--wait` takes no argument.</details> |
| settings.secretKey | string | `""` | Generate secret key at https://djecrety.ir/ |
| settings.sentry.dsn | string | `""` |  |
| settings.showLabelEnvironment | bool | `false` | Display environment information in the header in the admin. Defaults to True. Environment information is only displayed to logged in users. |
| settings.useXForwardedHost | bool | `false` |  |
| settings.uwsgi.harakiri | string | `""` | Rendered as `UWSGI_HARAKIRI` (seconds). Takes effect from app version 2.2.1 on; up to 2.2.0 the image's own `--harakiri=1800` flag overrode it. |
| settings.uwsgi.master | string | `""` |  |
| settings.uwsgi.maxRequests | string | `""` |  |
| settings.uwsgi.processes | string | `""` |  |
| settings.uwsgi.threads | string | `""` |  |
| strategy | object | `{}` | Update strategy of the web Deployment (`.spec.strategy`), rendered verbatim when set. <details><summary>More information</summary> Empty keeps the Kubernetes default (`RollingUpdate` with maxSurge and maxUnavailable 25%), which at one replica starts the new pod before stopping the old one, so every rollout briefly needs the resources of both. `{type: RollingUpdate, rollingUpdate: {maxSurge: 0, maxUnavailable: 1}}` stops the old pod first: no extra resources during the rollout, but a gap while the new pod starts. `{type: Recreate}` does that for all replicas at once. The same setting exists as `worker.strategy` and `flower.strategy`.</details> |
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
| worker.livenessProbe.exec.command[2] | string | `"celery --workdir src --app openforms.celery inspect --destination celery@${HOSTNAME} active"` |  |
| worker.livenessProbe.failureThreshold | int | `3` |  |
| worker.livenessProbe.initialDelaySeconds | int | `60` |  |
| worker.livenessProbe.periodSeconds | int | `30` |  |
| worker.livenessProbe.successThreshold | int | `1` |  |
| worker.livenessProbe.timeoutSeconds | int | `10` |  |
| worker.name | string | `""` |  |
| worker.podLabels | object | `{}` |  |
| worker.queueName | string | `""` |  |
| worker.replicaCount | int | `1` |  |
| worker.resources | object | `{}` |  |
| worker.strategy | object | `{}` | Update strategy of the Celery worker Deployment (`.spec.strategy`), see `strategy`. <details><summary>More information</summary> The cheapest place to skip the rollout overlap, e.g. `{type: RollingUpdate, rollingUpdate: {maxSurge: 0, maxUnavailable: 1}}`: while no worker runs, new tasks wait in the broker, and a task interrupted by the shutdown is redelivered because the app acknowledges tasks only after they ran (`CELERY_TASK_ACKS_LATE`). The default overlap stops the old worker in the same way, just after the new one is up.</details> |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
