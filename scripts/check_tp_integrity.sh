#!/usr/bin/env bash
set -euo pipefail

CHANGED=()
while IFS= read -r file; do
  [[ -z "$file" ]] && continue
  CHANGED+=("$file")
done < <(git diff --name-only HEAD)

has_change() {
  local target=$1
  for f in "${CHANGED[@]}"; do
    [[ "$f" == "$target" ]] && return 0
  done
  return 1
}

failures=()

if has_change "references/toc-thinking-processes.md"; then
  has_change "references/mutate.md" || failures+=("references/mutate.md (missing alongside TOC reference change)")
  has_change "CLAUDE.md" || failures+=("CLAUDE.md (missing alongside TOC reference change)")
fi

if has_change "references/mutate.md" && ! has_change "references/toc-thinking-processes.md"; then
  failures+=("references/toc-thinking-processes.md (missing while move catalog changed)")
fi

if has_change "CLAUDE.md" && ! has_change "references/toc-thinking-processes.md"; then
  failures+=("references/toc-thinking-processes.md (missing while agent instructions changed)")
fi

if ((${#failures[@]} > 0)); then
  printf 'TOC/TP integrity check failed. Please update the following files:\n'
  for item in "${failures[@]}"; do
    printf '  - %s\n' "$item"
  done
  printf '\nIf this change intentionally omits one of the files, rerun the script after updating or document the exception in your review notes.\n'
  exit 1
fi

echo "TOC/TP integrity check passed."
