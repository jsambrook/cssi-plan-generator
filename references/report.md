# Report Generation

At the end of a run the agent writes a summary report to `runs/<session-slug>/report.md`. This document describes what goes in that report.

The report is written for the human who will read it after the run. It should be clear to someone who was not watching the iterations happen.

---

## Report structure

### 1. Seed idea

A brief restatement of the original seed idea, copied or lightly paraphrased from `seed.md`. One to three sentences. The goal is to show the reader where this started.

### 2. Top 5 variants

A ranked table of the five best variants from the run. Rank by the agent's judgment of overall strength - not a mechanical average, but a considered view of which variants would be most worth pursuing.

For each variant include:

| Field | Content |
|-------|---------|
| Variant | File reference (e.g., v007) |
| Summary | One sentence describing the idea at this stage |
| T / V / D / F | Testability, Value, Difficulty, Failure modes scores |
| Why it ranks here | One sentence on its strongest quality or limiting weakness |

### 3. Key moves that worked

A short narrative (three to six bullet points) describing which improvement moves produced the biggest gains. Be specific: "Applying Move 2 in iteration 4 removed the manual data-gathering step, which raised testability from 3 to 7."

Do not just list the moves - explain the causal connection between the move and the improvement.

### 4. Tensions resolved

If any Evaporating Cloud processes were run during the session, summarize each one here:
- The tension that was named
- The injection that broke it
- How the idea changed as a result

If no tensions were resolved, note whether any remain unresolved and what they are.

### 5. Recommendations for next steps

Two to five concrete suggestions for what to do next. These can include:
- Which variant to pursue and why
- A remaining tension that was not resolved and what approach to try
- A specific test to run to validate the current-best idea
- A scope adjustment to consider before building

Keep recommendations grounded in the specific idea. Avoid generic advice.

---

## Tone

The report should be calm and direct. No hype. No hedging. State what happened and what the agent recommends. The reader can disagree and that is fine - the report gives them enough information to do so.

Length guideline: the report should be readable in five to ten minutes. Aim for clarity over completeness.
