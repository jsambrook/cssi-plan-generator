# Seed: Self-Improving SaaS Onboarding

## Idea as stated

An onboarding system for B2B SaaS products that learns from every user's journey and automatically adjusts the onboarding flow to reduce time-to-value.

## Clarifying questions and answers

**What problem does this solve?**
Most B2B SaaS products lose 40-60% of signups during onboarding. The onboarding flow is designed once and rarely updated — it doesn't adapt to different user roles, experience levels, or goals. Users who get stuck churn silently. The product team only learns about onboarding failures through quarterly churn analysis, months after the users left.

**Who is the customer?**
B2B SaaS companies with 1,000-50,000 users, where the product is complex enough that onboarding matters but the team is too small for a dedicated onboarding product manager. Typically Series A/B companies with a product team of 5-15 engineers.

**What is the rough mechanism?**
Instrument the onboarding flow to track where users succeed, get stuck, or drop off. An AI agent analyzes the patterns, identifies bottlenecks (steps with high drop-off), and generates alternative versions of those steps. Run the alternatives as A/B tests. The system continuously proposes, tests, and adopts improvements — no human product manager needed for the iteration loop.

**What makes this hard to copy?**
The learning loop is the moat — the more users go through onboarding, the better the system gets at predicting and preventing drop-off. A competitor starting fresh has no data. But this moat only activates after significant volume, so the early product needs to win on something else (ease of integration, quality of initial recommendations).

## Research findings

- Median B2B SaaS free-to-paid conversion rate is 3-5%; companies with optimized onboarding report 2-3x higher conversion (Source: OpenView Partners SaaS benchmarks).
- The average B2B SaaS user decides whether to continue within the first 3-5 sessions (Source: Mixpanel product benchmarks report).
- Existing onboarding tools (Appcues, Pendo, Userpilot) provide tooltips, checklists, and flow builders but do not automatically optimize the flow. The optimization step is manual — a product manager reviews analytics and redesigns steps.
- Self-optimizing systems exist in ads (Google Smart Bidding), email (marketing automation platforms), and recommendations (Netflix, Spotify), but not in SaaS onboarding specifically.

## Shaped seed

A self-improving onboarding system for B2B SaaS: instrument the flow, detect bottlenecks, generate alternative step designs, A/B test them, and adopt winners — automatically and continuously. The product team sets guardrails (brand, tone, core steps that can't be removed) and the system iterates on everything else.

Target customer: Series A/B SaaS companies (1,000-50,000 users, 5-15 person product team) where onboarding conversion directly impacts revenue but no one owns onboarding optimization full-time.

Key tension: the system must be both autonomous (to deliver value without a dedicated PM) and controllable (to avoid breaking the product experience). The guardrail mechanism is the critical design challenge — too loose and the system produces jarring experiences, too tight and it can't improve anything meaningful.
