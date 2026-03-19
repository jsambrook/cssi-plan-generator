# Cross-Session Analysis

When multiple runs exist under `runs/`, the agent can analyze them together to surface moves and changes that had high novelty and impact across sessions. This is triggered on demand — the user asks for it, and the agent reads across all (or specified) session directories.

Output is written to `runs/cross-session-report.md`.

---

## How to trigger

The user says something like:

> "Compare all runs."
> "What worked best across my sessions?"
> "Cross-session analysis on consulting-proposal and saas-onboarding."

The agent can analyze all sessions or a user-specified subset.

---

## What the agent reads

For each session in scope:
- `iteration-log.md` — the move-by-move record with before/after scores
- `report.md` — the narrative on what worked and what tensions were resolved
- `current-best.md` — the final state of the idea
- `seed.md` — the starting point (to measure distance traveled)

The agent does not need to read every variant file. The iteration log and report contain enough signal to identify high-impact moves.

---

## How to assess impact

A move has **high impact** if it produced a meaningful score improvement or a qualitative shift in the idea. Indicators:

- **Score jump:** A single move raised one or more dimensions by 2+ points.
- **Unlock:** A move broke a plateau — scores were stuck for multiple iterations, then this move changed the trajectory.
- **Structural shift:** The move changed the architecture, business model, or target customer in a way that all subsequent variants built on. Even if the immediate score change was small, the downstream effect was large.
- **Tension resolution:** An Evaporating Cloud that produced a genuine win-win injection (both sides of the conflict satisfied without compromise).

---

## How to assess novelty

A move has **high novelty** if the insight it produced was surprising or non-obvious. Indicators:

- **Assumption broken:** The move challenged something that seemed obviously true and turned out to be false or conditional.
- **Cross-domain transfer:** The move applied a pattern from one session's domain to a different session's problem in a way that would not have been obvious without seeing both.
- **Counter-intuitive direction:** The move went against what the scores suggested (e.g., broadening scope when the heuristic said narrow) and it worked.
- **New mechanism:** The move introduced a mechanism, framing, or structural element that did not exist in any prior variant across any session.

---

## Report structure

### 1. Sessions analyzed

A simple table listing each session: slug, seed idea (one sentence), number of iterations, final scores.

### 2. High-impact moves

A ranked list of the moves with the biggest impact across all sessions. For each:

| Field | Content |
|-------|---------|
| Session | Which run this occurred in |
| Iteration / variant | Where it happened |
| Move | Which move was applied |
| What changed | One sentence on the before/after |
| Why it had high impact | One sentence: score jump, unlock, structural shift, or tension resolution |

Limit to the top 5–10 moves. Quality over quantity.

### 3. High-novelty insights

A ranked list of the most surprising or non-obvious insights that emerged across sessions. These are not necessarily the same as the high-impact moves — a move can be impactful but predictable, or novel but minor.

For each:

| Field | Content |
|-------|---------|
| Session | Which run |
| Insight | One sentence stating the surprising finding |
| How it emerged | Which move or moment surfaced it |
| Transferability | Could this insight apply to other ideas? If so, which ones and how? |

Limit to 3–7 insights.

### 4. Patterns across sessions

Observations about what tends to work and what does not, drawn from the evidence of multiple runs. Examples:

- "Move 1 (make concrete) in the first iteration consistently produces the highest single-iteration score gain."
- "TOC tension resolution works best after 4+ iterations of feature work, not early in the run."
- "Broadening scope before the beachhead is proven tends to drop difficulty without raising value."

Only state patterns supported by at least two sessions. Do not generalize from a single data point.

### 5. Recommendations

Concrete suggestions informed by the cross-session view:

- Moves or sequences worth trying in future runs
- Insights from one session that should be tested in another
- Common failure patterns to watch for

---

## Tone

Same as session reports: calm, direct, evidence-based. The cross-session report is a learning document — its purpose is to make future runs smarter, not to rank the sessions against each other.
