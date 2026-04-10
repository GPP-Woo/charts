#!/usr/bin/env bash
#
# helm-docs-with-deps.sh
#
# Fetches all Helm chart dependencies (recursively) and runs helm-docs
# with --document-dependency-values so that subchart values appear in
# the generated documentation.
#
# Usage:
#   ./helm-docs-with-deps.sh [CHART_DIR] [EXTRA_HELM_DOCS_ARGS...]
#
# Examples:
#   ./helm-docs-with-deps.sh .
#   ./helm-docs-with-deps.sh ./charts/my-app --dry-run
#   ./helm-docs-with-deps.sh ./charts/my-app --template-files README.md.gotmpl

set -euo pipefail

CHART_DIR="${1:-.}"
shift || true  # remaining args are forwarded to helm-docs

# ── Preflight checks ─────────────────────────────────────────────────
for cmd in helm helm-docs python3; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "ERROR: '$cmd' is not installed or not in PATH." >&2
    exit 1
  fi
done

if [[ ! -f "$CHART_DIR/Chart.yaml" ]]; then
  echo "ERROR: No Chart.yaml found in '$CHART_DIR'." >&2
  exit 1
fi

# ── Resolve to absolute path ─────────────────────────────────────────
CHART_DIR="$(cd "$CHART_DIR" && pwd)"

# Temp file to collect original repo URLs for post-processing READMEs
URL_MAP_FILE="$(mktemp)"
trap 'rm -f "$URL_MAP_FILE"' EXIT

# ── Update all repo indexes once ──────────────────────────────────────
echo "==> Updating Helm repo indexes (once) ..."
helm repo update

# ── Build dependencies (uses cached indexes, no further repo fetches) ─
echo "==> Building dependencies for $CHART_DIR ..."
helm dependency build --skip-refresh "$CHART_DIR"

# Also untar any .tgz archives so helm-docs can read their values.yaml.
# helm dep build leaves packaged charts as .tgz in charts/; helm-docs
# needs the unpacked directories to read values files.
if [[ -d "$CHART_DIR/charts" ]]; then
  echo "==> Unpacking dependency archives ..."
  for tgz in "$CHART_DIR/charts/"*.tgz; do
    [[ -e "$tgz" ]] || continue
    tar -xzf "$tgz" -C "$CHART_DIR/charts/"
    rm -f "$tgz"
    echo "    Unpacked $(basename "$tgz")"
  done
fi

