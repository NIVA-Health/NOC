# azure_appointments_adapter.md

## Purpose
This document defines the first governed integration contract for connecting NOC to the Azure-hosted appointments API.

It exists to convert a successful connectivity test into a repeatable integration pattern that can be validated, reused, and governed.

---

## Integration Summary

### Source Name
Azure Appointments API

### Environment
Development

### Base URL
`https://niva-dev-api-app.azurewebsites.net`

### Current Integration Status
Validated for basic connectivity and authenticated retrieval.

### Proven Facts
- `/health` is reachable
- `/health` returns a healthy status without authentication
- authenticated access to `/appointments` works
- `/appointments` returns structured paginated data
- appointment records include scheduling and reference fields suitable for observation-mode workflows

### Not Yet Proven
- whether server-side date filtering is officially supported
- whether undocumented filter parameters change result scope
- the final canonical mapping for appointment status values
- the final production behavior for pagination across larger record sets

---

## Source-of-Truth Posture
This API is treated as a candidate operational source for appointment data retrieval.

### Current rule
Use this API as authoritative for the fields it directly returns during this pilot, unless a governed source conflict is identified.

### Do not assume
- that convenience summaries override record-level response fields
- that undocumented query behavior is stable
- that all local field names are canonical NOC terms

Any material conflict must be logged in the governance queue before broader rollout.

---

## Authentication

### Method
Basic Authentication

### Current behavior
- `/health` does not require authentication
- `/appointments` requires authentication

### Required runtime behavior
- distinguish auth failure from endpoint failure
- do not classify invalid credentials as source downtime
- do not continue as if data retrieval succeeded when auth fails

---

## Known Endpoints

### Health Check
`GET /health`

#### Expected behavior
Returns service health response when the API is available.

#### NOC classification
- success: service reachable
- failure: endpoint unavailable or service degraded

### Appointment Retrieval
`GET /appointments?page=1&limit=<N>`

#### Expected behavior
Returns paginated structured appointment records.

#### Current known fields
Candidate fields observed or expected from live test results:
- `id`
- `scheduledAt`
- `status`
- `type`
- `patient`
- `provider`

These field names are integration-level labels, not yet final canonical NOC terms.

---

## Pagination Behavior

### Known
The appointments endpoint supports `page` and `limit`.

### Unknown
- maximum reliable page size
- ordering guarantees across pages
- whether paging is stable under changing data

### Current pilot rule
Use conservative paging during the pilot and document any ordering assumptions before building downstream logic that depends on completeness.

---

## Target-Date Query Behavior

### Current state
Date filtering is not yet documented as part of the known endpoint contract.

### Required validation
Test likely query variants such as:
- `date=YYYY-MM-DD`
- `scheduledAt=YYYY-MM-DD`
- `from=YYYY-MM-DD&to=YYYY-MM-DD`

### Current fallback rule
If server-side date filtering is not supported or is not stable, NOC must retrieve records and filter by date client-side.

### Important rule
A valid zero-match result for a target date is not a system failure.
It is a successful query with no matching records.

---

## NOC Failure Classification

| Condition | Meaning | NOC behavior |
|---|---|---|
| Health check fails | Service unavailable or unreachable | Escalate as endpoint/system issue |
| Auth fails | Credential or configuration problem | Escalate as access/config issue |
| Endpoint responds, zero target-date matches | Valid no-result case | Return clean no-match result |
| Endpoint responds, records returned | Successful retrieval | Continue observation workflow |
| Response shape changes materially | Contract drift or schema risk | Escalate and log governance item |

---

## Observation-Only Output Rule
During the first pilot, NOC should only:
- retrieve appointment data
- summarize findings in plain language
- report whether matches were found for the requested date or window
- identify whether the result is a no-match case versus a failure case

NOC must not take downstream autonomous action from this source during the first phase.

---

## Candidate Canonical Mapping Areas
The following require governed mapping review before broader use:
- appointment identifier
- scheduled datetime
- appointment status
- appointment type
- patient reference
- provider reference
- pagination metadata
- error class
- no-match result classification

---

## Required Logging
Each non-trivial execution should be able to reconstruct:
- what endpoint was called
- whether auth succeeded
- what date or time filter was requested
- whether filtering was server-side or client-side
- how many records were returned
- how many matches were found
- why the result was classified as success, no-match, auth failure, or endpoint failure

---

## Open Governance Questions
1. Which appointment status values map cleanly into canonical NOC lifecycle meaning?
2. Should this API be treated as fully authoritative for appointment state during pilot use, or only for retrieval events?
3. Which query parameters are officially supported versus tolerated but undocumented?
4. What is the approved operator-facing wording for a valid no-results response?

---

## Definition of Done for This Adapter Phase
This adapter phase is complete when:
- the smoke test is reusable
- the endpoint contract is documented
- no-match behavior is explicitly handled
- initial field mappings are reviewed
- one observation-only workflow uses the source successfully

---

## Final Rule
This adapter is successful only when the connection is repeatable, the results are classified correctly, and ambiguity is surfaced rather than hidden.