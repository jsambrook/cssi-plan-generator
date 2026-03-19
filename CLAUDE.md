# Proposal Generator

This project is an auto-improving business idea and proposal generator. It works in two phases:

1. **Interactive seed discussion** - you describe a rough idea and the agent asks clarifying questions to produce a well-formed seed document.
2. **Autonomous iteration loop** - the agent applies improvement moves repeatedly, scoring each variant and keeping the best.

Inspired by Karpathy's autoresearch pattern, but adapted for business ideas using Theory of Constraints thinking.

---

## How to start a session

Tell the agent your idea. The agent will ask questions to clarify:
- What problem does this solve?
- Who is the customer?
- What is the rough mechanism?
- What makes this hard to copy?

**Web research during seed shaping:** While shaping the seed, the agent uses WebSearch and WebFetch to ground the discussion in reality. This happens automatically — the agent researches the problem space, customer segment, competitive landscape, and any domain-specific facts relevant to the idea. Research findings are woven into the clarifying conversation (e.g., "I found that the average consultant spends X hours per proposal — does that match your experience?") and summarized in a `## Research findings` section of the seed document. The goal is to enter the iteration loop with a seed that is already grounded, not one built entirely on assumptions.

The agent writes the shaped idea to `runs/<session-slug>/seed.md` and you confirm before iteration begins.

## How to kick off a run

Once the seed is confirmed, say something like:

> "Run 5 iterations."

The agent will iterate autonomously, applying one improvement move per iteration (see `references/mutate.md`), scoring each variant (see `references/score.md`), and updating `runs/<session-slug>/current-best.md` and `runs/<session-slug>/top-5.md` as it goes.

At the end of the run it writes `runs/<session-slug>/report.md`.

---

## Cross-session analysis

When multiple runs exist, you can ask the agent to look across sessions for high-impact and high-novelty moves. Say something like:

> "Compare all runs."
> "What worked best across my sessions?"

The agent reads the iteration logs and reports from each session, identifies moves that produced the biggest score jumps or most surprising insights, and looks for patterns that transfer across ideas. Output is written to `runs/cross-session-report.md`. See `references/cross-session.md` for the full methodology.

## Reference files

| File | Purpose |
|------|---------|
| `references/mutate.md` | Catalog of improvement moves |
| `references/score.md` | Scoring rubric (five dimensions) |
| `references/select.md` | How to pick the next move |
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

## Output layout

All session output lives under `runs/<session-slug>/`. See `references/format.md` for details. Each run directory includes a `rubric-snapshot.md` (frozen scoring rubric) and `results.tsv` (structured experiment log) in addition to the narrative files.

The cross-session report lives at `runs/cross-session-report.md` (outside any single session directory).
