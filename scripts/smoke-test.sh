#!/usr/bin/env bash
# Run sample ideas through the plan generator and validate output.
#
# Usage:
#   scripts/smoke-test.sh                          # Run all samples
#   scripts/smoke-test.sh consultant-proposal      # Run one sample
#   ITERATIONS=1 scripts/smoke-test.sh             # Quick single-iteration check
#   AGENT_CMD="codex" scripts/smoke-test.sh        # Use a different agent CLI
#
# Prerequisites:
#   - claude CLI (or the CLI specified by AGENT_CMD) must be on PATH
#   - Internet access (for claude CLI API calls)
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGENT_CMD="${AGENT_CMD:-claude}"
ITERATIONS="${ITERATIONS:-3}"
SAMPLES_DIR="$REPO_ROOT/samples"
SCRIPTS_DIR="$REPO_ROOT/scripts"

# Collect targets
TARGETS=("$@")
if [ ${#TARGETS[@]} -eq 0 ]; then
  # Run all samples: extract names from .seed.md files
  shopt -s nullglob
  seed_files=("$SAMPLES_DIR"/*.seed.md)
  shopt -u nullglob
  if [ ${#seed_files[@]} -eq 0 ]; then
    echo "No sample seed files found in $SAMPLES_DIR"
    exit 1
  fi
  for f in "${seed_files[@]}"; do
    name=$(basename "$f" .seed.md)
    TARGETS+=("$name")
  done
fi

TOTAL=${#TARGETS[@]}
PASSED=0
FAILED=0

for sample in "${TARGETS[@]}"; do
  slug="_sample-${sample}"
  seed_file="$SAMPLES_DIR/${sample}.seed.md"
  run_dir="$REPO_ROOT/runs/$slug"

  if [ ! -f "$seed_file" ]; then
    echo "ERROR: Seed file not found: $seed_file"
    FAILED=$((FAILED + 1))
    continue
  fi

  if [ -d "$run_dir" ]; then
    echo "SKIP: $sample — run directory already exists. Run scripts/clean-samples.sh first."
    FAILED=$((FAILED + 1))
    continue
  fi

  echo ""
  echo "========================================"
  echo "Sample: $sample"
  echo "Slug:   $slug"
  echo "Iterations: $ITERATIONS"
  echo "Agent:  $AGENT_CMD"
  echo "========================================"

  # Build the prompt for the agent
  prompt="You are running a smoke test of the plan generator methodology.

A pre-written seed file exists at: samples/${sample}.seed.md

Do the following — no questions, no interactive conversation:

1. Create the directory runs/${slug}/variants/
2. Read samples/${sample}.seed.md and write its contents to runs/${slug}/seed.md
3. Read references/score.md and write its contents to runs/${slug}/rubric-snapshot.md
4. Run exactly ${ITERATIONS} iteration(s) following the methodology in AGENTS.md
   - For each iteration: select a move, apply it, score the variant, write the variant file, update results.tsv, current-best.md, top-5.md, and iteration-log.md
   - Use the run slug '${slug}' — do not rename it
5. Stop after the iterations. Do NOT write report.md.

This is a smoke test to verify the iteration machinery works. Proceed immediately — do not ask for confirmation."

  # Run the agent
  echo ""
  echo "Starting agent..."
  if $AGENT_CMD -p --dangerously-skip-permissions "$prompt" 2>&1; then
    echo ""
    echo "Agent completed. Validating..."
  else
    echo ""
    echo "Agent exited with error. Validating anyway..."
  fi

  # Validate
  echo ""
  if "$SCRIPTS_DIR/validate-run.sh" "$run_dir" "$ITERATIONS"; then
    PASSED=$((PASSED + 1))
  else
    FAILED=$((FAILED + 1))
  fi
done

# Summary
echo ""
echo "========================================"
echo "Smoke Test Summary"
echo "========================================"
echo "Total:  $TOTAL"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "========================================"

if [ "$FAILED" -gt 0 ]; then
  exit 1
fi
