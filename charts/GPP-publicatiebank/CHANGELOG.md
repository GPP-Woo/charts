# Changelog

## 2.0.5 (2025-07-18)

- Set appVersion to 2.0.0-rc.0

## 2.0.4 (2025-04-23)

- Serve media files directly from nginx.
- Add location `/.well-known/security.txt` in nginx.

## 2.0.3 (2025-04-16)

- Add explicit persistence.enabled value.
- Improve persistence documentation.

## 2.0.2 (2025-03-26)

- Use the correct appname in the celery command/

## 2.0.1 (2025-03-25)

- Allow leaving the ingress backend empty.

## 2.0.0 (2025-03-21)

- Added Flower
- Fixed the fact that Nginx was being deployed but the traffic was going directly from the ingress to the 
  application pods. This means that when upgrading the ingress needs to be deleted and re-added.

## 1.1.0 (2025-02-21)

- Added celery workers.