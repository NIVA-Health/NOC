\# BigQuery Primary Observation Pilot



\## Purpose

This pilot is the scaffold for onboarding a BigQuery source into NOC using the external source onboarding standard.



\## Current Status

Scaffold only. Final table configuration and validation are still pending.



\## Files in this Pilot



\### `run\_observation\_workflow.ps1`

Observation workflow scaffold for BigQuery.



\### `run\_daily\_operator\_summary.ps1`

Operator-facing summary scaffold for BigQuery.



\### `BIGQUERY\_PRIMARY\_VALIDATION\_RESULTS.md`

Validation record for BigQuery once source testing begins.



\## Runtime Artifact

The following file will be runtime-only and should not be committed once active testing begins:



\- `last\_observation\_result.json`



\## Next Step

Configure the smoke test against the final BigQuery source table, then validate the four core states:

\- `CONNECTED`

\- `NO\_MATCHES`

\- `AUTH\_FAILED`

\- `ENDPOINT\_FAILED`

