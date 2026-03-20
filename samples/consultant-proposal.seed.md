# Seed: Consultant Proposal Automation

## Idea as stated

Help independent consultants write proposals faster using AI — take a voice note or rough brief and turn it into a polished, client-ready proposal.

## Clarifying questions and answers

**What problem does this solve?**
Independent consultants spend 4-8 hours writing each proposal. Most of that time is formatting, restating the client's problem, and writing sections that are 80% similar across proposals. Meanwhile, the proposal window is short — if you take a week to respond, the client moves on.

**Who is the customer?**
Solo consultants and small consulting firms (1-5 people) who do project-based work — management consulting, IT consulting, marketing strategy. Not large firms with dedicated proposal teams.

**What is the rough mechanism?**
The consultant records a 15-30 minute voice note after a discovery call, describing what the client needs. An AI agent transcribes it, extracts the key elements (problem, scope, approach, timeline, pricing), and generates a draft proposal in the consultant's format/voice. The consultant reviews, edits, and sends.

**What makes this hard to copy?**
Not much — the technical mechanism is straightforward. The moat would come from learning each consultant's style, accumulating winning proposal patterns, and building trust in a professional context where the output carries the consultant's reputation.

## Research findings

- The average management consultant spends 20-30% of non-billable time on proposals and business development (Source: Kennedy Consulting Research).
- Win rates for consulting proposals typically range from 25-40% for cold outreach, 50-70% for warm referrals (Source: APMP benchmarks).
- Existing tools (Qwilr, Proposify, PandaDoc) focus on templates and design, not on generating content from unstructured input. The gap is going from "messy notes" to "structured draft."
- Voice-to-document workflows are gaining traction in legal (Harvey AI) and medical (Nuance DAX) but consulting proposals have received less attention.

## Shaped seed

A Claude Code skill that takes a consultant's post-discovery-call voice note (15-30 minutes) and produces a draft proposal. The mechanism: transcribe, extract structure (problem/scope/approach/timeline/pricing), match against the consultant's previous proposals for voice and format, generate a first draft. The consultant reviews and sends — total time drops from 4-8 hours to 30-60 minutes.

Target customer: solo consultants and small firms doing project-based work at $150-500/hour, where proposal speed directly affects win rate and a lost week means a lost deal.

The primary risk is trust — consultants stake their reputation on every proposal, so the draft must be good enough to edit, not just good enough to read. The tool must learn the consultant's voice, not impose a generic one.
