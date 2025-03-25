# Changelog

## 2.0.1 (2025-03-25)

- Allow leaving the ingress backend empty.

## 2.0.0 (2025-03-21)

- Added Flower
- Fixed the fact that Nginx was being deployed but the traffic was going directly from the ingress to the 
  application pods. This means that when upgrading the ingress needs to be deleted and re-added.

## 1.1.0 (2025-02-21)

- Added celery workers.