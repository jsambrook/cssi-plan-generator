# Scoring Rubric

Each variant is scored on five dimensions. Scores are 0-100 with a one-line justification. There is no composite score — the profile of five numbers is the signal. Different ideas at different stages will have different priority dimensions.

## Scale calibration

| Range | Meaning |
|-------|---------|
| 0-20 | Barely an idea. Vague, untested, no mechanism described. |
| 20-40 | Has a concept but missing key elements. Would not survive one hard question. |
| 40-60 | Reasonable idea with clear gaps. The kind of thing you'd brainstorm in a meeting. |
| 60-75 | Well-developed on paper. Specific enough to discuss seriously but not yet tested against evidence or pressure. |
| 75-85 | Pressure-tested through iteration. Tensions identified and resolved. Grounded in research. Ready for real-world contact. |
| 85-92 | Exceptional design. Every remaining risk has a specific mitigation. Execution plan is concrete enough to start tomorrow. |
| 93-97 | Near-optimal. Agent has actively tried to find weaknesses and failed. Would require real-world data to improve further. |
| 98-100 | Essentially perfect for its scope. Reserved for ideas that have been validated in practice, not just on paper. |

A well-iterated idea on paper should typically plateau in the 75-85 range. Getting above 85 requires extreme specificity, real evidence, or genuine structural elegance. Scores above 93 should be rare and require the agent to have actively tried to find weaknesses.

---

## Rubric locking

At the start of each run, the agent copies the current scoring rubric into `runs/<slug>/rubric-snapshot.md`. All scoring during the run references the snapshot. The rubric can evolve between runs but not during one. This prevents the agent from drifting its interpretation of scores across iterations.

---

## Dimension 1: Testability

**Question:** Can this idea be evaluated right now, with minimal human labor?

| Score | Meaning |
|-------|---------|
| 90-100 | A specific test is designed with a named subject, defined success criteria, and nothing blocking execution except doing it. |
| 75-89 | The test is clear and feasible this week. Requires one or two simple human actions. |
| 60-74 | Testable in principle but requires moderate setup — gathering data, configuring tools, finding participants. |
| 40-59 | Testable with significant effort. Multiple dependencies must be resolved first. |
| 20-39 | Requires building something substantial before any test is possible. |
| 0-19 | Cannot be tested without months of work or infrastructure that doesn't exist. |

**Justification format:** One sentence explaining the key bottleneck or enabler for testability.

---

## Dimension 2: Value

**Question:** How valuable is this idea once implemented?

| Score | Meaning |
|-------|---------|
| 90-100 | Solves a painful, frequent problem for a well-defined segment. The value is quantifiable and the user would actively seek this out. Evidence exists (research, analogues, or direct validation). |
| 75-89 | Meaningful value for a real segment. The pain is clear and the mechanism is plausible, but the evidence is indirect or the segment is narrower than it could be. |
| 60-74 | Useful but not urgent. Solves a real problem but the user might not prioritize it. |
| 40-59 | Nice to have. The problem exists but alternatives are good enough. |
| 20-39 | Marginal value. Hard to build a business around. |
| 0-19 | Minimal value. Solves a problem people have already solved or don't care about. |

**Justification format:** One sentence identifying who gets the value, what they get, and why they'd care.

---

## Dimension 3: Implementation difficulty

**Question:** How much effort does this require to build?

Higher score = easier. Inverted so all five dimensions read "higher is better."

Note: this dimension measures *effort and complexity*, not *calendar time*. An idea that requires little effort but depends on an external timeline scores high on difficulty but may score low on speed. See Dimension 5.

| Score | Meaning |
|-------|---------|
| 90-100 | Can be built today with existing tools. The implementation is a straightforward application of things that already work. |
| 75-89 | A few days of focused work. No novel infrastructure, no research questions, no coordination dependencies. |
| 60-74 | A week or two. Requires some integration work, new tooling, or design decisions that aren't obvious. |
| 40-59 | Weeks to a month. Significant engineering, coordination across people, or learning curve. |
| 20-39 | Months. Requires novel capabilities, a team, or infrastructure that doesn't exist yet. |
| 0-19 | A major project. Months to years of work, large team, or fundamental research. |

**Justification format:** One sentence on what the hardest part is and why.

---

## Dimension 4: Failure modes

**Question:** How many ways can this go wrong, and how bad are they?

