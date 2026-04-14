# Market Insights Agent Phase 1 Plan

## Purpose
This document defines the first internal business-development intelligence agent for NOC.

Its role is to convert referral-source, conversion, care-plan, and related operational data into account-level and territory-level insight that helps leadership and BDRs decide where to focus.

This agent is internal-facing.
It is not an outbound writing agent.

## Why This Agent Exists
This agent exists to support the need described by business-development leadership to:
- understand referral-source performance by territory and BDR
- compare trends across time windows
- distinguish volume from conversion quality
- evaluate account quality rather than raw referral count alone
- generate direct coaching guidance for BDRs

## Primary Users
- Andy
- BDR leadership
- operators supporting market analysis

## Phase 1 Objective
Build one governed internal-facing Market Insights agent that can reliably:
- summarize account and territory performance
- identify referral-source trends over a defined period
- produce account quality scorecards
- surface low-conversion or low-value referral patterns
- recommend where BDR attention should increase, decrease, or shift
- flag data-quality gaps and source conflicts clearly

## Core Outputs
Phase 1 outputs should include:
- account quality scorecard
- territory coaching brief
- date-range trend summary
- account watchlist summary
- prioritized BDR action recommendations

## Non-Goals For Phase 1
Do not include these in the first version unless required to complete a test:
- external-facing outreach writing
- executive narrative proposals
- CEO follow-up emails
- autonomous CRM actions
- autonomous task assignment
- unsupported causal claims about performance changes

## Output Class
The Market Insights agent should default to:
- Observation
- Recommendation
- Approval Packet

It should not operate in autonomous action mode.

## Internal Data Orientation
This agent must treat internal data quality as a first-class concern.

It should:
- distinguish validated data from provisional data
- state the date range used
- identify small-sample limitations
- separate observed pattern from inferred cause
- flag conflicting source records explicitly

## Core Questions It Should Answer
- Which accounts are growing or declining?
- Which accounts send volume but do not convert?
- Which accounts produce low-value or misaligned referrals?
- Which BDR accounts deserve increased attention?
- Which accounts are not worth additional near-term focus?
- When did a meaningful trend change begin?

## Source Hierarchy For Phase 1
Preferred source order:
1. operator-provided definitions and business rules
2. validated referral-sheet or referral-log data
3. validated WoundExpert-derived reports
4. other approved internal sources
5. clearly labeled inference

If internal sources conflict, the conflict must be stated and confidence reduced.

## Recommended Repo Follow-Ups
The next supporting files to add after this one should be:
- `docs/agents/market_insights_agent_prompt_contract.md`
- `docs/agents/market_insights_output_template.md`
- `docs/agents/market_insights_test_cases.md`

## Decision
The Market Insights agent should be a distinct NOC agent separate from external-facing proposal generation.

This separation reduces confusion, improves authority clarity, and keeps internal performance analysis from being mixed with outbound executive writing.
