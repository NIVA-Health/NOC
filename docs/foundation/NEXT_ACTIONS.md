# NEXT_ACTIONS

This file captures the immediate next actions for the current workstation build phase.

## Current repo state
The core foundation, model, rollout, and governance documents are now present in Git and should be treated as the working source of truth.

## Immediate execution priorities
1. Complete and verify `docs/foundation/WORKSTATION_BASELINE.md` on the real machine.
2. Create the actual folder structure on `C:` and `D:`.
3. Verify or install the core software stack.
4. Point LM Studio model storage to `D:\Models\`.
5. Begin populating `docs/models/MODEL_REGISTRY.md` with real first-wave model candidates.
6. Use `docs/foundation/RUNBOOK.md` to define actual startup, shutdown, and health-check procedures once the first local stack is live.
7. Log all meaningful progress in `docs/foundation/CHANGELOG.md`.

## First operational milestone
The first milestone is a boring, reproducible local stack where:
- folders are created
- baseline machine facts are captured
- at least one model backend is reachable
- OpenClaw starts cleanly
- one agent session completes successfully

## Governance milestone
Before broader pilot work:
- unresolved semantic issues should go to `docs/governance/governance_queue.md`
- prompts should align with `docs/governance/prompt_contracts.md`
- runtime behavior should align with `docs/governance/agent_runtime_contract.md`
- action boundaries should align with `docs/governance/autonomy_ladder.md`

## Rule
Do not let setup work drift into undocumented tribal knowledge. If a decision shapes future behavior, capture it in the corresponding file the same day.
