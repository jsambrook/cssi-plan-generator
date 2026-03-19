# Run Report: Self-Improvement

## Seed idea

Use the cssi-plan-generator to improve its own design — treating the methodology, reference docs, scoring rubric, and user experience as the "idea" to be refined across 8 iterations.

## Top 5 variants

| Rank | Variant | Summary | T | V | D | F | S | Why it ranks here |
|------|---------|---------|---|---|---|---|---|-------------------|
| 1 | v008 | IFR-simplified: core methodology + lightweight safeguards | 73 | 78 | 75 | 71 | 75 | Highest floor (71). Everything load-bearing. |
| 2 | v007 | Simplified cross-run learning (TSV scan only) | 73 | 78 | 73 | 69 | 75 | Cross-run learning in simplest form. |
| 3 | v005 | CLAUDE.md rewrite (user-facing / agent-facing split) | 72 | 76 | 72 | 68 | 73 | Best artifact for the stranger experience. |
| 4 | v004 | Error containment grounded in research | 70 | 74 | 72 | 68 | 73 | Research-backed drift detection. |
| 5 | v003 | Manual-action audit (62.5% reduction) | 70 | 74 | 74 | 60 | 73 | Produced the front-load-then-run principle. |

## Key moves that worked

- **Move 5 (EC, iteration 1):** Resolved the self-evaluation dilemma — the tool scores its own output with no external check. The injection: structural anti-inflation mechanisms (red team step, anchored justifications, bottleneck comparison) rather than requiring an external evaluator. This raised the floor from 45 to 55 and set the integrity framework for the entire run.

- **Move 2 (reduce human dependency, iteration 3):** Audited all 8 manual-action instructions in the reference docs and eliminated or deferred 5 (62.5%). Produced the run's most important UX insight: **front-load human input, then run autonomously.** Interactive seed shaping, autonomous iteration, human review at the end. This directly addressed the user's stated friction point.

- **Move 10 → Move 3 (inventive principle then narrow, iterations 6-7):** The learning loop idea (cross-run TSV scan) was introduced in iteration 6 but was overbuilt and lost on the bottleneck tiebreak. Iteration 7 narrowed it to the simplest version — no new files, just a wider read scope. This two-iteration arc demonstrated the methodology working as designed: the bottleneck rule rejected complexity, and scoping down recovered the value.

- **Move 8 (IFR, iteration 8):** Applied the "methodology or overhead?" test to every mechanism. Merged the regression check into the red team step, changed drift detection from scheduled to event-triggered, and simplified the variant template. The final variant has the fewest mechanisms and the highest floor score.

## Tensions resolved

### EC: Self-evaluation integrity (v001)

**Tension:** The tool needs honest scoring but is also the entity producing and scoring the output.

**Challenged assumption:** "An external evaluator is needed for honest scoring." Wrong — what's needed is structural resistance to inflation.

**Injection:** Four mechanisms that make lazy inflation structurally difficult: red team step (write criticisms before scoring), anchored justifications (cite concrete elements), regression check (explain large jumps), and bottleneck comparison (inflating non-bottleneck dimensions doesn't help). Later simplified by the IFR (v008): regression check merged into the red team step.

**Impact:** Raised failure modes from 45 to 58 and established the integrity framework used throughout the run. The framework proved itself in iteration 6, when the bottleneck rule prevented an overbuilt variant (v006) from becoming current-best.

## Score progression

| Iteration | Variant | Lowest | Move | New best? |
|-----------|---------|--------|------|-----------|
| Seed | — | 45 | — | — |
| 1 | v001 | 55 | EC (self-evaluation) | Yes |
| 2 | v002 | 58 | Make concrete (3 targets) | Yes |
| 3 | v003 | 60 | Reduce human dep. (audit) | Yes |
| 4 | v004 | 68 | Research (error containment) | Yes |
| 5 | v005 | 68 | Improve clarity (CLAUDE.md) | Yes (tiebreak) |
| 6 | v006 | 68 | Inventive principle (learning loop) | **No** (Difficulty dropped) |
| 7 | v007 | 69 | Narrow scope (simplify loop) | Yes |
| 8 | v008 | 71 | IFR (simplify mechanisms) | Yes |

The floor rose from 45 to 71 across 8 iterations. 7 of 8 variants became current-best. The one rejection (v006) demonstrated the scoring integrity mechanisms working as designed.

## Recommendations for next steps

1. **Apply the CLAUDE.md rewrite (v005).** This is the highest-leverage single change — it makes the tool usable for strangers. The proposed rewrite is in `variants/v005.md`. Update it to include the cross-run TSV scan instruction and the simplified mechanisms from v008.

2. **Update `references/select.md` to include cross-run scanning.** Add a step before the history check: "If other runs exist under `runs/`, read their `results.tsv` files to build a move effectiveness prior."

3. **Update `references/score.md` to codify the simplified integrity mechanisms.** Replace the current scoring discipline section with: red team step (including regression check for large score changes), anchored justifications, devil's advocate for 85+, and event-triggered drift detection after EC injections.

4. **Test with a real business idea.** This run tested the tool on itself — a meta case. The next test should be a concrete business idea where the five dimensions have real stakes. The cross-run learning won't activate until run 2, so run at least two more ideas to validate it.

5. **Have a stranger try it.** The first-run experience (Target 2) was addressed by the CLAUDE.md rewrite, but it hasn't been tested by an actual stranger. Ask someone unfamiliar with the tool to clone the repo, open Claude Code, and describe an idea. Document what confuses them.
