# NOC agent separation decision

**Date:** 2026-04-14  
**Prepared by:** ChatGPT / Maude + Josh  
**Reporting window:** Clarification of BDR-related agent architecture after reviewing proposal instructions and leadership transcript

---

## Detailed log update

### 1. What changed
The prior BDR concept was split into two distinct agents.

This decision was made after reviewing:
- the executive-proposal custom GPT structure
- the leadership conversation describing internal market-insights and scorecard needs

### 2. Why the split was needed
The two workflows have different:
- users
- outputs
- guardrails
- input discipline
- source hierarchies
- success criteria

Keeping them inside one agent would have increased ambiguity and reduced role clarity.

### 3. New agent architecture
#### Agent 1: Market Insights Agent
Purpose:
- internal business-development intelligence
- territory and referral-source analysis
- account prioritization
- BDR coaching support

Examples of outputs:
- account quality scorecard
- territory coaching brief
- trend summary
- prioritized action recommendations

#### Agent 2: Executive Proposal Agent
Purpose:
- external-facing executive narrative proposals
- tightly aligned executive follow-on assets

Examples of outputs:
- executive narrative proposal
- CEO follow-up email
- executive call prep materials
- board-level summary

### 4. What was added to the repo
- `docs/agents/market_insights_agent_phase1_plan.md`
- `docs/agents/executive_proposal_agent_phase1_plan.md`
- `reports/2026-04-14-agent-separation-decision.md`

### 5. Recommendation
Going forward:
- stop referring to both workflows as one BDR agent
- create distinct OpenClaw agents for each workflow
- keep testing and workspace design separate
- only share common governance language where appropriate

### 6. Immediate next actions
- [ ] Create `market_insights` agent in OpenClaw
- [ ] Create `executive_proposal` agent in OpenClaw
- [ ] Build dedicated `AGENTS.md`, `SOUL.md`, `TOOLS.md`, and `IDENTITY.md` for each
- [ ] Design output templates and test cases separately

---

## Dr. Foss TL;DR

### What happened
We clarified that two different business-development workflows were being conflated into one agent concept. They have now been separated into distinct agent definitions.

### Why it matters
This gives NOC cleaner authority boundaries, cleaner prompts, cleaner testing, and more reliable specialization.

### What is next
The next step is to create the two OpenClaw agents and build their workspaces separately.

### Traffic light
- **Status:** Green
- **Reason:** The architecture is now cleaner and more specific, which reduces downstream confusion.