Higher score = fewer and less severe failure modes. Inverted so all dimensions read "higher is better."

| Score | Meaning |
|-------|---------|
| 90-100 | Every plausible failure mode has been identified, each has a specific mitigation with evidence, and the remaining risks are genuinely low-probability. The agent has actively tried to break the idea and failed. |
| 75-89 | Major failure modes identified with specific mitigations. One or two risks remain that are hard to mitigate without real-world data. |
| 60-74 | Failure modes are identified but some mitigations are vague or untested. At least one risk could be serious. |
| 40-59 | Several failure modes, some unmitigated. Depends on assumptions that haven't been validated. |
| 20-39 | Many failure modes. Multiple hard dependencies or things outside the team's control. |
| 0-19 | Deeply fragile. Would be surprising if this worked on the first attempt. |

**Justification format:** One sentence naming the most dangerous remaining failure mode and its mitigation.

---

## Dimension 5: Speed to signal

**Question:** How quickly does this idea start producing real-world feedback?

Higher score = faster to first signal. "Signal" means a real-world response that tells you whether the idea works — a client reaction, a conversion, a rejection, engagement data, or any other feedback that is not the practitioner's own opinion.

This is distinct from difficulty (Dimension 3). Difficulty measures effort; speed measures calendar time to first feedback. They can diverge:
- Easy but slow: little work required, but depends on someone else's timeline.
- Hard but fast: significant effort, but you can produce a testable version quickly.

| Score | Meaning |
|-------|---------|
| 90-100 | Real-world feedback within hours to days. One action produces signal immediately. |
| 75-89 | Feedback within 1-2 weeks. A short sequence of actions with no external dependencies. |
| 60-74 | Feedback within 1-2 months. Moderate external dependencies (scheduling, review cycles, audience building). |
| 40-59 | Feedback within 3-6 months. Slow external processes (sales cycles, partnerships, program launches). |
| 20-39 | Feedback takes 6-12 months. Structural changes or market shifts required. |
| 0-19 | More than a year before any real signal. Depends on adoption cycles or ecosystem changes. |

**Justification format:** One sentence identifying the first real-world signal and what determines how fast it arrives.

---

## Scoring discipline & integrity stack

1. **Red-team before scoring.** After producing a variant and before assigning any scores, list 2–3 concrete criticisms. If any dimension jumps by more than 10 points versus the previous variant, at least one criticism must interrogate that jump (this replaces the old regression-check step).
2. **Anchored justifications.** Every score cites the exact element (section, bullet, data point) in the variant that supports it. If the evidence is missing, lower the score.
3. **Devil's advocate for ≥85.** Before assigning a score of 85 or above, state one specific reason the score should be lower and why that concern is mitigated.
4. **Event-triggered drift detection.** Whenever you resolve a tension, apply TRIZ/IFR, or otherwise make a structural change, compare `current-best.md` to the seed. Document any drift and the correction in the iteration log before moving on.
5. **Score decay check.** If a dimension hasn't been directly targeted for five iterations, revisit its justification to confirm it still holds.

### Plateau detection (advisory)

When 3 consecutive iterations produce no new current-best:
1. The agent reports: "Plateau detected at iteration N. Attempting disruptive move."
2. The agent applies a disruptive move (Move 8/IFR, Move 10/inventive principle, or Move 5/EC).
3. If the disruptive move also produces no improvement, the agent reports: "Disruptive move failed. Recommend stopping — the next improvement likely requires real-world contact." But continues unless the user confirms the stop.
4. The user says "stop" or "keep going."

The human decides when to stop, not the machine.

---

## How to read the profile

Look at the lowest score first — that is the bottleneck. If testability is 45 and everything else is 75, the next move should target testability. If all five scores are above 75, the idea is in good shape and the focus shifts to the dimension with the most room to grow.

Do not average the scores. The shape of the profile matters more than any single number.

**Speed as a tiebreaker:** When two variants have similar profiles, prefer the one with higher speed. In a practice where the constraint is sales and distribution, ideas that produce real-world signal faster are worth more than ideas that are marginally better on other dimensions but take months to test.

---

## Variant comparison rule

A new variant becomes current-best if and only if its lowest score is higher than the previous best's lowest score. Ties on the lowest score are broken by the second-lowest, then third, etc. If all dimensions are tied, prefer the variant with higher Speed.

This is the TOC bottleneck principle applied to variant selection: the bottleneck dimension determines the winner.
