#!/usr/bin/env bash
set -euo pipefail

echo '[verify] checking TOC/TP integrity'
scripts/check_tp_integrity.sh

echo '[verify] scanning for TODO markers (lines starting with TODO)'
pattern='^\s*TODO\b'
if RIPGREP_CONFIG_PATH= rg --line-number --hidden --glob '!.git/' "$pattern"; then
  echo '[verify] TODO markers found. Remove or document before merging.' >&2
  exit 1
else
  status=$?
  if [[ $status -ne 1 ]]; then
    echo '[verify] rg failed unexpectedly.' >&2
    exit $status
  fi
fi

echo '[verify] done'
