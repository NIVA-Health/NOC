# memory-policy.md

## Purpose
This policy defines what NIVA OpenClaw should remember, how memory should be structured, what must expire, and what must remain historically intact.

## First Principle
Memory exists to improve future action, consistency, traceability, and organizational learning.
Memory must never become a shadow source of truth that competes with authoritative systems.

## Memory Classes

### 1. Canonical Semantic Memory
Persistent.
Stores governed business meaning.

Examples:
- canonical entities
- canonical terms
- alias mappings
- lifecycle definitions
- disposition definitions
- KPI definitions
- approved workflow categories
- deprecation mappings

This memory is versioned and governed through SCCB.

### 2. Operational Pattern Memory
Persistent, but reviewable.
Stores reusable decision patterns and workflow logic.

Examples:
- routing rules
- SLA logic
- escalation patterns
- campaign-to-queue mappings
- common failure conditions
- approved automation playbooks

### 3. Case and Episode Context Memory
Time-bound and entity-linked.
Stores longitudinal context needed for safe reasoning across workflow, case, episode, and financial chains.

Examples:
- ownership state
- current lifecycle stage
- recent escalation history
- active authorizations
- linked encounters
- open claims issues

This memory must respect temporal validity and source attribution.

### 4. Audit Memory
Immutable once written except via governed correction.
Stores decision traceability.

Every meaningful AI action should retain:
- trigger
- evaluated relationships
- rules applied
- data version used
- confidence threshold
- notifications sent
- alternative options considered

### 5. Session Working Memory
Ephemeral.
Stores temporary context for current reasoning only.
Must not be promoted to persistent memory without policy fit.

## What Must Be Remembered
NIVA OpenClaw should preserve:
- canonical definitions
- authoritative mappings
- approved term aliases
- lifecycle transition rules
- policy boundaries for automation
- audit logs of AI actions
- deprecation history
- acquisition and partner mappings
- lessons from validated failure cases

## What Must Not Be Remembered as Truth
The following must not become enterprise memory without governance:
- temporary spreadsheet labels
- one-off departmental shorthand
- unapproved local categories
- guessed terminology mappings
- transient vendor payload shapes treated as business concepts
- user anecdotes treated as policy

## Memory Precondition Rules
Persistent memory must carry:
- concept or entity identifier
- source system or governing source
- effective start date
- effective end date, if applicable
- status
- confidence or verification state
- owner or steward
- version

This mirrors the required deprecation and temporal integrity model.

## Temporal Integrity Rule
Historical memory must remain tied to the definition valid at that time.
No back-editing history to make past decisions look aligned to present terminology.

## Source-of-Truth Rule
Authoritative systems define regulated state.
Memory may cache, interpret, and relate authoritative information, but may not overwrite or supersede it.

## Ambiguity Rule
If terminology is not canonically mapped, memory should store the ambiguity as unresolved.
It must not silently normalize it.

## Promotion Rule
For information to move from temporary working memory to persistent memory, it must be one of:
- governed semantic change
- approved workflow logic
- validated operational pattern
- audit artifact
- persistent entity state required for future safe action

## Expiration Rule
The following should expire or be archived aggressively:
- transient reasoning scratch notes
- stale recommendations
- superseded non-governed summaries
- duplicate derived context
- low-confidence inferred context not later verified

## Sensitivity Rule
Memory related to identity, coverage, clinical documentation, and financial outcomes must retain source attribution and minimum necessary scope.

## Retrieval Priority
When deciding what memory to retrieve, prioritize:
1. canonical definitions
2. current lifecycle state
3. authoritative entity identity
4. active consent and coverage state
5. ownership and responsibility
6. recent audit-relevant actions
7. historical pattern analogs

## Final Policy
Remember meaning.
Remember rules.
Remember traceability.
Do not remember noise as truth.
