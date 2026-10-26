# Changelog

## 2.1.0-rc.0 (2026-10-23)

- Set appVersion to 5.1.0-rc.0. The app reads no new or changed environment variables, so templates and values are unchanged.
- The new inzageprocedure banner needs GPP-publicatiebank >= 3.0.0. With an older publicatiebank the portal keeps working without the banner.

## 2.0.2 (2026-08-31)

- `settings.sitemapCacheDurationHours` and `settings.downloadTimeoutMinutes` are now rendered when set to `0`, instead of being dropped from the ConfigMap.

## 2.0.1 (2026-08-26)

- Remove stray tab characters from 19 `RESOURCES__*` key names in the ConfigMap template. Kubernetes trimmed them, but they made rendered manifests unparseable by stricter YAML parsers (e.g. PyYAML).

## 2.0.0 (2026-04-22)

- Add new environment variables for docker image version 5.0.0
- Add volume (mount) to allow saving images for image version 5.0.0
- use ReadWriteMany storage by default
- Remove unused values
- update appversion to 5.0.0

## 1.2.0 (2025-08-28)

- Add extraVolumes/extraVolumeMounts
- update appversion to 4.0.0

## 1.1.0 (2025-07-18)

- Add Values.settings.resources.gemeenteVideoUrl
- Set appversion to 4.0.0-rc.0


## 1.0.2 (2025-05-07)

- Set aspnetcore related env vars in config
- Set appversion to 2.0.1

## 1.0.1 (2025-03-24)

- Wrap all environment variables in quotes to prevent patch errors during helm upgrade

## 1.0.0 (2025-03-20)

- Added variables for connecting to `gpp-zoeken`
- Added variables for loading custom resources
- Removed obsolete `redirectUrl` variable