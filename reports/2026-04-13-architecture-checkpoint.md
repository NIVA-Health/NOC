# NOC architecture checkpoint

**Date:** 2026-04-13  
**Prepared by:** ChatGPT / Maude + Josh  
**Reporting window:** Post-install architecture clarification before BDR buildout

---

## Detailed log update

### 1. What was reviewed
- Reviewed whether NOC needed a larger infrastructure detour before building the first operational agent.
- Reviewed how concurrent sessions and concurrent agent work should be handled in the early system.
- Reconciled those questions against the current repo trajectory and operating direction.

### 2. Conclusion
A major new infrastructure phase is not required before BDR buildout.

However, one architecture checkpoint was needed before going deeper:
- define the session model
- define the top-level agent model
- define the routing default
- define the concurrency policy
- define parent-child execution boundaries

### 3. What was added
- Added `docs/architecture/noc_session_and_concurrency_model.md`.

### 4. Architecture direction locked for Phase 1
- Use `main` as the operator and control-plane agent.
- Use `bdr` as the first operational specialist agent.
- Keep routing simple and operator-directed.
- Use sequential execution by default.
- Use child concurrency only when it clearly improves speed or quality.
- Limit child depth to 1.
- Limit child runs per parent to 3.
- Limit concurrent child runs to 3.
- Keep all BDR output inside observation, recommendation, or approval-packet boundaries.

### 5. Why this matters
This checkpoint prevents the next phase from becoming vague in three critical areas:
- session isolation
- authority boundaries during child work
- uncontrolled multi-agent sprawl

It gives NOC enough control-plane clarity to build the BDR workflow without pausing for a broader redesign.

### 6. Recommended next actions
- [ ] Create `docs/agents/bdr_agent_prompt_contract.md`
- [ ] Create `docs/agents/bdr_agent_output_template.md`
- [ ] Create `docs/agents/bdr_agent_test_cases.md`
- [ ] Decide whether BDR v1 starts at Stage A sequential-only or Stage B limited child concurrency
- [ ] Run the first structured BDR task through OpenClaw
- [ ] Score the run and capture iteration notes

---

## Dr. Foss TL;DR

### What happened
Before building the first operational agent, we paused to answer an important architecture question: how NOC should handle sessions, agent boundaries, and parallel work. That clarification has now been documented.

### Why it matters
This reduces the risk that the first agent is built on informal assumptions. It gives us a clear control model for how work should be routed, how parallel child work should be bounded, and how operator review should happen.

### What is next
The next step is to build the BDR prompt contract, output template, and test cases, then run the first controlled workflow through OpenClaw.

### Traffic light
- **Status:** Green
- **Reason:** No major infrastructure blocker remains, and the main control-plane questions for Phase 1 have now been clarified.
