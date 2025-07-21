# gpp-stack

![Version: 0.2.2](https://img.shields.io/badge/Version-0.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

An umbrella chart for the GPP stack

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://GPP-Woo.github.io/charts | gpp-app | 0.2.0 |
| https://GPP-Woo.github.io/charts | gpp-burgerportaal | 1.1.0 |
| https://GPP-Woo.github.io/charts | gpp-publicatiebank | 2.0.5 |
| https://GPP-Woo.github.io/charts | gpp-zoeken | 0.2.2 |
| https://maykinmedia.github.io/charts/ | openzaak | 1.8.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.settings.databaseHost | string | `""` | Global databasehost, overrides setting.database.host |
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
| gpp-app.enabled | bool | `true` |  |
| gpp-app.existingSecret | string | `nil` |  |
| gpp-app.extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
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
| gpp-app.settings.gppPublicatiebank.apiKey | string | `""` |  |
| gpp-app.settings.gppPublicatiebank.baseUrl | string | `""` |  |
| gpp-app.settings.oidc.adminRole | string | `""` |  |
| gpp-app.settings.oidc.authority | string | `""` |  |
| gpp-app.settings.oidc.clientId | string | `""` |  |
| gpp-app.settings.oidc.clientSecret | string | `""` |  |
| gpp-app.settings.oidc.idClaimType | string | `""` |  |
| gpp-app.settings.oidc.nameClaimType | string | `""` |  |
| gpp-app.settings.oidc.roleClaimType | string | `""` |  |
| gpp-app.tolerations | list | `[]` |  |
| gpp-burgerportaal.affinity | object | `{}` |  |
| gpp-burgerportaal.autoscaling.enabled | bool | `false` |  |
| gpp-burgerportaal.autoscaling.maxReplicas | int | `100` |  |
| gpp-burgerportaal.autoscaling.minReplicas | int | `1` |  |
| gpp-burgerportaal.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| gpp-burgerportaal.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| gpp-burgerportaal.azureVaultSecret.contentType | string | `""` |  |
| gpp-burgerportaal.azureVaultSecret.objectName | string | `""` |  |
| gpp-burgerportaal.azureVaultSecret.secretName | string | `"{{ .Values.existingSecret }}"` |  |
| gpp-burgerportaal.azureVaultSecret.vaultName | string | `nil` |  |
| gpp-burgerportaal.enabled | bool | `true` |  |
| gpp-burgerportaal.existingSecret | string | `nil` |  |
| gpp-burgerportaal.extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
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
| gpp-burgerportaal.persistence.enabled | bool | `true` |  |
| gpp-burgerportaal.persistence.existingClaim | string | `nil` |  |
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
| gpp-burgerportaal.settings.downloadTimeoutMinutes | int | `10` | The maximum duration in minutes for downloading files. <br/> (default value is `10`) |
| gpp-burgerportaal.settings.gppPublicatiebank.apiKey | string | `""` | The secret key for the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| gpp-burgerportaal.settings.gppPublicatiebank.baseUrl | string | `""` | The base URL of the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `https://publicatiebank.mijn-gemeente.nl` </details> |
| gpp-burgerportaal.settings.resources.gemeenteContactUrl | string | `""` | The website address where the municipality's contact details can be found. Used for linking from the citizen portal. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/contact`</details> |
| gpp-burgerportaal.settings.resources.gemeenteDesignTokensUrl | string | `""` | Public URL where the CSS file containing NL Design System tokens is available, to style the citizen portal in the municipal house style. <details><summary>More information </summary>For example: `https://unpkg.com/@gemeente/design-tokens/dist/index.css`</details> |
| gpp-burgerportaal.settings.resources.gemeenteFaviconUrl | string | `""` | Public URL where the municipality's favicon is available. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/favicon.ico`</details> |
| gpp-burgerportaal.settings.resources.gemeenteLogoUrl | string | `""` | Public URL where the municipality's logo is available. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/logo.svg`</details> |
| gpp-burgerportaal.settings.resources.gemeenteMainImageUrl | string | `""` | Public URL where a high-resolution atmospheric image of the municipality is available, to be included on all pages. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/main_img.jpg` </details> |
| gpp-burgerportaal.settings.resources.gemeenteNaam | string | `""` | The name of the municipality used within the citizen portal. <details><summary>More information</summary> For example: Mijn Gemeente</details>  |
| gpp-burgerportaal.settings.resources.gemeentePrivacyUrl | string | `""` | The website address where the municipality's privacy statement is located. Used for linking from the citizen portal. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/privacy`</details> |
| gpp-burgerportaal.settings.resources.gemeenteThemeNaam | string | `""` | The name of the selector from the CSS file used to scope the NLDS tokens. <details><summary>More information</summary> For example: `gemeente-theme` </details> |
| gpp-burgerportaal.settings.resources.gemeenteWebFontSources | list | `[]` | Public URLs referring to web font file(s) associated with the municipal house style. <details><summary>More information </summary>For example: `["https://fonts.mijn-gemeente.nl/custom-regular-font.woff2", "https://fonts.mijn-gemeente.nl/custom-bold-font.woff2"]`. A single reference to the location where all font-style files are stored is also possible: `["https://fonts.mijn-gemeente.nl/custom-font/"]`. **Note:** this configuration is only intended to allow font files to be loaded under CORS. References to files must also be specified under a `@font-face` ruleset in the theme styling.</details> |
| gpp-burgerportaal.settings.resources.gemeenteWebsiteUrl | string | `""` | The website address of the municipality, for linking from the citizen portal to the municipal website. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl`</details> |
| gpp-burgerportaal.settings.resources.gemeenteWelkom | string | `""` | The welcome text, formatted in HTML, for the homepage. <details><summary>More information</summary> **Note:** The HTML fragment must be properly escaped/formatted depending on the format (e.g., JSON or YAML) to be added as an environment variable. The following HTML elements can be used here: `<h1>, <h2>, <p>, <a>, <ul>, <ol>, <li>`</details> |
| gpp-burgerportaal.settings.resources.portaalTitel | string | `""` | The title of the citizen portal. <details><summary>More information</summary> For example: Open Mijn Gemeente</details> |
| gpp-burgerportaal.settings.resources.toegankelijkheidsverklaringRegisterUrl | string | `""` | The website address of the government register of accessibility declarations. Used for linking from the citizen portal. <details><summary>More information</summary> Likely: `https://www.toegankelijkheidsverklaring.nl/register`</details> |
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
| gpp-publicatiebank.enabled | bool | `true` |  |
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
| gpp-publicatiebank.nameOverride | string | `""` |  |
| gpp-publicatiebank.nginx.autoscaling.enabled | bool | `false` |  |
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
| gpp-publicatiebank.nodeSelector | object | `{}` |  |
| gpp-publicatiebank.pdb.create | bool | `false` |  |
| gpp-publicatiebank.pdb.maxUnavailable | string | `""` |  |
| gpp-publicatiebank.pdb.minAvailable | int | `1` |  |
| gpp-publicatiebank.persistence.existingClaim | string | `nil` |  |
| gpp-publicatiebank.persistence.mediaMountSubpath | string | `"gpp-app/media"` |  |
| gpp-publicatiebank.persistence.privateMediaMountSubpath | string | `"gpp-app/private_media"` |  |
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
| gpp-publicatiebank.redis.master.persistence.enabled | bool | `true` |  |
| gpp-publicatiebank.redis.master.persistence.size | string | `"8Gi"` |  |
| gpp-publicatiebank.redis.master.persistence.storageClass | string | `""` |  |
| gpp-publicatiebank.redis.master.resources.requests.cpu | string | `"10m"` |  |
| gpp-publicatiebank.redis.master.resources.requests.memory | string | `"20Mi"` |  |
| gpp-publicatiebank.redis.nameOverride | string | `"gpp-publicatiebank-redis"` |  |
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
| gpp-publicatiebank.settings.cache.oidc | string | `""` |  |
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
| gpp-publicatiebank.settings.environment_background_color | string | `""` |  |
| gpp-publicatiebank.settings.environment_label | string | `""` | Environment information to display, defaults to the value of ENVIRONMENT. Only displayed when SHOW_ENVIRONMENT is set to True. You can set this to strings like OpenGem PROD or simply PROD, depending on your needs. |
| gpp-publicatiebank.settings.isHttps | bool | `true` |  |
| gpp-publicatiebank.settings.secretKey | string | `""` | Generate secret key at https://djecrety.ir/ |
| gpp-publicatiebank.settings.sentry.dsn | string | `""` |  |
| gpp-publicatiebank.settings.showLabelEnvironment | bool | `false` | Display environment information in the header in the admin. Defaults to True. Environment information is only displayed to logged in users. |
| gpp-publicatiebank.settings.show_label_environment | string | `"false"` | Display environment information in the header in the admin. Defaults to True. Environment information is only displayed to logged in users. |
| gpp-publicatiebank.settings.useXForwardedHost | bool | `false` |  |
| gpp-publicatiebank.settings.uwsgi.harakiri | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.master | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.maxRequests | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.processes | string | `""` |  |
| gpp-publicatiebank.settings.uwsgi.threads | string | `""` |  |
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
| gpp-publicatiebank.worker.name | string | `""` |  |
| gpp-publicatiebank.worker.podLabels | object | `{}` |  |
| gpp-publicatiebank.worker.queueName | string | `""` |  |
| gpp-publicatiebank.worker.replicaCount | int | `1` |  |
| gpp-publicatiebank.worker.resources | object | `{}` |  |
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
| gpp-zoeken.eck-elasticsearch.enabled | bool | `true` |  |
| gpp-zoeken.eck-elasticsearch.fullnameOverride | string | `"gpp-zoeken-eck-elasticsearch"` |  |
| gpp-zoeken.eck-elasticsearch.nameOverride | string | `"gpp-zoeken-eck-elasticsearch"` |  |
| gpp-zoeken.eck-elasticsearch.version | string | `"8.17.1"` |  |
| gpp-zoeken.eck-operator.enabled | bool | `true` |  |
| gpp-zoeken.eck-operator.fullnameOverride | string | `"gpp-zoeken-eck-operator"` |  |
| gpp-zoeken.eck-operator.nameOverride | string | `"gpp-zoeken-eck-operator"` |  |
| gpp-zoeken.existingSecret | string | `nil` |  |
| gpp-zoeken.existingSecretElastic | string | `nil` |  |
| gpp-zoeken.extraEnvVars | list | `[]` | Array with extra environment variables to add |
| gpp-zoeken.extraIngress | list | `[]` |  |
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
| gpp-zoeken.redis.master.persistence.enabled | bool | `true` |  |
| gpp-zoeken.redis.master.persistence.size | string | `"8Gi"` |  |
| gpp-zoeken.redis.master.persistence.storageClass | string | `""` |  |
| gpp-zoeken.redis.master.resources.requests.cpu | string | `"10m"` |  |
| gpp-zoeken.redis.master.resources.requests.memory | string | `"20Mi"` |  |
| gpp-zoeken.redis.nameOverride | string | `"gpp-zoeken-redis"` |  |
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
| openzaak.worker.livenessProbe.failureThreshold | int | `3` |  |
| openzaak.worker.livenessProbe.initialDelaySeconds | int | `60` |  |
| openzaak.worker.livenessProbe.periodSeconds | int | `10` |  |
| openzaak.worker.livenessProbe.successThreshold | int | `1` |  |
| openzaak.worker.livenessProbe.timeoutSeconds | int | `5` |  |
| openzaak.worker.podLabels | object | `{}` |  |
| openzaak.worker.readinessProbe.failureThreshold | int | `3` |  |
| openzaak.worker.readinessProbe.initialDelaySeconds | int | `30` |  |
| openzaak.worker.readinessProbe.periodSeconds | int | `10` |  |
| openzaak.worker.readinessProbe.successThreshold | int | `1` |  |
| openzaak.worker.readinessProbe.timeoutSeconds | int | `5` |  |
| openzaak.worker.replicaCount | int | `1` |  |
| openzaak.worker.resources | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
