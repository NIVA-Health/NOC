# governance_queue.md

## Purpose
This document tracks unresolved semantic issues, proposed ontology changes, deprecated term cleanup, adapter mapping gaps, and governance decisions pending review.

It is the operational intake and working backlog for semantic governance.

## Core Rule
If an issue could change enterprise meaning, reporting, workflow behavior, or agent authority, it belongs in the governance queue until resolved.

## Queue Categories
Use one of these categories for every item:
- unresolved_term
- alias_request
- deprecation_request
- new_entity_request
- new_relationship_request
- lifecycle_change
- kpi_definition_change
- adapter_mapping_gap
- source_conflict_review
- acquisition_mapping_review
- temporary_mapping_review
- prompt_governance_issue

## Status Values
Use one of these statuses:
- new
- triaged
- awaiting_evidence
- under_steward_review
- pending_sccb
- approved
- rejected
- deferred
- temporary_mapping_active
- implemented
- closed

## Priority Levels
- P1: urgent, operationally blocking or high-risk
- P2: important, material but not immediately blocking
- P3: useful, cleanup or improvement
- P4: low urgency, backlog or hygiene

---

## Queue Entry Template

### Governance Item ID
`GOV-<YYYY>-<NNN>`

### Title
Short descriptive title.

### Category
One category from the approved list.

### Status
One approved status.

### Priority
P1 / P2 / P3 / P4

### Date Opened
YYYY-MM-DD

### Requestor
Person or team raising the issue.

### Domain Steward
Owner for the affected business domain.

### Technical Steward
Owner for mapping, schema, or adapter impact.

### Summary
Short explanation of the issue.

### Observed Source
Where the issue appeared:
- system
- sheet
- prompt
- dashboard
- acquisition artifact
- workflow

### Affected Artifacts
List any impacted files or systems, such as:
- `canonical_terms.md`
- `ontology.md`
- `entity_registry.yaml`
- `relationship_registry.yaml`
- adapter docs
- prompt templates
- dashboards
- sheets
- reports

### Candidate Canonical Mapping or Change
If known, list likely mappings or possible change types.

### Risk If Unchanged
Operational, financial, compliance, reporting, or governance risk.

### Risk If Mapped Incorrectly
What goes wrong if a bad mapping or semantic decision is made.

### Historical Impact
Does the issue affect prior records or reporting?

### Required Evidence
What still needs to be gathered?

### Decision Needed
What exactly must SCCB or stewards decide?

### Next Action
Concrete next step.

### Notes
Freeform notes.

---

## Active Queue

### GOV-2026-002
**Title:** Azure appointments API date-filter and no-match classification governance  
**Category:** adapter_mapping_gap  
**Status:** new  
**Priority:** P1  
**Date Opened:** 2026-04-16  
**Requestor:** NOC integration workstream  
**Domain Steward:** TBD  
**Technical Steward:** TBD  

**Summary:**  
The Azure-hosted appointments API has validated connectivity and authenticated retrieval, but server-side date-filter behavior is not yet governed. NOC also needs an approved semantic distinction between valid no-match results and true endpoint or auth failures.

**Observed Source:**  
System

**Affected Artifacts:**  
- `runtime/adapters/azure_appointments_adapter.md`
- `runtime/adapters/azure_appointments_smoke_test.ps1`
- `docs/rollout/data_source_integration_plan.md`
- prompt templates
- adapter docs

**Candidate Canonical Mapping or Change:**  
- Map successful zero-match query results to a governed no-match outcome rather than a failure outcome
- Treat undocumented date filter behavior as unresolved until validated
- Treat appointment API field labels as integration labels pending canonical mapping review

**Risk If Unchanged:**  
NOC may generate false alarms, misclassify healthy no-result queries as failures, or encode unstable undocumented query behavior into runtime logic.

**Risk If Mapped Incorrectly:**  
Operators may trust incorrect workflow states, downstream automations may trigger on false failure conditions, and local API naming may become de facto enterprise meaning.

