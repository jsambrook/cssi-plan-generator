# TOC Thinking Processes Reference

This file gives the agent working knowledge of the Theory of Constraints Thinking Processes (TP) toolkit. These tools answer three questions:

1. **What to change?** — Identify the core problem.
2. **What to change to?** — Design the solution.
3. **How to cause the change?** — Plan the implementation.

The agent uses these tools during improvement moves — particularly Move 5 (Evaporating Cloud), Move 7 (Magic Druids), and whenever a business idea contains buried conflicts, unexamined assumptions, or recurring patterns that resist simple fixes.

---

## The Tools

### 1. Current Reality Tree (CRT)

**Purpose:** Map the cause-and-effect chain that produces the undesirable effects (UDEs) you're seeing today. Answers: "What to change?"

**Structure:** A logic tree read bottom-to-top. Entities (statements of fact or observation) are connected by arrows representing "if... then..." causality. Multiple causes can combine (AND logic) or act independently (OR logic) to produce effects.

**How to build one:**
1. List 5–10 undesirable effects (UDEs) — things that are wrong, frustrating, or limiting.
2. Connect them with cause-and-effect arrows. Ask: "Does this UDE cause that one? Or do they share a common cause?"
3. Follow the arrows downward until you find the root cause — the one entity that, if changed, would eliminate or weaken most of the UDEs.

**When to use in this tool:** When a business idea has multiple problems and you're not sure which one to fix first. The CRT reveals the root cause so you target the constraint, not the symptoms.

**Agent guidance:** Keep CRTs small (10–20 entities). The goal is to find the root cause, not to model the entire system. If the tree gets large, you're probably modeling context rather than causality.

---

### 2. Evaporating Cloud (EC) / Conflict Resolution Diagram

**Purpose:** Surface and resolve a conflict by identifying the hidden assumption that makes the conflict seem irresolvable. Answers: "What to change to?"

**Structure:** Five elements:

| Element | Label | Question |
|---------|-------|----------|
| Common objective | O | What are both sides trying to achieve? |
| Need A | NA | What does one side need? |
| Need B | NB | What does the other side need? |
| Action A | AA | What action satisfies NA but conflicts with AB? |
| Action B | AB | What action satisfies NB but conflicts with AA? |

The conflict is between AA and AB — they appear mutually exclusive.

**How to resolve:**
1. For each arrow (O→NA, O→NB, NA→AA, NB→AB, AA↔AB), state the assumption that makes that arrow feel necessary.
2. Challenge each assumption: "Is this always true? Under what conditions would it be false?"
3. Find one assumption you can invalidate. That's your injection — a concrete change that breaks the conflict.

**When to use in this tool:** When the business idea contains a "we need X but we also need not-X" dilemma. See Move 5 in `references/mutate.md` and the detailed process in `references/resolve.md`.

**Agent guidance:** The most common mistake is accepting the cloud's framing as given. The power of the EC is in challenging assumptions — especially the ones that feel most obvious. If an assumption feels like "well, obviously that's true," examine it harder.

---

### 3. Magic Druids

**Purpose:** Map and break a recurring oscillation — a pattern where you swing between two behaviors because each one's negative side effects drive you to the other. Developed by James Powell and Peter Cronin; accepted into the TOCICO Body of Knowledge.

**Structure:** Two parallel cause-and-effect chains forming a loop:

```
Behavior A → consequences of A → pressure to switch to B
    ↑                                          ↓
pressure to switch to A ← consequences of B ← Behavior B
```

Each side has four cause-and-effect steps, read from bottom to top. The loop is the key insight: you're not facing a one-time decision, you're trapped in an oscillation.

**How to build one:**
1. Identify the two behaviors you (or the business) keep swinging between.
2. For each behavior, map 3–4 cause-and-effect steps: what happens when you commit to this behavior? What negative side effects emerge?
3. Show how those side effects create pressure to switch to the other behavior.
4. Read the full loop: A → bad effects → switch to B → bad effects → switch to A → ...
5. To break the loop: question the beliefs underlying each causal step. Which belief is wrong or conditional? What change would stop the negative side effects from accumulating?

**How it differs from the Evaporating Cloud:**
- The EC resolves a **one-time conflict** between two incompatible actions.
- The Magic Druid resolves a **recurring oscillation** between two behaviors that each seem right in the moment but produce negative consequences over time.
- Use the EC when you hear "we need X but we also need not-X."
- Use the Magic Druid when you hear "we keep going back and forth between X and Y" or "every time we try X, we end up switching back to Y."

**When to use in this tool:** When a business idea contains a strategic oscillation — e.g., "we keep swinging between premium and discount pricing," "we alternate between building features and fixing bugs," "we cycle between broad marketing and narrow targeting." See Move 7 in `references/mutate.md`.

**Agent guidance:** The Magic Druid is especially valuable for ideas that have been through several iterations without converging. If the same tension keeps reappearing in different forms, it may be an oscillation, not a conflict.

---

### 4. Future Reality Tree (FRT)

**Purpose:** Test whether a proposed solution will actually produce the desired effects — and catch unintended consequences before implementing. Answers: "What to change to?" (validation step).

**Structure:** Same as a CRT, but built forward from the proposed injection rather than backward from symptoms. Start with the injection at the bottom, build cause-and-effect upward, and check whether the desired effects appear at the top.

**How to build one:**
1. Place the injection (from the EC, Magic Druid, or TRIZ move) at the base.
2. Build sufficiency-based links upward: "If [cause], then [effect] because..." Capture the rationale inline.
3. Keep linking until the desired effects (reversals of the UDEs) appear at the top of the tree.
4. At each link, ask "What could make this false?" to surface presumptions.
5. Run Negative Branch Reservations (next section) on any link that feels risky. Add extra injections or conditions to trim those branches.

