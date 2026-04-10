# START_HERE

This file is the quickest entry point into the NOC repository.

## What this repo is
NOC is the controlled operating system for NIVA Health's OpenClaw environment.
It holds the authoritative documentation structure for workstation foundation, runtime behavior, model governance, pilot rollout, and operational controls.

## Recommended reading order
1. `docs/master-index/MASTER_INDEX.md`
2. `docs/foundation/openclaw_workstation_foundation_plan.md`
3. `docs/foundation/WORKSTATION_BASELINE.md`
4. `docs/foundation/RUNBOOK.md`
5. `docs/models/MODEL_REGISTRY.md`
6. `docs/rollout/deployment_path.md`
7. `docs/governance/agent_runtime_contract.md`
8. `docs/governance/prompt_contracts.md`
9. `docs/governance/autonomy_ladder.md`
10. `docs/governance/ontology.md`
11. `docs/governance/canonical_terms.md`
12. `docs/governance/failure_modes.md`
13. `docs/governance/golden_examples.md`
14. `docs/governance/eval_rubric.md`
15. `docs/governance/governance_queue.md`
16. `docs/governance/task_taxonomy.md`
17. `docs/governance/memory-policy.md`
18. `docs/foundation/CHANGELOG.md`

## Monday operator minimum path
If the immediate goal is getting the workstation usable fast, start here:
1. `docs/foundation/openclaw_workstation_foundation_plan.md`
2. `docs/foundation/WORKSTATION_BASELINE.md`
3. `docs/foundation/RUNBOOK.md`
4. `docs/models/MODEL_REGISTRY.md`
5. `docs/rollout/deployment_path.md`

## Domain map
- `docs/foundation/` machine truth, roadmap, runbook, and change log
- `docs/models/` model registry and model governance
- `docs/rollout/` staged deployment logic
- `docs/governance/` runtime rules, prompt rules, ontology, terms, failure patterns, evals, and governance backlog
- `infra/` scripts, config templates, diagnostics, and workstation automation
- `runtime/` future runtime assets such as agents, prompts, adapters, and schemas
- `pilots/` bounded workflow-specific rollout packages
- `ui/` frontend assets
- `tests/` validation assets

## Core rule
If a behavior is important enough to normalize, it should live in this repo before it becomes standard practice.
