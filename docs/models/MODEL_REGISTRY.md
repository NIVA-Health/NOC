# MODEL_REGISTRY

Updated: 2026-04-10

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
