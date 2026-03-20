# Claude Code Instructions

Read `AGENTS.md` for the core methodology. Everything below adds Claude Code-specific capabilities. If anything here conflicts with `AGENTS.md`, `AGENTS.md` wins.

---

## Web research during seed shaping

While shaping the seed, use WebSearch and WebFetch to ground the discussion in reality. This happens automatically — research the problem space, customer segment, competitive landscape, and domain-specific facts relevant to the idea.

Weave findings into the clarifying conversation naturally (e.g., "I found that the average consultant spends X hours per proposal — does that match your experience?"). Summarize research in a `## Research findings` section of `seed.md`.

The goal: enter the iteration loop with a seed that is already grounded, not built entirely on assumptions.

## Web research during iteration (Move 6)

When executing Move 6 (Research & ground), use WebSearch to find evidence and WebFetch to read the most promising results. See `AGENTS.md` for the full Move 6 description — Claude Code can do the search step that other agents must skip.

Guidelines:
- Prefer authoritative sources (industry reports, company pages, government data) over listicles
- One or two targeted queries per iteration, not an exhaustive review
- If a search returns nothing useful, say so rather than forcing a weak source
- Do not let research expand scope — ground what is already there

## Subagent delegation (future)

For methodology-heavy moves (5, 7, 8, 9, 10, 11), consider spawning a focused subagent using the Agent tool. Pass it:
- The current-best idea (`current-best.md`)
- The specific reference file(s) for the chosen move
- The rubric snapshot (`rubric-snapshot.md`)
- The variant template from `references/format.md`

The subagent applies the move, scores the variant, and writes the variant file. The main conversation handles move selection, `results.tsv` updates, and reporting.

This is optional. Use it when the conversation context is getting long (iteration 6+) or when executing a move that requires deep engagement with a reference file.
