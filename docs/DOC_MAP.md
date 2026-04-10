# DOC_MAP

This file maps the current source-of-truth documents in the repository to their intended role.

## Canonical authority map

| Priority | File | Role |
|---|---|---|
| 1 | `docs/foundation/WORKSTATION_BASELINE.md` | Machine truth authority |
| 2 | `docs/models/MODEL_REGISTRY.md` | Installed model truth |
| 3 | `docs/foundation/RUNBOOK.md` | Operating procedure authority |
| 4 | `docs/rollout/deployment_path.md` | Rollout sequence authority |
| 5 | `docs/governance/autonomy_ladder.md` | Action boundary authority |
| 6 | `docs/governance/agent_runtime_contract.md` | Runtime behavior authority |
| 7 | `docs/governance/prompt_contracts.md` | Prompt design authority |
| 8 | `docs/governance/ontology.md` | Semantic structure authority |
| 9 | `docs/governance/canonical_terms.md` | Naming and term authority |
| 10 | `docs/governance/failure_modes.md` | Failure reference authority |
| 11 | `docs/governance/golden_examples.md` | Good-output reference |
| 12 | `docs/governance/eval_rubric.md` | Evaluation standard |
| 13 | `docs/governance/governance_queue.md` | Governance work intake and backlog |
| 14 | `docs/governance/task_taxonomy.md` | Task classification reference |
| 15 | `docs/governance/memory-policy.md` | Memory handling policy |
| 16 | `docs/foundation/CHANGELOG.md` | Historical record |
| 17 | `docs/master-index/MASTER_INDEX.md` | Navigation and reading order |

## Domain-to-path mapping

| Domain | Path | Notes |
|---|---|---|
| Foundation | `docs/foundation/` | Roadmap, baseline, runbook, changelog |
| Models | `docs/models/` | Model inventory and governance |
| Rollout | `docs/rollout/` | Staged deployment logic |
| Governance | `docs/governance/` | Runtime rules, ontology, terms, failures, evals, queue |
| Navigation | `docs/master-index/` | Top-level orientation and authority map |
| Infra | `infra/` | Scripts, templates, backups, diagnostics |
| Runtime | `runtime/` | Future agent, prompt, adapter, and schema assets |
| Pilots | `pilots/` | Workflow-specific rollout packages |
| UI | `ui/` | Frontend assets |
| Tests | `tests/` | Validation assets |

## Near-term build focus
For the current workstation bring-up phase, the highest-maintenance docs are:
- `docs/foundation/WORKSTATION_BASELINE.md`
- `docs/foundation/RUNBOOK.md`
- `docs/models/MODEL_REGISTRY.md`
- `docs/foundation/CHANGELOG.md`
- `docs/rollout/deployment_path.md`

## Rule
When two docs appear to conflict, resolve the issue by following the authority order above rather than whichever file was edited most recently.
