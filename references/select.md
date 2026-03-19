# Move Selection

Each iteration the agent must decide which improvement move to apply. This document describes the selection heuristic.

---

## The guiding question

Before looking at the scores, ask:

> "What is the most practical thing I could try that might improve this idea?"

This framing keeps the selection grounded in the actual idea rather than mechanical score-chasing. The scores then sharpen the answer.

---

## History check

Before selecting a move, the agent scans `results.tsv` and answers:
1. Which moves have I applied so far? Which produced a new current-best?
2. Which moves made things worse (lower scores than the previous variant)?
3. Is there a move type I haven't tried yet?
4. What is the success rate of each move type in this run?

This history check supplements the score-driven heuristics. The agent still targets the lowest-scoring dimension, but uses history to choose *which* move to try for that dimension. Prefer moves with a track record of improvement in this run. Avoid moves that have consistently failed.

---

## Score-driven heuristics

Look at the five scores from the current-best variant. Find the lowest score. In most cases, the right move targets the lowest-scoring dimension.

| Lowest score | Likely best move |
|--------------|-----------------|
| Testability  | Move 1 (make concrete) or Move 2 (reduce human dependency) |
| Value        | Move 3 (adjust scope), Move 6 (research & ground), or Move 10 (inventive principle) - broaden if value is low; ground if value claims are unsubstantiated; apply inventive principle if value has plateaued and the idea needs a structural surprise |
| Difficulty   | Move 2 (reduce human dependency), Move 3 (narrow scope), or Move 8 (IFR) - if difficulty is low because the idea is over-engineered, IFR can reset toward radical simplification |
| Failure modes | Move 5 (resolve tension), Move 6 (research & ground), Move 7 (Magic Druids), or Move 9 (separation principles) - fragile ideas often have buried conflicts or oscillations; if the conflict is structural (not belief-based), separation principles offer concrete resolution strategies |
| Speed        | Move 1 (make concrete) - specify the first action that produces signal; Move 2 (reduce human dependency) - remove steps that add calendar time; Move 8 (IFR) - ask "what if the feedback happened instantly?" to challenge unnecessary delays; Move 3 (narrow scope) - a narrower idea often reaches signal faster |

These are defaults, not rules. The agent should reason about why the score is low before picking the move.

---

## When scores are roughly equal

If no dimension is clearly the bottleneck, use this priority order:

1. **Is there an unresolved tension or recurring oscillation in the idea?** If a one-time conflict, apply Move 5. If a recurring swing between two approaches, apply Move 7. If the conflict is structural (both sides genuinely needed, assumptions are valid), apply Move 9 (separation principles). Unresolved tensions and oscillations limit all dimensions and compound over iterations.
2. **Does the idea rest on unverified assumptions?** Apply Move 6 (research & ground). Grounding early prevents wasted iterations that optimize around a false premise.
3. **Is the idea still vague?** Apply Move 1 or Move 4. Vague ideas score artificially high on value because the reader fills in the gaps favorably.
4. **Is the idea too broad?** Apply Move 3 (narrow). Broad ideas are hard to test and hard to implement.
5. **Is the idea too small?** Apply Move 3 (broaden). If value is stuck at 5-6 and the idea is already concrete, the problem may be scope.
6. **Is the idea over-engineered or incremental?** Apply Move 8 (IFR). If the idea has accumulated features and complexity across iterations, the IFR resets toward radical simplification.
7. **Is the idea conventional or easily replicable?** Apply Move 10 (inventive principle). Structural creativity — segmentation, reversal, self-service, blessing-in-disguise — introduces the kind of surprise that analytical moves cannot produce.
8. **Is the idea targeting where the market is, not where it's going?** Apply Move 11 (trends of evolution). Evaluate which evolutionary trend the idea is behind on and advance it one step.

---

## Avoiding repetition

The agent should not apply the same move twice in a row unless the first application was clearly incomplete. Check `results.tsv` and the iteration log before selecting. If Move 1 was just applied, look for the next most useful move.

---

## Capturing the rationale

Whatever move is selected, the agent records a one-sentence rationale in the variant file and in the iteration log. The rationale should explain why this move was chosen given the current scores, not just restate what the move does.

Example: "Testability is 3 because the idea still requires the user to manually gather input data; applying Move 2 to see if that step can be automated."

See `references/format.md` for where to record this.
