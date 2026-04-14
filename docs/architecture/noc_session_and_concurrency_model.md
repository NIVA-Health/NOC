# NOC Session and Concurrency Model

## Purpose
This document defines the initial operating model for sessions, agents, routing, and concurrency inside NOC.

It exists to close the gap between infrastructure readiness and operational agent execution.

The goal is to make early agent behavior predictable, auditable, and easy to debug before the system expands into broader multi-agent orchestration.

## Why This Exists Now
NOC has already reached the point where:
- local models are installed and validated
- OpenClaw is installed and reachable
- the dashboard is accessible
- governed runtime expectations are documented
- the first operational agent has been selected

That means the next risk is no longer infrastructure readiness.

The next risk is ambiguity around:
- what counts as a session
- what counts as an agent
- when work should run in parallel
- how spawned work is bounded
- how operators inspect and review concurrent work

## Design Principles
1. **Prefer clarity over cleverness.**
2. **Prefer isolation over shared context when uncertainty matters.**
3. **Use concurrency only where it reduces latency or operator burden.**
4. **Keep top-level agents few; use spawned work selectively.**
5. **Make every non-trivial run reconstructable.**
6. **Do not allow concurrency to bypass approval or governance.**

## Core Concepts

### Session
A session is the bounded context for one running conversation or task history.

In NOC terms, a session should be treated as:
- the container for task-specific context
- the record of messages and decisions for that run
- the unit that should be inspected when debugging or reviewing work

### Agent
An agent is a role-bound execution identity with a defined purpose, allowed task classes, authority ceiling, and tool surface.

An agent may:
- own one or more sessions over time
- operate as a top-level agent
- spawn child work when allowed by policy

### Spawned child run
A spawned child run is a background execution created by a parent agent to perform a narrow sub-task in isolation.

It should be treated as:
- temporary
- narrow in scope
- subordinate to the parent task
- separately logged and reviewable

## Initial Top-Level Agent Model
NOC should begin with a minimal top-level agent set.

### Top-level agents for Phase 1
- `main`: operator and control-plane session
- `bdr`: first operational specialist agent

### Not recommended yet
Do not add additional top-level agents yet for:
- wound care
- routing
- quality control
- governance automation
- experimentation sandboxes

Those can be added later after the BDR workflow is proven.

## Recommended Session Model

### 1. Main operator sessions
The `main` agent should be used for:
- operator planning
- architecture questions
- system supervision
- manual task launch
- debugging and review

This session is the human control surface, not the place where every operational task should accumulate indefinitely.

### 2. Operational task sessions
Operational work should run in isolated task-oriented sessions wherever possible.

For example:
- one BDR task request
- one account-research run
- one outreach-draft run
- one evaluation pass

This reduces context bleed and makes outputs easier to inspect.

### 3. Child sessions
When child work is spawned, each child should run in its own separate session.

This preserves:
- cleaner logs
- narrower context windows
- easier debugging
- safer authority boundaries

## Session Isolation Rules
NOC should use the following default rules.

### Rule 1: No uncontrolled shared context
Do not let unrelated prospecting or operational tasks accumulate inside one long-running session unless there is a clear reason.

### Rule 2: One real task, one primary session
Every meaningful operator request should map to one primary task session.

### Rule 3: Spawned work must remain subordinate
A child run may enrich the parent task, but it should not become a separate autonomous initiative.

### Rule 4: Review should happen at the parent level
The operator should primarily review the parent output, with child outputs available for audit when needed.

## Routing Model

### Phase 1 routing recommendation
Use simple routing first.

- `main` receives operator conversations and architecture work
- `bdr` receives explicit BDR tasks launched intentionally by the operator

### Do not automate routing yet
Do not introduce broad automatic routing across many agents during Phase 1.

Reason:
- harder to debug
- harder to audit
- easier to lose authority clarity
- unnecessary before the first operational workflow is proven

## Concurrency Model

### Phase 1 default
The default execution model should be **sequential first, parallel only when useful**.

That means:
- do not force concurrency into every run
- only parallelize narrow sub-tasks with clear boundaries
- treat concurrency as an optimization, not as the core identity of NOC

### Where concurrency is allowed
Concurrency is appropriate when:
- two or more research tasks can be done independently
- the outputs can be recombined cleanly
- parallel execution reduces waiting time materially
- the operator benefits from a single merged final output

