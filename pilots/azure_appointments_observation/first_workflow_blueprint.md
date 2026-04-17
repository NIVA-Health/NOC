# first_workflow_blueprint.md

## Workflow Name
Azure Appointments Observation Pilot

## Purpose
This pilot defines the first live observation-only workflow that uses the Azure-hosted appointments API adapter to produce a plain-English operational summary for NOC.

The goal is to prove that NOC can read live external data, classify outcomes correctly, and generate a useful operator-facing result without taking autonomous action.

---

## Business Objective
Demonstrate that NOC can convert live appointment API responses into a reliable daily signal for operators and leadership.

This pilot should reduce ambiguity around whether the source is unavailable, access is broken, or there are simply no appointments matching the requested date.

---

## In Scope
- health check against the source
- authenticated appointment retrieval
- target-date or date-window request handling
- plain-English observation output
- clean distinction between failure, no-match, and successful retrieval
- evidence logging sufficient for operator review

## Out of Scope
- autonomous action
- outbound notifications
- clinical decision support
- patient-level recommendations
- writeback to source systems
- multi-source reconciliation

---

## Trigger
Manual or scheduled execution with:
- target date
- optional date window
- optional record limit

---

## Inputs
### Required
- source base URL
- valid credentials
- target date or date window

### Optional
- page size limit
- server-side date filter attempt flag

---

## Governing Artifacts
- `runtime/adapters/azure_appointments_adapter.md`
- `runtime/adapters/azure_appointments_smoke_test.ps1`
- `docs/governance/agent_runtime_contract.md`
- `docs/governance/governance_queue.md`
- `docs/rollout/data_source_integration_plan.md`

---

## Workflow Logic
1. Check source health
2. Attempt authenticated appointment retrieval
3. Determine whether server-side date filtering is available or whether client-side filtering is required
4. Classify the result as one of:
   - endpoint failure
   - auth failure
   - no matches
   - matching records found
5. Produce a plain-English observation summary
6. Log enough evidence for operator review
7. Stop without taking further action

---

## Output Requirements
The output must include:
- output class: Observation
- requested date or date window
- result classification
- record counts returned
- match count
- whether filtering was server-side or client-side
- latest and oldest returned appointment dates when available
- clear explanation of whether this is a true failure or a valid no-result case
- escalation note only when required

---

## Recommended Output Format
### Executive TL;DR
One to three sentences summarizing the result in plain language.

### Verified Result
- source reachable or not
- auth valid or not
- number of records returned
- number of matches found
- filtering mode used

### Operational Meaning
Explain whether the team should treat the result as:
- system issue
- access issue
- normal no-result condition
- normal successful retrieval

### Escalation Note
Only include if the issue is a true endpoint, auth, or contract-drift problem.

### Audit Notes
State the requested date, endpoint used, and classification logic.

---

## Success Criteria
This pilot is successful when:
- operators can understand the output without technical translation
- valid no-result cases no longer create false alarms
- true failures are clearly separated from no-result conditions
- live data can be summarized consistently on repeated runs
- output is stable enough to support a recommendation-only next step later

---

## Failure Conditions
The pilot is not successful if:
- auth failure is misclassified as source downtime
- no matches are treated as failures
- output wording implies action occurred when it did not
- field ambiguity is hidden instead of logged
- operators cannot tell what happened from the summary

---

## Exit Criteria
Before moving beyond observation-only mode:
- smoke test is reused successfully across multiple runs
- no-match classification is accepted
- date-filter behavior is documented well enough for stable use
- at least one real operator-facing summary is judged useful
- open governance issues are understood and tracked

---

## Final Rule
This pilot succeeds by producing trustworthy operational visibility, not by doing more.