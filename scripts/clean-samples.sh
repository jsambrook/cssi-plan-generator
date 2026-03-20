#!/usr/bin/env bash
# Remove all sample run output (runs/_sample-*/).
# Safe: only touches directories with the _sample- prefix.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

shopt -s nullglob
sample_dirs=("$REPO_ROOT"/runs/_sample-*/)
shopt -u nullglob

if [ ${#sample_dirs[@]} -eq 0 ]; then
  echo "No sample runs found."
  exit 0
fi

for dir in "${sample_dirs[@]}"; do
  echo "Removing: ${dir#$REPO_ROOT/}"
  rm -rf "$dir"
done

echo "Cleaned ${#sample_dirs[@]} sample run(s)."
