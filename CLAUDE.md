# Plan Generator

Auto-improving business idea refiner usable in both Claude Code and Codex. Say your idea, let the agent shape it, then let it iterate autonomously until you say stop.

## Quick Start

**Start a new idea.** Just describe it in plain language.

> "A tool that helps plumbers schedule jobs."
> "What if BNI chapters had a shared CRM?"
> "I want to sell fractional COO services to SaaS startups."

The agent researches the space, asks a few clarifying questions, and writes `runs/<slug>/seed.md` for your approval.

**Run iterations.** After approving the seed, specify how many passes to run: `"Run 8 iterations."` The agent handles move selection, scoring, and reporting without further prompts.

**Compare runs.** Once multiple sessions exist, ask `"Compare all runs"` or `"What worked best across sessions?"` Output goes to `runs/cross-session-report.md`.

---

## For the Agent

This section guides the Claude Code or Codex agent. A curious human can read it, but speak directly to the agent when referencing these instructions.

### Before You Begin

1. Read every file in `references/` so you know the moves, scoring rubric, report format, TOC/TRIZ tools, and file layout.
2. Treat `AGENTS.md` as identical to `CLAUDE.md` (they are symlinked). Any update here applies to both assistants.
3. Research tooling:
   - Claude Code: use `WebSearch` + `WebFetch`.
   - Codex: use `web.run` with `search_query`/`open`/`find`.
   - Offline fallback for either assistant: if the network call fails or access is restricted, note the missing evidence, state assumptions explicitly in the variant, and ask the human for data if the assumption feels critical.

### Seed Shaping

Goal: enter iteration with a grounded seed, not a blank slate.

1. Ask clarifying questions one at a time (problem, customer, mechanism, differentiation) while weaving in research.
2. Draft tentative answers derived from your research so the user can correct rather than invent from scratch.
3. Summarize everything (idea, clarifications, `## Research findings`) in `runs/<slug>/seed.md` and get explicit user confirmation before iterating.

### Using TOC / TP tools

- Reach for the TOC Thinking Processes reference whenever you hit a conflict or structural change. Resolve dilemmas with an Evaporating Cloud (Move 5) or Magic Druid (Move 7), then immediately validate the injection with a Future Reality Tree and trim any negative branches.
- When a solution spans multiple tactics or teams, thread it through a Strategy & Tactic Tree before drafting Prerequisite or Transition Trees. Capture any key assumptions so later iterations can check for drift.

### Cross-Run Learning

Before each iteration, scan every `runs/*/results.tsv` (including the current run) to build a quick prior: which moves tended to improve Testability/Value/etc.? Favor moves that historically unlocked the current bottleneck; avoid moves that repeatedly failed.

### Iteration Loop

1. Run the requested number of iterations end-to-end with no mid-run confirmations.
2. At each iteration:
   - Re-read the seed (and last `current-best.md`) to stay anchored.
   - Identify the lowest score / tension.
   - Consult the cross-run prior + current `results.tsv` history to pick a move.
   - Apply exactly one move, score the new variant, update `current-best.md` only if it wins via the bottleneck rule.
3. Whenever you resolve a tension via EC / separation, or add a major injection, perform an immediate drift check: compare `current-best.md` to the seed and confirm the original promise still holds. Record findings in `iteration-log.md`.
4. After all iterations, update `top-5.md` and `report.md` as specified in `references/format.md` and `references/report.md`.

### Self-Evaluation Integrity Stack

Apply these safeguards every iteration:

1. **Red team before scoring.** Write 2–3 concrete criticisms or failure modes for the new variant. If a dimension jumps by >10 points vs. the previous variant, that criticism must address the jump (this replaces a separate regression-check step).
2. **Anchored justifications.** Every score cites the specific evidence (section, bullet, data point) from the variant.
3. **Devil's advocate for ≥85.** Before any dimension crosses 85, state why it *should* be lower and why it isn't.
4. **Event-triggered drift detection.** After resolving a tension, applying a TRIZ move, or making a structural simplification, compare the new `current-best.md` to the seed to ensure you didn't erase the original value proposition. Document any drift and corrections in the iteration log.

### Notes for Human Collaborators

- The agent assumes control once you say "Run N iterations" and won't pause unless you intervene.
- To inspect progress mid-run, read `runs/<slug>/iteration-log.md` or `current-best.md` directly.
- If you clone the repo for another assistant, ensure the `AGENTS.md` symlink remains intact so the instructions stay synchronized.
