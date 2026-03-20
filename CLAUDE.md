# Plan Generator

An auto-improving business idea and proposal generator. It works in two phases:

1. **Seed shaping** — the user describes a rough idea; the agent asks clarifying questions to produce a well-formed seed document.
2. **Autonomous iteration** — the agent applies improvement moves repeatedly, scoring each variant and keeping the best.

Inspired by Karpathy's autoresearch pattern, adapted for business ideas using Theory of Constraints and TRIZ.

---

## How to start a session

The user describes their idea. The agent asks clarifying questions one at a time:
- What problem does this solve?
- Who is the customer?
- What is the rough mechanism?
- What makes this hard to copy?

The agent writes the shaped idea to `runs/<session-slug>/seed.md`. The user confirms before iteration begins.

## How to kick off a run

Once the seed is confirmed, the user says something like:

> "Run 5 iterations."

The agent iterates autonomously: one move per iteration, score the result, update `current-best.md` and `top-5.md`, repeat. At the end, write `runs/<session-slug>/report.md`.

## Cross-session analysis

When multiple runs exist, the user can ask for a cross-session comparison:

> "Compare all runs."

Output goes to `runs/cross-session-report.md`. See `references/cross-session.md`.

---

## Reference file read order

Do NOT read all reference files upfront. Load them progressively based on what phase you are in.

### Always read at session start
- `references/score.md` (or `runs/<slug>/rubric-snapshot.md` if a run already exists)
- `references/format.md`

### Read when selecting a move
- `references/select.md`
- `references/mutate.md` (scan the catalog to pick a move — do not deep-read every move description)
- `runs/<slug>/results.tsv` (iteration history, if it exists)
- If other runs exist under `runs/`, scan their `results.tsv` files for cross-run move effectiveness

### Read only when executing the chosen move
| Move | Reference file(s) to read |
|------|--------------------------|
| 1 – Make concrete | (none needed — use judgment) |
| 2 – Reduce human dependency | (none needed) |
| 3 – Adjust scope | (none needed) |
| 4 – Improve clarity | (none needed) |
| 5 – Resolve tension (EC) | `references/resolve.md` + `references/evaporating-cloud.md` |
| 6 – Research & ground | (none — see note below) |
| 7 – Break oscillation | `references/toc-thinking-processes.md` (Magic Druids section) |
| 8 – Ideal Final Result | `references/triz.md` (IFR section) |
| 9 – Separation principles | `references/triz.md` (Separation Principles section) |
| 10 – Inventive principle | `references/triz.md` (Inventive Principles section) |
| 11 – Trends of evolution | `references/triz.md` (Trends section) |

### Read at end of run
- `references/report.md`
- `references/cross-session.md` (only if cross-session analysis is requested)

### Domain references (read only when the idea touches the domain)
- `references/mafia-offer.md`
- `references/goldratt-technology-rules.md`
- `references/sales-process-engineering.md`

---

## Core rules

1. **One move per iteration.** Apply one improvement move, score it, record it, move on.
2. **Bottleneck comparison.** A new variant becomes current-best if and only if its lowest score is higher than the previous best's lowest score. Ties broken by second-lowest, then third, etc. Final tiebreaker: prefer higher Speed.
3. **Rubric locking.** At the start of each run, copy `references/score.md` to `runs/<slug>/rubric-snapshot.md`. Score against the snapshot for the entire run.
4. **Red team before scoring.** Before assigning scores, write 2-3 specific criticisms of the variant. This includes a regression check: if any score jumps by 10+ points, explain why.
5. **Anchored justifications.** Every score must cite a concrete element of the variant, not a general impression.
6. **Devil's advocate for 85+.** Before assigning any score ≥ 85, state one reason it should be lower and explain why it isn't.
7. **History-informed selection.** Before choosing a move, read `results.tsv` to see what has worked and what hasn't. Prefer moves with a track record; avoid moves that have consistently failed.
8. **Plateau detection.** After 3 consecutive iterations that produce no new current-best, report "Plateau detected" and attempt a disruptive move (Move 5, 8, or 10). If that also fails, recommend stopping — but the human decides.
9. **Front-load human input.** Interactive conversation during seed shaping, autonomous iteration during the run, human review at the end.

---

## Move 6: Research & ground

Move 6 asks the agent to replace assumptions with evidence. How this works depends on the agent's capabilities:

- **If the agent has web access:** Search for evidence, read sources, integrate findings, cite sources inline.
- **If the agent has no web access:** Identify the weakest factual claim or most consequential assumption. Flag it explicitly in the variant's Notes section as "unverified — needs grounding." State what evidence would strengthen or challenge the claim and what search queries would find it. This is still valuable: it converts invisible assumptions into visible ones.

Do not skip Move 6 just because web access is unavailable. The diagnostic step (identifying what needs grounding) is half the value.

---

## Output layout

All session output lives under `runs/<session-slug>/`. See `references/format.md` for the full specification.

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
    v001.md, v002.md, ...
```

Cross-session report: `runs/cross-session-report.md`.

---

## Reference file index

| File | Purpose |
|------|---------|
| `references/mutate.md` | Catalog of 11 improvement moves |
| `references/score.md` | Scoring rubric (five dimensions) |
| `references/select.md` | History-informed move selection heuristics |
| `references/resolve.md` | TOC tension resolution (EC process) |
| `references/report.md` | How to write the final report |
| `references/format.md` | File layout and naming conventions |
| `references/toc-thinking-processes.md` | TOC TP toolkit (EC, CRT, FRT, PRT, TT, NBR, Magic Druids) |
| `references/cross-session.md` | Cross-session analysis methodology |
| `references/evaporating-cloud.md` | EC deep dive: structure, injection patterns, mass generation |
| `references/mafia-offer.md` | Mafia Offer: UDEs to unrefusable offer |
| `references/goldratt-technology-rules.md` | Goldratt's 4/6 questions for new technology |
| `references/sales-process-engineering.md` | Roff-Marsh/Ballistix SPE |
| `references/triz.md` | TRIZ: IFR, separation principles, inventive principles, trends |

---

## Sample ideas

Pre-written seed files live in `samples/`. These skip the interactive seed-shaping phase — the clarifying questions are already answered, research is included, and the idea is shaped and ready for iteration. See `samples/README.md` for the full list.

### Running a sample (inside an agent session)

When the user asks to run a sample (e.g., "run the consultant-proposal sample" or "make test-one S=bakery-delivery"):

1. Read `samples/<name>.seed.md`
2. Create `runs/_sample-<name>/variants/`
3. Write the seed contents to `runs/_sample-<name>/seed.md`
4. Copy `references/score.md` to `runs/_sample-<name>/rubric-snapshot.md`
5. Run the requested number of iterations (default: 3) following the normal methodology
6. After iterations complete, run `make validate R=runs/_sample-<name>` to verify output structure
7. Report the validation result

The `_sample-` slug prefix keeps sample runs separate from real runs. They are gitignored.

### Running samples from the command line (CI / headless)

```bash
make test                              # Run all samples via claude -p (3 iterations each)
make test-quick                        # All samples, 1 iteration each
make test-one S=consultant-proposal    # One sample
AGENT_CMD=codex make test              # Use a different agent CLI
```

### Utilities (work everywhere)

```bash
make validate R=runs/self-improvement  # Validate one run's output structure
make validate-all                      # Validate every run under runs/
make clean-samples                     # Remove runs/_sample-*/ directories
make list-samples                      # Show available sample names
make list-runs                         # Show all runs with iteration counts
make help                              # Show all targets
```
