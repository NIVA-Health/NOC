# deployment_path.md

## Purpose
This document defines the recommended path from foundation files to a live pilot deployment.

It is designed to reduce implementation chaos by sequencing work in the right order.

## Core Rule
Do not deploy ontology, prompts, agents, and adapters all at once.
Deploy in layers so failures are attributable and governance can keep up.

## Recommended Deployment Path
The first deployment path should be:

1. governance baseline freeze
2. workflow pilot definition
3. prompt and agent assembly
4. adapter validation
5. dry-run observation mode
6. recommendation-only pilot
7. limited Level 2 action pilot
8. QC review loop
9. governance refinement
10. broader rollout decision

---

## Phase 0: Baseline Freeze

### Goal
Freeze the first working governance pack so implementation can build against a stable baseline.

### Required artifacts
- identity
- ontology
- canonical terms
- autonomy ladder
- prompt contracts
- runtime contract
- failure modes
- golden examples
- mapping registry
- governance queue

### Exit criteria
- core files exist
- major contradictions resolved
- obvious unresolved terms logged

---

## Phase 1: Pilot Workflow Selection

### Goal
Choose one workflow only.

### Recommended choice
Operational Routing and SLA Escalation Pilot

### Exit criteria
- `first_workflow_blueprint.md` approved
- in-scope and out-of-scope boundaries accepted
- named owner assigned

---

## Phase 2: Build Pilot Runtime Stack

### Goal
Assemble only the files needed for the chosen pilot.

### Required artifacts
- `routing_agent.md`
- `observation_prompt.md`
- `recommendation_prompt.md`
- `rule_based_action_prompt.md`
- `workflow_engine_adapter.md`
- `decision_audit_schema.yaml`

### Optional
- `google_sheets_adapter.md` if Sheets is part of pilot surface
- `qc_agent.md` for pilot review support

### Exit criteria
- minimal pilot stack assembled
- no missing critical dependencies

---

## Phase 3: Mapping Validation

### Goal
Validate that runtime queue names, statuses, and skill references map correctly.

### Required steps
- populate `mapping_registry.yaml` with real pilot mappings
- run relevant `adapter_test_cases.md`
- log gaps in `governance_queue.md`

### Exit criteria
- all pilot-critical mappings governed or explicitly blocked
- unmapped values do not allow silent action

---

## Phase 4: Observation-Only Dry Run

### Goal
Run the system in Level 0 mode only.

### Behavior
- no recommendations unless explicitly requested
- no action
- observe real workflow events
- compare outputs to operator reality

### What to measure
- semantic correctness
- source conflicts found
- unmapped statuses or queues found
- operator usefulness of outputs
- audit completeness

### Exit criteria
- observation outputs are useful and accurate
- no major semantic failures
- major mapping gaps resolved or documented

---

## Phase 5: Recommendation-Only Pilot

### Goal
Allow Level 1 outputs in real workflow conditions.

### Behavior
- recommendations only
- no autonomous action
- operators compare recommendations to actual decisions

### What to measure
- recommendation accuracy
- operator agreement rate
- false-confidence rate
- escalation appropriateness
- failure mode incidence

### Exit criteria
- recommendations trusted enough for limited operational use
- no protected-domain drift
- acceptable eval rubric scores

---

## Phase 6: Limited Level 2 Pilot

### Goal
Enable only the narrowest governed autonomous actions.

### Allowed actions
- SLA escalation
- approved owner notification
- approved exception-path routing

### Conditions
- deterministic trigger only
- rollback known
- mappings governed
- source-of-truth verified
- audit logging active

### What to measure
- action correctness
- rollback clarity
- operator trust
- false-action rate
- blocked-action rate
- time saved

### Exit criteria
- low failure rate
- no critical failure modes
- clean audit records
- leadership comfortable with bounded autonomy

---

## Phase 7: QC and Governance Review Loop

### Goal
Use pilot data to harden the system.

### Required actions
- review failed or weak outputs
- update `failure_modes.md`
- add to `golden_examples.md`
- log governance issues
- refine mappings and prompts

### Exit criteria
- repeated issues are shrinking
- no unresolved high-risk governance drift

---

## Phase 8: Rollout Decision

### Options
- stop and redesign
- keep as recommendation-only tool
- expand Level 2 scope carefully
- add adjacent workflows

### Decision criteria
- operational benefit demonstrated
- failure modes controlled
- governance queue manageable
- adapter behavior stable
- pilot owner support

---

## Deployment Roles

### Executive Sponsor
Approves pilot scope and rollout decision.

### Pilot Owner
Owns real-world workflow outcomes.

### Semantic Steward
Owns canonical and mapping integrity.

### Technical Owner
Owns implementation and runtime integration.

### QC Owner
Owns eval review and failure analysis.

---

## Suggested Timeline Logic
Do not time-box based on calendar alone.
Advance only when exit criteria are met.

The sequence matters more than speed.

---

## Pilot Artifacts Checklist

Before observation-only dry run:
- pilot workflow blueprint exists
- routing agent profile exists
- prompt templates exist
- workflow engine adapter exists
- critical mappings exist
- governance queue ready
- audit schema ready

Before recommendation-only pilot:
- observation dry run reviewed
- major mapping gaps handled
- golden examples updated

Before Level 2 pilot:
- recommendation quality acceptable
- rollback defined
- QC signoff complete
- no critical open governance items affecting the pilot

---

## Anti-Patterns to Avoid
Do not:
- deploy multiple workflows at once
- enable Level 2 before recommendation quality is proven
- skip mapping registry population
- let local sheet terms drive runtime behavior
- allow pilot success to be judged only by speed
- ignore audit quality because outputs look right

---

## Final Rule
The safest fast path is a staged path.
A rushed deployment with weak semantic controls is slower in the end because it creates distrust and rework.
