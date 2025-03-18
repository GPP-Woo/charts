# Helm Charts

This repository contains the Helm charts for the invididual components and the umbrella
chart for the full stack of components.

The deployed components are:

* GPP-App
* GPP-Burgerportaal
* GPP-Publicatiebank
* Open Zaak

## Requirements

The requirements listed here are not included in the charts and you're responsible for
provisioning them yourself.

* PostgreSQL database (version 13 or higher, 16 (latest) is recommended)
* An OpenID Connect identity provider for Single Sign On (optional)

## Cheat sheet

```bash
helm repo add gpp-woo https://GPP-Woo.github.io/charts
helm repo update
helm install \
    -f myvalues.yml \
    my-gpp-woo \
    gpp-woo/gpp-stack
```

Assuming a values file ``myvalues.yml`` was created.

## Elastic Search recommendations

GPP-zoeken requires Elastic Search (v8.x, tested with 8.17) to be deployed to function
properly. We recommend installing Elastic Search in your cluster using their
[operator](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-install-helm.html).

Since GPP-zoeken sends binary file content to Elastic Search, the following
recommendations apply:

* Deploy at least 3 master nodes
* Ensure you have at least one node with `data` role.
* Ensure you have at least one node with `ingest` role, separate from the node(s) with
  `data` role. Depending on how frequently documents are uploaded, you may need to
  play around with the number of nodes.

If you don't expose Elasticsearch through an ingress, you can connect GPP-zoeken to its
internal http endpoint. The internal endpoint uses its own Certificate Authority (CA),
so make sure to make the root certificate available to GPP-zoeken via the
`ELASTICSEARCH_CA_CERTS` or the `EXTRA_VERIFY_CERTS`
[environment variables](https://gpp-zoeken.readthedocs.io/en/latest/installation/config.html).
