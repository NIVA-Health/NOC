\# Routing Runtime Contract v1



\## Purpose

This document defines the first-pass routing contract for NOC runtime behavior.



It extends the obligations in `docs/governance/agent\_runtime\_contract.md` and applies specifically to request classification, routing decisions, delegation behavior, specialist handoff requirements, specialist return requirements, and routing trace expectations.



This contract governs routing behavior for:

\- `main`

\- `market\_insights`

\- `operator`



\## Scope

This contract defines:

\- routing ownership

\- routing confidence behavior

\- mixed-intent handling

\- routing handoff requirements

\- specialist return requirements

\- routing trace requirements

\- escalation behavior for ambiguous or low-confidence cases



It does not define:

\- UI naming or display labels

\- creation of new agents

\- broader orchestration patterns beyond first-pass routing

\- domain logic internal to specialist agents



\## Routing Roles and Ownership



\### `main`

`main` is the front-door dispatcher for incoming requests.



`main` may:

\- retain a request for handling in `main`

\- delegate a request to `market\_insights`

\- delegate a request to `operator`

\- ask one clarifying question when required by low confidence or material ambiguity



`main` owns:

\- strategic synthesis

\- general planning

\- ambiguous mixed-intent requests without a clear dominant owner

\- requests that cannot be delegated safely under this contract



\### `market\_insights`

`market\_insights` owns:

\- market analysis

\- account analysis

\- BDR analysis

\- account quality interpretation

\- outbound/account prioritization support

\- market/account/BDR recommendation work that does not exceed its authority boundary



\### `operator`

`operator` owns:

\- system debugging

\- automation troubleshooting

\- repo and git tasks

\- runtime operations

\- technical execution support

\- implementation-oriented operational tasks within its authority boundary



\## Routing Decision Rules



\### Rule 1: Ownership First

Routing decisions must first determine whether the request clearly falls into one of these ownership domains:

\- `market\_insights`

\- `operator`

\- `main`



If ownership is not clear, the request must remain in `main` or trigger one clarifying question.



\### Rule 2: Confidence Behavior

Routing confidence must be classified as one of:

\- `high`

\- `medium`

\- `low`



\#### High confidence

If specialist ownership is clear and routing confidence is high, `main` should auto-delegate to the appropriate specialist.



\#### Medium confidence

If routing confidence is medium, `main` may delegate only if a single dominant intent is clear.



If no dominant intent is clear, `main` must retain the request or ask one clarifying question.



\#### Low confidence

If routing confidence is low, `main` must:

\- retain the request in `main`, or

\- ask one clarifying question



Low-confidence requests must not be auto-delegated.



\### Rule 3: Mixed-Intent Requests

In v1, mixed-intent requests use primary-owner routing by default.



This means:

\- route to the specialist that owns the dominant task

\- do not dual-route by default

\- retain in `main` if dominance is materially unclear



\### Rule 4: `main` Retention

The following categories remain in `main` by default:

\- strategic synthesis

\- general planning

\- ambiguous mixed-intent requests

\- requests near an authority boundary where delegation would be unsafe

\- requests lacking required context for specialist handoff



\## Linkage to Existing Runtime Obligations



This routing contract inherits and must comply with the following obligations defined in `docs/governance/agent\_runtime\_contract.md`:



\### Identity Obligation

Routing must be performed with awareness of:

\- current agent role

\- allowed task class

\- authority ceiling

\- source files in force



\### Context Verification Obligation

Before delegation, `main` must verify that enough context exists to support safe specialist routing.



If required context is missing, `main` must downgrade authority, retain the request, or ask one clarifying question.



\### Source-of-Truth Obligation

Routing should preserve source-of-truth awareness when task ownership depends on authoritative system context.



\### Authority Boundary Obligation

Routing must not be used to simulate authority that the current agent or specialist does not possess.



Delegation does not remove authority restrictions.



\### Auditability Obligation

Every non-trivial routing decision must be reconstructable.



\### Escalation Obligation

Routing must escalate or retain requests when ambiguity, protected scope, or missing material context is present.



\### Output Classification Obligation

Delegation must preserve the intended output class and not blur:

\- observation

\- recommendation

\- autonomous action

\- approval packet

\- human-reserved support



\## Required Routing Inputs

A first-pass routing decision should use, when available:

\- original request text

\- normalized task statement

\- detected task category

\- detected dominant intent

\- known context relevant to ownership

\- authority sensitivity

\- ambiguity level

\- source constraints

\- required output class



\## Handoff Requirements

When `main` delegates to a specialist, it must produce a structured handoff that includes:

\- source agent identity

\- target agent identity

\- routing category

\- routing confidence

\- routing reason

\- original request

\- normalized task statement

\- relevant context

\- required output class

\- escalation flag

\- timestamp



If a formal schema is available, the handoff must conform to it.



If the handoff cannot be completed safely due to missing context, the request must remain in `main` or trigger one clarifying question.



\## Specialist Return Requirements

When a specialist returns a result to `main`, the return must be structured and reconstructable.



The return must include:

\- source agent identity

\- completed task class

\- output class

\- decision summary

\- canonical entities

\- context checks

\- source-of-truth notes

\- action or recommendation

\- escalation note, if needed

\- audit explanation



If a formal schema is available, the return must conform to it.



\## Routing Trace Requirements

Every routing decision must emit a concise routing trace during testing and debugging.



The routing trace must include:

\- detected routing category

\- routing confidence

\- selected target agent

\- one-sentence routing reason



\### Trace format

`route\_decision: category=<category> confidence=<confidence> target=<target\_agent> reason="<one-sentence reason>"`



\### Example

`route\_decision: category=market\_account\_bdr confidence=high target=market\_insights reason="Request is clearly a market/account/BDR analysis task."`



\## Escalation and Clarification Rules

`main` must retain the request or ask one clarifying question when:

\- routing confidence is low

\- dominant intent is unclear

\- required context is missing

\- the task appears to cross authority boundaries

\- the request touches protected or governed domains not safely delegated

\- routing would create misleading implied authority



\## Definition of Done for v1 Routing

v1 routing is considered contract-compliant when:

\- `main` can retain or delegate between `main`, `market\_insights`, and `operator`

\- mixed-intent requests use primary-owner routing by default

\- low-confidence cases remain in `main` or trigger one clarifying question

\- delegation uses a structured handoff

\- specialist responses use a structured return

\- routing traces are emitted during testing

\- no new agents are introduced

