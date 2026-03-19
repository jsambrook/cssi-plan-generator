# Current Best: v008

## Move that produced this version
Move 8: Ideal Final Result — separated core methodology from overhead, simplified mechanisms

## Idea

The cssi-plan-generator is an auto-improving business idea refinement tool that gets better with use. Every mechanism is either core methodology or eliminated.

### Core methodology
- **11 improvement moves** from TOC and TRIZ
- **5-dimension scoring** with bottleneck comparison
- **Red team step** before scoring (includes regression check for large score changes)
- **Anchored justifications** (every score cites a concrete element)
- **Devil's advocate** required for 85+ scores
- **Cross-run learning** via `results.tsv` scan at run start
- **Front-load-then-run** (interactive seed, autonomous iteration, human review)

### Lightweight safeguards
- **Drift detection** after Move 5 (EC) injections only
- **Variant checkpoints** (every variant saved; current-best updated only on wins)
- **Bounded moves** (one per iteration)
- **Plateau auto-stop** (3 consecutive non-improvements)

### CLAUDE.md redesign
- User section: 3 actions (start, iterate, compare)
- Agent section: core methodology + safeguards

### Target status
1. Reduce manual steps — **Done** (62.5% reduction)
2. First-run experience — **Addressed** (CLAUDE.md rewrite)
3. Scoring integrity — **Demonstrated** (v006 rejected by bottleneck rule)

## Scores

| Dimension | Score | Justification |
|-----------|-------|---------------|
| Testability | 73 | Three targets with success criteria. All addressed or demonstrated. |
| Value | 78 | Gets better with use. Clean methodology, fewer mechanisms doing more. |
| Difficulty | 75 | Simpler than v007: fewer mechanisms, simpler variant template, event-triggered drift detection. |
| Failure modes | 71 | IFR identified load-bearing mechanisms; removing overhead reduces failure surface. |
| Speed | 75 | Move effectiveness prior improves early selection in later runs. |
