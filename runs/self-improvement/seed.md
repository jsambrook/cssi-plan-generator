# Seed: Self-Improvement of the Plan Generator

## Idea as stated

Use the cssi-plan-generator to improve its own design. The tool should iterate on itself — treating its own methodology, reference docs, scoring rubric, and user experience as the "idea" to be refined.

## Clarifying questions and answers

**What problem does this solve?**
The tool is new and untested against its own standards. Before going public, it should be pressure-tested by the very process it prescribes. Any weakness in the methodology will show up as friction during the run itself.

**Who is the customer?**
Three audiences: (1) John, using it for his own business ideas and client engagements, (2) consulting clients who receive the output, (3) strangers who find the public repo and try it themselves.

**What is the rough mechanism?**
Apply the tool's own iteration loop — select a move, apply it, score the result — where the "idea" being improved is the tool's design: its reference docs, scoring rubric, move catalog, move selection heuristics, and output format.

**What makes this hard to copy?**
Nothing — the tool is going open source. The value is in the methodology (TOC + TRIZ + autoresearch), not in secrecy. The recursive run demonstrates that the methodology is coherent enough to apply to itself.

**What is the biggest source of friction?**
The tool asking users to perform manual actions it could automate. Every iteration should push toward maximizing what the agent does autonomously before requiring human input.

## Research findings

- **Karpathy's autoresearch** (March 2026): An autonomous agent ran ~700 changes over two days on a small LLM training setup, finding ~20 additive improvements that transferred to larger models — an 11% efficiency gain. The pattern: mutate, evaluate, keep or discard, repeat. This tool adapts the same loop but for documents/ideas rather than code/weights, using a qualitative rubric instead of a loss function.
- **Microsoft STOP** (Self-Taught Optimizer): A recursively self-improving code generation system where the improver runs itself to improve itself. Discovered emergent strategies (beam search, genetic algorithms, simulated annealing) without being told to. Validates that recursive self-improvement is not just a thought experiment — it produces real gains.
- **Darwin Gödel Machine** (Sakana AI): A coding agent that rewrites its own source code to improve performance. Learned to add patch validation steps and better editing tools. Relevant because this run is the document-level analogue: the tool examining and rewriting its own methodology.
- **Key difference**: Those systems have automated evaluation (loss functions, test suites). This tool's evaluation is qualitative (five-dimension rubric scored by the agent). The risk is scoring drift or self-congratulation. Mitigation: rubric locking, devil's advocate requirement for 85+ scores, and the bottleneck comparison rule (lowest score wins).

## Shaped seed

The cssi-plan-generator is an auto-improving business idea refinement tool. It works in two phases: interactive seed shaping (with live web research), then autonomous iteration using 11 improvement moves drawn from TOC and TRIZ. Each variant is scored on five dimensions; the lowest score determines the winner (TOC bottleneck principle).

The tool currently exists as a set of reference documents and a CLAUDE.md that instructs a Claude Code agent. There is no traditional code — the "application" is the methodology itself.

**Three improvement goals for this run:**

1. **Reduce human dependency** — identify every place where the methodology asks a human to do something the agent could do, and redesign those steps.
2. **Sharpen for multiple audiences** — ensure the reference docs, output format, and interaction style work for a solo practitioner, a consultant running it with clients, and a stranger reading the repo for the first time.
3. **Stress-test coherence** — find internal contradictions, missing instructions, or ambiguous heuristics in the reference docs by actually following them under pressure.
