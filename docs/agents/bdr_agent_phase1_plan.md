# BDR Agent Phase 1 Plan

## Purpose
This document defines the first operational agent to build in NOC after the local model and OpenClaw foundation passed initial validation.

The goal is to move NOC from infrastructure readiness into a governed, testable business workflow with clear operator oversight.

## Why BDR First
The BDR agent is the best first operational agent because it offers a faster path to useful output than more regulated or clinically sensitive workflows.

It is the right first proving ground for NOC because it:
- has lower compliance risk than wound care or clinical workflows
- is easier to evaluate quickly with real operator judgment
- requires less integration depth for the first iteration
- can demonstrate repeatable business value early
- creates reusable patterns for later agents

## Alignment With NOC Roadmap
This direction is consistent with the current repository trajectory.

The workstation foundation plan defines Phase 4 as a minimal working local OpenClaw instance and Phase 5 as agent bootstrapping, including defining core agents and roles, creating a consistent prompt and config layout, testing basic workflows, and creating a standard agent template.

The BDR agent should be the first Phase 5 execution target.

## Phase 1 Objective
Build one governed BDR agent that can reliably:
- intake a prospecting request
- research the target account using approved sources
- synthesize a concise account brief
- draft an initial outreach message
- suggest a follow-up sequence
- escalate when confidence, authority, or source quality is insufficient

## Success Criteria
The Phase 1 BDR agent is successful when all of the following are true:
- it produces a structured output consistently
- it stays within recommendation and draft support boundaries
- it does not send external messages autonomously
- it records enough reasoning context for operator review
- Josh can evaluate output quality quickly and consistently
- the workflow can be repeated with low setup friction

## Non-Goals For Phase 1
Do not include these in the first version unless they are required to complete a test:
- CRM write-back
- autonomous outbound sending
- autonomous list building at scale
- multistep workflow orchestration across multiple systems
- advanced memory or long-horizon autonomy
- any workflow involving protected clinical decision support

## Proposed Output Class
The BDR agent should default to one of these output classes:
- Observation
- Recommendation
- Approval Packet

It should not operate in autonomous external-action mode during Phase 1.

## Operator Model
### Primary operator
- Josh

### Operator responsibilities
- provide the task trigger
- review account briefs and outreach drafts
- approve or revise messaging
- rate output quality
- identify gaps in tools, prompts, or data

## Core BDR Tasks
### 1. Account brief
Inputs:
- company or organization name
- contact name if known
- website if available
- known context or referral notes
- offer or business objective

Outputs:
- organization summary
- likely pain points or opportunity areas
- relevant context for outreach
- missing information
- confidence notes

### 2. Outreach draft
Inputs:
- account brief
- target persona
- objective
- tone guidance if needed

Outputs:
- subject line options if email is the channel
- first-touch draft
- rationale for positioning
- claims requiring verification

### 3. Follow-up recommendation
Inputs:
- account brief
- initial outreach draft
- business objective

Outputs:
- recommended follow-up cadence
- message angle options
- what to personalize next
- escalation note if further human input is needed

## Required Guardrails
The BDR agent must:
- stay inside the agent runtime contract
- identify the source quality of any factual claim
- avoid fabricating company, contact, or market details
- separate observed facts from inferred positioning opportunities
- mark missing data explicitly
- avoid making regulated, legal, or clinical claims without verified support
- avoid sending or posting externally

## Source Hierarchy For Phase 1
Preferred source order:
1. operator-provided facts
2. approved internal documents or notes
3. approved public web sources
4. model inference clearly marked as inference

If a key claim depends only on inference, the agent must label it clearly and lower confidence.

## Recommended Minimal Tooling
The BDR agent should begin with the smallest useful toolset:
- structured task intake
- approved web research
- internal document access when available
- structured output template
- run logging

Delay these until later:
- CRM integration
- email sending
- contact enrichment APIs
- calendar actions

## Evaluation Rubric For Phase 1
Each run should be scored on:
- factual grounding
- strategic relevance
- message quality
- personalization quality
- actionability
- operator edit burden
- escalation quality

## Minimum Run Record
Each BDR run should capture:
- date and operator
- task request
- target account
- sources used
- output class
- confidence level
- draft produced
- missing information
- operator verdict
- next iteration note

## First Test Cases
### Test case 1: Known organization
Goal:
- confirm the agent can produce a grounded account brief and usable outreach draft

### Test case 2: Thin-context prospect
Goal:
- confirm the agent degrades safely when data is missing

### Test case 3: Regulated or high-risk edge case
Goal:
- confirm the agent escalates rather than overclaims

## Recommended Repo Follow-Ups
The next supporting files to add after this one should be:
- `docs/agents/bdr_agent_prompt_contract.md`
- `docs/agents/bdr_agent_output_template.md`
- `docs/agents/bdr_agent_test_cases.md`
- `reports/2026-04-13-bdr-direction.md`

## Decision
The first operational NOC agent should be the BDR agent.

This is the highest-ROI next step because it lets the team validate NOC as an operating system for governed work before moving into more sensitive workflows such as wound care.
