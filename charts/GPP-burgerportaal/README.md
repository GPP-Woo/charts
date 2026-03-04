# gpp-burgerportaal

![Version: 2.0.0-rc.1](https://img.shields.io/badge/Version-2.0.0--rc.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.0.0-rc.1](https://img.shields.io/badge/AppVersion-5.0.0--rc.1-informational?style=flat-square)

A helm chart for the ICATT GPP burgerportaal.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts, for example to trust extra ca certificates. |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes, for example to trust extra ca certificates. |
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
| persistence.accessMode | string | `"ReadWriteMany"` |  |
| persistence.enabled | bool | `true` | If persistence is enabled, a PVC is used. Otherwise, the app container will use an emptyDir volume. Note: data in emptyDir volumes is lost when the pod is removed. |
| persistence.existingClaim | string | `nil` | If persistence.existingClaim is set, no PVC will be created, but the referenced PVC will be used to mount a volume in the app container. |
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
| settings.blockRobots | bool | `false` | Whether to block robots from crawling the citizen portal. <details><summary>More information</summary> If set to `true`, a `robots.txt` file will be served with the content `User-agent: *\nDisallow: /`, which blocks all robots from crawling the citizen portal. Default value is `false`.</details> |
| settings.database.host | string | `""` |  |
| settings.database.name | string | `""` |  |
| settings.database.password | string | `""` |  |
| settings.database.port | int | `5432` |  |
| settings.database.username | string | `""` |  |
| settings.downloadTimeoutMinutes | int | `10` | The maximum duration in minutes for downloading files. <br/> (default value is `10`) |
| settings.gppPublicatiebank.apiKey | string | `""` | The secret key for the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| settings.gppPublicatiebank.baseUrl | string | `""` | The base URL of the Publicatiebank to establish a connection. <details> <summary>More information </summary>For example: `https://publicatiebank.mijn-gemeente.nl` </details> |
| settings.oidc.adminRole | string | `""` | The role that will be used to determine if a user is an administrator in the citizen portal. <details> <summary>More information </summary>For example: `admin`</details> |
| settings.oidc.authority | string | `""` | The OpenID Connect authority of the Identity Provider to establish a connection. <details> <summary>More information </summary>For example: `https://auth.mijn-gemeente.nl/realms/gpp` </details> |
| settings.oidc.clientId | string | `""` | The client ID for the OpenID Connect connection. <details> <summary>More information </summary>For example: `gpp-burgerportaal`</details> |
| settings.oidc.clientSecret | string | `""` | The client secret for the OpenID Connect connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| settings.oidc.idClaimType | string | `""` | The claim type in which the user ID is stored. <details> <summary>More information </summary>For example: `sub`</details> |
| settings.oidc.nameClaimType | string | `""` | The claim type in which the user name is stored. <details> <summary>More information </summary>For example: `name`</details> |
| settings.oidc.roleClaimType | string | `""` | The claim type in which the user roles are stored. <details> <summary>More information </summary>For example: `roles`</details> |
| settings.resources.designTokensUrl | string | `""` | Public URL where the CSS file containing NL Design System tokens is available, to style the citizen portal in the organisational house style. <details><summary>More information </summary>For example: `https://unpkg.com/@gemeente/design-tokens/dist/index.css`</details> |
| settings.resources.gemeenteContactUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.gemeenteDesignTokensUrl | string | `""` | DEPRECATED - use resources.designTokensUrl instead. this setting will be removed in a future version |
| settings.resources.gemeenteFaviconUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.gemeenteLogoUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.gemeenteMainImageUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.gemeenteNaam | string | `""` | DEPRECATED - use resources.organisatieNaam instead. this setting will be removed in a future version |
| settings.resources.gemeentePrivacyUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.gemeenteThemeNaam | string | `""` | DEPRECATED - use resources.themeNaam instead. this setting will be removed in a future version |
| settings.resources.gemeenteVideoUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.gemeenteWebFontSources | list | `[]` | DEPRECATED - use resources.webFontSources instead . this setting will be removed in a future version |
| settings.resources.gemeenteWebsiteUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.gemeenteWelkom | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.organisatieNaam | string | `""` | The name of the organisation used within the citizen portal. <details><summary>More information</summary> For example: My Organization. Please note: only mention the name here, not the type (so “Demodam” instead of Gemeente Demodam”)</details>  |
| settings.resources.organisatieType | string | `""` | The type of organisation used within the citizen portal. <details><summary>More information</summary> Possible values: `gemeente`, `provincie`, `waterschap`, `stichting`, `vereniging`, `organisatie`. This determines how the organization is referred to in the Citizen Portal (e.g. "Naar de gemeente" or "Naar het waterschap"). Default: `organisatie`. </details>  |
| settings.resources.portaalTitel | string | `""` | The title of the citizen portal. <details><summary>More information</summary> For example: Open Mijn Gemeente</details> |
| settings.resources.themeNaam | string | `""` | The name of the selector from the CSS file used to scope the NLDS tokens. <details><summary>More information</summary> For example: `gemeente-theme` </details> |
| settings.resources.toegankelijkheidsverklaringRegisterUrl | string | `""` | DEPRECATED - this setting is managed in the application and will be removed in a future version |
| settings.resources.webFontSources | list | `[]` | Public URLs referring to web font file(s) associated with the organisation house style. <details><summary>More information </summary>For example: `["https://fonts.mijn-gemeente.nl/custom-regular-font.woff2", "https://fonts.mijn-gemeente.nl/custom-bold-font.woff2"]`. A single reference to the location where all font-style files are stored is also possible: `["https://fonts.mijn-gemeente.nl/custom-font/"]`. **Note:** this configuration is only intended to allow font files to be loaded under CORS. References to files must also be specified under a `@font-face` ruleset in the theme styling.</details> |
| settings.search.apiKey | string | `""` | The secret key for the Search component to establish a connection. <details> <summary>More information </summary>For example: `VM2B!ccnebNe.M*gxH63*NXc8iTiAGhp`</details> |
| settings.search.baseUrl | string | `""` | The base URL of the Search component to establish a connection. <details> <summary>More information </summary>For example: `https://zoekcomponent.mijn-gemeente.nl` </details> |
| settings.sitemapCacheDurationHours | int | `23` | The number of hours the sitemap is cached. <br/> (default value is `23`) |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
