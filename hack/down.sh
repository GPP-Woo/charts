#!/usr/bin/env bash
# Tear down the local e2e cluster. KEEP_CLUSTER=1 only uninstalls the releases.
set -euo pipefail
CLUSTER=gpp-e2e
NS=gpp-e2e
if [ "${KEEP_CLUSTER:-}" = "1" ]; then
  for r in seed openzaak zoeken eck-operator odbp odpc odrc infra; do helm -n "$NS" uninstall "$r" 2>/dev/null || true; done
else
  kind delete cluster --name "$CLUSTER"
fi