**Historical Impact:**  
Low for historical reporting today, but medium if the same pattern is reused across future sources without correction.

**Required Evidence:**  
- repeated endpoint tests for target-date queries
- evidence of whether `date`, `scheduledAt`, or `from/to` parameters are officially supported or only tolerated
- examples of real appointment status values returned by the source
- confirmation of operator-preferred wording for valid no-match results

**Decision Needed:**  
1. Which date-filter behavior is approved for production use?
2. What is the governed classification for valid zero-match responses?
3. Which returned fields and statuses require canonical term mapping before broader rollout?

**Next Action:**  
Run controlled tests for likely date-filter patterns, capture real returned status values, and review the no-match classification with the technical owner before recommendation-mode rollout.

**Notes:**  
This is the first live governance item tied directly to a real external source integration path.

### GOV-2026-001
**Title:** Example placeholder, replace with real issue  
**Category:** unresolved_term  
**Status:** new  
**Priority:** P2  
**Date Opened:** 2026-03-08  
**Requestor:** TBD  
**Domain Steward:** TBD  
**Technical Steward:** TBD  

**Summary:**  
Placeholder item to demonstrate queue format.

**Observed Source:**  
Operational spreadsheet

**Affected Artifacts:**  
- `canonical_terms.md`
- `google_sheets_adapter.md`

**Candidate Canonical Mapping or Change:**  
Unknown

**Risk If Unchanged:**  
Local shorthand may spread without governance.

**Risk If Mapped Incorrectly:**  
A non-canonical label could become embedded in reporting and prompts.

**Historical Impact:**  
Possible if already used in reporting.

**Required Evidence:**  
Examples of current usage across sheets and workflows.

**Decision Needed:**  
Whether the term maps to an existing canonical construct or remains unresolved.

**Next Action:**  
Collect three examples of the term in real context.

**Notes:**  
Replace this placeholder with live governance items.

---

## Intake Rules

### Add an item immediately when:
- a term has no clear canonical mapping
- two systems disagree in a semantically important way
- a new queue, status, or lifecycle appears without mapping
- a deprecated term reappears
- a local sheet or dashboard starts behaving like a source of truth
- acquisition vocabulary materially overlaps multiple constructs
- a prompt pattern encourages semantic drift or authority confusion

### Do not add an item when:
- the issue is already clearly resolved in current governed files
- the problem is purely formatting or wording with no semantic consequence
- the issue is only local and has no operational or reporting impact

---

## Review Cadence

### Weekly
- triage new items
- assign stewards
- close clearly resolved issues
- escalate P1 items immediately

### Biweekly or Monthly SCCB Review
- review pending approvals
- review temporary mappings
- review unresolved high-impact items
- review deprecations and change packages

### Quarterly Cleanup
- close stale resolved items
- review repeated issue patterns
- update failure modes and golden examples if patterns recur

---

## Queue Health Metrics
Track at minimum:
- count of open governance items
- count by category
- count by priority
- average age of open items
- number of temporary mappings still active
- repeated issue sources, such as Sheets or a specific adapter
- items causing operational blocking

## Escalation Rules
Escalate immediately if:
- issue affects patient or clinical safety
- issue affects compliance legality
- issue affects material revenue workflows
- issue may corrupt historical reporting
- issue would change agent authority boundaries

## Closure Rules
An item may close only when:
- decision is documented
- impacted artifacts are updated
- stewards confirm implementation, if required
- temporary mappings are either retired or formalized
- any needed scenario tests or golden examples are updated

## Suggested Companion Process
When an item is approved, check whether the following need updates:
- `canonical_terms.md`
- `ontology.md`
- `entity_registry.yaml`
- `relationship_registry.yaml`
- `scenario_tests.md`
- `golden_examples.md`
- `failure_modes.md`
- adapter docs
- prompt templates
- agent profiles

## Final Rule
The governance queue is not admin overhead.
It is the control point that prevents local convenience from becoming enterprise truth.
