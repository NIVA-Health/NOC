# BDR Agent Output Template

## Purpose
This document defines the standard output shape for the Phase 1 BDR agent.

The goal is to make each run:
- fast to review
- easy to score
- easy to compare across iterations
- easy to audit later

## General Rule
The BDR agent should produce one clean structured output.

It should not bury the main deliverable under process language.
It should not mix hidden assumptions into verified facts.
It should not skip missing-information disclosure.

## Standard Output Template
Use the following structure for all non-trivial BDR runs.

---

## Output Class
Choose one:
- Observation
- Recommendation
- Approval Packet

## Task Summary
State in 1 to 3 sentences:
- what the operator asked for
- who the target is
- what the intended business-development objective is

## Verified Facts
List only grounded facts supported by the provided context or approved sources.

Recommended format:
- Fact
- Fact
- Fact

## Key Inferences
List only interpretations, hypotheses, or likely positioning ideas that are not fully verified.

Each item should be clearly marked as inferential.

Recommended format:
- Inference:
- Inference:
- Inference:

## Missing Information
List the most important information gaps.

Only include gaps that materially affect output quality, personalization quality, or confidence.

Recommended format:
- Missing:
- Missing:
- Missing:

## Main Deliverable
This section depends on task type.

### A. Account brief format
Include:
- organization snapshot
- likely relevance to NIVA or the current business objective
- possible angle for outreach
- risk or uncertainty note

### B. Outreach draft format
Include:
- channel, if known
- 2 to 4 subject line options when email is the channel
- one primary draft
- optional alternate angle if useful

### C. Follow-up recommendation format
Include:
- suggested next step
- suggested timing or cadence
- what to personalize next
- what should be verified before using the recommendation

## Confidence Level
Choose one:
- High
- Medium
- Low

Then explain briefly why.

Recommended format:
- **Confidence:** Medium
- **Reason:** Key organization facts are grounded, but contact-level personalization remains limited.

## Escalation Note
Only include when needed.

Use this section when:
- material facts are missing
- source quality is weak
- the task crosses into protected territory
- the output should not be used without review

Recommended format:
- **Escalation needed:** Yes or No
- **Why:**
- **What is needed next:**

---

## Compact Review Version
Use this shorter view when operator speed matters more than narrative detail.

### Compact Template
**Output Class:**  
**Task Summary:**  
**Verified Facts:**  
**Key Inferences:**  
**Missing Information:**  
**Main Deliverable:**  
**Confidence:**  
**Escalation needed:**  

## Task-Specific Templates

### 1. Account Brief Template
```md
## Output Class
Observation

## Task Summary
Prepare a brief on [organization] to support [business objective].

## Verified Facts
- 
- 
- 

## Key Inferences
- Inference: 
- Inference: 

## Missing Information
- Missing: 
- Missing: 

## Main Deliverable
### Organization Snapshot

### Relevance to Objective

### Suggested Outreach Angle

### Risk or Uncertainty Note

## Confidence Level
- **Confidence:** 
- **Reason:** 

## Escalation Note
- **Escalation needed:** 
- **Why:** 
- **What is needed next:** 
```

### 2. Outreach Draft Template
```md
## Output Class
Recommendation

## Task Summary
Draft a first-touch message for [contact or organization] to support [business objective].

## Verified Facts
- 
- 
- 

## Key Inferences
- Inference: 
- Inference: 

## Missing Information
- Missing: 
- Missing: 

## Main Deliverable
### Subject Line Options
1. 
2. 
3. 

### Primary Draft

### Alternate Angle

## Confidence Level
- **Confidence:** 
- **Reason:** 

## Escalation Note
- **Escalation needed:** 
- **Why:** 
- **What is needed next:** 
```

### 3. Follow-Up Recommendation Template
```md
## Output Class
Recommendation

## Task Summary
Recommend a next step for [contact or organization] after an initial outreach effort.

## Verified Facts
- 
- 
- 

## Key Inferences
- Inference: 
- Inference: 

## Missing Information
- Missing: 
- Missing: 

## Main Deliverable
### Recommended Next Step

### Suggested Timing

### What to Personalize Next

### Verification Needed Before Use

## Confidence Level
- **Confidence:** 
- **Reason:** 

## Escalation Note
- **Escalation needed:** 
- **Why:** 
- **What is needed next:** 
```

## Style Rules
The agent should:
- keep sections short and readable
- prioritize specifics over adjectives
- use direct language
- separate evidence from interpretation cleanly

The agent should not:
- use hype language
- imply certainty that is not earned
- hide weak sourcing
- overload the output with process commentary

## Review Guidance
Operators should be able to review the output by scanning in this order:
1. Output Class
2. Task Summary
3. Verified Facts
4. Missing Information
5. Main Deliverable
6. Confidence Level
7. Escalation Note

## Recommendation
Use this template as the required output format for Phase 1 BDR test runs so results can be scored consistently and compared across prompt iterations.
