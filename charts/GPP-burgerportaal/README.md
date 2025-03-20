# gpp-burgerportaal

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

A helm chart for the ICATT GPP Burgerportaal.

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
| extraIngress | list | `[]` | Specify extra ingresses, for example if you have multiple ingress classes |
| fullnameOverride | string | `""` |  |
| global.settings.databaseHost | string | `""` | Global databasehost, overrides setting.database.host |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/gpp-woo/gpp-burgerportaal"` |  |
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
| nodeSelector | object | `{}` |  |
| pdb.create | bool | `false` |  |
| pdb.maxUnavailable | string | `""` |  |
| pdb.minAvailable | int | `1` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `nil` |  |
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
| settings.aspnetcore.environment | string | `""` |  |
| settings.aspnetcore.forwardedHeadersEnabled | bool | `true` |  |
| settings.aspnetcore.httpPorts | string | `""` |  |
| settings.downloadTimeoutMinutes | int | `10` | The maximum duration in minutes for downloading files. <br/> (default value is `10`) |
| settings.gppPublicatiebank.apiKey | string | `""` | The secret key for the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| settings.gppPublicatiebank.baseUrl | string | `""` | The base URL of the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `https://publicatiebank.mijn-gemeente.nl` </details> |
| settings.resources.gemeenteContactUrl | string | `""` | The website address where the municipality's contact details can be found. Used for linking from the citizen portal. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/contact`</details> |
| settings.resources.gemeenteDesignTokensUrl | string | `""` | Public URL where the CSS file containing NL Design System tokens is available, to style the citizen portal in the municipal house style. <details><summary>More information </summary>For example: `https://unpkg.com/@gemeente/design-tokens/dist/index.css`</details> |
| settings.resources.gemeenteFaviconUrl | string | `""` | Public URL where the municipality's favicon is available. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/favicon.ico`</details> |
| settings.resources.gemeenteLogoUrl | string | `""` | Public URL where the municipality's logo is available. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/logo.svg`</details> |
| settings.resources.gemeenteMainImageUrl | string | `""` | Public URL where a high-resolution atmospheric image of the municipality is available, to be included on all pages. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/main_img.jpg` </details> |
| settings.resources.gemeenteNaam | string | `""` | The name of the municipality used within the citizen portal. <details><summary>More information</summary> For example: Mijn Gemeente</details>  |
| settings.resources.gemeentePrivacyUrl | string | `""` | The website address where the municipality's privacy statement is located. Used for linking from the citizen portal. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl/privacy`</details> |
| settings.resources.gemeenteThemeNaam | string | `""` | The name of the selector from the CSS file used to scope the NLDS tokens. <details><summary>More information</summary> For example: `gemeente-theme` </details> |
| settings.resources.gemeenteWebFontSources | list | `[]` | Public URLs referring to web font file(s) associated with the municipal house style. <details><summary>More information </summary>For example: `["https://fonts.mijn-gemeente.nl/custom-regular-font.woff2", "https://fonts.mijn-gemeente.nl/custom-bold-font.woff2"]`. A single reference to the location where all font-style files are stored is also possible: `["https://fonts.mijn-gemeente.nl/custom-font/"]`. **Note:** this configuration is only intended to allow font files to be loaded under CORS. References to files must also be specified under a `@font-face` ruleset in the theme styling.</details> |
| settings.resources.gemeenteWebsiteUrl | string | `""` | The website address of the municipality, for linking from the citizen portal to the municipal website. <details><summary>More information</summary> For example: `https://www.mijn-gemeente.nl`</details> |
| settings.resources.gemeenteWelkom | string | `""` | The welcome text, formatted in HTML, for the homepage. <details><summary>More information</summary> **Note:** The HTML fragment must be properly escaped/formatted depending on the format (e.g., JSON or YAML) to be added as an environment variable. The following HTML elements can be used here: `<h1>, <h2>, <p>, <a>, <ul>, <ol>, <li>`</details> |
| settings.resources.portaalTitel | string | `""` | The title of the citizen portal. <details><summary>More information</summary> For example: Open Mijn Gemeente</details> |
| settings.resources.toegankelijkheidsverklaringRegisterUrl | string | `""` | The website address of the government register of accessibility declarations. Used for linking from the citizen portal. <details><summary>More information</summary> Likely: `https://www.toegankelijkheidsverklaring.nl/register`</details> |
| settings.search.apiKey | string | `""` | The secret key for the Search component to establish a connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| settings.search.baseUrl | string | `""` | The base URL of the Search component to establish a connection. <details> <summary>More information </summary>For example: `https://zoekcomponent.mijn-gemeente.nl` </details> |
| settings.sitemapCacheDurationHours | int | `23` | The number of hours the sitemap is cached. <br/> (default value is `23`) |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
