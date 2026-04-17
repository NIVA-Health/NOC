# Azure Appointments Observation Pilot

## Purpose
This pilot provides the first end-to-end observation-only workflow for a live external data source in NOC.

It connects the reusable Azure appointments smoke test to a structured observation payload that can be summarized for operators and leadership.

---

## Files
- `first_workflow_blueprint.md`
- `observation_prompt.md`
- `run_observation_workflow.ps1`
- `last_observation_result.json` (runtime output, created locally when the workflow runs)

---

## Execution Flow
1. Run `runtime/adapters/azure_appointments_smoke_test.ps1`
2. Receive classified result
3. Translate result into observation payload
4. Save structured JSON output for downstream summary generation
5. Stop without taking action

---

## Example command
```powershell
.\pilots\azure_appointments_observation\run_observation_workflow.ps1 -TargetDate 2026-04-17 -TryServerSideDateFilters
```

---

## Expected output classes
- `CONNECTED`
- `AUTH_FAILED`
- `NO_MATCHES`
- `ENDPOINT_FAILED`

---

## Final Rule
This pilot exists to generate trustworthy operational visibility from live data without introducing action risk.