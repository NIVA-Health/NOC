# Current NOC Model Stack

Updated: 2026-04-10

This document captures the current model set selected for the NOC workstation and supersedes any placeholder candidate list.

## Approved Stack

| Bucket | Model |
|---|---|
| Reasoning | `QwQ-32B` |
| Coding | `Qwen2.5-Coder-32B-Instruct` |
| General | `Qwen2.5-32B-Instruct` |
| Fast | `Ministral-3-8B-Instruct-2512` |
| Embeddings | `jina-embeddings-v3` |
| Rerankers | `mxbai-rerank-large-v1` |

## Experimental Stack

| Bucket | Model |
|---|---|
| Premium | `Qwen2.5-72B-Instruct` |
| Premium | `Llama-3.3-70B-Instruct` |
| Vision | `Qwen2.5-VL-72B-Instruct` |

## Filesystem Target Layout

```text
approved/
  reasoning/
    QwQ-32B
  coding/
    Qwen2.5-Coder-32B-Instruct
  general/
    Qwen2.5-32B-Instruct
  fast/
    Ministral-3-8B-Instruct-2512
  embeddings/
    jina-embeddings-v3
  rerankers/
    mxbai-rerank-large-v1
experimental/
  premium/
    Qwen2.5-72B-Instruct
    Llama-3.3-70B-Instruct
  vision/
    Qwen2.5-VL-72B-Instruct
```

## Operational Guidance

1. Treat the approved stack as the default install target.
2. Keep experimental models isolated from production routing.
3. Route embeddings and reranking separately from chat/completion workloads.
4. Promote experimental models only after explicit validation.

## Recommended Next Cleanup

- Update `models/README.md` to link to `models/STACK.md`.
- Replace placeholder rows in `docs/models/MODEL_REGISTRY.md` with concrete entries for these models.
- Align any OpenClaw routing or workstation setup docs to these exact names.
