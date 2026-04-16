\# Routing v1 Test Cases



\## Purpose

These test cases validate first-pass routing behavior for NOC Routing Blueprint v1.1.



They verify:

\- routing category selection

\- confidence behavior

\- target selection

\- primary-owner routing for mixed intent

\- `main` retention behavior

\- routing trace output



\## Test Case 1

\### Name

High-confidence market/account/BDR routing



\### Request

Prepare an account quality scorecard for a territory using referral volume, conversion count, care-plan mix, territory, and BDR context.



\### Expected Routing Category

`market\_account\_bdr`



\### Expected Confidence

`high`



\### Expected Target Agent

`market\_insights`



\### Expected Reason

Request is clearly a market/account/BDR analysis task.



\### Expected Trace

`route\_decision: category=market\_account\_bdr confidence=high target=market\_insights reason="Request is clearly a market/account/BDR analysis task."`



\---



\## Test Case 2

\### Name

Medium-confidence operator routing with clear dominant intent



\### Request

The repo log automation pushed yesterday but today the scheduled run failed. Inspect likely repo or automation issues and recommend the next technical fix.



\### Expected Routing Category

`system\_debugging\_automation\_repo`



\### Expected Confidence

`medium`



\### Expected Target Agent

`operator`



\### Expected Reason

Request is operational and technical, with clear dominant debugging and automation intent.



\### Expected Trace

`route\_decision: category=system\_debugging\_automation\_repo confidence=medium target=operator reason="Request is operational and technical, with clear dominant debugging and automation intent."`



\---



\## Test Case 3

\### Name

Low-confidence ambiguous request retained in main



\### Request

Help me figure out what to do next with this.



\### Expected Routing Category

`ambiguous\_mixed\_intent`



\### Expected Confidence

`low`



\### Expected Target Agent

`main`



\### Expected Reason

Request lacks enough task clarity to delegate safely.



\### Expected Trace

`route\_decision: category=ambiguous\_mixed\_intent confidence=low target=main reason="Request lacks enough task clarity to delegate safely."`



\---



\## Test Case 4

\### Name

Strategic synthesis retained in main



\### Request

Given our recent work on routing, market insights, and operator responsibilities, recommend the best phased plan for NOC over the next two weeks.



\### Expected Routing Category

`strategic\_synthesis`



\### Expected Confidence

`high`



\### Expected Target Agent

`main`



\### Expected Reason

Request is for cross-domain strategic synthesis and should remain in main.



\### Expected Trace

`route\_decision: category=strategic\_synthesis confidence=high target=main reason="Request is for cross-domain strategic synthesis and should remain in main."`



\---



\## Test Case 5

\### Name

Mixed-intent request routed by primary owner



\### Request

Review account quality trends and identify the one technical automation issue that is blocking the BDR team most.



\### Expected Routing Category

`market\_account\_bdr`



\### Expected Confidence

`medium`



\### Expected Target Agent

`market\_insights`



\### Expected Reason

Request is mixed-intent, but the dominant task is market/account/BDR analysis.



\### Expected Trace

`route\_decision: category=market\_account\_bdr confidence=medium target=market\_insights reason="Request is mixed-intent, but the dominant task is market/account/BDR analysis."`



\---



\## Test Case 6

\### Name

High-confidence operator routing



\### Request

Update the repo workflow so the end-of-night log is written, committed, rebased, and pushed safely with validation checks.



\### Expected Routing Category

`system\_debugging\_automation\_repo`



\### Expected Confidence

`high`



\### Expected Target Agent

`operator`



\### Expected Reason

Request is a clear repo and automation implementation task.



\### Expected Trace

`route\_decision: category=system\_debugging\_automation\_repo confidence=high target=operator reason="Request is a clear repo and automation implementation task."`

