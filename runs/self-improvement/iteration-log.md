# Iteration Log

## Iteration 1 — v001

**Move:** Move 5 (Resolve tension via Evaporating Cloud)
**Rationale:** Failure modes was the bottleneck (45) due to self-evaluation bias risk. The tool scores its own output with no external check.

**What happened:** Constructed an EC around the conflict between autonomous operation (agent scores itself) and honest evaluation (needs external check). Challenged the assumption that external evaluation is the only path to honest scoring. Injection: four structural anti-inflation mechanisms (red team step, anchored justifications, regression check, bottleneck lock).

**Scores before:** T:52 / V:65 / D:78 / F:45 / S:70
**Scores after:** T:55 / V:68 / D:76 / F:58 / S:70
**New current-best?** Yes — lowest score rose from 45 to 55.

## Iteration 2 — v002

**Move:** Move 1 (Make it more concrete)
**Rationale:** Testability was the bottleneck (55). "Improve the tool" had no specific success criteria.

**What happened:** Defined three concrete improvement targets with named success criteria: (1) reduce manual steps by 50%, (2) one-sentence-to-iterate first-run experience, (3) scoring integrity tested by documenting at least one downward revision during the run.

**Scores before:** T:55 / V:68 / D:76 / F:58 / S:70
**Scores after:** T:68 / V:70 / D:74 / F:58 / S:72
**New current-best?** Yes — lowest score rose from 55 to 58.

## Iteration 3 — v003

**Move:** Move 2 (Reduce dependency on human action)
**Rationale:** Tackle Target 1 directly — audit reference docs for manual-action instructions. Addresses the user's primary friction point.

**What happened:** Found 8 manual-action instructions across the methodology. Classified 3 as genuinely requiring human judgment, automated 1 (plateau auto-stop), and redesigned 4 to defer to post-run review. Key insight: "front-load human input, then run autonomously" — interactive seed phase, autonomous iteration, human review at the end.

**Scores before:** T:68 / V:70 / D:74 / F:58 / S:72
**Scores after:** T:70 / V:74 / D:74 / F:60 / S:73
**New current-best?** Yes — lowest score rose from 58 to 60.

## Iteration 4 — v004

**Move:** Move 6 (Research and ground)
**Rationale:** Failure modes (60) bottleneck. v003 red team flagged compounding error risk from deferred validation. Researched how autonomous systems handle this.

**What happened:** Found that checkpoint-and-rollback is the standard mitigation for compounding errors in autonomous agents. Discovered the tool already had 2 of 3 standard containment mechanisms (variant checkpoints, bounded moves) but was missing the third (drift detection). Added drift detection every 3 iterations: agent re-reads seed and checks if current-best has drifted.

**Scores before:** T:70 / V:74 / D:74 / F:60 / S:73
**Scores after:** T:70 / V:74 / D:72 / F:68 / S:73
**New current-best?** Yes — lowest score rose from 60 to 68.

## Iteration 5 — v005

**Move:** Move 4 (Improve clarity)
**Rationale:** Target 2 (first-run experience for strangers) unaddressed. All dimensions clustered 68-74. Clarity is the lever.

**What happened:** Analyzed what blocks a stranger today: stale title, exposed reference file details, no "just say your idea" entry point, README/CLAUDE.md overlap. Proposed CLAUDE.md rewrite splitting user-facing (3 actions) from agent-facing (methodology) sections. Incorporates all improvements from v001-v004 (draft-and-correct, autonomous iteration, drift detection, self-evaluation integrity).

**Scores before:** T:70 / V:74 / D:72 / F:68 / S:73
**Scores after:** T:72 / V:76 / D:72 / F:68 / S:73
**New current-best?** Yes — tied on lowest (68), won on second-lowest tiebreak (72 > 70).

## Iteration 6 — v006

**Move:** Move 10 (Inventive principle — TRIZ #23 Feedback + #25 Self-Service)
**Rationale:** Scores clustered, no clear bottleneck. Applied structural creativity. The tool improves ideas but doesn't improve itself across runs.

**Drift check (every 3 iterations):** Re-read seed. Three goals still directly addressed. No drift detected.

**What happened:** Applied two TRIZ principles. #23 (Feedback): agent now reads all existing `results.tsv` files at run start to build a cross-run move effectiveness profile. #25 (Self-Service): `runs/move-history.md` file accumulates meta-knowledge about which moves work and when. The tool now literally gets better with use.

**Scores before:** T:72 / V:76 / D:72 / F:68 / S:73
**Scores after:** T:72 / V:80 / D:70 / F:68 / S:75
**New current-best?** Yes — lowest tied at 68, but second-lowest improved (70 vs. 68 in v005 had 72/68; v006 has 70/68 — wait, let me recheck. v005: 68,72,72,73,76 sorted = 68,72,72,73,76. v006: 68,70,72,75,80 sorted = 68,70,72,75,80. Second-lowest: v005=72, v006=70. v005 wins on second-lowest. v006 is NOT a new current-best by strict bottleneck comparison.)

**Correction:** v006 is NOT the new current-best. v005 wins the tiebreak (second-lowest 72 > 70). But v006 introduces a structurally important idea (learning loop) that will likely pay off in future iterations targeting Difficulty or Failure modes.

**Target 3 milestone:** The bottleneck comparison rule prevented an overbuilt variant from becoming current-best. This is the documented evidence Target 3 required — the scoring integrity mechanisms caught their first inflation.

## Iteration 7 — v007

**Move:** Move 3 (Adjust scope — narrow)
**Rationale:** v006's learning loop was valuable but too complex (Difficulty dropped). Narrow to simplest version.

**What happened:** Dropped `move-history.md` (redundant with iteration logs and cross-session report). Kept only the cross-run `results.tsv` scan — no new files, just a wider read scope for existing move selection. The value of "gets better with use" is preserved without the maintenance burden.

**Scores before (v005):** T:72 / V:76 / D:72 / F:68 / S:73
**Scores after:** T:73 / V:78 / D:73 / F:69 / S:75
**New current-best?** Yes — lowest score rose from 68 to 69.

## Iteration 8 — v008 (final)

**Move:** Move 8 (Ideal Final Result — TRIZ IFR)
**Rationale:** Final iteration, all dimensions 69-78. IFR challenges whether accumulated complexity is justified.

**What happened:** Applied "methodology or overhead?" test to every mechanism. Found that three mechanisms (red team, anchored justifications, bottleneck rule) do most of the heavy lifting. Merged regression check into red team step. Changed drift detection from scheduled (every 3 iterations) to event-triggered (after EC injections only). Simplified variant template to 4 required + 2 optional sections.

**Scores before:** T:73 / V:78 / D:73 / F:69 / S:75
**Scores after:** T:73 / V:78 / D:75 / F:71 / S:75
**New current-best?** Yes — lowest score rose from 69 to 71.
