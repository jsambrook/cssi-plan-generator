#!/usr/bin/env bash
# Validate the structural output of a plan-generator run.
# Usage: validate-run.sh <run-directory> [expected-iterations]
set -euo pipefail

RUN_DIR="$1"
EXPECTED="${2:-3}"
ERRORS=0
WARNINGS=0

fail() { echo "  FAIL: $1"; ERRORS=$((ERRORS + 1)); }
warn() { echo "  WARN: $1"; WARNINGS=$((WARNINGS + 1)); }
pass() { echo "  ok:   $1"; }

echo "Validating: $RUN_DIR (expecting $EXPECTED iterations)"
echo "---"

# --- File existence ---

for f in seed.md rubric-snapshot.md results.tsv current-best.md iteration-log.md; do
  if [ -f "$RUN_DIR/$f" ]; then
    pass "$f exists"
  else
    fail "$f missing"
  fi
done

# current-best.md should be non-empty
if [ -f "$RUN_DIR/current-best.md" ]; then
  if [ -s "$RUN_DIR/current-best.md" ]; then
    pass "current-best.md is non-empty"
  else
    fail "current-best.md is empty"
  fi
fi

# --- results.tsv structure ---

if [ -f "$RUN_DIR/results.tsv" ]; then
  # Check header
  header=$(head -1 "$RUN_DIR/results.tsv")
  expected_header="iteration	variant	move	T	V	D	F	S	new_best	one_line"
  if [ "$header" = "$expected_header" ]; then
    pass "results.tsv header matches"
  else
    fail "results.tsv header mismatch"
    echo "        expected: $expected_header"
    echo "        got:      $header"
  fi

  # Check row count
  data_rows=$(tail -n +2 "$RUN_DIR/results.tsv" | grep -c '[^[:space:]]' || true)
  if [ "$data_rows" -eq "$EXPECTED" ]; then
    pass "results.tsv has $EXPECTED data rows"
  else
    fail "results.tsv has $data_rows data rows (expected $EXPECTED)"
  fi

  # Check scores are 0-100 integers
  score_errors=0
  row_num=0
  while IFS=$'\t' read -r iter var move t v d f s best note; do
    row_num=$((row_num + 1))
    for score in $t $v $d $f $s; do
      if ! [[ "$score" =~ ^[0-9]+$ ]]; then
        fail "Row $row_num: non-integer score '$score'"
        score_errors=$((score_errors + 1))
      elif [ "$score" -lt 0 ] || [ "$score" -gt 100 ]; then
        fail "Row $row_num: score $score out of range 0-100"
        score_errors=$((score_errors + 1))
      fi
    done
  done < <(tail -n +2 "$RUN_DIR/results.tsv")

  if [ "$score_errors" -eq 0 ]; then
    pass "All scores are integers in 0-100"
  fi
fi

# --- Variant files ---

variants_ok=0
variants_missing=0
for i in $(seq 1 "$EXPECTED"); do
  vnum=$(printf "v%03d" "$i")
  if [ -f "$RUN_DIR/variants/${vnum}.md" ]; then
    variants_ok=$((variants_ok + 1))
  else
    fail "variants/${vnum}.md missing"
    variants_missing=$((variants_missing + 1))
  fi
done

if [ "$variants_missing" -eq 0 ]; then
  pass "All $EXPECTED variant files present"
fi

# --- Variant structure (spot-check v001) ---

if [ -f "$RUN_DIR/variants/v001.md" ]; then
  for section in "## Move applied" "## Idea" "## Scores"; do
    if grep -q "$section" "$RUN_DIR/variants/v001.md"; then
      pass "v001.md contains '$section'"
    else
      # Use "Move rationale" as alternative for "Move applied"
      if [ "$section" = "## Move applied" ] && grep -qi "## Move" "$RUN_DIR/variants/v001.md"; then
        pass "v001.md contains a Move section (variant naming)"
      else
        fail "v001.md missing section '$section'"
      fi
    fi
  done
fi

# --- Optional files (warn, don't fail) ---

if [ -f "$RUN_DIR/top-5.md" ]; then
  pass "top-5.md exists"
else
  warn "top-5.md not found (optional for short runs)"
fi

# --- Summary ---

echo "---"
if [ "$ERRORS" -gt 0 ]; then
  echo "FAILED: $ERRORS error(s), $WARNINGS warning(s)"
  exit 1
else
  echo "PASSED: 0 errors, $WARNINGS warning(s)"
  exit 0
fi