### Examples of allowed child tasks under `bdr`
- website/company research
- public positioning summary
- pain-point extraction from approved sources
- draft subject-line brainstorming
- follow-up angle generation

### Not allowed for Phase 1
Do not use concurrency for:
- external sending
- CRM writes
- protected decision domains
- tasks with unclear source-of-truth hierarchy
- workflows where rollback is unknown and action is material

## Concurrency Limits
NOC should begin with intentionally conservative limits.

### Initial limits
- **Maximum spawn depth:** 1
- **Maximum child runs per parent:** 3
- **Maximum concurrent child runs:** 3
- **Child run timeout target:** 5 to 10 minutes depending on task type

### Why these limits
These limits keep the system:
- understandable
- debuggable
- computationally predictable
- easier to supervise

## Parent-Child Execution Pattern
For Phase 1, use this standard pattern.

### Step 1: Parent receives task
The parent agent receives the operator request and determines whether the task is:
- simple enough to handle directly
- appropriate for child spawning
- blocked by missing context

### Step 2: Parent plans child work
If children are needed, the parent defines narrow child assignments.

### Step 3: Children execute in isolation
Each child handles one scoped task only.

### Step 4: Parent recombines results
The parent synthesizes findings into one structured output.

### Step 5: Parent delivers review-ready result
The parent returns the final output to the operator in the required format.

## Authority Boundaries
Concurrency does not change the authority model.

### Rule
A child run may not exceed the authority of its parent.

### Therefore
If the parent is restricted to observation, recommendation, or approval-packet output, the child must stay within that same boundary.

### Phase 1 BDR boundary
The BDR agent and any child runs beneath it must not:
- send emails
- update CRM records
- post externally
- make regulated, legal, or clinical claims without verified support
- act as though approval has already been granted

## Logging Requirements
Every parent run should capture:
- task ID or equivalent run label
- operator
- top-level agent
- output class
- sources consulted
- whether child runs were used
- child run count
- final confidence level
- operator verdict
- next iteration note

Every child run should capture:
- parent task reference
- child task purpose
- sources consulted
- result summary
- errors or blocks
- completion state

## Review and Audit Expectations
The parent run is the primary review object.

Child sessions should be available when needed for:
- debugging
- audit
- source verification
- understanding why the parent reached a conclusion

NOC should optimize for:
- one clean final output for the operator
- enough traceability to inspect the path taken

## Phase 1 Recommended Operating Pattern
For the first BDR implementation, use this maturity path.

### Stage A: Single-session sequential workflow
- parent only
- no child runs
- prove the workflow and output quality

### Stage B: Limited child concurrency
- parent plus up to 3 child runs
- use only for narrow research or ideation subtasks

### Stage C: Refined concurrency
- retain only the child patterns that clearly reduce latency or improve quality
- remove any child pattern that adds noise or review burden

## Risks and Trade-Offs

### Risk 1: Context bleed
If too much unrelated work happens in one session, output quality and auditability fall.

Mitigation:
- isolate sessions by task

### Risk 2: Premature swarm behavior
Too many top-level agents too early will make routing and debugging harder.

Mitigation:
- start with `main` and `bdr` only

### Risk 3: Concurrency theater
Parallelism can look advanced while adding little real value.

Mitigation:
- require a concrete latency or quality benefit before keeping a concurrent pattern

### Risk 4: Hidden authority drift
Child runs may appear lower-risk but can still create governance problems if boundaries are vague.

Mitigation:
- keep the parent responsible for final synthesis and approval boundary enforcement

## Decision Summary
### Locked for Phase 1
- top-level agents: `main`, `bdr`
- routing: simple and operator-directed
- concurrency: optional, not default
- spawn depth: 1
- max child runs per parent: 3
- max concurrent child runs: 3
- primary review object: parent run
- BDR output class: observation, recommendation, approval packet only

### Deferred for later phases
- many top-level specialist agents
- automatic routing across broad channels
- deeper multi-hop child hierarchies
- autonomous external actions
- advanced persistent multi-session memory strategy

## Recommendation
NOC should proceed into BDR buildout without a major infrastructure detour.

However, it should do so with this session and concurrency model in place so that the first operational workflow is built on clear control-plane rules rather than informal assumptions.
