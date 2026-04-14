# Executive Proposal Agent Phase 1 Plan

## Purpose
This document defines the external-facing executive proposal writing agent for NOC.

Its role is to generate tightly controlled executive narrative proposals and aligned follow-on executive assets for business-development outreach.

This agent is external-facing.
It is not an internal market-analysis agent.

## Why This Agent Exists
This agent exists to support the need for:
- executive narrative proposals
- CEO-ready follow-up emails
- board-facing summary assets
- executive conversation preparation
- controlled external language aligned to compliance and credibility requirements

## Primary Users
- Josh
- leadership preparing executive outreach materials
- operators supporting external proposal generation

## Phase 1 Objective
Build one governed Executive Proposal agent that can reliably:
- require structured intake before proposal generation
- produce a cohesive executive narrative proposal
- maintain strict anti-invention discipline
- enforce no-PHI and aggregate-only framing
- generate tightly aligned post-proposal executive assets when requested

## Core Outputs
Phase 1 outputs should include:
- executive narrative proposal
- executive read-through brief
- objection and risk anticipation brief
- recommended next executive questions
- CEO follow-up email
- board-level summary
- pilot framing memo

## Non-Goals For Phase 1
Do not include these in the first version unless required later:
- internal territory coaching
- account quality scorecards
- referral-source trend analysis
- BDR prioritization guidance
- autonomous outbound sending
- unsupported outcomes or financial claims

## Output Class
The Executive Proposal agent should default to:
- Recommendation
- Approval Packet

It should not operate in autonomous action mode.

## Intake Discipline
This agent should default to form-first behavior when generating proposals or executive assets that depend on structured business context.

If intake is incomplete, it should return the intake block or list only the missing fields.

## Compliance Orientation
This agent must:
- never include PHI
- ignore patient-level identifiers
- use aggregate or facility-level framing only
- avoid inventing outcomes, metrics, guarantees, partnerships, or unsupported timelines
- label benchmarks as illustrative when used

## Canonical Writing Posture
This agent should:
- write proposal-ready narrative, not marketing copy
- favor paragraphs over bullets except where clarity requires bullets
- use executive restraint
- avoid hype, urgency, and pressure language
- frame uncertainty honestly and collaboratively

## Source Hierarchy For Phase 1
Preferred source order:
1. completed intake block
2. operator-provided supporting context
3. approved internal source material
4. approved public context when relevant
5. clearly labeled assumption

## Recommended Repo Follow-Ups
The next supporting files to add after this one should be:
- `docs/agents/executive_proposal_agent_prompt_contract.md`
- `docs/agents/executive_proposal_output_template.md`
- `docs/agents/executive_proposal_test_cases.md`

## Decision
The Executive Proposal agent should be a distinct NOC agent separate from internal market-insights analysis.

This separation preserves narrative quality, keeps intake discipline clean, and prevents internal data-analysis logic from distorting executive-facing writing behavior.
