# cssi-plan-generator

An auto-improving business idea and proposal generator, usable in both Claude Code and OpenAI Codex agents.

## What it does

You give it a rough idea. It shapes the idea through interactive conversation and web research, then iterates autonomously to improve it — making it more concrete, resolving internal tensions, grounding claims in evidence, and clarifying the value proposition.

Each iteration applies one improvement move, scores the result on five dimensions (Testability, Value, Difficulty, Failure modes, Speed), and keeps the best variant. After N iterations you get a ranked list of the best variants and a report explaining what changed and why.

## Design philosophy

This project borrows from two sources:

**Andrej Karpathy's autoresearch pattern** — the idea that an agent can improve a document or artifact through repeated self-critique and mutation, without a human in the loop during iteration. Each iteration applies a transformation, evaluates the result, and keeps the best. Key adaptations: locked rubric snapshots prevent scoring drift, a structured experiment log (`results.tsv`) enables history-informed move selection, and the TOC bottleneck principle determines which variant wins (lowest score decides).

**Theory of Constraints Thinking Processes** — the full TP toolkit, including Evaporating Clouds for resolving one-time conflicts, Magic Druids (developed by James Powell and Peter Cronin, accepted into the TOCICO Body of Knowledge) for breaking recurring oscillations, and TRIZ for structural creativity. Many ideas stall because they contain buried dilemmas or strategic cycles. TOC gives structured ways to name these patterns and find injections that break them.

The combination means the generator is not just a brainstorm tool. It is a refinement engine that makes ideas more testable, more valuable, and more coherent.

## Usage

This project runs identically in Claude Code and Codex. `CLAUDE.md` contains the shared instructions, and `AGENTS.md` is a symbolic link so assistants that expect `AGENTS.md` (e.g., Codex) read the same playbook. Open the repo in your agent of choice and talk naturally — it uses those docs plus `references/` to know what to do.

## Agent compatibility & setup

- `CLAUDE.md` / `AGENTS.md` stay in sync via a symlink so either runtime picks up the same workflow.
- Research calls differ slightly (`WebSearch`/`WebFetch` vs. `web.run`), but the methodology is identical. If network access is unavailable, the agent logs the missing evidence and proceeds with explicit assumptions.
- Keep the symlink intact when copying or zipping the repo so both assistants remain supported.

### Seeding an idea

Describe your idea. The agent asks clarifying questions one at a time, weaving in web research as it goes:

```
> Help consultants write proposals faster.

# The agent asks (one at a time):
# - What problem does this solve? (researches the problem space)
# - Who is the customer? (researches the segment)
# - What is the rough mechanism? (researches analogues)
# - What makes this hard to copy? (researches competitors)
```

The agent writes the shaped idea to `runs/<session-slug>/seed.md` and confirms with you before iteration begins.

### Running iterations

Tell the agent to iterate:

```
> Run 8 iterations.

# The agent iterates autonomously:
# - Selects a move based on scores + history
# - Applies the move
# - Scores the variant
# - Updates current-best if it wins
# - Reports progress after each iteration
```

At the end of the run it writes `runs/<session-slug>/report.md`.

### Cross-session analysis

When multiple runs exist, ask the agent to compare:

```
> Compare all runs.
> What worked best across my sessions?
```

Output is written to `runs/cross-session-report.md`. See `references/cross-session.md` for the methodology.

## Live example

The `runs/self-improvement/` directory contains a complete run where the tool was used to improve its own design — a recursive case. Read the [iteration log](runs/self-improvement/iteration-log.md) and [report](runs/self-improvement/report.md) to see the full progression, including two resolved Evaporating Clouds.

## Quick verification checklist

1. `rg -n "Run Report" runs/self-improvement` – confirm the sample run artifacts exist.
2. Inspect `runs/self-improvement/results.tsv` to make sure iteration rows match the log before starting a new run.
3. Run your agent against the sample run (e.g., "Summarize the self-improvement run") to verify it can read the file layout end-to-end.
4. Before submitting changes, open both `CLAUDE.md` and `AGENTS.md` to ensure the symlink still points to the shared instructions.

## TOC / TP integrity checklist

Use this whenever a change touches the methodology (moves, CLAUDE.md, references):

1. **Update references.** Ensure `references/toc-thinking-processes.md` reflects any new or modified tool guidance (EC, FRT, NBR, Strategy & Tactic Trees, etc.).
2. **Sync the move catalog.** If a tool affects how a move operates, update `references/mutate.md` so the workflow mentions it explicitly.
3. **Align agent instructions.** Confirm `CLAUDE.md`/`AGENTS.md` reference the new behavior so both Claude Code and Codex read the same guidance.
4. **Reviewer pass.** Have the designated TP plan reviewer (human or agent) run `scripts/verify.sh` (which chains `check_tp_integrity` + TODO scan) and walk through this checklist before merging. Agents are acceptable reviewers as long as they report any missing cross-references back to a human maintainer.

