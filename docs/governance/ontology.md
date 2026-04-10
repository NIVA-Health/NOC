# ontology.md

## Purpose
This ontology defines the canonical business meaning that governs NIVA OpenClaw reasoning, workflow execution, reporting, and future automation.

## Layer Model
NIVA ontology uses four semantic layers:

1. Universal Layer  
   Stable cross-domain primitives such as time, outcome, relationship, consent, ownership, obligation, communication.

2. Domain Layer  
   Healthcare-specific and insurance-specific concepts.

3. Business Layer  
   Enterprise operational meaning used by AI and executive reporting.

4. Implementation Layer  
   Vendor-specific identifiers, payloads, and technical artifacts.

AI reasoning and executive reporting should operate primarily in the Business Layer.
System artifacts stay below that layer.

## Design Principle
Systems do not define reality.
They translate into it.

## Universal Concepts
Canonical cross-domain concepts include:
- Time
- Outcome
- Financial Obligation
- Consent
- Communication
- Case
- Relationship
- Ownership

If a concept cannot map to these or to governed domain/business entities, it is likely implementation detail.

## Domain Concepts

### Healthcare Domain
- Encounter
- Episode of Care
- Diagnosis
- Treatment Plan
- Provider
- Clinical Documentation
- Units of Service
- Care Plan
- Outcome Metrics

### Insurance Domain
- Policy
- Benefit Plan
- Coverage Tier
- Deductible
- Copay
- Authorization
- Claim
- Adjudication
- Denial Code
- Network Status

Healthcare defines what was done.
Insurance defines whether it is reimbursable.
The ontology must relate them without merging them.

## Core Business Entities
The NIVA Business Layer should treat the following as canonical enterprise entities:

- Person
- Patient
- Provider
- Lead
- Referral
- Workitem
- Campaign
- Queue
- Skill
- Consent
- Disposition
- Encounter
- Care Episode
- Case
- Workflow Event
- Authorization
- Claim
- Denial
- Revenue Event
- SLA
- Outcome
- Service Line
- Geography
- Time Period

## Definitions

### Person
A real-world human identity anchor.
May relate to one or more system records over time.

### Patient
A person acting in the patient role within NIVA workflows.

### Provider
A licensed clinical actor with regulated identity and capacity constraints.

### Lead
An initial commercially or operationally relevant opportunity signal that may or may not mature into a referral or booked encounter.

### Referral
A governed intake object representing a request, transfer, or clinically relevant entry into NIVA service consideration.

### Workitem
A unit of operational work requiring action, monitoring, routing, or closure.

### Campaign
A structured outreach or acquisition context used to organize operational and financial performance.

### Queue
A governed operational holding and routing structure.

### Skill
A capability or routing qualification relevant to handling a workitem or contact.

### Consent
A time-bound permission state governing communication or action eligibility.

### Disposition
A standardized outcome classification attached to an event, contact, or workitem.

### Encounter
A discrete interaction, visit, message, or contact event, depending on governed subtype.

### Care Episode
A longitudinal clinical grouping of related encounters representing a coherent care interval.

### Case
A longitudinal coordination construct that may span multiple workflows and, in some contexts, one or more episodes.

### Workflow Event
A timestamped operational event inside a workflow sequence.

### Authorization
A payer or coverage approval state related to reimbursability or access.

### Claim
A financial submission object linked to billable clinical or operational events.

### Denial
A negative adjudication or rejection outcome tied to a claim or authorization pathway.

### Revenue Event
A recognized or expected financial outcome tied to encounters, episodes, or claims.

### SLA
A service-level expectation governing response timing or workflow handling.

### Outcome
A governed result state used for performance, completion, or success measurement.

## Entity Relationship Model

### Core operational chain
Workitem → Campaign → Queue → Skill → Consent → Disposition

This is the deterministic path NOC agents must reason across in real time.

### Longitudinal reasoning chain
Event → Workflow → Case → Episode → Financial Lifecycle → Organizational Context

AI must reason across this chain to avoid local optimization that harms broader performance.

### Financial chain
Encounter → Claim → Payment or Denial

### Executive rollup dimensions
Everything should roll up to:
- Campaign
- Service Line
- Geography
- Provider
- Time Period

## Lifecycle Principles
Each lifecycle-bearing entity must have:
- canonical lifecycle states
- valid transitions
- time bounds
- ownership state
- audit timestamps
- versioned definitions when semantics change

## Hierarchy Rule
Hierarchy stops where action stops.

If adding a level does not change a decision, it should not exist.

## Synonym Governance
Departments may use local labels.
Enterprise reasoning may use only canonical meaning plus governed alias mapping.

Examples from current drift risk:
- Lead ↔ Referral
- Encounter ↔ Visit
- DOS ↔ Visit Date
- Completed ↔ Closed
- Workitem ↔ Task
- Census ↔ Active Episode

These are not harmless variations.
They are operational risk unless mapped.

## Deprecation Rule
Concepts are never deleted.
They are versioned and deprecated with effective dates and replacement mapping when applicable.

## Business Meaning vs Technical Layer
The following belong in business ontology:
- Patient
- Episode
- Encounter
- Lead
- Conversion
- Completion
- Authorization
- Claim
- Revenue
- Denial
- Consent
- Responsibility
- Outcome
- SLA
- Case

The following belong in technical or adapter layers:
- Workitem ID
- Queue ID
- Campaign object ID
- API payload
- Database table
- Call SID
- Athena appointment GUID
- CareSMS message ID

## Authoritative Mapping Principle
Ontology should map to authoritative truth systems, but never be owned by them.
Examples:
- Athena anchors patient identity and coverage
- WoundExpert anchors signed clinical documentation
- billing and clearinghouse layers anchor submitted claims
- CareSMS anchors message audit history

## Final Ontology Rule
If a concept is not lifecycle-distinct, decision-relevant, historically governable, and semantically real, it should not become a canonical ontology entity.