# ── Recursively build nested dependencies ────────────────────────────
# Some subcharts may themselves declare dependencies.
build_nested_deps() {
  local dir="$1"
  for subchart_yaml in "$dir"/charts/*/Chart.yaml; do
    [[ -e "$subchart_yaml" ]] || continue
    local subchart_dir
    subchart_dir="$(dirname "$subchart_yaml")"

    # Skip if no dependencies declared
    if grep -qE '^\s*dependencies:' "$subchart_dir/Chart.yaml" 2>/dev/null; then
      echo "==> Building nested dependencies for $subchart_dir ..."
      helm dependency build --skip-refresh "$subchart_dir"

      # Unpack nested .tgz files too
      for tgz in "$subchart_dir/charts/"*.tgz; do
        [[ -e "$tgz" ]] || continue
        tar -xzf "$tgz" -C "$subchart_dir/charts/"
        rm -f "$tgz"
        echo "    Unpacked $(basename "$tgz")"
      done

      # Recurse
      build_nested_deps "$subchart_dir"
    fi
  done
}

build_nested_deps "$CHART_DIR"

# ── Rewrite repository URLs to file:// ────────────────────────────────
# helm-docs only includes dependency values when the repository field
# starts with "file://". After unpacking everything locally we patch
# every Chart.yaml so that each dependency points to its local directory.
# We use Python for reliable YAML handling.
rewrite_repos_to_local() {
  local dir="$1"
  [[ -f "$dir/Chart.yaml" ]] || { echo "    [DEBUG] No Chart.yaml in $dir"; return; }
  [[ -d "$dir/charts" ]] || { echo "    [DEBUG] No charts/ dir in $dir"; return; }

  # Collect names of locally present subcharts
  local -a local_charts=()
  for subchart in "$dir/charts"/*/; do
    [[ -d "$subchart" ]] || continue
    local_charts+=("$(basename "$subchart")")
  done
  [[ ${#local_charts[@]} -gt 0 ]] || { echo "    [DEBUG] No subcharts found in $dir/charts/"; return; }

  echo "    [DEBUG] Patching $dir/Chart.yaml for local deps: ${local_charts[*]}"

  # Back up files before patching
  for target in "$dir/Chart.yaml" "$dir/Chart.lock"; do
    [[ -f "$target" ]] || continue
    cp "$target" "$target.bak"
  done

  # Patch both Chart.yaml and Chart.lock (helm-docs may read either)
  for target in "$dir/Chart.yaml" "$dir/Chart.lock"; do
    [[ -f "$target" ]] || continue
    python3 - "$target" "$URL_MAP_FILE" "${local_charts[@]}" <<'PYEOF'
import sys, re

chart_file = sys.argv[1]
url_map_file = sys.argv[2]
local_names = set(sys.argv[3:])

print(f"    [DEBUG-PY] Processing {chart_file}, looking for deps: {local_names}")

with open(chart_file, "r") as f:
    lines = f.readlines()

out = []
current_dep_name = None
changed = False

for line in lines:
    # Detect start of a new dependency list item (any "- key: val")
    if re.match(r'^\s*-\s*\w+:', line):
        current_dep_name = None
        m = re.match(r'^\s*-\s*name:\s*["\']?(\S+?)["\']?\s*$', line)
        if m:
            current_dep_name = m.group(1)
        out.append(line)
        continue

    # Detect "name:" WITHOUT list marker
    m = re.match(r'^(\s+name:\s*)["\']?(\S+?)["\']?\s*$', line)
    if m and not re.match(r'^\s*-', line):
        current_dep_name = m.group(2)
        out.append(line)
        continue

    # If we're inside a dep block that exists locally, rewrite repository
    if current_dep_name and current_dep_name in local_names:
        m2 = re.match(r'^(\s*repository:\s*)["\']?(\S+?)["\']?\s*$', line)
        if m2:
            print(f"    [DEBUG-PY] Found repo for {current_dep_name}: {m2.group(2)}")
            if not m2.group(2).startswith("file://"):
                original_url = m2.group(2).strip("\"'")
                out.append(f"{m2.group(1)}file://charts/{current_dep_name}\n")
                # Save mapping: file://charts/name → original_url
                with open(url_map_file, "a") as mf:
                    mf.write(f"file://charts/{current_dep_name}\t{original_url.strip()}\n")
                changed = True
                continue

    out.append(line)

if changed:
    with open(chart_file, "w") as f:
        f.writelines(out)
    print(f"    Patched {chart_file}")
else:
    print(f"    No changes needed for {chart_file}")
PYEOF
  done

  # Recurse into subcharts
  for subchart in "$dir/charts"/*/; do
    [[ -d "$subchart" ]] || continue
    rewrite_repos_to_local "$subchart"
  done
}

echo "==> Rewriting dependency repositories to local file:// paths ..."
rewrite_repos_to_local "$CHART_DIR"

# ── Run helm-docs ────────────────────────────────────────────────────
echo "==> Running helm-docs with --document-dependency-values ..."
(cd "$CHART_DIR" && helm-docs \
  --chart-search-root . \
  --document-dependency-values \
  "$@")

# ── Restore original repository URLs in generated READMEs ─────────────
if [[ -s "$URL_MAP_FILE" ]]; then
  echo "==> Restoring original repository URLs in READMEs ..."
  # Deduplicate the mapping (same dep may appear in multiple charts)
  sort -u "$URL_MAP_FILE" -o "$URL_MAP_FILE"

  # Replace file:// URLs with originals in every README.md under the chart root
  find "$CHART_DIR" -name "README.md" -print0 | while IFS= read -r -d '' readme; do
    while IFS=$'\t' read -r fake_url original_url; do
      fake_url="${fake_url%$'\r'}"
      original_url="${original_url%$'\r'}"
      original_url="${original_url%$'\n'}"
      if grep -qF "$fake_url" "$readme"; then
        sed -i "s|${fake_url}|${original_url}|g" "$readme"
        echo "    Fixed $fake_url -> $original_url in $readme"
      fi
    done < "$URL_MAP_FILE"
  done
fi

# ── Restore original Chart.yaml and Chart.lock files ──────────────────
echo "==> Restoring original Chart.yaml / Chart.lock files ..."
find "$CHART_DIR" \( -name "Chart.yaml.bak" -o -name "Chart.lock.bak" \) -print0 | while IFS= read -r -d '' bak; do
  mv "$bak" "${bak%.bak}"
done

echo "==> Done. Documentation generated."