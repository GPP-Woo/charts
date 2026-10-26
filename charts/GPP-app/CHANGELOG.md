# Changelog

## 0.5.0-rc.0 (2026-10-23)

- Set appVersion to 4.0.0-rc.0. The app reads no new or changed environment variables, so templates and values are unchanged.
- GPP-app 4.0 requires GPP-publicatiebank >= 3.0.0: it fetches the inzageprocedure of every publicatie, and an older publicatiebank answers that with an error.
- On startup the app migrates its database (adds a column to `Gebruikersgroepen`).

## 0.4.0 (2026-10-15)

- Add `settings.uploadTimeoutMinutes` and `settings.downloadTimeoutMinutes`, rendered as `UPLOAD_TIMEOUT_MINUTES` and `DOWNLOAD_TIMEOUT_MINUTES` when set. Empty (the default) keeps the app's own default of 10 minutes, so existing releases render unchanged. The app aborts a file-part upload that takes longer, which limits slow clients to about 100 MiB per part at 1.4 Mbit/s.

## 0.3.2 (2026-04-22)

- Set appversion to 3.1.0
- Remove unused values

## 0.3.1 (2026-01-21)

- Set appversion to 3.0.1

## 0.3.0 (2025-08-28)

- Add extraVolumes/extraVolumeMounts
- Set appversion to 3.0.0

## 0.2.0 (2025-07-16)

- Set appversion to 3.0.0-rc.0