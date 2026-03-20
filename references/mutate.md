# Improvement Moves

Each iteration the agent picks one move from this catalog and applies it to the current-best idea. The goal is a meaningful improvement - not cosmetic rewording.

After applying a move, the agent scores the resulting variant and updates current-best if the variant is better on the dimensions that matter most for the current stage.

---

## Move 1: Make it more concrete

**What it does:** Replaces vague language with specific mechanisms, named customer segments, concrete deliverables, or measurable outcomes.

**When to pick it:** Testability score is low, or the idea still sounds like a category rather than a product. "A platform for consultants" becomes "a Claude Code skill that drafts a 5-page proposal from a 30-minute voice note."

**Output looks like:** The idea now names who does what, using what tool, to produce what artifact, for what type of customer.

---

## Move 2: Reduce dependency on human action

**What it does:** Rewrites the idea so more of the value is delivered by the system rather than by human effort. Looks for steps that currently say "the user will..." and asks whether those can be automated or eliminated.

**When to pick it:** Testability is low because the idea requires human setup, judgment, or labor before it can be evaluated. Also useful when implementation difficulty is high due to human-in-the-loop steps.

**Output looks like:** Fewer manual steps. More of the idea is runnable by an agent or automated system with minimal configuration.

---

## Move 3: Adjust scope

**What it does:** Either narrows the idea (focus on one customer segment, one use case, one workflow) or broadens it (extend the mechanism to adjacent problems or markets). Direction is chosen based on which adjustment increases business value.

**When to pick it:** Value score is mediocre because the idea is trying to serve too many people at once (narrow it), or because the idea is too small to be worth building (broaden it). Also useful when the idea is technically sound but the market is unclear.

**Output looks like:** A clearly bounded version of the idea with a named beachhead segment, or an extended version with a larger addressable problem.

---

## Move 4: Improve clarity

**What it does:** Rewrites the idea for a reader who knows nothing about the domain. Removes jargon, tightens the logic, and ensures the value proposition is stated in the first two sentences.

**When to pick it:** The idea is internally coherent but hard to explain. This is especially important before sharing the report with stakeholders who were not part of the iteration.

**Output looks like:** A crisp one-paragraph description that any reasonably informed person can understand, followed by the supporting detail.

---

## Move 5: Identify and resolve a core tension using TOC Evaporating Cloud

**What it does:** Finds a dilemma embedded in the idea - two things the idea needs that seem to conflict - and applies the Evaporating Cloud process to surface the assumptions and find an injection that breaks the conflict.

**When to pick it:** The idea has been concrete and clear for several iterations but something still feels off. Often there is a buried "we need X but we also need not-X" that is preventing the idea from being both ambitious and realistic.

**Output looks like:** A named tension, a resolved cloud with the winning injection identified, and a revised idea that incorporates the injection. See `references/resolve.md` for the full process.

**After the injection:** Validate it with a quick Future Reality Tree plus Negative Branch Reservations. Confirm the injection actually produces the desired effects, note any trims required, and capture the logic in the variant's Notes. If the change spans multiple tactics or teams, sketch the resulting Strategy & Tactic Tree so the rest of the run stays aligned.

---

## Move 6: Research and ground

**What it does:** Uses web search and web fetch to replace assumptions, invented numbers, or vague claims in the idea with real-world evidence. This can include market sizing, competitor analysis, pricing benchmarks, customer language, regulatory constraints, or any other external fact that strengthens (or challenges) the idea.

**How it works:**
1. Identify the weakest factual claim or most consequential assumption in the current-best idea.
2. Formulate one or two targeted search queries (prefer specific over broad).
3. Use WebSearch to find relevant sources, then WebFetch to read the most promising results.
4. Integrate what you find: replace the assumption with the grounded fact, cite the source inline, and note if the evidence contradicts the idea (this is valuable — it prevents building on a false premise).

**When to pick it:** The idea contains claims that sound plausible but are not grounded — market size estimates, customer willingness-to-pay assumptions, competitive landscape assertions, or regulatory claims. Also useful when value score is stuck because the idea's benefits are stated in abstract terms rather than anchored to real customer pain.

**Output looks like:** The idea now contains at least one specific, sourced fact where there was previously an assumption. The variant's Notes section lists the sources consulted and what was found.

**Guidelines:**
- Prefer authoritative sources (industry reports, company pages, government data) over listicles or opinion pieces.
- If a search returns nothing useful, say so in the Notes section rather than forcing a weak source into the idea.
- Do not let research expand the scope of the idea — the goal is to ground what is already there, not to discover new features.
- Keep research focused: one or two queries per iteration, not an exhaustive literature review.

---

## Move 7: Identify and break a recurring oscillation using Magic Druids

**What it does:** Finds a pattern where the business idea (or its strategy, positioning, or execution) keeps swinging between two behaviors — each one's negative side effects driving a switch to the other. Maps the loop explicitly and breaks it by challenging the beliefs that sustain it.

**How it differs from Move 5 (Evaporating Cloud):** The EC resolves a one-time conflict ("we need X but also not-X"). The Magic Druid resolves a recurring oscillation ("we keep going back and forth between X and Y"). Use Move 5 when you hear a dilemma. Use Move 7 when you hear a pattern of cycling.

**When to pick it:** The idea or its strategy has a "swinging door" quality — the team or founder keeps alternating between two approaches without settling. Common examples: premium vs. discount pricing, build vs. buy, broad vs. narrow targeting, move fast vs. be thorough. If the same tension keeps resurfacing across iterations in different forms, it's likely an oscillation, not a one-time conflict.

