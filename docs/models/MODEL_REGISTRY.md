# MODEL_REGISTRY

## Purpose
This file tracks every model considered, downloaded, approved, deprecated, or removed for the OpenClaw workstation. The goal is to prevent model sprawl, unclear ownership, and mystery files consuming disk and VRAM.

Related documents:
- `openclaw_workstation_foundation_plan.md`
- `WORKSTATION_BASELINE.md`
- `RUNBOOK.md`
- `CHANGELOG.md`

---

## Model Governance Rules
1. Every model on disk gets an entry here.
2. Approved models live under `D:\Models\approved\`.
3. Unproven models live under `D:\Models\experimental\`.
4. Embedding models, rerankers, and vision models should be separated by function.
5. If a model is removed from disk, keep the record and mark it as removed.
6. Record why a model is approved, not just that it exists.

---

## Storage Layout

```text
D:\Models\
  approved\
  experimental\
  embeddings\
  rerankers\
  vision\
  downloads\
  cache\
```

---

## Status Definitions

| Status | Meaning |
|---|---|
| Proposed | Candidate not yet downloaded |
| Downloaded | Present on disk, not yet validated |
| Testing | In active evaluation |
| Approved | Allowed for normal workflow use |
| Limited | Approved only for narrow use cases |
| Deprecated | No longer preferred, may still exist |
| Removed | No longer on disk |

---

## Registry Table

Add one row per model variant.

| Model ID | Family / Model Name | Function | Size / Params | Quant / Format | Context | Storage Path | Backend | Status | Approval Tier | Primary Use Case | VRAM / RAM Notes | Owner | Date Added | Date Reviewed | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| MOD-001 | `TBD` | Reasoning | `TBD` | `TBD` | `TBD` | `TBD` | LM Studio / other | Proposed | None | `TBD` | `TBD` | `TBD` | `TBD` | `TBD` | |

---

## Recommended Initial Buckets

Use this section to decide what categories need at least one working option.

| Bucket | Needed | Candidate | Status | Decision Notes |
|---|---|---|---|---|
| Primary reasoning model | Yes | `TBD` | Open | Main Maude / synthesis path |
| Primary coding model | Yes | `TBD` | Open | Walter / repo work |
| Small fallback model | Yes | `TBD` | Open | Fast cheap fallback |
| Embeddings model | Yes | `TBD` | Open | Retrieval / indexing |
| Reranker | Optional | `TBD` | Open | Higher quality retrieval |
| Vision model | Optional | `TBD` | Open | Images / PDFs / multimodal |

---

## Evaluation Criteria

Score each model before approval.

| Criterion | Weight | Notes |
|---|---:|---|
| Output quality | 5 | Accuracy, usefulness, coherence |
| Latency | 4 | Real response speed for your use cases |
| Stability | 5 | Long sessions, no weird failures |
| Tool-use reliability | 5 | Important for OpenClaw workflows |
| Context handling | 4 | Large docs, long prompts, chaining |
| VRAM efficiency | 4 | Practical fit for this machine |
| Operational simplicity | 3 | Easy to serve, easy to document |

### Optional scoring template

| Model ID | Quality | Latency | Stability | Tool Use | Context | VRAM Efficiency | Simplicity | Total | Verdict |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| MOD-001 |  |  |  |  |  |  |  |  | |

---

## Naming Convention

Use a predictable naming pattern in docs and folder names.

```text
[family]-[size]-[quant]-[context]-[purpose]
```

Example:

```text
qwen-coder-32b-q4km-128k-coding
```

Rules:
- Keep names short but unambiguous.
- Include quant when relevant.
- Include intended role when useful.
- Match folder names to the registry where possible.

---

## Approval Notes Template

Copy-paste this for any model moving from Testing to Approved.

```md
### Model Approval Record
- Model ID:
- Model Name:
- Date Approved:
- Approved By:
- Primary Function:
- Backend:
- Storage Path:
- Why approved:
- Known limitations:
- Best-fit workflows:
- Replacement trigger:
```

---

## Deprecation / Removal Template

```md
### Model Removal Record
- Model ID:
- Model Name:
- Date Deprecated or Removed:
- Action Taken:
- Reason:
- Replacement Model:
- Disk reclaimed:
- Notes:
```

---

## Active Decisions

| Decision | Status | Notes |
|---|---|---|
| Which reasoning model is first-wave approved | Open | |
| Which coding model is first-wave approved | Open | |
| Whether embeddings stay local or move later | Open | |
| Whether vision is phase 1 or phase 2 | Open | |

---

## Quick Rules for Disk Hygiene
- Do not leave large downloads in `downloads\` once classified.
- Do not let experimental variants accumulate without review.
- Remove duplicate quantizations unless they serve a real comparison purpose.
- Review the registry whenever free space drops materially.

---

## Review Cadence

| Cadence | Task |
|---|---|
| Weekly during buildout | Review testing and experimental models |
| Monthly once stable | Review approved list and prune drift |
| Any major backend change | Revalidate approved models |

---

## Notes
```text
[Add notes here]
```
