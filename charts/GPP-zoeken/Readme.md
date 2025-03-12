# GPP-Zoeken

## Elastic search

To deploy Elasticsearch, the cluster wide Custom Resource Definitions (CRDs) need to be present.
They can be installed by a cluster administrator with:

```bash
helm install elastic-operator-crds elastic/eck-operator-crds
```