**How to apply:**
1. Name the two behaviors being oscillated between.
2. For each behavior, map 3–4 cause-and-effect steps: what happens → what negative side effects emerge → what pressure builds to switch.
3. Read the full loop and verify it matches the observed pattern.
4. Challenge the beliefs underlying each causal step. Which belief is wrong or conditional?
5. Design a change that stops the negative side effects from accumulating — breaking the loop.

**Output looks like:** A named oscillation, the two-sided loop mapped out, the challenged belief, the loop-breaking change, and the revised idea incorporating it. After mapping, run an FRT + NBR pass on the proposed change to ensure it doesn't create a new loop elsewhere. See `references/toc-thinking-processes.md` for the full Magic Druids tool description.

---

## Move 8: Formulate the Ideal Final Result (from TRIZ)

**What it does:** Challenges the framing of the idea by asking: "What if the problem solved itself? What if the system did not exist but its function was fully performed?" Pushes toward radical simplification rather than incremental improvement.

**The template:** "The [system] itself performs [desired function], without cost, without harm, without complexity." Or at system level: "The ideal system does not exist, but its function is fully performed."

**When to pick it:** The idea is well-developed but feels incremental — it solves a problem but introduces its own complexity. Or the idea has accumulated features across iterations and needs a reset toward simplicity. Also useful when the idea has plateaued and no analytical move (clarify, ground, resolve) is producing progress.

**How to apply:**
1. State the IFR for the idea's core function.
2. Ask: what would have to be true for this to happen?
3. Work backward from the ideal to find what minimal mechanism gets closest.
4. Revise the idea to incorporate any insight that moves toward the ideal.

**Output looks like:** The IFR statement, the gap between current idea and ideal, and a revised idea that is simpler, more elegant, or more radical than the previous version. See `references/triz.md` for the full IFR description.

---

## Move 9: Apply separation principles to a physical contradiction (from TRIZ)

**What it does:** When the idea contains a "must be both X and not-X" contradiction that survived an EC attempt — because both sides are genuinely needed simultaneously — this move applies four concrete resolution strategies from TRIZ.

**The four separations:**
1. **Separation in time:** X at time T1, not-X at time T2.
2. **Separation in space:** X in one location or segment, not-X in another.
3. **Separation by condition:** X under condition C1, not-X under condition C2.
4. **Separation of whole and parts:** Parts have property X, the whole has property not-X (or vice versa).

**When to pick it:** Move 5 (EC) has been applied but the conflict persists because both prerequisites are genuinely needed — the assumptions are valid, not false. The contradiction is structural, not belief-based. Common examples: must be both simple and powerful, both cheap and high-quality, both standardized and customized, both open and proprietary.

**How to apply:**
1. State the physical contradiction: "[element] must be both [X] and [not-X]."
2. Try each of the four separations. For each, ask: "Does this produce a workable design?"
3. Select the separation that produces the most elegant resolution.
4. Revise the idea to incorporate the separation.

**Output looks like:** The stated physical contradiction, the separation principle that resolves it, and a revised idea that achieves both properties simultaneously. See `references/triz.md` for business examples of each separation.

---

## Move 10: Apply an inventive principle by analogy (from TRIZ)

**What it does:** Uses TRIZ's business-transferable inventive principles (drawn from cross-domain patent analysis) to introduce structural creativity. This move suggests changes that analytical moves (clarify, ground, resolve) do not prompt.

**When to pick it:** The idea is stuck — concrete, clear, grounded, tension-resolved, but not creative enough. The value score has plateaued. The idea needs a structural surprise, not more polish. Also useful when the idea feels conventional or easily replicable.

**How to apply:**
1. Review the 12 business-transferable principles (see `references/triz.md`).
2. Select 2-3 principles most relevant to the idea's current shape.
3. For each, ask: "What would this idea look like if we applied [principle]?"
4. Pick the most promising variant.

**Key principles to consider:**
- **Segmentation (#1):** Can we unbundle? Sell pieces separately?
- **Taking Out (#2):** What if we removed the hardest component entirely?
- **Merging (#5):** What should this be bundled with?
- **Universality (#6):** Can one component serve multiple functions?
- **The Other Way Round (#13):** What if we reversed the flow?
- **Dynamics (#15):** What if the fixed parameters adapted per customer?
- **Blessing in Disguise (#22):** What if the weakness IS the selling point?
- **Feedback (#23):** What if the output improved the next input automatically?
- **Self-Service (#25):** Can the system improve itself from its own usage?

**Output looks like:** The principle(s) applied, what structural change they suggest, and a revised idea incorporating the most promising change.

---

## Move 11: Apply trends of evolution (from TRIZ)

**What it does:** Evaluates the idea against TRIZ's 11 trends of system evolution and advances it one step along the trajectory it is behind on. This is the only forward-looking move — it improves the idea relative to where its market or technology is heading, not just where it is now.

**When to pick it:** The idea is solid but may be targeting where the market *is* rather than where it is *going*. Or the idea feels like it could be leapfrogged quickly by a competitor or technology shift.

**How to apply:**
1. Evaluate the idea against key trends:
   - Is it maximally trimmed? (Trend #6: what can be removed?)
   - Does it minimize human involvement? (Trend #5: what steps can be automated?)
   - Is it on the right part of the S-curve? (Trend #1: early growth, rapid growth, or plateau?)
   - Is it well-coordinated with its supersystem? (Trends #3, #8)
   - Is it dynamic and controllable? (Trends #10, #11)
2. Identify which trend the idea is *behind* on.
3. Advance the idea one step along that trend.

**Output looks like:** The identified trend gap, the current state vs. next evolutionary stage, and a revised idea that is one step ahead. See `references/triz.md` for the full trend descriptions.

---

## Move selection

See `references/select.md` for how the agent decides which move to apply each iteration.
