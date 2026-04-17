# data_source_integration_plan.md

## Purpose
This document defines the next phase of attack for NOC after validating a successful live connection to an external Azure-hosted API data source.

The goal is to turn a one-time successful integration test into a repeatable, governed process that can be reused across future data sources.

---

## Current State
NOC has validated the following with a live external API:
- health endpoint reachable
- authenticated access works
- structured appointment data can be retrieved

This means the immediate blocker is no longer basic connectivity.
The next work is operationalizing query logic, handling valid empty-result cases, defining mappings, and wiring the source into a controlled NOC workflow.

---

## Core Objective
Convert proven connectivity into a replicable integration pattern.

That pattern should allow NOC to:
- validate a source consistently
- classify failures correctly
- map source data into governed NOC meaning
- produce observation-only outputs first
- reuse the same pattern on future sources with minimal redesign

---

## Next 5 Priorities

### 1. Canonical smoke test
Create a reusable baseline test for this source that checks:
- `/health`
- authentication
- one known working endpoint
- target-date behavior
- output classification

Allowed output classes:
- `CONNECTED`
- `AUTH_FAILED`
- `NO_MATCHES`
- `ENDPOINT_FAILED`

### 2. Source integration contract
Document:
- source name
- base URL
- auth method
- working endpoints
- pagination behavior
- expected response shape
- target-date query behavior
- failure classification rules
- rule that valid empty results are not system failures

### 3. Mapping and governance layer
Map the first source fields into NOC governed meaning.
Initial focus:
- appointment ID
- scheduled date/time
- appointment status
- patient reference
- provider reference
- pagination metadata
- error classes

Any ambiguity, undocumented parameter behavior, or source conflict should be logged in the governance queue.

### 4. Observation-only workflow
Wire the source into one bounded NOC workflow that:
- reads live data
- summarizes results in plain language
- distinguishes real failures from valid no-result responses
- does not take action yet

### 5. Reusable adapter pattern
Use this source as the first template for future source integrations.
The reusable pattern should include:
- smoke test structure
- integration contract structure
- mapping checklist
- failure classification model
- observation-only output pattern

---

## Recommended First Workflow
Use a narrow workflow first.
Recommended options:
- daily appointment signal check
- appointment date availability summary
- appointment exception scan

Start in observation mode only.
Do not broaden scope until output quality is stable and the workflow is easy for an operator to verify.

---

## Operating Rules
1. Do not treat valid empty-result cases as failures.
2. Do not let API field labels silently become canonical NOC meaning.
3. Do not add autonomous action before observation outputs are trusted.
4. Log ambiguity in the governance queue rather than hiding it in prompts or code.
5. Prefer one reusable pattern over one-off source logic.

---

## Definition of Success
This phase is successful when:
- the smoke test is reusable
- the source contract is documented
- the first mappings are governed
- one observation-only workflow runs on live data
- the same pattern can be copied for the next source

---

## Business Meaning
This phase moves NOC from a successful technical proof to a repeatable operational integration capability.

That matters because it:
- reduces future source onboarding friction
- improves reliability and trust
- supports faster proof-of-value across additional workflows
- creates a scalable pattern instead of isolated wins

---

## Final Rule
A successful connection is not the finish line.
The finish line for this phase is a reusable process.