### Local quality tools

- **Pre-commit hook (optional):** enable with `git config core.hooksPath .githooks`. It runs the integrity check and blocks TODO markers.
- **One-command verify:** run `scripts/verify.sh` before pushing or merging.
- **Git alias:** add `tpcheck = !scripts/check_tp_integrity.sh` to your local `~/.gitconfig` (or `git config alias.tpcheck '!scripts/check_tp_integrity.sh'`) for quick ad-hoc checks.

## Scoring

Each variant is scored on five dimensions (0–100 scale, higher is better):

| Dimension | Question |
|-----------|----------|
| **Testability** | Can this idea be evaluated right now, with minimal human labor? |
| **Value** | How valuable is this idea once implemented? |
| **Difficulty** | How much effort does this require to build? (inverted: higher = easier) |
| **Failure modes** | How many ways can this go wrong? (inverted: higher = fewer/less severe) |
| **Speed** | How quickly does this produce real-world feedback? |

The variant comparison rule follows the TOC bottleneck principle: a new variant wins if its lowest score is higher than the previous best's lowest score. There is no composite score — the profile shape matters.

## Improvement moves

The tool applies eleven types of moves:

| Move | Name | Source | When to use |
|------|------|--------|-------------|
| 1 | Make it more concrete | — | Idea is vague; testability is low |
| 2 | Reduce human dependency | — | Too many manual steps; difficulty is high |
| 3 | Adjust scope | — | Value is low (broaden) or idea is unfocused (narrow) |
| 4 | Improve clarity | — | Idea is coherent but hard to explain |
| 5 | Resolve tension | TOC EC | A buried "need X but also not-X" dilemma |
| 6 | Research and ground | — | Claims are unverified; assumptions need evidence |
| 7 | Break oscillation | TOC Magic Druids | A recurring swing between two approaches |
| 8 | Ideal Final Result | TRIZ | Idea feels incremental; needs radical simplification |
| 9 | Separation principles | TRIZ | Physical contradiction survived an EC attempt |
| 10 | Inventive principle | TRIZ | Idea is stuck; needs structural creativity |
| 11 | Trends of evolution | TRIZ | Idea targets where the market is, not where it's going |

Move selection is history-informed: the agent scans `results.tsv` for what has worked and what hasn't before choosing. See `references/select.md` for the full heuristic.

## Output layout

All session output lives under `runs/<session-slug>/`:

```
runs/<session-slug>/
  seed.md              # Original shaped idea (written once)
  rubric-snapshot.md   # Frozen scoring rubric for this run
  results.tsv          # Structured experiment log (one row per iteration)
  current-best.md      # Living best variant
  top-5.md             # Ranked top 5 variants
  iteration-log.md     # Narrative log of each iteration
  report.md            # Final run report
  variants/
    v001.md, v002.md, ...  # Each variant snapshot
```

See `references/format.md` for full details.

## Reference files

| File | Purpose |
|------|---------|
| `references/mutate.md` | Catalog of 11 improvement moves |
| `references/score.md` | Scoring rubric (five dimensions) |
| `references/select.md` | History-informed move selection heuristics |
| `references/resolve.md` | TOC tension resolution process |
| `references/report.md` | How to write the final report |
| `references/format.md` | File layout and naming conventions |
| `references/toc-thinking-processes.md` | TOC Thinking Processes toolkit (EC, CRT, FRT, PRT, TT, NBR, Magic Druids) |
| `references/cross-session.md` | Cross-session analysis methodology |
| `references/evaporating-cloud.md` | EC deep dive: structure, injection patterns, mass generation, examples |
| `references/mafia-offer.md` | Mafia Offer methodology: four-phase process from UDEs to unrefusable offer |
| `references/goldratt-technology-rules.md` | Goldratt's 4/6 questions for assessing new technology |
| `references/sales-process-engineering.md` | Roff-Marsh/Ballistix SPE: TOC applied to sales function design |
| `references/triz.md` | TRIZ: IFR, separation principles, inventive principles, trends of evolution |

## Credits

- **Andrej Karpathy** for the [autoresearch pattern](https://x.com/karpathy)
- **Eli Goldratt** for the Theory of Constraints and Thinking Processes
- **James Powell and Peter Cronin** ([Black Belt in Thinking](https://blackbeltinthinking.com)) for the Magic Druids tool
- Built with [Claude Code](https://claude.ai/claude-code) by [Common Sense Systems, Inc.](https://common-sense.com)
