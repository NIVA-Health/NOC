# canonical_terms.md

## Purpose
This document defines NIVA’s controlled operational vocabulary.

Each canonical term has:
- one approved definition
- zero or more allowed aliases
- zero or more deprecated or forbidden aliases
- an assigned domain
- an owner or steward
- a status

## Rules
1. One canonical term per business meaning.
2. Local system labels may exist, but they must map to a canonical term.
3. Deprecated terms are preserved historically and must not be reused for new meanings.
4. If a term cannot be mapped clearly, it must be flagged as unresolved, not normalized by guesswork.
5. Canonical terms govern prompts, workflows, reporting, and agent reasoning.

---

## Canonical Term Registry

### Person
- **Definition:** A real-world human identity anchor that may relate to one or more system records over time.
- **Domain:** Universal
- **Allowed aliases:** Individual, human
- **Forbidden/deprecated aliases:** Contact record, profile
- **Authoritative source:** Enterprise identity model
- **Owner:** Semantic Change Control Board
- **Status:** Active
- **Notes:** Person is broader than patient, provider, guarantor, or staff role.

### Patient
- **Definition:** A person acting in the patient role within NIVA workflows.
- **Domain:** Business / Healthcare
- **Allowed aliases:** Patient record
- **Forbidden/deprecated aliases:** Member, consumer, customer
- **Authoritative source:** Athena identity layer
- **Owner:** Operations + SCCB
- **Status:** Active
- **Notes:** Do not collapse patient with insurance member unless a mapped relationship exists.

### Provider
- **Definition:** A licensed clinical actor with regulated identity and role constraints.
- **Domain:** Healthcare
- **Allowed aliases:** Clinician
- **Forbidden/deprecated aliases:** Resource, user
- **Authoritative source:** Credentialing / provider registry
- **Owner:** Clinical operations
- **Status:** Active

### Lead
- **Definition:** An initial commercially or operationally relevant opportunity signal that may or may not mature into a referral or booked service.
- **Domain:** Business
- **Allowed aliases:** Prospect
- **Forbidden/deprecated aliases:** Referral
- **Authoritative source:** Intake / CRM mapping
- **Owner:** Growth operations
- **Status:** Active
- **Notes:** Must remain distinct from referral.

### Referral
- **Definition:** A governed intake object representing a request, transfer, or clinically relevant entry into service consideration.
- **Domain:** Business / Healthcare
- **Allowed aliases:** Intake referral
- **Forbidden/deprecated aliases:** Lead, prospect
- **Authoritative source:** Intake workflow
- **Owner:** Operations
- **Status:** Active

### Encounter
- **Definition:** A discrete interaction, visit, message, or contact event defined by governed subtype.
- **Domain:** Universal / Healthcare / Operations
- **Allowed aliases:** Visit, interaction, contact event
- **Forbidden/deprecated aliases:** Episode
- **Authoritative source:** Source system by subtype
- **Owner:** SCCB
- **Status:** Active
- **Notes:** Encounter is atomic. Episode is longitudinal.

### Care Episode
- **Definition:** A longitudinal grouping of related encounters representing a coherent care interval.
- **Domain:** Healthcare / Business
- **Allowed aliases:** Episode, episode of care
- **Forbidden/deprecated aliases:** Case, census
- **Authoritative source:** Clinical operations model
- **Owner:** Clinical operations + SCCB
- **Status:** Active

### Case
- **Definition:** A longitudinal coordination construct that may span one or more workflows and, in some contexts, one or more episodes.
- **Domain:** Business / Operations
- **Allowed aliases:** Coordination case
- **Forbidden/deprecated aliases:** Episode
- **Authoritative source:** Enterprise workflow model
- **Owner:** Operations
- **Status:** Active

### Workitem
- **Definition:** A unit of operational work requiring action, monitoring, routing, or closure.
- **Domain:** Operations
- **Allowed aliases:** Task, ticket
- **Forbidden/deprecated aliases:** Queue item
- **Authoritative source:** Workflow engine / operational queue model
- **Owner:** Operations
- **Status:** Active
- **Notes:** Queue is a location or routing construct, not the work itself.

### Queue
- **Definition:** A governed holding and routing structure used to organize workitems.
- **Domain:** Operations
- **Allowed aliases:** Work queue
- **Forbidden/deprecated aliases:** Task
- **Authoritative source:** Routing model
- **Owner:** Operations
- **Status:** Active

