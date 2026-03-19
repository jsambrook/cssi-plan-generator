# File Structure and Naming Conventions

All session output lives under `runs/<session-slug>/`. The session slug is a short kebab-case label derived from the seed idea, e.g., `runs/consultant-proposal-drafter/` or `runs/toc-onboarding-tool/`.

---

## Directory layout

```
runs/
  <session-slug>/
    seed.md
    rubric-snapshot.md
    results.tsv
    current-best.md
    top-5.md
    iteration-log.md
    report.md
    variants/
      v001.md
      v002.md
      v003.md
      ...
```

---

## File descriptions

### seed.md

The original idea after the interactive shaping conversation. Contains:
- The idea as stated by the user (lightly cleaned up)
- The clarifying questions asked and the answers given
- The shaped seed idea as a short document (problem, customer, mechanism, differentiation)

This file is written once and never modified.

### rubric-snapshot.md

Written once at the start of the run. A frozen copy of `references/score.md` at the time the run began. All scoring during the run uses this snapshot.

### results.tsv

A tab-separated log updated after each iteration. One row per iteration. The agent reads this before selecting each move to identify patterns in what has worked and what hasn't.

Format:
```
iteration	variant	move	T	V	D	F	S	new_best	one_line
```

This supplements (not replaces) the narrative `iteration-log.md`. The TSV is for machine-scannable pattern recognition; the narrative log is for human reading.

### current-best.md

A living document that always contains the current best version of the idea. Updated at the end of each iteration if the new variant is better than the previous best.

Contains:
- The full idea text
- Current scores (T / V / D / F / S) with justifications
- A one-line note on what move produced this version

### top-5.md

A ranked list of the five best variants seen so far in the run. Updated after each iteration. Format is a simple ranked table with variant reference, one-sentence summary, and scores. See `references/report.md` for the table format.

### iteration-log.md

A running log of what happened each iteration. One entry per iteration. Each entry contains:
- Iteration number
- Variant produced (e.g., v004)
- Move applied and why (one sentence rationale)
- Scores before and after
- Whether this became the new current-best

### report.md

Written once at the end of the run. See `references/report.md` for full contents.

### variants/v001.md, v002.md, etc.

Each variant is a snapshot of the idea at that point in the run. Zero-padded three-digit numbers (v001, v002, ...). Contains:

```
# Variant v001

## Move applied
<name of move>

## Move rationale
<one sentence: why this move was chosen given the current scores>

## Idea
<full idea text after the move was applied>

## Scores

| Dimension | Score | Justification |
|-----------|-------|--------------|
| Testability | X | ... |
| Value | X | ... |
| Difficulty | X | ... |
| Failure modes | X | ... |
| Speed | X | ... |

## Execution plan
<conditional: include when the idea is an action plan, not just a concept>
<ordered list of concrete steps the user would take to execute this idea>
<each step: what to do, roughly how long it takes, and what it produces>
<keep it short — a plan you can scan in 60 seconds and start acting on>

## Notes
<optional: anything notable about this variant that doesn't fit above>
```

---

## Naming conventions

- Session slugs: kebab-case, derived from the core noun of the idea. Short (two to four words).
- Variant files: `v` followed by a zero-padded three-digit number. Always starts at `v001`.
- All filenames: lowercase, hyphens for spaces, `.md` extension.

---

## Cross-session output

When the user triggers a cross-session analysis, the output is written to `runs/cross-session-report.md` — at the `runs/` level, outside any individual session directory. This file is overwritten each time a new cross-session analysis is run. See `references/cross-session.md` for the report structure.

---

## What not to store

Do not store intermediate scratch work in the variants directory. Each variant file should be a clean snapshot of a complete idea, not a working draft. The iteration-log is the place for process notes.
