# Plan Generator — common tasks
#
# Inside Claude Code / agent sessions:
#   make validate R=runs/my-idea       Validate a run's output structure
#   make validate-all                  Validate all runs
#   make clean-samples                 Remove sample run output
#   make list-samples                  Show available sample names
#   make list-runs                     Show all runs with iteration counts
#
# From the command line (CI / headless):
#   make test                          Run all samples via claude -p
#   make test-quick                    All samples, 1 iteration each
#   make test-one S=bakery-delivery    Run a single sample
#
# Environment:
#   AGENT_CMD=codex make test          Use a different agent CLI (default: claude)
#   ITERATIONS=5 make test             Override iteration count

SHELL := /bin/bash
.DEFAULT_GOAL := help

AGENT_CMD ?= claude
ITERATIONS ?= 3

SCRIPTS := scripts
SAMPLES := samples

# ── Validation ───────────────────────────────────────────────

.PHONY: validate
validate: ## Validate a run directory (usage: make validate R=runs/self-improvement)
ifndef R
	$(error Set R=<run-directory>, e.g. make validate R=runs/self-improvement)
endif
	$(SCRIPTS)/validate-run.sh $(R)

.PHONY: validate-all
validate-all: ## Validate every run under runs/
	@for dir in runs/*/; do \
		if [ -f "$$dir/results.tsv" ]; then \
			rows=$$(tail -n +2 "$$dir/results.tsv" | grep -c '[^[:space:]]' 2>/dev/null || echo 0); \
			echo ""; \
			$(SCRIPTS)/validate-run.sh "$$dir" "$$rows" || true; \
		fi; \
	done

# ── Cleanup ──────────────────────────────────────────────────

.PHONY: clean-samples clean
clean-samples: ## Remove all sample run output (runs/_sample-*/)
	$(SCRIPTS)/clean-samples.sh

clean: clean-samples ## Alias for clean-samples

# ── Info ─────────────────────────────────────────────────────

.PHONY: list-samples
list-samples: ## Show available sample names
	@for f in $(SAMPLES)/*.seed.md; do \
		basename "$$f" .seed.md; \
	done

.PHONY: list-runs
list-runs: ## Show all runs with iteration counts
	@for dir in runs/*/; do \
		if [ -f "$$dir/results.tsv" ]; then \
			rows=$$(tail -n +2 "$$dir/results.tsv" | grep -c '[^[:space:]]' 2>/dev/null || echo 0); \
			printf "%-40s %s iterations\n" "$$dir" "$$rows"; \
		else \
			printf "%-40s (no results.tsv)\n" "$$dir"; \
		fi; \
	done

# ── Headless smoke tests (CI / command line) ─────────────────
# These spawn a separate agent process via claude -p.
# Inside Claude Code, ask the agent directly instead — see AGENTS.md.

.PHONY: test
test: ## [CI] Run all sample smoke tests via claude -p (3 iterations each)
	AGENT_CMD=$(AGENT_CMD) ITERATIONS=$(ITERATIONS) $(SCRIPTS)/smoke-test.sh

.PHONY: test-quick
test-quick: ## [CI] Run all samples, 1 iteration each
	AGENT_CMD=$(AGENT_CMD) ITERATIONS=1 $(SCRIPTS)/smoke-test.sh

.PHONY: test-one
test-one: ## [CI] Run one sample (usage: make test-one S=consultant-proposal)
ifndef S
	$(error Set S=<sample-name>, e.g. make test-one S=consultant-proposal)
endif
	AGENT_CMD=$(AGENT_CMD) ITERATIONS=$(ITERATIONS) $(SCRIPTS)/smoke-test.sh $(S)

# ── Help ─────────────────────────────────────────────────────

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