**When to use in this tool:** After resolving a tension (Move 5 or Move 7) or inventing a bold new mechanism (Move 10/11), use the FRT to validate that the injection actually improves the idea without creating new problems. Especially important when the injection changes the business model, target customer, or core mechanism.

**Agent guidance:** The FRT is a reality check, not a sales document. Actively look for ways the injection could fail or backfire. If you can't find any negative branches, you're probably not looking hard enough.

---

### 5. Negative Branch Reservation (NBR)

**Purpose:** Identify and preemptively address negative side effects of a proposed change.

**Structure:** A branch off a Future Reality Tree showing: injection → intermediate effects → undesirable outcome. Each branch is its own micro tree.

**How to use:**
1. While building an FRT or PRT, ask at each step: "What could go wrong here? What negative side effect might this cause?"
2. If you find one, trace the cause-and-effect chain to the negative outcome (that is the negative branch).
3. Design a supplementary injection (a trim) that prevents or mitigates the branch. Document the trim in the same variant so future work honors it.

**When to use in this tool:** Whenever Move 5 or Move 7 produces an injection that changes the idea significantly. The NBR catches problems before they're baked into the next variant.

**Agent guidance:** Present NBRs constructively. The goal is not to kill the injection but to strengthen it. Every NBR should end with a trim — if you can name the problem, you can usually design the fix. When a branch feels scary but you cannot design a mitigation, call it out explicitly so the human can help.

---

### 6. Prerequisite Tree (PRT)

**Purpose:** Plan how to overcome obstacles between the current state and the desired state. Answers: "How to cause the change?"

**Structure:** Start with the objective at the top. List every obstacle between here and there. For each obstacle, identify an intermediate objective (IO) that overcomes it. Sequence the IOs by dependency.

**How to build one:**
1. State the objective clearly.
2. Brainstorm obstacles: "What could prevent us from reaching this objective?"
3. For each obstacle, name the IO that overcomes it.
4. Sequence: which IOs must come before others? What are the dependencies?
5. The result is an ordered plan of intermediate objectives.

**When to use in this tool:** When the execution plan for a business idea faces real obstacles — regulatory hurdles, technical prerequisites, market education, partnership dependencies. The PRT turns "this is hard" into "here are the specific things that need to happen in order."

**Agent guidance:** The PRT is most useful for ideas that score well on Value but poorly on Difficulty. It converts a vague sense of "this is hard to build" into a concrete sequence of solvable sub-problems.

---

### 7. Transition Tree (TT)

**Purpose:** Create a detailed, step-by-step action plan with explicit cause-and-effect justification for each step. Answers: "How to cause the change?" (detailed action level).

**Structure:** A sequence of: current reality → action → expected effect → new reality → next action → ...

Each step states:
- What is true now (the need for this step)
- What action to take
- Why this action produces the desired effect (the causal logic)
- What will be true after this step

**When to use in this tool:** When the execution plan needs to be bulletproof — each step justified, each transition explained. Most useful for high-stakes implementations where the "why" behind each step matters as much as the "what."

**Agent guidance:** The TT is the most granular TP tool. Use it sparingly — most execution plans in this tool don't need step-level causal justification. Reserve it for plans where a misstep has significant consequences.

---

### 8. Strategy & Tactic Tree (S&T)

**Purpose:** Align high-level objectives (strategy) with the concrete tactics that deliver them, including the necessary assumptions. Bridges "what to change to" and "how to cause the change" by making every tactic traceable to the strategy and constraints.

**Structure:** Repeating blocks of Strategy → Assumptions → Tactic → Assumptions → Next-level Tactic. Each strategy node states the objective at that level; its tactic describes *how* it will be accomplished; assumptions explain why the tactic works and what conditions must hold.

**How to build one:**
1. Start from the top objective (often the injection validated by the FRT).
2. For that objective, articulate the strategy statement (what success looks like) and the tactic (the concrete approach).
3. List the assumptions behind both statements — market realities, resource availability, success measures. Assumptions later become checkpoints for drift detection.
4. For each tactic that requires sub-steps, add child strategy/tactic blocks until the work is actionable or handed off to a PRT/TT.
5. When assumptions look shaky, either strengthen them (via research) or design safeguards.

**When to use in this tool:** When the idea spans multiple teams/steps and you need to ensure each tactic aligns with the constraint-aware strategy. Useful after an FRT confirms the solution but before detailed execution planning; it keeps later trees (PRT/TT) coherent.

**Agent guidance:** Keep the tree light. It is a coordination artifact, not a Gantt chart. Focus on clarity: if someone reads a tactic, they should immediately understand what they must do and why it matters to the higher-level strategy.

---

## How the TP Tools Connect

The tools form a natural sequence:

```
CRT  →  EC / Magic Druid  →  FRT + NBR  →  PRT  →  TT
 ↓           ↓                    ↓            ↓        ↓
What's     What's the          Does it      What's    Step-by-step
wrong?     core conflict?      work?        in the    action plan
                                            way?
```

In practice, the agent most commonly uses:
- **CRT** when the idea has multiple UDEs and the root cause isn't obvious
- **EC** (Move 5) for one-time conflicts in business ideas
- **Magic Druids** (Move 7) for recurring oscillations
- **FRT + NBR** to validate and stress-test any injection before it becomes the new current-best
- **Strategy & Tactic Trees** to keep multi-level plans aligned
- **PRT** when building execution plans for ideas that face real obstacles
- **TT** only when the execution sequence must be watertight

Use the lightest tool that gives you confidence. Escalate to the heavier tools when stakes rise or the same issue reappears.
