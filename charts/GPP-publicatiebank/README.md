# gpp-publicatiebank

![Version: 2.0.4](https://img.shields.io/badge/Version-2.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Een registratie die voorziet in de "Openbare Documenten opslag"-functionaliteiten

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 20.2.1 |

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
| nameOverride | string | `""` |  |
| nginx.autoscaling.enabled | bool | `false` |  |
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
| worker.name | string | `""` |  |
| worker.podLabels | object | `{}` |  |
| worker.queueName | string | `""` |  |
| worker.replicaCount | int | `1` |  |
| worker.resources | object | `{}` |  |

