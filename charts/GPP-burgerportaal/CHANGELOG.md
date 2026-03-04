# Changelog

## 2.0.0-rc.2 (2026-03-04)

- Add new environment variables for docker image version 5.0.0-rc.1
- Add volume (mount) to allow saving images for image version 5.0.0-rc.1
- use ReadWriteMany storage by default
- Remove unused values
- update appversion to 5.0.0-rc.1

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