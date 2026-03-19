# Evaporating Cloud Reference

This file consolidates EC knowledge for use by the iteration agent. It draws from the Mafia Offer skill's EC reference, Grok-generated prompting guidance, and practical experience from the energy-catalyst and self-improvement runs.

---

## Structure

The EC has five elements connected by arrows representing assumptions:

```
              A
           Objective
            /    \
          (1)    (2)
          /        \
         B          C
    Requirement  Requirement
        |           |
       (3)         (4)
        |           |
        D    <->    D'
   Prerequisite  Prerequisite
              (5)
           Conflict
```

## Arrow Assumptions

Each arrow is an assumption that can be challenged:

- **(1) A -> B**: "In order to achieve A, we must have B."
- **(2) A -> C**: "In order to achieve A, we must have C."
- **(3) B -> D**: "In order to have B, we must do D."
- **(4) C -> D'**: "In order to have C, we must do D'."
- **(5) D <-> D'**: "D and D' are in direct conflict."

## Finding the Injection

Systematically challenge each assumption:

1. **Is the objective (A) correctly stated?** Sometimes parties assume different objectives.
2. **Are B and C truly the only ways to achieve A?** Often there are alternatives not considered.
3. **Is D really necessary for B?** The assumption may be based on outdated constraints or false beliefs.
4. **Is D' really necessary for C?** Same challenge applies.
5. **Do D and D' truly conflict?** Sometimes the conflict is based on false scarcity or timing assumptions.

## Injection Patterns

Common ways conflicts get broken:

- **Change the constraint**: The assumption assumes a fixed constraint that can actually be changed.
- **Separate in time**: D and D' only conflict if done simultaneously; sequencing resolves it.
- **Separate in space**: D applies to one segment, D' to another.
- **Challenge necessity**: The assumed requirement isn't actually required.
- **Find a third way**: Neither D nor D', but something that satisfies both B and C differently.

---

## Mass Injection Generation

When using AI to resolve an EC, the agent can generate many candidate injections quickly. The recommended approach:

### Prompt Pattern

Given a cloud with all five elements and assumptions stated, generate 20-30 distinct injections. For each:

- State which assumption(s) it breaks
- Explain in one sentence why it works logically
- Give a real-world or analogous example
- Rate feasibility (1-10) and breakthrough impact (1-10)

Then rank the top 5 and suggest implementation steps for the best one.

### Why This Works

The cognitive stamina barrier that previously limited EC use is removed. A skilled practitioner might surface 3-5 injections in a workshop; an AI agent can surface 30 in under a minute. The practitioner's role shifts from *generating* injections to *curating* them — selecting which are genuinely feasible and impactful.

### Quality Control

AI-generated injections require human validation:

- Do they actually break the stated assumption, or just reframe it?
- Are they implementable, or purely theoretical?
- Do they create new significant problems (negative branches)?
- Would a skilled TOC practitioner recognize them as valid?

The agent should flag its confidence level and invite challenge. The goal is not to replace human judgment but to expand the search space dramatically.

---

## Example: IT Services (from Mafia Offer skill)

**Objective (A)**: Client gets IT systems that support business goals

**Requirement B**: Keep costs predictable
**Prerequisite D**: Fixed-price contracts

**Requirement C**: Get exactly what's needed
**Prerequisite D'**: Allow scope changes as needs clarify

**Conflict**: Fixed-price contracts conflict with allowing scope changes

**Assumptions to challenge:**
- B->D: "Fixed-price is the only way to have predictable costs" — What if outcomes were guaranteed instead of activities?
- C->D': "Scope changes are inevitable" — What if requirements were validated before commitment?
- D<->D': "You can't have both" — What if the pricing model accommodated change without penalizing either party?

**Injection**: Outcome-based pricing with defined success criteria, where scope flexibility serves the outcome rather than threatening the budget.

---

## Example: Thoroughness vs. Adoption Friction (from self-improvement run)

**Objective (A)**: Consultants get high-quality proposal drafts

**Requirement B**: Low adoption friction
**Prerequisite D**: Fast, minimal process

**Requirement C**: Thorough, trustworthy output
**Prerequisite D'**: Deep multi-iteration analysis

**Conflict**: Fast process conflicts with deep analysis

**Challenged assumption (B->D)**: "Low friction means a fast process." Wrong. Startup friction (how hard it is to begin) and wait friction (how annoying it is to wait) are different. Wait friction disappears if the process runs in the background.

**Injection**: Run the iteration loop as a background process. Brief in 30 seconds, read the output when ready. Decouples adoption friction from processing depth.

---

## Sources

- Mafia Offer skill: `~/git/cssi-ai-share/skills/mafia-offer/references/evaporating-cloud.md`
- Self-improvement run: `runs/self-improvement/`
- Energy-catalyst run: `runs/energy-catalyst/`
- Goldratt, E. M. *It's Not Luck* (1994). North River Press.
