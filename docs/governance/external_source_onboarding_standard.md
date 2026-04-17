\# External Source Onboarding Standard



\## Purpose

This standard defines the required pattern for onboarding external data sources into NOC.



The goal is to ensure every external-source integration is:

\- repeatable

\- operator-readable

\- trustworthy

\- validated against both success and failure conditions

\- safe in the presence of sparse or inconsistent source payloads



This standard should be used before beginning source-specific expansion or agent behavior that depends on external data.



\## Required Components



Each external source onboarding effort must include the following components:



\### 1. Source smoke test

A source-specific smoke test script that:

\- checks baseline connectivity

\- attempts authentication where applicable

\- returns structured machine-readable output

\- classifies source state without requiring downstream interpretation



\### 2. Observation workflow

A source-specific observation workflow that:

\- invokes the smoke test

\- produces structured JSON output

\- generates plain-English operational meaning

\- writes a runtime result artifact for operator-facing workflows



\### 3. Operator-facing summary workflow

A wrapper or summary workflow that:

\- reads the observation result

\- translates it into operator-facing language

\- recommends next action

\- does not duplicate source classification logic



\### 4. Validation record

A markdown file that records:

\- what classifications were tested

\- what dates or scenarios were used

\- what behaviors were confirmed

\- what source limitations or trust boundaries were identified



\### 5. Runtime artifact hygiene

Runtime artifacts must not be committed.

Source onboarding must explicitly document:

\- which files are runtime-only

\- which outputs belong in `.gitignore`



\## Required Classification States



Every source should support the following core states where applicable:



\- `CONNECTED`

\- `NO\_MATCHES`

\- `AUTH\_FAILED`

\- `ENDPOINT\_FAILED`



Additional source-specific states may be added when needed, but these core states should remain standard unless the source truly does not support the distinction.



\## Classification Rules



\### `CONNECTED`

Use when:

\- the source is reachable

\- authentication succeeds if applicable

\- matching records are found for the requested condition



\### `NO\_MATCHES`

Use when:

\- the source is reachable

\- authentication succeeds if applicable

\- no matching records are found for the requested condition



Important rule:

`NO\_MATCHES` is a valid business outcome, not a failure.



\### `AUTH\_FAILED`

Use when:

\- the source is reachable

\- the request is rejected because of credentials, permissions, or access configuration



\### `ENDPOINT\_FAILED`

Use when:

\- the source cannot be reached

\- the endpoint, route, DNS, or service availability prevents successful access



\## Required Validation Tests



Before a source is considered ready for reuse, the following validations must be completed and documented:



1\. Known successful retrieval test

2\. Known valid no-result test

3\. Intentional authentication failure test, if authentication exists

4\. Intentional endpoint failure test



These validations should be run through:

\- the source smoke test or observation workflow

\- the operator-facing summary workflow



\## Result Shape Requirements



Observation output must:

\- be written as structured JSON

\- include a top-level source classification

\- include an operator-readable summary

\- tolerate sparse failure payloads without crashing



\### Required design rule

The workflow must not assume all detail fields exist in failure conditions.



If source detail fields may be missing, the workflow must:

\- null-check optional fields

\- guard property access

\- continue rendering a valid observation result



\## Operator-Facing Workflow Requirements



The operator summary must:

\- preserve the underlying classification

\- avoid reclassifying source states independently

\- present plain-English interpretation

\- include a recommended next action

\- distinguish clearly between valid no-result conditions and real failures



\## Source Filtering Trust Policy



If source-side filtering behavior is not proven trustworthy, it must not be treated as authoritative.



When this happens:

\- document the limitation in the validation record

\- preserve client-side filtering fallback

\- do not remove the fallback until source-side filtering is explicitly revalidated



\## Logging and Secrets Handling



Workflows may indicate that a password or credential override was supplied, but must not print raw secret values.



Allowed:

\- masked or redacted indicators



Not allowed:

\- raw credentials

\- tokens

\- full authorization headers



Avoid duplicate logging of the same masked secret across multiple workflow layers when one layer is sufficient.



\## Required Repo Artifacts



Each external-source onboarding implementation should include:



\- smoke test script

\- observation workflow

\- operator-facing summary workflow

\- validation results markdown

\- pilot README or equivalent usage guide

\- `.gitignore` entry for runtime-only artifacts



\## Readiness Gate for Source #2 and Beyond



A source should be treated as the reference pattern for additional onboarding only after:



\- all core states have been validated

\- valid no-result handling is confirmed

\- sparse failure payloads are handled safely

\- operator summary output is working

\- runtime artifact hygiene is in place

\- validation results are documented



\## Azure Appointments Reference Pattern



The Azure appointments observation pilot is the current reference implementation for this standard.



It demonstrated:

\- successful handling of `CONNECTED`

\- successful handling of `NO\_MATCHES`

\- successful handling of `AUTH\_FAILED`

\- successful handling of `ENDPOINT\_FAILED`

\- safe handling of sparse failure details

\- operator-readable observation summaries

\- preservation of client-side filtering fallback when server-side filtering was not trusted



\## Recommended Workflow for New Sources



For each new source:



1\. Build the smoke test

2\. Validate connectivity and auth behavior

3\. Add the observation workflow

4\. Add the operator summary workflow

5\. Validate all applicable classification states

6\. Document results and trust boundaries

7\. Clean up runtime artifact handling

8\. Only then move into downstream automation or agent logic

