# MASTER_INDEX.md

## Purpose
This is the top-level navigation file for the OpenClaw workstation and system documentation set.

Use this file to understand:
- what each document is for
- what order to read the documents in
- which documents are authoritative
- which documents are operational versus conceptual
- which documents should be updated during build, testing, and rollout

This folder is organized into two main layers:
1. workstation foundation
2. governance and system behavior

The goal is to keep machine setup separate from agent policy and pilot governance while still making the full system easy to operate.

---

## Recommended Reading Order

### Read first
1. `openclaw_workstation_foundation_plan.md`
2. `WORKSTATION_BASELINE.md`
3. `RUNBOOK.md`
4. `MODEL_REGISTRY.md`
5. `deployment_path.md`

### Read second
6. `agent_runtime_contract.md`
7. `prompt_contracts.md`
8. `autonomy_ladder.md`
9. `ontology.md`
10. `canonical_terms.md`

### Read during testing and rollout
11. `failure_modes.md`
12. `golden_examples.md`
13. `eval_rubric.md`
14. `governance_queue.md`
15. `CHANGELOG.md`

### Reference as needed
16. `task_taxonomy.md`
17. `memory-policy.md`

---

## Document Map

## Layer 1: Workstation Foundation
These files define the physical machine, local runtime assumptions, and day-to-day operator procedures.

### `openclaw_workstation_foundation_plan.md`
Primary roadmap for building the system on this Puget workstation.

Use for:
- phase sequencing
- architecture decisions
- storage strategy
- installation direction
- build priorities

Authority level:
- roadmap authority

Update when:
- phases change
- architecture changes
- major implementation decisions are made

### `WORKSTATION_BASELINE.md`
Defines the hardware and baseline machine truth.

Use for:
- CPU, GPU, RAM, storage reference
- installed software baseline
- hardware troubleshooting reference
- documenting actual machine state after setup

Authority level:
- machine truth authority

Update when:
- drivers change
- BIOS changes
- storage layout changes
- core installed software changes

### `MODEL_REGISTRY.md`
Defines what models are installed, allowed, tested, or deprecated.

Use for:
- model inventory
- storage location tracking
- runtime role assignment
- version control for local models
- evaluation notes per model

Authority level:
- model inventory authority

Update when:
- a model is added
- a model is removed
- a model is promoted or demoted
- quantization changes
- runtime routing changes

### `RUNBOOK.md`
Defines the operating procedures for the workstation and OpenClaw runtime.

Use for:
- start and stop procedures
- health checks
- upgrade steps
- troubleshooting flow
- operator routines

Authority level:
- operations authority

Update when:
- procedures change
- new services are added
- troubleshooting improves

### `CHANGELOG.md`
Chronological record of notable changes to the workstation and system.

Use for:
- tracking what changed
- rollback context
- audit trail for system evolution

Authority level:
- historical record

Update when:
- any meaningful change is made
- any phase is completed
- any rollback occurs

---

## Layer 2: Governance and System Behavior
These files define how OpenClaw should behave, reason, constrain itself, and be evaluated.

### `deployment_path.md`
Defines the recommended staged deployment model from baseline to pilot to bounded autonomy.

Use for:
- rollout planning
- phase gates
- sequencing work safely

Authority level:
- deployment sequencing authority

### `agent_runtime_contract.md`
Defines what agents are expected to receive, produce, and respect at runtime.

Use for:
- agent design
- interface expectations
- runtime discipline

Authority level:
- runtime behavior contract

### `prompt_contracts.md`
Defines how prompts should be structured and what guarantees they should preserve.

Use for:
- prompt design
- prompt review
- prompt hardening

Authority level:
- prompt design contract

### `autonomy_ladder.md`
Defines allowed authority levels and boundaries for system action.

Use for:
- deciding whether the system can observe, recommend, or act
- preventing premature autonomy

Authority level:
- action authority boundary

### `ontology.md`
Defines conceptual structure for entities, relationships, and system meaning.

Use for:
- semantic consistency
- schema design
- agent interpretation consistency

Authority level:
- semantic structure authority

### `canonical_terms.md`
Defines approved naming conventions and preferred terminology.

Use for:
- keeping prompts, outputs, and mappings consistent
- reducing semantic drift

