# CHANGELOG

## Purpose
This changelog records meaningful changes to the NIVA Health OpenClaw workstation, software stack, configuration, models, and operating procedures. The goal is traceability, rollback awareness, and reduced debugging time.

Related documents:
- `openclaw_workstation_foundation_plan.md`
- `WORKSTATION_BASELINE.md`
- `MODEL_REGISTRY.md`
- `RUNBOOK.md`

---

## Logging Rules
1. Log changes the same day they happen.
2. Prefer one entry per meaningful change or change set.
3. Record why the change happened, not just what changed.
4. If rollback is unclear, say so.
5. If a change introduced a problem, note that explicitly.

---

## Entry Template

Copy-paste this block for manual entries.

```md
## YYYY-MM-DD - Short change title
- Operator:
- Area:
- Change:
- Reason:
- Expected impact:
- Validation performed:
- Rollback method:
- Related files:
- Notes:
```

---

## Change Areas
Use one of these labels when possible.

| Area | Use for |
|---|---|
| Hardware | Physical upgrades, BIOS, drives, peripherals |
| OS | Windows updates, activation, restore points |
| Drivers | GPU, chipset, LAN, firmware |
| Tooling | Git, Python, Node, PowerShell, editors |
| OpenClaw | Gateway, config, agents, auth, sessions |
| Models | Downloads, approvals, removals, backend changes |
| Scripts | Startup, shutdown, backup, health check |
| Security | Tokens, auth posture, remote access, secrets handling |
| Docs | Runbook, baseline, roadmap, process updates |
| Incident | Breakages and corrective actions |

---

## Current Log

## 2026-04-16 - Azure observation workflow runner added
- Operator: ChatGPT
- Area: Scripts
- Change: Added an end-to-end observation workflow runner and pilot README for the Azure appointments observation pilot. The runner executes the smoke test, classifies the result, and writes a structured observation payload for downstream summary generation.
- Reason: Complete the first live external-source workflow path so NOC can move from disconnected artifacts to a repeatable observation-only execution flow.
- Expected impact: Faster operator validation, easier repeated testing, and a cleaner bridge from adapter output to executive-friendly summaries.
- Validation performed: Confirmed the workflow runner maps smoke test classifications into operational meanings and preserves observation-only guardrails in the output payload.
- Rollback method: Remove or revise the runner and README if the pilot execution pattern changes.
- Related files:
  - `pilots/azure_appointments_observation/run_observation_workflow.ps1`
  - `pilots/azure_appointments_observation/README.md`
  - `pilots/azure_appointments_observation/observation_prompt.md`
  - `runtime/adapters/azure_appointments_smoke_test.ps1`
- Notes: This is the first repo artifact that ties external-source validation directly to a structured workflow output.

## 2026-04-16 - Azure appointments observation pilot defined
- Operator: ChatGPT
- Area: Docs
- Change: Added the first bounded observation-only workflow for the Azure appointments source, including a workflow blueprint and observation prompt for plain-English operator summaries.
- Reason: Move the source integration effort from adapter validation into a live, low-risk NOC workflow that can generate useful operational visibility without taking action.
- Expected impact: Faster proof-of-value, clearer operator-facing summaries, and a stable bridge from raw API results to governed observation outputs.
- Validation performed: Confirmed workflow scope, output requirements, and observation-only guardrails align with the adapter contract and staged rollout approach.
- Rollback method: Remove or revise the pilot files if a different first workflow is selected.
- Related files:
  - `pilots/azure_appointments_observation/first_workflow_blueprint.md`
  - `pilots/azure_appointments_observation/observation_prompt.md`
  - `runtime/adapters/azure_appointments_adapter.md`
  - `runtime/adapters/azure_appointments_smoke_test.ps1`
- Notes: This establishes the first live external-source observation workflow in the repo.

## 2026-04-16 - Data source integration phase defined
- Operator: ChatGPT
- Area: Docs
- Change: Added a formal next-phase plan for turning the validated Azure-hosted API connection into a repeatable NOC data source integration pattern.
- Reason: The team has proven external data source connectivity and now needs a governed, reusable process for query handling, failure classification, mapping, and observation-only workflow rollout.
- Expected impact: Faster onboarding of future data sources, less re-debugging, clearer failure handling, and a more scalable proof-of-value path for NOC.
- Validation performed: Confirmed the plan aligns with recent successful API connectivity testing and with the repo's staged deployment logic.
- Rollback method: Remove or revise the plan document if the integration approach changes.
- Related files:
  - `docs/rollout/data_source_integration_plan.md`
  - `docs/rollout/deployment_path.md`
  - `docs/governance/agent_runtime_contract.md`
  - `docs/governance/governance_queue.md`
- Notes: This change records the strategic shift from proving connectivity to operationalizing a reusable integration pattern.

## 2026-04-09 - Documentation scaffold created
- Operator: ChatGPT
- Area: Docs
- Change: Created the initial markdown documentation set for the OpenClaw workstation, including the roadmap, workstation baseline, model registry, runbook, and changelog.
- Reason: Establish a durable operating roadmap and reduce undocumented setup drift.
- Expected impact: Faster, more organized workstation buildout and easier troubleshooting later.
- Validation performed: Files created and linked conceptually to each other.
- Rollback method: Delete files if a different documentation structure is preferred.
- Related files:
  - `openclaw_workstation_foundation_plan.md`
  - `WORKSTATION_BASELINE.md`
  - `MODEL_REGISTRY.md`
  - `RUNBOOK.md`
  - `CHANGELOG.md`
- Notes: This is the documentation baseline, not proof that software installation or configuration has been completed.

---

## Pending First Entries
Use these once work begins on the actual machine.

### Example: baseline capture
```md
## 2026-04-XX - Baseline machine inventory captured
- Operator:
- Area: Docs
- Change: Captured hostname, OS build, BIOS version, driver versions, disk labels, and installed tool versions.
- Reason: Establish known-good baseline before deeper OpenClaw setup.
- Expected impact: Better troubleshooting and rollback clarity.
- Validation performed:
- Rollback method: Re-capture and replace if errors found.
- Related files:
  - `WORKSTATION_BASELINE.md`
- Notes:
```

### Example: first model backend setup
```md
## 2026-04-XX - Local model backend configured
- Operator:
- Area: Models
- Change: Configured LM Studio or other local backend to serve approved initial models from D:\Models.
- Reason: Enable local inference for OpenClaw.
- Expected impact: Working local model path for agent testing.
- Validation performed:
- Rollback method:
- Related files:
  - `MODEL_REGISTRY.md`
  - `RUNBOOK.md`
- Notes:
```

### Example: first OpenClaw boot
```md
## 2026-04-XX - OpenClaw minimal local configuration validated
- Operator:
- Area: OpenClaw
- Change: Installed or validated OpenClaw with minimal local-only configuration and successful first session.
- Reason: Confirm base architecture before adding complexity.
- Expected impact: Working local orchestration layer.
- Validation performed:
- Rollback method:
- Related files:
  - `RUNBOOK.md`
  - `WORKSTATION_BASELINE.md`
- Notes:
```

---

## Decision Points to Track

| Decision | Status | Notes |
|---|---|---|
| Which reasoning model becomes first approved default | Open | |
| Which coding model becomes first approved default | Open | |
| Whether remote access is enabled in early phases | Open | |
| Whether Docker is required in first-wave architecture | Open | |
| Whether ClawOps UI is core or optional | Open | |

---

## Notes
```text
[Add notes here]
```