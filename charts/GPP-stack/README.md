# gpp-stack

![Version: 0.4.0-rc.1](https://img.shields.io/badge/Version-0.4.0--rc.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.1](https://img.shields.io/badge/AppVersion-1.0.1-informational?style=flat-square)

An umbrella chart for the GPP stack

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://GPP-Woo.github.io/charts | gpp-app | 0.3.2 |
| https://GPP-Woo.github.io/charts | gpp-burgerportaal | 2.0.2 |
| https://GPP-Woo.github.io/charts | gpp-publicatiebank | 2.5.0 |
| https://GPP-Woo.github.io/charts | gpp-zoeken | 0.2.8 |
| https://maykinmedia.github.io/charts/ | openzaak | 1.15.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.settings.databaseHost | string | `""` | Global databasehost, overrides setting.database.host |
| gpp-app.enabled | bool | `true` |  |
| gpp-burgerportaal.enabled | bool | `true` |  |
| gpp-publicatiebank.enabled | bool | `true` |  |
| gpp-publicatiebank.redis.nameOverride | string | `"gpp-publicatiebank-redis"` |  |
| gpp-zoeken.eck-elasticsearch.enabled | bool | `true` |  |
| gpp-zoeken.eck-elasticsearch.fullnameOverride | string | `"gpp-zoeken-eck-elasticsearch"` |  |
| gpp-zoeken.eck-elasticsearch.nameOverride | string | `"gpp-zoeken-eck-elasticsearch"` |  |
| gpp-zoeken.eck-operator.enabled | bool | `true` |  |
| gpp-zoeken.eck-operator.fullnameOverride | string | `"gpp-zoeken-eck-operator"` |  |
| gpp-zoeken.eck-operator.nameOverride | string | `"gpp-zoeken-eck-operator"` |  |
| gpp-zoeken.enabled | bool | `true` |  |
| gpp-zoeken.redis.nameOverride | string | `"gpp-zoeken-redis"` |  |
| openzaak.affinity | object | `{}` |  |
| openzaak.autoscaling.enabled | bool | `false` |  |
| openzaak.autoscaling.maxReplicas | int | `100` |  |
| openzaak.autoscaling.minReplicas | int | `1` |  |
| openzaak.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| openzaak.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| openzaak.azureVaultSecret.contentType | string | `""` |  |
| openzaak.azureVaultSecret.objectName | string | `""` |  |
| openzaak.azureVaultSecret.secretName | string | `"{{ .Values.existingSecret }}"` |  |
| openzaak.azureVaultSecret.vaultName | string | `nil` |  |
| openzaak.configuration.cronjob.historyLimit | int | `1` |  |
| openzaak.configuration.cronjob.resources | object | `{}` |  |
| openzaak.configuration.cronjob.schedule | string | `"0 0 * * *"` | Schedule to run the clean logged notifications cronjob |
| openzaak.configuration.enabled | bool | `true` |  |
| openzaak.configuration.notificaties.ApiRoot | string | `"http://opennotificaties.example.nl/api/v1/"` |  |
| openzaak.configuration.notificaties.enabled | bool | `true` |  |
| openzaak.configuration.notificaties.openzaakNotifcationClientId | string | `"oz-client-id"` |  |
| openzaak.configuration.notificaties.openzaakNotificationSecret | string | `"oz-secret"` |  |
| openzaak.configuration.notificatiesAuthorization.enabled | bool | `true` |  |
| openzaak.configuration.notificatiesAuthorization.notifcationOpenzaakSecret | string | `"notif-secret"` |  |
| openzaak.configuration.notificatiesAuthorization.notificationOpenzaakClientId | string | `"notif-client-id"` |  |
| openzaak.configuration.selectieLijst.AllowedYears[0] | int | `2017` |  |
| openzaak.configuration.selectieLijst.AllowedYears[1] | int | `2020` |  |
| openzaak.configuration.selectieLijst.ApiOas | string | `"https://selectielijst.openzaak.nl/api/v1/schema/openapi.yaml"` |  |
| openzaak.configuration.selectieLijst.ApiRoot | string | `"https://selectielijst.openzaak.nl/api/v1/"` |  |
| openzaak.configuration.selectieLijst.DefaultYear | int | `2020` |  |
| openzaak.configuration.selectieLijst.enabled | bool | `true` |  |
| openzaak.configuration.sites.enabled | bool | `true` |  |
| openzaak.configuration.sites.openzaakDomain | string | `"openzaak.example.com"` |  |
| openzaak.configuration.sites.organization | string | `"Gemeente Example"` |  |
| openzaak.configuration.superuser.email | string | `""` |  |
| openzaak.configuration.superuser.password | string | `""` |  |
| openzaak.configuration.superuser.username | string | `""` |  |
| openzaak.enabled | bool | `true` |  |
| openzaak.existingSecret | string | `nil` |  |
| openzaak.extraDeploy | list | `[]` |  |
| openzaak.extraEnvVars | list | `[]` |  |
| openzaak.extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
| openzaak.extraVerifyCerts | string | `""` |  |
| openzaak.extraVolumeMounts | list | `[]` |  |
| openzaak.extraVolumes | list | `[]` |  |
| openzaak.flower.enabled | bool | `true` |  |
| openzaak.flower.livenessProbe.failureThreshold | int | `6` |  |
| openzaak.flower.livenessProbe.initialDelaySeconds | int | `60` |  |
| openzaak.flower.livenessProbe.periodSeconds | int | `10` |  |
| openzaak.flower.livenessProbe.successThreshold | int | `1` |  |
| openzaak.flower.livenessProbe.timeoutSeconds | int | `5` |  |
| openzaak.flower.podLabels | object | `{}` |  |
| openzaak.flower.readinessProbe.failureThreshold | int | `6` |  |
| openzaak.flower.readinessProbe.initialDelaySeconds | int | `30` |  |
| openzaak.flower.readinessProbe.periodSeconds | int | `10` |  |
| openzaak.flower.readinessProbe.successThreshold | int | `1` |  |
| openzaak.flower.readinessProbe.timeoutSeconds | int | `5` |  |
| openzaak.flower.replicaCount | int | `1` |  |
| openzaak.flower.resources | object | `{}` |  |
| openzaak.fullnameOverride | string | `""` |  |
| openzaak.image.pullPolicy | string | `"IfNotPresent"` |  |
| openzaak.image.repository | string | `"openzaak/open-zaak"` |  |
| openzaak.image.tag | string | `""` |  |
| openzaak.imagePullSecrets | list | `[]` |  |
| openzaak.ingress.annotations | object | `{}` |  |
| openzaak.ingress.className | string | `""` |  |
| openzaak.ingress.enabled | bool | `false` |  |
| openzaak.ingress.hosts | list | `[]` | ingress hosts |
| openzaak.ingress.tls | list | `[]` |  |
| openzaak.livenessProbe.failureThreshold | int | `6` |  |
| openzaak.livenessProbe.initialDelaySeconds | int | `60` |  |
| openzaak.livenessProbe.periodSeconds | int | `10` |  |
| openzaak.livenessProbe.successThreshold | int | `1` |  |
| openzaak.livenessProbe.timeoutSeconds | int | `5` |  |
| openzaak.nameOverride | string | `""` |  |
| openzaak.nginx.autoscaling.enabled | bool | `false` |  |
| openzaak.nginx.existingConfigmap | string | `nil` | mount existing nginx vhost config |
| openzaak.nginx.image.pullPolicy | string | `"IfNotPresent"` |  |
| openzaak.nginx.image.repository | string | `"nginxinc/nginx-unprivileged"` |  |
| openzaak.nginx.image.tag | string | `"stable"` |  |
| openzaak.nginx.livenessProbe.failureThreshold | int | `3` |  |
| openzaak.nginx.livenessProbe.initialDelaySeconds | int | `60` |  |
| openzaak.nginx.livenessProbe.periodSeconds | int | `10` |  |
| openzaak.nginx.livenessProbe.successThreshold | int | `1` |  |
| openzaak.nginx.livenessProbe.timeoutSeconds | int | `5` |  |
| openzaak.nginx.podLabels | object | `{}` |  |
| openzaak.nginx.readinessProbe.failureThreshold | int | `3` |  |
| openzaak.nginx.readinessProbe.initialDelaySeconds | int | `30` |  |
| openzaak.nginx.readinessProbe.periodSeconds | int | `10` |  |
| openzaak.nginx.readinessProbe.successThreshold | int | `1` |  |
| openzaak.nginx.readinessProbe.timeoutSeconds | int | `5` |  |
| openzaak.nginx.replicaCount | int | `1` |  |
| openzaak.nginx.resources | object | `{}` |  |
| openzaak.nginx.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| openzaak.nginx.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| openzaak.nginx.securityContext.runAsNonRoot | bool | `true` |  |
| openzaak.nginx.securityContext.runAsUser | int | `101` |  |
| openzaak.nginx.service.annotations | object | `{}` |  |
| openzaak.nginx.service.port | int | `80` |  |
| openzaak.nginx.service.type | string | `"ClusterIP"` |  |
| openzaak.nodeSelector | object | `{}` |  |
| openzaak.pdb.create | bool | `false` |  |
| openzaak.pdb.maxUnavailable | string | `""` |  |
| openzaak.pdb.minAvailable | int | `1` |  |
| openzaak.persistence.enabled | bool | `true` |  |
| openzaak.persistence.existingClaim | string | `nil` |  |
| openzaak.persistence.mediaMountSubpath | string | `"openzaak/media"` |  |
| openzaak.persistence.privateMediaMountSubpath | string | `"openzaak/private_media"` |  |
| openzaak.persistence.size | string | `"1Gi"` |  |
| openzaak.persistence.storageClassName | string | `""` |  |
| openzaak.podAnnotations | object | `{}` |  |
| openzaak.podLabels | object | `{}` |  |
| openzaak.podSecurityContext.fsGroup | int | `1000` |  |
| openzaak.readinessProbe.failureThreshold | int | `6` |  |
| openzaak.readinessProbe.initialDelaySeconds | int | `30` |  |
| openzaak.readinessProbe.periodSeconds | int | `10` |  |
| openzaak.readinessProbe.successThreshold | int | `1` |  |
| openzaak.readinessProbe.timeoutSeconds | int | `5` |  |
| openzaak.redis.architecture | string | `"standalone"` |  |
| openzaak.redis.auth.enabled | bool | `false` |  |
| openzaak.redis.master.persistence.enabled | bool | `false` |  |
| openzaak.redis.master.resources.requests.cpu | string | `"10m"` |  |
| openzaak.redis.master.resources.requests.memory | string | `"20Mi"` |  |
| openzaak.redis.nameOverride | string | `"openzaak-redis"` |  |
| openzaak.redis.sentinel.masterService.enabled | bool | `false` |  |
| openzaak.replicaCount | int | `1` |  |
| openzaak.resources | object | `{}` |  |
| openzaak.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| openzaak.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| openzaak.securityContext.runAsNonRoot | bool | `true` |  |
| openzaak.securityContext.runAsUser | int | `1000` |  |
| openzaak.service.port | int | `80` |  |
| openzaak.service.type | string | `"ClusterIP"` |  |
| openzaak.serviceAccount.annotations | object | `{}` |  |
| openzaak.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| openzaak.serviceAccount.create | bool | `true` |  |
| openzaak.serviceAccount.name | string | `""` |  |
| openzaak.settings.allowedHosts | string | `""` |  |
| openzaak.settings.cache.axes | string | `""` |  |
| openzaak.settings.cache.default | string | `""` |  |
| openzaak.settings.cache.portalLocker | string | `""` |  |
| openzaak.settings.celery.brokerUrl | string | `""` |  |
| openzaak.settings.celery.enabled | bool | `true` | Deploy celery (worker), celery is required from openzaak version 1.8.0 |
| openzaak.settings.celery.logLevel | string | `"debug"` |  |
| openzaak.settings.celery.resultBackend | string | `""` |  |
| openzaak.settings.cmis.enabled | bool | `false` |  |
| openzaak.settings.cmis.mapperFile | string | `""` |  |
| openzaak.settings.database.host | string | `"open-zaak-postgresql"` |  |
| openzaak.settings.database.name | string | `"openzaak"` |  |
| openzaak.settings.database.password | string | `""` |  |
| openzaak.settings.database.port | int | `5432` |  |
| openzaak.settings.database.sslmode | string | `"prefer"` |  |
| openzaak.settings.database.username | string | `"postgres"` |  |
| openzaak.settings.debug | bool | `false` |  |
| openzaak.settings.djangoSettingsModule | string | `"openzaak.conf.docker"` |  |
| openzaak.settings.elasticapm.serviceName | string | `""` |  |
| openzaak.settings.elasticapm.token | string | `""` |  |
| openzaak.settings.elasticapm.url | string | `""` |  |
| openzaak.settings.email.host | string | `"localhost"` |  |
| openzaak.settings.email.password | string | `""` |  |
| openzaak.settings.email.port | int | `25` |  |
| openzaak.settings.email.useTLS | bool | `false` |  |
| openzaak.settings.email.username | string | `""` |  |
| openzaak.settings.environment | string | `""` |  |
| openzaak.settings.flower.basicAuth | string | `""` |  |
| openzaak.settings.flower.urlPrefix | string | `""` |  |
| openzaak.settings.isHttps | bool | `true` |  |
| openzaak.settings.jwtExpiry | int | `3600` |  |
| openzaak.settings.notificationsDisabled | bool | `false` |  |
| openzaak.settings.numProxies | int | `1` | use 2 if enabling ingress |
| openzaak.settings.secretKey | string | `""` | Generate secret key at https://djecrety.ir/ |
| openzaak.settings.sentry.dsn | string | `""` |  |
| openzaak.settings.useXForwardedHost | bool | `true` |  |
| openzaak.settings.uwsgi.harakiri | string | `""` |  |
| openzaak.settings.uwsgi.master | string | `""` |  |
| openzaak.settings.uwsgi.maxRequests | string | `""` |  |
| openzaak.settings.uwsgi.processes | string | `""` |  |
| openzaak.settings.uwsgi.threads | string | `""` |  |
| openzaak.tags.redis | bool | `true` |  |
| openzaak.tolerations | list | `[]` |  |
| openzaak.worker.autoscaling.enabled | bool | `false` |  |
| openzaak.worker.autoscaling.maxReplicas | int | `100` |  |
| openzaak.worker.autoscaling.minReplicas | int | `1` |  |
| openzaak.worker.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| openzaak.worker.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| openzaak.worker.concurrency | int | `4` |  |
| openzaak.worker.podLabels | object | `{}` |  |
| openzaak.worker.replicaCount | int | `1` |  |
| openzaak.worker.resources | object | `{}` |  |
| gpp-app.affinity | object | `{}` |  |
| gpp-app.autoscaling.enabled | bool | `false` |  |
| gpp-app.autoscaling.maxReplicas | int | `100` |  |
| gpp-app.autoscaling.minReplicas | int | `1` |  |
| gpp-app.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| gpp-app.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| gpp-app.azureVaultSecret.contentType | string | `""` |  |
| gpp-app.azureVaultSecret.objectName | string | `""` |  |
| gpp-app.azureVaultSecret.secretName | string | `"{{ .Values.existingSecret }}"` |  |
| gpp-app.azureVaultSecret.vaultName | string | `nil` |  |
| gpp-app.existingSecret | string | `nil` |  |
| gpp-app.extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
| gpp-app.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts, for example to trust extra ca certificates. |
| gpp-app.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes, for example to trust extra ca certificates. |
| gpp-app.fullnameOverride | string | `""` |  |
| gpp-app.image.pullPolicy | string | `"IfNotPresent"` |  |
| gpp-app.image.repository | string | `"ghcr.io/gpp-woo/gpp-app"` |  |
| gpp-app.image.tag | string | `""` |  |
| gpp-app.imagePullSecrets | list | `[]` |  |
| gpp-app.ingress.annotations | object | `{}` |  |
| gpp-app.ingress.className | string | `""` |  |
| gpp-app.ingress.enabled | bool | `false` |  |
| gpp-app.ingress.hosts | list | `[]` | ingress hosts |
| gpp-app.ingress.tls | list | `[]` |  |
| gpp-app.livenessProbe.failureThreshold | int | `6` |  |
| gpp-app.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-app.livenessProbe.periodSeconds | int | `10` |  |
| gpp-app.livenessProbe.successThreshold | int | `1` |  |
| gpp-app.livenessProbe.timeoutSeconds | int | `5` |  |
| gpp-app.nameOverride | string | `""` |  |
| gpp-app.nodeSelector | object | `{}` |  |
| gpp-app.pdb.create | bool | `false` |  |
| gpp-app.pdb.maxUnavailable | string | `""` |  |
| gpp-app.pdb.minAvailable | int | `1` |  |
| gpp-app.persistence.enabled | bool | `true` |  |
| gpp-app.persistence.existingClaim | string | `nil` |  |
| gpp-app.persistence.size | string | `"1Gi"` |  |
| gpp-app.persistence.storageClassName | string | `""` |  |
| gpp-app.podAnnotations | object | `{}` |  |
| gpp-app.podLabels | object | `{}` |  |
| gpp-app.podSecurityContext.fsGroup | int | `1000` |  |
| gpp-app.readinessProbe.failureThreshold | int | `6` |  |
| gpp-app.readinessProbe.initialDelaySeconds | int | `30` |  |
| gpp-app.readinessProbe.periodSeconds | int | `10` |  |
| gpp-app.readinessProbe.successThreshold | int | `1` |  |
| gpp-app.readinessProbe.timeoutSeconds | int | `5` |  |
| gpp-app.replicaCount | int | `1` |  |
| gpp-app.resources | object | `{}` |  |
| gpp-app.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| gpp-app.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| gpp-app.securityContext.runAsNonRoot | bool | `true` |  |
| gpp-app.securityContext.runAsUser | int | `1000` |  |
| gpp-app.service.port | int | `80` |  |
| gpp-app.service.type | string | `"ClusterIP"` |  |
| gpp-app.serviceAccount.annotations | object | `{}` |  |
| gpp-app.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| gpp-app.serviceAccount.create | bool | `true` |  |
| gpp-app.serviceAccount.name | string | `""` |  |
| gpp-app.settings.aspnetcore.environment | string | `""` |  |
| gpp-app.settings.aspnetcore.forwardedHeadersEnabled | bool | `true` |  |
| gpp-app.settings.aspnetcore.httpPorts | string | `""` |  |
| gpp-app.settings.database.host | string | `""` |  |
| gpp-app.settings.database.name | string | `""` |  |
| gpp-app.settings.database.password | string | `""` |  |
| gpp-app.settings.database.port | int | `5432` |  |
| gpp-app.settings.database.sslmode | string | `"prefer"` |  |
| gpp-app.settings.database.username | string | `""` |  |
| gpp-app.settings.downloadTimeoutMinutes | string | `""` | Timeout in minutes for relaying one document download from GPP-publicatiebank (`DOWNLOAD_TIMEOUT_MINUTES`). Empty keeps the app default of 10. |
| gpp-app.settings.gppPublicatiebank.apiKey | string | `""` |  |
| gpp-app.settings.gppPublicatiebank.baseUrl | string | `""` |  |
| gpp-app.settings.oidc.adminRole | string | `""` |  |
| gpp-app.settings.oidc.authority | string | `""` |  |
| gpp-app.settings.oidc.clientId | string | `""` |  |
| gpp-app.settings.oidc.clientSecret | string | `""` |  |
| gpp-app.settings.oidc.idClaimType | string | `""` |  |
| gpp-app.settings.oidc.nameClaimType | string | `""` |  |
| gpp-app.settings.oidc.roleClaimType | string | `""` |  |
| gpp-app.settings.uploadTimeoutMinutes | string | `""` | Timeout in minutes for relaying one file part (bestandsdeel) of an upload to GPP-publicatiebank (`UPLOAD_TIMEOUT_MINUTES`). Empty keeps the app default of 10. <details><summary>More information</summary> The app streams each part from the browser to GPP-publicatiebank, so the whole part has to arrive within this time: a slow client either needs a longer timeout or smaller parts (the Documents API's part size, e.g. Open Zaak's `DOCUMENTEN_UPLOAD_CHUNK_SIZE`).</details> |
| gpp-app.tolerations | list | `[]` |  |
| gpp-burgerportaal.affinity | object | `{}` |  |
| gpp-burgerportaal.autoscaling.enabled | bool | `false` |  |
| gpp-burgerportaal.autoscaling.maxReplicas | int | `100` |  |
| gpp-burgerportaal.autoscaling.minReplicas | int | `1` |  |
| gpp-burgerportaal.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| gpp-burgerportaal.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| gpp-burgerportaal.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts, for example to trust extra ca certificates. |
| gpp-burgerportaal.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes, for example to trust extra ca certificates. |
| gpp-burgerportaal.fullnameOverride | string | `""` |  |
| gpp-burgerportaal.image.pullPolicy | string | `"IfNotPresent"` |  |
| gpp-burgerportaal.image.repository | string | `"ghcr.io/gpp-woo/gpp-burgerportaal"` |  |
| gpp-burgerportaal.image.tag | string | `""` |  |
| gpp-burgerportaal.imagePullSecrets | list | `[]` |  |
| gpp-burgerportaal.ingress.annotations | object | `{}` |  |
| gpp-burgerportaal.ingress.className | string | `""` |  |
| gpp-burgerportaal.ingress.enabled | bool | `false` |  |
| gpp-burgerportaal.ingress.hosts | list | `[]` | ingress hosts |
| gpp-burgerportaal.ingress.tls | list | `[]` |  |
| gpp-burgerportaal.livenessProbe.failureThreshold | int | `6` |  |
| gpp-burgerportaal.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-burgerportaal.livenessProbe.periodSeconds | int | `10` |  |
| gpp-burgerportaal.livenessProbe.successThreshold | int | `1` |  |
| gpp-burgerportaal.livenessProbe.timeoutSeconds | int | `5` |  |
| gpp-burgerportaal.nameOverride | string | `""` |  |
| gpp-burgerportaal.nodeSelector | object | `{}` |  |
| gpp-burgerportaal.pdb.create | bool | `false` |  |
| gpp-burgerportaal.pdb.maxUnavailable | string | `""` |  |
| gpp-burgerportaal.pdb.minAvailable | int | `1` |  |
| gpp-burgerportaal.persistence.accessMode | string | `"ReadWriteMany"` |  |
| gpp-burgerportaal.persistence.enabled | bool | `true` | If persistence is enabled, a PVC is used. Otherwise, the app container will use an emptyDir volume. Note: data in emptyDir volumes is lost when the pod is removed. |
| gpp-burgerportaal.persistence.existingClaim | string | `nil` | If persistence.existingClaim is set, no PVC will be created, but the referenced PVC will be used to mount a volume in the app container. |
| gpp-burgerportaal.persistence.size | string | `"1Gi"` |  |
| gpp-burgerportaal.persistence.storageClassName | string | `""` |  |
| gpp-burgerportaal.podAnnotations | object | `{}` |  |
| gpp-burgerportaal.podLabels | object | `{}` |  |
| gpp-burgerportaal.podSecurityContext.fsGroup | int | `1000` |  |
| gpp-burgerportaal.readinessProbe.failureThreshold | int | `6` |  |
| gpp-burgerportaal.readinessProbe.initialDelaySeconds | int | `30` |  |
| gpp-burgerportaal.readinessProbe.periodSeconds | int | `10` |  |
| gpp-burgerportaal.readinessProbe.successThreshold | int | `1` |  |
| gpp-burgerportaal.readinessProbe.timeoutSeconds | int | `5` |  |
| gpp-burgerportaal.replicaCount | int | `1` |  |
| gpp-burgerportaal.resources | object | `{}` |  |
| gpp-burgerportaal.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| gpp-burgerportaal.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| gpp-burgerportaal.securityContext.runAsNonRoot | bool | `true` |  |
| gpp-burgerportaal.securityContext.runAsUser | int | `1000` |  |
| gpp-burgerportaal.service.port | int | `80` |  |
| gpp-burgerportaal.service.type | string | `"ClusterIP"` |  |
| gpp-burgerportaal.serviceAccount.annotations | object | `{}` |  |
| gpp-burgerportaal.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| gpp-burgerportaal.serviceAccount.create | bool | `true` |  |
| gpp-burgerportaal.serviceAccount.name | string | `""` |  |
| gpp-burgerportaal.settings.aspnetcore.environment | string | `""` |  |
| gpp-burgerportaal.settings.aspnetcore.forwardedHeadersEnabled | bool | `true` |  |
| gpp-burgerportaal.settings.aspnetcore.httpPorts | string | `""` |  |
| gpp-burgerportaal.settings.blockRobots | bool | `false` | Whether to block robots from crawling the citizen portal. <details><summary>More information</summary> If set to `true`, a `robots.txt` file will be served with the content `User-agent: *\nDisallow: /`, which blocks all robots from crawling the citizen portal. Default value is `false`.</details> |
| gpp-burgerportaal.settings.database.host | string | `""` |  |
| gpp-burgerportaal.settings.database.name | string | `""` |  |
| gpp-burgerportaal.settings.database.password | string | `""` |  |
| gpp-burgerportaal.settings.database.port | int | `5432` |  |
| gpp-burgerportaal.settings.database.username | string | `""` |  |
| gpp-burgerportaal.settings.downloadTimeoutMinutes | int | `10` | The maximum duration in minutes for downloading files. <br/> (default value is `10`) |
| gpp-burgerportaal.settings.gppPublicatiebank.apiKey | string | `""` | The secret key for the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| gpp-burgerportaal.settings.gppPublicatiebank.baseUrl | string | `""` | The base URL of the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `https://publicatiebank.mijn-gemeente.nl` </details> |
| gpp-burgerportaal.settings.oidc.adminRole | string | `""` | The role that will be used to determine if a user is an administrator in the citizen portal. <details> <summary>More information </summary>For example: `admin`</details> |
| gpp-burgerportaal.settings.oidc.authority | string | `""` | The OpenID Connect authority of the Identity Provider to establish a connection. <details> <summary>More information </summary>For example: `https://auth.mijn-gemeente.nl/realms/gpp` </details> |
| gpp-burgerportaal.settings.oidc.clientId | string | `""` | The client ID for the OpenID Connect connection. <details> <summary>More information </summary>For example: `gpp-burgerportaal`</details> |
| gpp-burgerportaal.settings.oidc.clientSecret | string | `""` | The client secret for the OpenID Connect connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| gpp-burgerportaal.settings.oidc.idClaimType | string | `""` | The claim type in which the user ID is stored. <details> <summary>More information </summary>For example: `sub`</details> |
| gpp-burgerportaal.settings.oidc.nameClaimType | string | `""` | The claim type in which the user name is stored. <details> <summary>More information </summary>For example: `name`</details> |
| gpp-burgerportaal.settings.oidc.roleClaimType | string | `""` | The claim type in which the user roles are stored. <details> <summary>More information </summary>For example: `roles`</details> |
| gpp-burgerportaal.settings.resources.designTokensUrl | string | `""` | Public URL where the CSS file containing NL Design System tokens is available, to style the citizen portal in the organisational house style. <details><summary>More information </summary>For example: `https://unpkg.com/@gemeente/design-tokens/dist/index.css`</details> |
| gpp-burgerportaal.settings.resources.gemeenteContactUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteDesignTokensUrl | string | `""` | DEPRECATED - use resources.designTokensUrl instead. this setting will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteFaviconUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteLogoUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteMainImageUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteNaam | string | `""` | DEPRECATED - use resources.organisatieNaam instead. this setting will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeentePrivacyUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteThemeNaam | string | `""` | DEPRECATED - use resources.themeNaam instead. this setting will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteVideoUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteWebFontSources | list | `[]` | DEPRECATED - use resources.webFontSources instead . this setting will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteWebsiteUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.gemeenteWelkom | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.organisatieNaam | string | `""` | The name of the organisation used within the citizen portal. <details><summary>More information</summary> For example: My Organization. Please note: only mention the name here, not the type (so “Demodam” instead of Gemeente Demodam”)</details>  |
| gpp-burgerportaal.settings.resources.organisatieType | string | `""` | The type of organisation used within the citizen portal. <details><summary>More information</summary> Possible values: `gemeente`, `provincie`, `waterschap`, `stichting`, `vereniging`, `organisatie`. This determines how the organization is referred to in the Citizen Portal (e.g. "Naar de gemeente" or "Naar het waterschap"). Default: `organisatie`. </details>  |
| gpp-burgerportaal.settings.resources.portaalTitel | string | `""` | The title of the citizen portal. <details><summary>More information</summary> For example: Open Mijn Gemeente</details> |
| gpp-burgerportaal.settings.resources.themeNaam | string | `""` | The name of the selector from the CSS file used to scope the NLDS tokens. <details><summary>More information</summary> For example: `gemeente-theme` </details> |
| gpp-burgerportaal.settings.resources.toegankelijkheidsverklaringRegisterUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| gpp-burgerportaal.settings.resources.webFontSources | list | `[]` | Public URLs referring to web font file(s) associated with the organisation house style. <details><summary>More information </summary>For example: `["https://fonts.mijn-gemeente.nl/custom-regular-font.woff2", "https://fonts.mijn-gemeente.nl/custom-bold-font.woff2"]`. A single reference to the location where all font-style files are stored is also possible: `["https://fonts.mijn-gemeente.nl/custom-font/"]`. **Note:** this configuration is only intended to allow font files to be loaded under CORS. References to files must also be specified under a `@font-face` ruleset in the theme styling.</details> |
| gpp-burgerportaal.settings.search.apiKey | string | `""` | The secret key for the Search component to establish a connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| gpp-burgerportaal.settings.search.baseUrl | string | `""` | The base URL of the Search component to establish a connection. <details> <summary>More information </summary>For example: `https://zoekcomponent.mijn-gemeente.nl` </details> |
| gpp-burgerportaal.settings.sitemapCacheDurationHours | int | `23` | The number of hours the sitemap is cached. <br/> (default value is `23`) |
| gpp-burgerportaal.tolerations | list | `[]` |  |
| gpp-publicatiebank.affinity | object | `{}` |  |
| gpp-publicatiebank.autoscaling.enabled | bool | `false` |  |
| gpp-publicatiebank.autoscaling.maxReplicas | int | `100` |  |
| gpp-publicatiebank.autoscaling.minReplicas | int | `1` |  |
| gpp-publicatiebank.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| gpp-publicatiebank.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| gpp-publicatiebank.azureVaultSecret.contentType | string | `""` |  |
| gpp-publicatiebank.azureVaultSecret.objectName | string | `""` |  |
| gpp-publicatiebank.azureVaultSecret.secretName | string | `"{{ .Values.existingSecret }}"` |  |
| gpp-publicatiebank.azureVaultSecret.vaultName | string | `nil` |  |
| gpp-publicatiebank.beat.enabled | bool | `false` | Run the Celery beat scheduler (`/celery_beat.sh`) as a single-replica Deployment. <details><summary>More information</summary> Required from app version 3.0.0 on: beat schedules the daily task that revokes publications whose inspection period ("inzagetermijn") has ended (GPP-Woo/GPP-publicatiebank#460). Without it that task silently never runs. Always exactly one replica, because a second beat would schedule every task twice. Off by default while appVersion is 2.x, whose beat schedule is empty.</details> |
| gpp-publicatiebank.beat.podLabels | object | `{}` |  |
| gpp-publicatiebank.beat.resources | object | `{}` |  |
| gpp-publicatiebank.existingSecret | string | `nil` |  |
| gpp-publicatiebank.extraEnvVars | list | `[]` | Array with extra environment variables to add |
| gpp-publicatiebank.extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
| gpp-publicatiebank.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts |
| gpp-publicatiebank.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes |
| gpp-publicatiebank.flower.basicAuth | string | `""` | Basic auth credentials in format `user:password` |
| gpp-publicatiebank.flower.enabled | bool | `true` |  |
| gpp-publicatiebank.flower.livenessProbe.failureThreshold | int | `6` |  |
| gpp-publicatiebank.flower.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-publicatiebank.flower.livenessProbe.periodSeconds | int | `10` |  |
| gpp-publicatiebank.flower.livenessProbe.successThreshold | int | `1` |  |
| gpp-publicatiebank.flower.livenessProbe.timeoutSeconds | int | `5` |  |
| gpp-publicatiebank.flower.podLabels | object | `{}` |  |
| gpp-publicatiebank.flower.readinessProbe.failureThreshold | int | `6` |  |
| gpp-publicatiebank.flower.readinessProbe.initialDelaySeconds | int | `30` |  |
| gpp-publicatiebank.flower.readinessProbe.periodSeconds | int | `10` |  |
| gpp-publicatiebank.flower.readinessProbe.successThreshold | int | `1` |  |
| gpp-publicatiebank.flower.readinessProbe.timeoutSeconds | int | `5` |  |
| gpp-publicatiebank.flower.replicaCount | int | `1` |  |
| gpp-publicatiebank.flower.resources | object | `{}` |  |
| gpp-publicatiebank.flower.service.annotations | object | `{}` |  |
| gpp-publicatiebank.flower.service.port | int | `5555` |  |
| gpp-publicatiebank.flower.service.type | string | `"ClusterIP"` |  |
| gpp-publicatiebank.flower.strategy | object | `{}` | Update strategy of the Flower Deployment (`.spec.strategy`), see `strategy`. |
| gpp-publicatiebank.flower.urlPrefix | string | `"/flower/"` |  |
| gpp-publicatiebank.fullnameOverride | string | `""` |  |
| gpp-publicatiebank.image.pullPolicy | string | `"IfNotPresent"` |  |
| gpp-publicatiebank.image.repository | string | `"ghcr.io/gpp-woo/gpp-publicatiebank"` |  |
| gpp-publicatiebank.image.tag | string | `""` |  |
| gpp-publicatiebank.imagePullSecrets | list | `[]` |  |
| gpp-publicatiebank.ingress.annotations | object | `{}` |  |
| gpp-publicatiebank.ingress.className | string | `""` |  |
| gpp-publicatiebank.ingress.enabled | bool | `false` |  |
| gpp-publicatiebank.ingress.hosts | list | `[]` | ingress hosts |
| gpp-publicatiebank.ingress.tls | list | `[]` |  |
| gpp-publicatiebank.livenessProbe.failureThreshold | int | `6` |  |
| gpp-publicatiebank.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-publicatiebank.livenessProbe.periodSeconds | int | `10` |  |
| gpp-publicatiebank.livenessProbe.successThreshold | int | `1` |  |
| gpp-publicatiebank.livenessProbe.timeoutSeconds | int | `5` |  |
| gpp-publicatiebank.logVolume.enabled | bool | `true` | Mount a writable `emptyDir` at `logVolume.mountPath` in every container that runs the app: web, Celery worker, beat and Flower (not nginx). <details><summary>More information</summary> open-api-framework's logging configuration always creates its rotating log files there (`application.jsonl`, `performance.log`, `requests.log`, each up to 10 x 10 MB), also when the app logs to stdout (`LOG_STDOUT`, the default). Wherever the image's `/app/log` is not writable the app fails to start: under a `readOnlyRootFilesystem`, or with an arbitrary UID such as OpenShift's restricted-v2 SCC assigns. Skipped when `extraVolumeMounts` already mount something at `mountPath` (the values-only workaround before this chart had it), so existing values keep working. Harmless elsewhere: it also keeps those files out of the container's writable layer.</details> |
| gpp-publicatiebank.logVolume.mountPath | string | `"/app/log"` | Where the app writes its log files (open-api-framework: `BASE_DIR / "log"`). |
| gpp-publicatiebank.logVolume.sizeLimit | string | `""` | Optional `sizeLimit` of the emptyDir, e.g. `1Gi`; exceeding it evicts the pod. Empty sets none. |
| gpp-publicatiebank.nameOverride | string | `""` |  |
| gpp-publicatiebank.nginx.autoscaling.enabled | bool | `false` |  |
| gpp-publicatiebank.nginx.config.clientMaxBodySize | string | `"4G"` | Default client_max_body_size for all endpoints (unless overridden). Examples: "10M", "100M", "1G", "4G", "10G". |
| gpp-publicatiebank.nginx.config.proxyConnectTimeoutSeconds | int | `300` | Proxy connection timeout in seconds. How long nginx waits to establish a connection with the backend. |
| gpp-publicatiebank.nginx.config.proxyReadTimeoutSeconds | int | `300` | Proxy read timeout in seconds. How long nginx waits for a backend response. |
| gpp-publicatiebank.nginx.existingConfigmap | string | `nil` |  |
| gpp-publicatiebank.nginx.image.pullPolicy | string | `"IfNotPresent"` |  |
| gpp-publicatiebank.nginx.image.repository | string | `"nginxinc/nginx-unprivileged"` |  |
| gpp-publicatiebank.nginx.image.tag | string | `"stable"` |  |
| gpp-publicatiebank.nginx.livenessProbe | object | `{}` |  |
| gpp-publicatiebank.nginx.podLabels | object | `{}` |  |
| gpp-publicatiebank.nginx.readinessProbe | object | `{}` |  |
| gpp-publicatiebank.nginx.replicaCount | int | `1` |  |
| gpp-publicatiebank.nginx.resources | object | `{}` |  |
| gpp-publicatiebank.nginx.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| gpp-publicatiebank.nginx.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| gpp-publicatiebank.nginx.securityContext.runAsNonRoot | bool | `true` |  |
| gpp-publicatiebank.nginx.securityContext.runAsUser | int | `101` |  |
| gpp-publicatiebank.nginx.service.annotations | object | `{}` |  |
| gpp-publicatiebank.nginx.service.port | int | `80` |  |
| gpp-publicatiebank.nginx.service.type | string | `"ClusterIP"` |  |
| gpp-publicatiebank.nginx.strategy | object | `{}` | Update strategy of the nginx Deployment (`.spec.strategy`), see `strategy`. |
| gpp-publicatiebank.nodeSelector | object | `{}` |  |
| gpp-publicatiebank.pdb.create | bool | `false` |  |
| gpp-publicatiebank.pdb.maxUnavailable | string | `""` |  |
| gpp-publicatiebank.pdb.minAvailable | int | `1` |  |
| gpp-publicatiebank.persistence.enabled | bool | `true` | If persistence is enabled, a PVC is used. Otherwise, the app container will use an emptyDir volume. Note: data in emptyDir volumes is lost when the pod is removed. |
| gpp-publicatiebank.persistence.existingClaim | string | `nil` | If persistence.existingClaim is set, no PVC will be created, but the referenced PVC will be used to mount a volume in the app container. |
| gpp-publicatiebank.persistence.mediaMountSubpath | string | `"gpp-publicatiebank/media"` | Specifies a subpath for where to mount the media volume. This will be appended to the the fixed path `/app/media`. |
| gpp-publicatiebank.persistence.privateMediaMountSubpath | string | `"gpp-publicatiebank/private_media"` | Specifies a subpath for where to mount the private media volume. This will be appended to the the fixed path `/app/private_media`. |
| gpp-publicatiebank.persistence.size | string | `"1Gi"` |  |
| gpp-publicatiebank.persistence.storageClassName | string | `""` |  |
| gpp-publicatiebank.podAnnotations | object | `{}` |  |
| gpp-publicatiebank.podLabels | object | `{}` |  |
| gpp-publicatiebank.podSecurityContext.fsGroup | int | `1000` |  |
| gpp-publicatiebank.readinessProbe.failureThreshold | int | `6` |  |
| gpp-publicatiebank.readinessProbe.initialDelaySeconds | int | `30` |  |
| gpp-publicatiebank.readinessProbe.periodSeconds | int | `10` |  |
| gpp-publicatiebank.readinessProbe.successThreshold | int | `1` |  |
| gpp-publicatiebank.readinessProbe.timeoutSeconds | int | `5` |  |
| gpp-publicatiebank.redis.architecture | string | `"standalone"` |  |
| gpp-publicatiebank.redis.auth.enabled | bool | `false` |  |
| gpp-publicatiebank.redis.image | object | `{"registry":"docker.io","repository":"redis","tag":"8.0"}` | Redis image configuration - Migration from Bitnami to official Redis image         |
| gpp-publicatiebank.redis.master.persistence.enabled | bool | `true` |  |
| gpp-publicatiebank.redis.master.persistence.size | string | `"8Gi"` |  |
| gpp-publicatiebank.redis.master.persistence.storageClass | string | `""` |  |
| gpp-publicatiebank.redis.master.resources.requests.cpu | string | `"10m"` |  |
| gpp-publicatiebank.redis.master.resources.requests.memory | string | `"20Mi"` |  |
| gpp-publicatiebank.replicaCount | int | `1` |  |
| gpp-publicatiebank.resources | object | `{}` |  |
| gpp-publicatiebank.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| gpp-publicatiebank.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| gpp-publicatiebank.securityContext.runAsNonRoot | bool | `true` |  |
| gpp-publicatiebank.securityContext.runAsUser | int | `1000` |  |
| gpp-publicatiebank.service.port | int | `80` |  |
| gpp-publicatiebank.service.type | string | `"ClusterIP"` |  |
| gpp-publicatiebank.serviceAccount.annotations | object | `{}` |  |
| gpp-publicatiebank.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| gpp-publicatiebank.serviceAccount.create | bool | `true` |  |
| gpp-publicatiebank.serviceAccount.name | string | `""` |  |
| gpp-publicatiebank.settings.allowedHosts | string | `""` |  |
| gpp-publicatiebank.settings.cache.axes | string | `""` |  |
| gpp-publicatiebank.settings.cache.default | string | `""` |  |
| gpp-publicatiebank.settings.celery.brokerUrl | string | `""` |  |
| gpp-publicatiebank.settings.celery.logLevel | string | `"debug"` |  |
| gpp-publicatiebank.settings.celery.resultBackend | string | `""` |  |
| gpp-publicatiebank.settings.cookieSamesite | string | `""` | Choises Strict or Lax |
| gpp-publicatiebank.settings.database.host | string | `""` |  |
| gpp-publicatiebank.settings.database.name | string | `""` |  |
| gpp-publicatiebank.settings.database.password | string | `""` |  |
| gpp-publicatiebank.settings.database.port | int | `5432` |  |
| gpp-publicatiebank.settings.database.sslmode | string | `"prefer"` |  |
| gpp-publicatiebank.settings.database.username | string | `""` |  |
| gpp-publicatiebank.settings.debug | bool | `false` |  |
| gpp-publicatiebank.settings.disable2fa | bool | `false` | Disable two factor authentication |
| gpp-publicatiebank.settings.djangoSettingsModule | string | `"woo_publications.conf.docker"` |  |
| gpp-publicatiebank.settings.documentMaxBodySize | string | `"4G"` |  |
| gpp-publicatiebank.settings.documentsApiSlowOperationsTimeout | string | `""` | Read timeout (seconds) for the Documents API calls whose duration scales with document size: uploading a file part, and unlocking a document (which merges its parts). <details><summary>More information</summary> Rendered as `DOCUMENTS_API_SLOW_OPERATIONS_TIMEOUT`; needs app version 3.0.0 or later. Empty keeps the app default (`300`). A higher timeout configured on the Documents API service itself takes precedence. Keep `nginx.config.proxyReadTimeoutSeconds` at least this high.</details> |
| gpp-publicatiebank.settings.elasticapm.serviceName | string | `""` |  |
| gpp-publicatiebank.settings.elasticapm.token | string | `""` |  |
| gpp-publicatiebank.settings.elasticapm.url | string | `""` |  |
| gpp-publicatiebank.settings.email.defaultFrom | string | `""` |  |
| gpp-publicatiebank.settings.email.host | string | `"localhost"` |  |
| gpp-publicatiebank.settings.email.password | string | `""` |  |
| gpp-publicatiebank.settings.email.port | int | `25` |  |
| gpp-publicatiebank.settings.email.useTLS | bool | `false` |  |
| gpp-publicatiebank.settings.email.username | string | `""` |  |
| gpp-publicatiebank.settings.environment | string | `""` | sets the 'ENVIRONMENT' variable |
| gpp-publicatiebank.settings.environmentLabelBackgroundColor | string | `""` | CSS color value for the environment information background color. Defaults to orange, example values can be specified in HEX format too, e.g.: #FF0000 for red. |
| gpp-publicatiebank.settings.environmentLabelForegroundColor | string | `""` | CSS color value for the environment information text color. Defaults to black. Follows the same rules as ENVIRONMENT_BACKGROUND_COLOR. |
| gpp-publicatiebank.settings.environmentLabelName | string | `""` | Environment information to display, defaults to the value of ENVIRONMENT. Only displayed when SHOW_ENVIRONMENT is set to True. You can set this to strings like OpenGem PROD or simply PROD, depending on your needs. |
| gpp-publicatiebank.settings.isHttps | bool | `true` |  |
| gpp-publicatiebank.settings.secretKey | string | `""` | Generate secret key at https://djecrety.ir/ |
| gpp-publicatiebank.settings.sentry.dsn | string | `""` |  |
| gpp-publicatiebank.settings.showLabelEnvironment | bool | `false` | Display environment information in the header in the admin. Defaults to True. Environment information is only displayed to logged in users. |
| gpp-publicatiebank.settings.useXForwardedHost | bool | `false` |  |
| gpp-publicatiebank.settings.uwsgi.harakiri | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.master | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.maxRequests | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.processes | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.threads | string | `""` |  |
| gpp-publicatiebank.strategy | object | `{}` | Update strategy of the web Deployment (`.spec.strategy`), rendered verbatim when set. <details><summary>More information</summary> Empty keeps the Kubernetes default (`RollingUpdate` with maxSurge and maxUnavailable 25%), which at one replica starts the new pod before stopping the old one, so every rollout briefly needs the resources of both. `{type: RollingUpdate, rollingUpdate: {maxSurge: 0, maxUnavailable: 1}}` stops the old pod first: no extra resources during the rollout, but a gap while the new pod starts. `{type: Recreate}` does that for all replicas at once. The same setting exists as `worker.strategy`, `nginx.strategy` and `flower.strategy`; Celery beat always uses `Recreate`.</details> |
| gpp-publicatiebank.tags.redis | bool | `true` |  |
| gpp-publicatiebank.tolerations | list | `[]` |  |
| gpp-publicatiebank.worker.autoscaling.behavior | object | `{}` |  |
| gpp-publicatiebank.worker.autoscaling.enabled | bool | `false` |  |
| gpp-publicatiebank.worker.autoscaling.maxReplicas | int | `100` |  |
| gpp-publicatiebank.worker.autoscaling.minReplicas | int | `1` |  |
| gpp-publicatiebank.worker.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| gpp-publicatiebank.worker.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| gpp-publicatiebank.worker.concurrency | int | `4` |  |
| gpp-publicatiebank.worker.label | string | `"1"` |  |
| gpp-publicatiebank.worker.livenessProbe.enabled | bool | `false` |  |
| gpp-publicatiebank.worker.livenessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| gpp-publicatiebank.worker.livenessProbe.exec.command[1] | string | `"-c"` |  |
| gpp-publicatiebank.worker.livenessProbe.exec.command[2] | string | `"celery --workdir src --app woo_publications.celery inspect --destination celery@${HOSTNAME} active"` |  |
| gpp-publicatiebank.worker.livenessProbe.failureThreshold | int | `3` |  |
| gpp-publicatiebank.worker.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-publicatiebank.worker.livenessProbe.periodSeconds | int | `30` |  |
| gpp-publicatiebank.worker.livenessProbe.successThreshold | int | `1` |  |
| gpp-publicatiebank.worker.livenessProbe.timeoutSeconds | int | `10` |  |
| gpp-publicatiebank.worker.maxMemoryPerChildKiB | string | `nil` | Recycle a celery pool child once its resident memory passes this many KiB (celery's `--max-memory-per-child`). <details><summary>More information</summary> Unset means no memory limit; the image bounds child growth by task count instead (`CELERY_WORKER_MAX_TASKS_PER_CHILD`, default `50`). Pick a value below `worker.resources.limits.memory` so a bloated child is retired between tasks instead of the pod being OOMKilled mid-task, e.g. `786432` (768Mi) under a 1Gi limit. Recycling happens between tasks, so no work is lost. Set to `0` to disable the limit explicitly.</details> |
| gpp-publicatiebank.worker.maxTasksPerChild | string | `nil` | Recycle a celery pool child after this many tasks (celery's `--max-tasks-per-child`). <details><summary>More information</summary> Rendered as `CELERY_WORKER_MAX_TASKS_PER_CHILD` on the celery worker container only. Unset keeps the image default: `50` from app version 3.0.0 on, no recycling before that.</details> |
| gpp-publicatiebank.worker.name | string | `""` |  |
| gpp-publicatiebank.worker.podLabels | object | `{}` |  |
| gpp-publicatiebank.worker.queueName | string | `""` |  |
| gpp-publicatiebank.worker.replicaCount | int | `1` |  |
| gpp-publicatiebank.worker.resources | object | `{}` |  |
| gpp-publicatiebank.worker.strategy | object | `{}` | Update strategy of the Celery worker Deployment (`.spec.strategy`), see `strategy`. <details><summary>More information</summary> The cheapest place to skip the rollout overlap, e.g. `{type: RollingUpdate, rollingUpdate: {maxSurge: 0, maxUnavailable: 1}}`: while no worker runs, new tasks wait in the broker, and a task interrupted by the shutdown is redelivered because the app acknowledges tasks only after they ran (`CELERY_TASK_ACKS_LATE`). The default overlap stops the old worker in the same way, just after the new one is up.</details> |
| gpp-zoeken.affinity | object | `{}` |  |
| gpp-zoeken.autoscaling.enabled | bool | `false` |  |
| gpp-zoeken.autoscaling.maxReplicas | int | `100` |  |
| gpp-zoeken.autoscaling.minReplicas | int | `1` |  |
| gpp-zoeken.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| gpp-zoeken.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| gpp-zoeken.azureVaultSecret.contentType | string | `""` |  |
| gpp-zoeken.azureVaultSecret.objectName | string | `""` |  |
| gpp-zoeken.azureVaultSecret.secretName | string | `"{{ .Values.existingSecret }}"` |  |
| gpp-zoeken.azureVaultSecret.vaultName | string | `nil` |  |
| gpp-zoeken.eck-elasticsearch.annotations | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.auth | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.enabled | bool | `true` |  |
| gpp-zoeken.eck-elasticsearch.fullnameOverride | string | `"gpp-eck-elasticsearch"` |  |
| gpp-zoeken.eck-elasticsearch.http | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.ingress.annotations | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.ingress.enabled | bool | `false` |  |
| gpp-zoeken.eck-elasticsearch.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| gpp-zoeken.eck-elasticsearch.ingress.hosts[0].path | string | `"/"` |  |
| gpp-zoeken.eck-elasticsearch.ingress.labels | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.ingress.pathType | string | `"Prefix"` |  |
| gpp-zoeken.eck-elasticsearch.ingress.tls.enabled | bool | `false` |  |
| gpp-zoeken.eck-elasticsearch.labels | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.monitoring | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.nameOverride | string | `"gpp-eck-elasticsearch"` |  |
| gpp-zoeken.eck-elasticsearch.nodeSets[0].config."node.store.allow_mmap" | bool | `false` |  |
| gpp-zoeken.eck-elasticsearch.nodeSets[0].count | int | `1` |  |
| gpp-zoeken.eck-elasticsearch.nodeSets[0].name | string | `"default"` |  |
| gpp-zoeken.eck-elasticsearch.nodeSets[0].podTemplate.spec.containers[0].name | string | `"elasticsearch"` |  |
| gpp-zoeken.eck-elasticsearch.nodeSets[0].podTemplate.spec.containers[0].resources.limits.memory | string | `"2Gi"` |  |
| gpp-zoeken.eck-elasticsearch.nodeSets[0].podTemplate.spec.containers[0].resources.requests.memory | string | `"2Gi"` |  |
| gpp-zoeken.eck-elasticsearch.remoteClusters | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.secureSettings | list | `[]` |  |
| gpp-zoeken.eck-elasticsearch.transport | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.updateStrategy | object | `{}` |  |
| gpp-zoeken.eck-elasticsearch.version | string | `"8.19.12"` |  |
| gpp-zoeken.eck-elasticsearch.volumeClaimDeletePolicy | string | `""` |  |
| gpp-zoeken.eck-operator.affinity | object | `{}` |  |
| gpp-zoeken.eck-operator.automountServiceAccountToken | bool | `true` |  |
| gpp-zoeken.eck-operator.config.caDir | string | `""` |  |
| gpp-zoeken.eck-operator.config.caRotateBefore | string | `"24h"` |  |
| gpp-zoeken.eck-operator.config.caValidity | string | `"8760h"` |  |
| gpp-zoeken.eck-operator.config.certificatesRotateBefore | string | `"24h"` |  |
| gpp-zoeken.eck-operator.config.certificatesValidity | string | `"8760h"` |  |
| gpp-zoeken.eck-operator.config.containerRegistry | string | `"docker.elastic.co"` |  |
| gpp-zoeken.eck-operator.config.disableConfigWatch | bool | `false` |  |
| gpp-zoeken.eck-operator.config.elasticsearchClientTimeout | string | `"180s"` |  |
| gpp-zoeken.eck-operator.config.elasticsearchObservationInterval | string | `"10s"` |  |
| gpp-zoeken.eck-operator.config.enableLeaderElection | bool | `true` |  |
| gpp-zoeken.eck-operator.config.exposedNodeLabels[0] | string | `"topology.kubernetes.io/.*"` |  |
| gpp-zoeken.eck-operator.config.exposedNodeLabels[1] | string | `"failure-domain.beta.kubernetes.io/.*"` |  |
| gpp-zoeken.eck-operator.config.ipFamily | string | `""` |  |
| gpp-zoeken.eck-operator.config.kubeClientTimeout | string | `"60s"` |  |
| gpp-zoeken.eck-operator.config.logVerbosity | string | `"0"` |  |
| gpp-zoeken.eck-operator.config.maxConcurrentReconciles | string | `"3"` |  |
| gpp-zoeken.eck-operator.config.metrics.port | string | `"0"` |  |
| gpp-zoeken.eck-operator.config.metrics.secureMode.enabled | bool | `false` |  |
| gpp-zoeken.eck-operator.config.metrics.secureMode.tls.certificateSecret | string | `""` |  |
| gpp-zoeken.eck-operator.config.metricsPort | int | `0` |  |
| gpp-zoeken.eck-operator.config.setDefaultSecurityContext | string | `"auto-detect"` |  |
| gpp-zoeken.eck-operator.config.ubiOnly | bool | `false` |  |
| gpp-zoeken.eck-operator.config.validateStorageClass | bool | `true` |  |
| gpp-zoeken.eck-operator.createClusterScopedResources | bool | `true` |  |
| gpp-zoeken.eck-operator.enabled | bool | `true` |  |
| gpp-zoeken.eck-operator.env | list | `[]` |  |
| gpp-zoeken.eck-operator.fullnameOverride | string | `"gpp-eck-operator"` |  |
| gpp-zoeken.eck-operator.hostNetwork | bool | `false` |  |
| gpp-zoeken.eck-operator.image.fips | bool | `false` |  |
| gpp-zoeken.eck-operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| gpp-zoeken.eck-operator.image.repository | string | `"docker.elastic.co/eck/eck-operator"` |  |
| gpp-zoeken.eck-operator.image.tag | string | `nil` |  |
| gpp-zoeken.eck-operator.imagePullSecrets | list | `[]` |  |
| gpp-zoeken.eck-operator.installCRDs | bool | `false` |  |
| gpp-zoeken.eck-operator.kubeAPIServerIP | string | `nil` |  |
| gpp-zoeken.eck-operator.managedNamespaces | list | `[]` |  |
| gpp-zoeken.eck-operator.nameOverride | string | `"gpp-eck-operator"` |  |
| gpp-zoeken.eck-operator.nodeSelector | object | `{}` |  |
| gpp-zoeken.eck-operator.podAnnotations | object | `{}` |  |
| gpp-zoeken.eck-operator.podDisruptionBudget.enabled | bool | `false` |  |
| gpp-zoeken.eck-operator.podDisruptionBudget.minAvailable | int | `1` |  |
| gpp-zoeken.eck-operator.podLabels | object | `{}` |  |
| gpp-zoeken.eck-operator.podMonitor.annotations | object | `{}` |  |
| gpp-zoeken.eck-operator.podMonitor.enabled | bool | `false` |  |
| gpp-zoeken.eck-operator.podMonitor.interval | string | `"5m"` |  |
| gpp-zoeken.eck-operator.podMonitor.labels | object | `{}` |  |
| gpp-zoeken.eck-operator.podMonitor.podMetricsEndpointConfig | object | `{}` |  |
| gpp-zoeken.eck-operator.podMonitor.podTargetLabels | list | `[]` |  |
| gpp-zoeken.eck-operator.podMonitor.scrapeTimeout | string | `"30s"` |  |
| gpp-zoeken.eck-operator.podSecurityContext.runAsNonRoot | bool | `true` |  |
| gpp-zoeken.eck-operator.priorityClassName | string | `""` |  |
| gpp-zoeken.eck-operator.refs.enforceRBAC | bool | `false` |  |
| gpp-zoeken.eck-operator.replicaCount | int | `1` |  |
| gpp-zoeken.eck-operator.resources.limits.cpu | int | `1` |  |
| gpp-zoeken.eck-operator.resources.limits.memory | string | `"1Gi"` |  |
| gpp-zoeken.eck-operator.resources.requests.cpu | string | `"100m"` |  |
| gpp-zoeken.eck-operator.resources.requests.memory | string | `"150Mi"` |  |
| gpp-zoeken.eck-operator.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| gpp-zoeken.eck-operator.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| gpp-zoeken.eck-operator.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| gpp-zoeken.eck-operator.securityContext.runAsNonRoot | bool | `true` |  |
| gpp-zoeken.eck-operator.serviceAccount.annotations | object | `{}` |  |
| gpp-zoeken.eck-operator.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| gpp-zoeken.eck-operator.serviceAccount.create | bool | `true` |  |
| gpp-zoeken.eck-operator.serviceAccount.name | string | `""` |  |
| gpp-zoeken.eck-operator.serviceMonitor.caMountDirectory | string | `"/etc/prometheus/secrets/"` |  |
| gpp-zoeken.eck-operator.serviceMonitor.caSecret | string | `""` |  |
| gpp-zoeken.eck-operator.serviceMonitor.enabled | bool | `true` |  |
| gpp-zoeken.eck-operator.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| gpp-zoeken.eck-operator.softMultiTenancy.enabled | bool | `false` |  |
| gpp-zoeken.eck-operator.statefulsetAnnotations | object | `{}` |  |
| gpp-zoeken.eck-operator.statefulsetLabels | object | `{}` |  |
| gpp-zoeken.eck-operator.telemetry.disabled | bool | `false` |  |
| gpp-zoeken.eck-operator.telemetry.distributionChannel | string | `"helm"` |  |
| gpp-zoeken.eck-operator.tolerations | list | `[]` |  |
| gpp-zoeken.eck-operator.tracing.config.ELASTIC_APM_SERVER_TIMEOUT | string | `"30s"` |  |
| gpp-zoeken.eck-operator.tracing.config.ELASTIC_APM_SERVER_URL | string | `"http://localhost:8200"` |  |
| gpp-zoeken.eck-operator.tracing.enabled | bool | `false` |  |
| gpp-zoeken.eck-operator.volumeMounts | list | `[]` |  |
| gpp-zoeken.eck-operator.volumes | list | `[]` |  |
| gpp-zoeken.eck-operator.webhook.caBundle | string | `"Cg=="` |  |
| gpp-zoeken.eck-operator.webhook.certManagerCert | string | `nil` |  |
| gpp-zoeken.eck-operator.webhook.certsDir | string | `"/tmp/k8s-webhook-server/serving-certs"` |  |
| gpp-zoeken.eck-operator.webhook.certsSecret | string | `""` |  |
| gpp-zoeken.eck-operator.webhook.enabled | bool | `true` |  |
| gpp-zoeken.eck-operator.webhook.failurePolicy | string | `"Ignore"` |  |
| gpp-zoeken.eck-operator.webhook.manageCerts | bool | `true` |  |
| gpp-zoeken.eck-operator.webhook.namespaceSelector | object | `{}` |  |
| gpp-zoeken.eck-operator.webhook.objectSelector | object | `{}` |  |
| gpp-zoeken.eck-operator.webhook.port | int | `9443` |  |
| gpp-zoeken.existingSecret | string | `nil` |  |
| gpp-zoeken.existingSecretElastic | string | `nil` |  |
| gpp-zoeken.extraEnvVars | list | `[]` | Array with extra environment variables to add |
| gpp-zoeken.extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
| gpp-zoeken.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts |
| gpp-zoeken.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes |
| gpp-zoeken.flower.basicAuth | string | `""` | Basic auth credentials in format `user:password` |
| gpp-zoeken.flower.enabled | bool | `false` |  |
| gpp-zoeken.flower.livenessProbe.failureThreshold | int | `6` |  |
| gpp-zoeken.flower.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-zoeken.flower.livenessProbe.periodSeconds | int | `10` |  |
| gpp-zoeken.flower.livenessProbe.successThreshold | int | `1` |  |
| gpp-zoeken.flower.livenessProbe.timeoutSeconds | int | `5` |  |
| gpp-zoeken.flower.podLabels | object | `{}` |  |
| gpp-zoeken.flower.readinessProbe.failureThreshold | int | `6` |  |
| gpp-zoeken.flower.readinessProbe.initialDelaySeconds | int | `30` |  |
| gpp-zoeken.flower.readinessProbe.periodSeconds | int | `10` |  |
| gpp-zoeken.flower.readinessProbe.successThreshold | int | `1` |  |
| gpp-zoeken.flower.readinessProbe.timeoutSeconds | int | `5` |  |
| gpp-zoeken.flower.replicaCount | int | `1` |  |
| gpp-zoeken.flower.resources | object | `{}` |  |
| gpp-zoeken.flower.service.annotations | object | `{}` |  |
| gpp-zoeken.flower.service.port | int | `5555` |  |
| gpp-zoeken.flower.service.type | string | `"ClusterIP"` |  |
| gpp-zoeken.flower.urlPrefix | string | `""` |  |
| gpp-zoeken.fullnameOverride | string | `""` |  |
| gpp-zoeken.image.pullPolicy | string | `"IfNotPresent"` |  |
| gpp-zoeken.image.repository | string | `"ghcr.io/gpp-woo/gpp-zoeken"` |  |
| gpp-zoeken.image.tag | string | `""` |  |
| gpp-zoeken.imagePullSecrets | list | `[]` |  |
| gpp-zoeken.ingress.annotations | object | `{}` |  |
| gpp-zoeken.ingress.className | string | `""` |  |
| gpp-zoeken.ingress.enabled | bool | `false` |  |
| gpp-zoeken.ingress.hosts | list | `[]` | ingress hosts |
| gpp-zoeken.ingress.tls | list | `[]` |  |
| gpp-zoeken.livenessProbe.failureThreshold | int | `6` |  |
| gpp-zoeken.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-zoeken.livenessProbe.periodSeconds | int | `10` |  |
| gpp-zoeken.livenessProbe.successThreshold | int | `1` |  |
| gpp-zoeken.livenessProbe.timeoutSeconds | int | `5` |  |
| gpp-zoeken.nameOverride | string | `""` |  |
| gpp-zoeken.nodeSelector | object | `{}` |  |
| gpp-zoeken.pdb.create | bool | `false` |  |
| gpp-zoeken.pdb.maxUnavailable | string | `""` |  |
| gpp-zoeken.pdb.minAvailable | int | `1` |  |
| gpp-zoeken.persistence.existingClaim | string | `nil` |  |
| gpp-zoeken.persistence.logsMountSubpath | string | `"gpp-zoeken/logs"` |  |
| gpp-zoeken.persistence.mediaMountSubpath | string | `"gpp-zoeken/media"` |  |
| gpp-zoeken.persistence.privateMediaMountSubpath | string | `"gpp-zoeken/private_media"` |  |
| gpp-zoeken.persistence.size | string | `"1Gi"` |  |
| gpp-zoeken.persistence.storageClassName | string | `""` |  |
| gpp-zoeken.podAnnotations | object | `{}` |  |
| gpp-zoeken.podLabels | object | `{}` |  |
| gpp-zoeken.podSecurityContext.fsGroup | int | `1000` |  |
| gpp-zoeken.readinessProbe.failureThreshold | int | `6` |  |
| gpp-zoeken.readinessProbe.initialDelaySeconds | int | `30` |  |
| gpp-zoeken.readinessProbe.periodSeconds | int | `10` |  |
| gpp-zoeken.readinessProbe.successThreshold | int | `1` |  |
| gpp-zoeken.readinessProbe.timeoutSeconds | int | `5` |  |
| gpp-zoeken.redis.architecture | string | `"standalone"` |  |
| gpp-zoeken.redis.auth.enabled | bool | `false` |  |
| gpp-zoeken.redis.image | object | `{"registry":"docker.io","repository":"redis","tag":"8.0"}` | Redis image configuration - Migration from Bitnami to official Redis image         |
| gpp-zoeken.redis.master.persistence.enabled | bool | `true` |  |
| gpp-zoeken.redis.master.persistence.size | string | `"8Gi"` |  |
| gpp-zoeken.redis.master.persistence.storageClass | string | `""` |  |
| gpp-zoeken.redis.master.resources.requests.cpu | string | `"10m"` |  |
| gpp-zoeken.redis.master.resources.requests.memory | string | `"20Mi"` |  |
| gpp-zoeken.replicaCount | int | `1` |  |
| gpp-zoeken.resources | object | `{}` |  |
| gpp-zoeken.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| gpp-zoeken.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| gpp-zoeken.securityContext.runAsNonRoot | bool | `true` |  |
| gpp-zoeken.securityContext.runAsUser | int | `1000` |  |
| gpp-zoeken.service.port | int | `80` |  |
| gpp-zoeken.service.type | string | `"ClusterIP"` |  |
| gpp-zoeken.serviceAccount.annotations | object | `{}` |  |
| gpp-zoeken.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| gpp-zoeken.serviceAccount.create | bool | `true` |  |
| gpp-zoeken.serviceAccount.name | string | `""` |  |
| gpp-zoeken.settings.allowedHosts | string | `""` |  |
| gpp-zoeken.settings.cache.axes | string | `""` |  |
| gpp-zoeken.settings.cache.default | string | `""` |  |
| gpp-zoeken.settings.celery.brokerUrl | string | `""` |  |
| gpp-zoeken.settings.celery.logLevel | string | `"debug"` |  |
| gpp-zoeken.settings.celery.resultBackend | string | `""` |  |
| gpp-zoeken.settings.cookieSamesite | string | `""` | Choises Strict or Lax |
| gpp-zoeken.settings.database.host | string | `""` |  |
| gpp-zoeken.settings.database.name | string | `""` |  |
| gpp-zoeken.settings.database.password | string | `""` |  |
| gpp-zoeken.settings.database.port | int | `5432` |  |
| gpp-zoeken.settings.database.sslmode | string | `"prefer"` |  |
| gpp-zoeken.settings.database.username | string | `""` |  |
| gpp-zoeken.settings.debug | bool | `false` |  |
| gpp-zoeken.settings.disable2fa | bool | `false` | Disable two factor authentication |
| gpp-zoeken.settings.djangoSettingsModule | string | `"woo_search.conf.docker"` |  |
| gpp-zoeken.settings.elastic.caCertsPath | string | `""` | Path to CA bundle (in PEM) format if self-signed certificates or a private CA are used to connect to the ES cluster |
| gpp-zoeken.settings.elastic.iniIndices | bool | `true` |  |
| gpp-zoeken.settings.elastic.password | string | `""` |  |
| gpp-zoeken.settings.elastic.roles | string | `"superuser"` |  |
| gpp-zoeken.settings.elastic.user | string | `"gpp-elastic"` |  |
| gpp-zoeken.settings.elasticapm.serviceName | string | `""` |  |
| gpp-zoeken.settings.elasticapm.token | string | `""` |  |
| gpp-zoeken.settings.elasticapm.url | string | `""` |  |
| gpp-zoeken.settings.email.defaultFrom | string | `""` |  |
| gpp-zoeken.settings.email.host | string | `"localhost"` |  |
| gpp-zoeken.settings.email.password | string | `""` |  |
| gpp-zoeken.settings.email.port | int | `25` |  |
| gpp-zoeken.settings.email.useTLS | bool | `false` |  |
| gpp-zoeken.settings.email.username | string | `""` |  |
| gpp-zoeken.settings.environment | string | `""` | sets the 'ENVIRONMENT' variable |
| gpp-zoeken.settings.environmentLabelBackgroundColor | string | `""` | CSS color value for the environment information background color. Defaults to orange, example values can be specified in HEX format too, e.g.: #FF0000 for red. |
| gpp-zoeken.settings.environmentLabelForegroundColor | string | `""` | CSS color value for the environment information text color. Defaults to black. Follows the same rules as ENVIRONMENT_BACKGROUND_COLOR. |
| gpp-zoeken.settings.environmentLabelName | string | `""` | Environment information to display, defaults to the value of ENVIRONMENT. Only displayed when SHOW_ENVIRONMENT is set to True. You can set this to strings like OpenGem PROD or simply PROD, depending on your needs. |
| gpp-zoeken.settings.isHttps | bool | `true` |  |
| gpp-zoeken.settings.job.backoffLimit | int | `6` |  |
| gpp-zoeken.settings.job.resources | object | `{}` |  |
| gpp-zoeken.settings.job.restartPolicy | string | `"OnFailure"` |  |
| gpp-zoeken.settings.job.ttlSecondsAfterFinished | int | `0` | 0 Will clean the job after it is finished |
| gpp-zoeken.settings.secretKey | string | `""` | Generate secret key at https://djecrety.ir/ |
| gpp-zoeken.settings.sentry.dsn | string | `""` |  |
| gpp-zoeken.settings.showLabelEnvironment | bool | `false` | Display environment information in the header in the admin. Defaults to True. Environment information is only displayed to logged in users. |
| gpp-zoeken.settings.useXForwardedHost | bool | `false` |  |
| gpp-zoeken.settings.uwsgi.harakiri | string | `""` |  |
| gpp-zoeken.settings.uwsgi.master | string | `""` |  |
| gpp-zoeken.settings.uwsgi.maxRequests | string | `""` |  |
| gpp-zoeken.settings.uwsgi.processes | string | `""` |  |
| gpp-zoeken.settings.uwsgi.threads | string | `""` |  |
| gpp-zoeken.tags.redis | bool | `true` |  |
| gpp-zoeken.tolerations | list | `[]` |  |
| gpp-zoeken.worker.autoscaling.behavior | object | `{}` |  |
| gpp-zoeken.worker.autoscaling.enabled | bool | `false` |  |
| gpp-zoeken.worker.autoscaling.maxReplicas | int | `100` |  |
| gpp-zoeken.worker.autoscaling.minReplicas | int | `1` |  |
| gpp-zoeken.worker.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| gpp-zoeken.worker.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| gpp-zoeken.worker.concurrency | int | `4` |  |
| gpp-zoeken.worker.label | string | `"1"` |  |
| gpp-zoeken.worker.livenessProbe.enabled | bool | `false` |  |
| gpp-zoeken.worker.livenessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| gpp-zoeken.worker.livenessProbe.exec.command[1] | string | `"-c"` |  |
| gpp-zoeken.worker.livenessProbe.exec.command[2] | string | `"celery --workdir src --app openforms.celery inspect --destination celery@${HOSTNAME} active"` |  |
| gpp-zoeken.worker.livenessProbe.failureThreshold | int | `3` |  |
| gpp-zoeken.worker.livenessProbe.initialDelaySeconds | int | `60` |  |
| gpp-zoeken.worker.livenessProbe.periodSeconds | int | `30` |  |
| gpp-zoeken.worker.livenessProbe.successThreshold | int | `1` |  |
| gpp-zoeken.worker.livenessProbe.timeoutSeconds | int | `10` |  |
| gpp-zoeken.worker.name | string | `""` |  |
| gpp-zoeken.worker.podLabels | object | `{}` |  |
| gpp-zoeken.worker.queueName | string | `""` |  |
| gpp-zoeken.worker.replicaCount | int | `1` |  |
| gpp-zoeken.worker.resources | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