Authority level:
- naming authority

### `failure_modes.md`
Catalog of failure types the system must detect, avoid, or escalate.

Use for:
- testing
- incident review
- preflight risk review

Authority level:
- safety and risk reference

### `golden_examples.md`
Examples of strong, expected outputs or decisions.

Use for:
- prompt tuning
- QC review
- operator alignment

Authority level:
- example reference, not policy by itself

### `eval_rubric.md`
Defines how outputs and behavior are judged.

Use for:
- pilot review
- promotion criteria
- comparing models or prompts

Authority level:
- evaluation standard

### `governance_queue.md`
Tracks unresolved semantic, mapping, or governance issues.

Use for:
- issue triage
- prioritization
- preventing informal drift

Authority level:
- open governance work tracker

### `task_taxonomy.md`
Defines work categories or task classes used by the system.

Use for:
- routing design
- role assignment
- future workflow planning

Authority level:
- reference taxonomy

### `memory-policy.md`
Defines what the system should retain, reference, or avoid storing.

Use for:
- memory design
- retention boundaries
- safe context handling

Authority level:
- memory handling policy

---

## Authoritative Source Rules

When documents appear to conflict, resolve in this order:

1. `WORKSTATION_BASELINE.md` for machine facts
2. `MODEL_REGISTRY.md` for installed model truth
3. `RUNBOOK.md` for operating procedures
4. `deployment_path.md` for rollout sequence
5. `autonomy_ladder.md` for action limits
6. `agent_runtime_contract.md` and `prompt_contracts.md` for runtime and prompt discipline
7. `ontology.md` and `canonical_terms.md` for semantic interpretation
8. `failure_modes.md`, `golden_examples.md`, and `eval_rubric.md` for testing, QA, and refinement
9. `CHANGELOG.md` for historical context only

If the conflict is between old memory and current docs, prefer the current docs.

---

## How These Files Should Be Used in Practice

## During workstation setup
Use:
- `openclaw_workstation_foundation_plan.md`
- `WORKSTATION_BASELINE.md`
- `RUNBOOK.md`
- `CHANGELOG.md`

## During model installation and testing
Use:
- `MODEL_REGISTRY.md`
- `RUNBOOK.md`
- `eval_rubric.md`
- `golden_examples.md`
- `CHANGELOG.md`

## During agent and prompt design
Use:
- `agent_runtime_contract.md`
- `prompt_contracts.md`
- `ontology.md`
- `canonical_terms.md`
- `autonomy_ladder.md`

## During pilot rollout
Use:
- `deployment_path.md`
- `failure_modes.md`
- `eval_rubric.md`
- `governance_queue.md`
- `CHANGELOG.md`

---

## Build Status Model
Track progress at these levels:

### Level A: Machine ready
- drivers installed
- folders created
- OpenClaw installed
- local runtime stable

### Level B: Models ready
- initial approved models downloaded
- storage locations documented
- model launch tests complete
- baseline performance recorded

### Level C: Agent framework ready
- prompt contracts defined
- runtime contract active
- semantic terms aligned
- action boundaries documented

### Level D: Pilot ready
- chosen workflow defined
- eval rubric active
- failure review loop active
- governance queue operating

### Level E: Bounded production ready
- observation mode proven
- recommendation mode trusted
- limited action approved only where governed

---

## Documentation Hygiene Rules
- Update `CHANGELOG.md` for every meaningful system change.
- Update `WORKSTATION_BASELINE.md` when machine state changes.
- Update `MODEL_REGISTRY.md` when models change.
- Update `RUNBOOK.md` when procedures change.
- Do not silently change governance assumptions without updating the relevant governance file.
- Do not let test behavior become production behavior unless documented.
- Do not let a one-off workaround become a hidden standard.

---

## Immediate Next Documents to Maintain Actively
These are the most operationally important documents during the next phase:
- `PHASE_01_EXECUTION_CHECKLIST.md`
- `WORKSTATION_BASELINE.md`
- `RUNBOOK.md`
- `MODEL_REGISTRY.md`
- `CHANGELOG.md`

---

## Final Rule
This folder should function like a controlled operating system for the OpenClaw build, not a pile of notes.

If a document is important enough to shape behavior, it should be updated before the behavior becomes normalized.
