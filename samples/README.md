# Sample Ideas

Pre-written seed files for trying the plan generator and running smoke tests.

Each `.seed.md` file is a complete seed document — clarifying questions already answered, research findings included, idea shaped and ready for iteration. This skips the interactive seed-shaping phase so you can go straight to the iteration loop.

## The samples

| Sample | Domain | What makes it interesting |
|--------|--------|--------------------------|
| `consultant-proposal` | Professional services / AI tooling | Tension between thoroughness and speed; trust as the critical risk; clear customer pain with quantifiable value |
| `bakery-delivery` | Local marketplace / logistics | Chicken-and-egg network effects problem; physical-world constraints; tight margins that force creative solutions |
| `saas-onboarding` | B2B SaaS / self-improving systems | Autonomy vs. control tension; learning-loop moat; connects to TRIZ trends (decreasing human involvement, increasing dynamization) |

## Try one manually

Open the repo in Claude Code and say:

```
The seed is already written in samples/consultant-proposal.seed.md.
Copy it to a new run and do 5 iterations.
```

Or with Codex, include the same instruction in your task prompt.

## Run as smoke tests

```bash
scripts/smoke-test.sh                          # Run all samples (3 iterations each)
scripts/smoke-test.sh consultant-proposal      # Run one sample
ITERATIONS=1 scripts/smoke-test.sh             # Quick single-iteration check
scripts/clean-samples.sh                       # Clean up sample run output
```

See `scripts/smoke-test.sh` for environment variables (`AGENT_CMD`, `ITERATIONS`).

## Notes

- Sample runs use the `_sample-` slug prefix (e.g., `runs/_sample-consultant-proposal/`) and are gitignored.
- The smoke test validates output **structure**, not quality — files exist, TSV parses, scores are in range, variant sections are present.
- Each 3-iteration run consumes API tokens. Use `ITERATIONS=1` for a quick check.
