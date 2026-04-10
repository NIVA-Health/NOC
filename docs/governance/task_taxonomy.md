# task_taxonomy.md

## Purpose
This taxonomy defines the main classes of work NIVA OpenClaw agents perform so tasks can be routed, evaluated, and governed consistently.

## Design Principle
Task classes should reflect real operational decisions, not software implementation convenience.

## Top-Level Task Domains

### 1. Semantic Governance Tasks
Purpose:
Maintain enterprise meaning and prevent terminology drift.

Includes:
- canonical term creation requests
- alias mapping
- deprecation planning
- entity classification
- lifecycle definition
- acquisition vocabulary mapping
- KPI definition review

Human oversight:
Usually required for final approval via SCCB.

### 2. Operational Routing Tasks
Purpose:
Move work to the right owner, queue, or next step.

Includes:
- route or retain call
- recommend transfer
- assign provider when deterministic
- move workitem across queue
- reassign due to SLA breach

Autonomy:
Often eligible for autonomous action when criteria are deterministic and context complete.

### 3. Scheduling and Qualification Tasks
Purpose:
Determine whether a patient or contact can be booked, retained, escalated, or further qualified.

Includes:
- visit-type qualification
- scheduling recommendation
- provider geography fit
- slot recommendation
- escalation based on urgency indicators

Autonomy:
Mixed. Advisory when ambiguity or clinical judgment exists.

### 4. Consent and Compliance Tasks
Purpose:
Ensure actions remain legally and operationally compliant.

Includes:
- consent validity checks
- legal hour conflict flags
- missing consent alerts
- messaging permission checks
- compliance trend detection

Autonomy:
Autonomous for deterministic checks.
Human review for ambiguous interpretation.

### 5. Disposition and Outcome Classification Tasks
Purpose:
Standardize downstream reporting and workflow progression.

Includes:
- recommend disposition
- auto-disposition routine calls
- classify workflow outcome
- assign completion category
- identify leakage point between stages

Autonomy:
Only when canonical definitions and triggers are clear.

### 6. Workflow Monitoring and Escalation Tasks
Purpose:
Detect stalls, breaches, and anomalies in active workflows.

Includes:
- SLA breach escalation
- no-response alerting
- stuck workflow detection
- duplicate active episode flagging
- orphaned ownership flagging

Autonomy:
Strong candidate for autonomous handling when structure is clear.

### 7. Clinical Coordination Support Tasks
Purpose:
Support, but not replace, clinical operations.

Includes:
- summarization of relevant context
- escalation trigger detection from transcript
- documentation completeness flagging
- scheduling support based on care context
- non-clinical care coordination recommendations

Autonomy:
Primarily advisory.
Never substitutes for clinical judgment where licensed decisions are required.

### 8. Financial Lifecycle Tasks
Purpose:
Support revenue integrity and financial visibility.

Includes:
- authorization gap flagging
- claim risk detection
- denial pattern summarization
- recovery opportunity flagging
- revenue per episode analysis

Autonomy:
Advisory for interpretation.
Autonomous only for low-risk structural flags.

### 9. Identity and Entity Integrity Tasks
Purpose:
Protect correct linkage among people, patients, providers, episodes, and claims.

Includes:
- duplicate detection
- identity mismatch flagging
- unresolved role conflict detection
- source mismatch alerts
- merge recommendation packages

Autonomy:
Flagging yes.
Merging no.

### 10. Reporting and Executive Insight Tasks
Purpose:
Convert governed operational data into decision-ready signal.

Includes:
- DCA daily summary
- campaign performance summary
- booked-to-completed analysis
- denial rate rollup
- SLA trend summary
- provider productivity view

Autonomy:
Generally safe when based on governed definitions and authoritative sources.

### 11. Knowledge Capture and Learning Tasks
Purpose:
Preserve reusable enterprise knowledge.

Includes:
- failure mode capture
- workflow pattern extraction
- ontology gap detection
- policy exception cataloging
- post-incident semantic correction proposals

Autonomy:
Drafting yes.
Approval no.

## Task Risk Bands

### Band A: Deterministic Low Risk
Examples:
- SLA escalation
- routing by governed rules
- duplicate flagging
- missing auth alert

### Band B: Structured but Material
Examples:
- booking recommendations
- queue reassignment
- auto-disposition
- compliance-related messaging actions

### Band C: Interpretive High Risk
Examples:
- policy interpretation
- claim correction
- clinical change recommendation
- identity merge action

### Band D: Human-Reserved
Examples:
- diagnosis determination
- discharge approval
- retro financial adjustment approval
- final policy exception interpretation

## Required Task Metadata
Every task definition should include:
- task class
- domain
- required context
- authority level
- source-of-truth dependencies
- allowable outputs
- audit requirements
- escalation threshold
- failure modes

## Routing Rule
If a task cannot be clearly assigned to a governed class, it is not ready for automation.

## Final Taxonomy Rule
Classify work by decision type, risk level, and semantic dependency, not by whichever system currently hosts the button.