### Skill
- **Definition:** A routing qualification or capability required to handle a specific workitem or interaction.
- **Domain:** Operations
- **Allowed aliases:** Capability, routing skill
- **Forbidden/deprecated aliases:** Role
- **Authoritative source:** Contact center / routing design
- **Owner:** Operations
- **Status:** Active

### Consent
- **Definition:** A time-bound permission state governing whether certain communications or actions are allowed.
- **Domain:** Universal / Compliance
- **Allowed aliases:** Permission
- **Forbidden/deprecated aliases:** Preference
- **Authoritative source:** Consent capture system
- **Owner:** Compliance
- **Status:** Active

### Disposition
- **Definition:** A standardized outcome classification attached to a workflow event, contact, or workitem.
- **Domain:** Operations
- **Allowed aliases:** Outcome code, result code
- **Forbidden/deprecated aliases:** Note, tag
- **Authoritative source:** Disposition registry
- **Owner:** Operations
- **Status:** Active

### Authorization
- **Definition:** A payer or coverage approval state related to access, reimbursement, or service eligibility.
- **Domain:** Insurance / Financial
- **Allowed aliases:** Prior auth, auth
- **Forbidden/deprecated aliases:** Referral approval
- **Authoritative source:** Payer / revenue cycle workflow
- **Owner:** Revenue operations
- **Status:** Active

### Claim
- **Definition:** A financial submission object linked to billable clinical or operational events.
- **Domain:** Financial
- **Allowed aliases:** Billing claim
- **Forbidden/deprecated aliases:** Invoice
- **Authoritative source:** Billing / clearinghouse
- **Owner:** Revenue cycle
- **Status:** Active

### Denial
- **Definition:** A negative adjudication or rejection outcome linked to a claim or authorization pathway.
- **Domain:** Financial
- **Allowed aliases:** Rejection, denied claim
- **Forbidden/deprecated aliases:** Cancellation
- **Authoritative source:** Billing / payer response
- **Owner:** Revenue cycle
- **Status:** Active

### Revenue Event
- **Definition:** A recognized, expected, blocked, or lost financial outcome tied to an encounter, episode, authorization, or claim.
- **Domain:** Financial / Business
- **Allowed aliases:** Revenue outcome
- **Forbidden/deprecated aliases:** Payment only
- **Authoritative source:** Revenue model
- **Owner:** Finance + revenue cycle
- **Status:** Active

### SLA
- **Definition:** A service-level expectation governing response, action, or resolution timing.
- **Domain:** Operations
- **Allowed aliases:** Service level, response target
- **Forbidden/deprecated aliases:** Goal
- **Authoritative source:** Operations governance
- **Owner:** Operations leadership
- **Status:** Active

### Outcome
- **Definition:** A governed result state used for performance, completion, resolution, or success measurement.
- **Domain:** Universal / Business
- **Allowed aliases:** Result
- **Forbidden/deprecated aliases:** Tag, label
- **Authoritative source:** KPI and performance model
- **Owner:** SCCB
- **Status:** Active

### Campaign
- **Definition:** A structured acquisition, outreach, or performance context used to group operational and business activity.
- **Domain:** Business / Operations
- **Allowed aliases:** Outreach campaign
- **Forbidden/deprecated aliases:** Queue
- **Authoritative source:** Campaign model
- **Owner:** Growth operations
- **Status:** Active

### Geography
- **Definition:** A governed spatial classification used for service delivery, reporting, routing, or provider coverage.
- **Domain:** Business / Operations
- **Allowed aliases:** Territory, service area
- **Forbidden/deprecated aliases:** Location note
- **Authoritative source:** Enterprise geography model
- **Owner:** Operations leadership
- **Status:** Active

### Time Period
- **Definition:** A governed temporal reporting or operational grouping used for rollups, audit windows, or performance tracking.
- **Domain:** Universal
- **Allowed aliases:** Reporting period
- **Forbidden/deprecated aliases:** Date bucket
- **Authoritative source:** Enterprise calendar model
- **Owner:** BI / operations
- **Status:** Active

---

## Unresolved Terms Queue
Use this section for terms that appear in systems or workflows but are not yet canonically mapped.

Template:
- **Observed term:**
- **Observed context:**
- **Likely mapping:**
- **Confidence:** Low / Medium / High
- **Decision needed from:**
- **Status:** Open / Mapped / Rejected
