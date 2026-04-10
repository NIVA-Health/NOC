# NOC Model Stack

This file is the current approved and experimental model stack for the NOC workstation.

It is the active source of truth for which models should be present and how they are categorized.

## Approved

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
```

## Experimental

```text
experimental/
  premium/
    Qwen2.5-72B-Instruct
    Llama-3.3-70B-Instruct
  vision/
    Qwen2.5-VL-72B-Instruct
```

## Role Mapping

| Category | Model | Status | Intended Use |
|---|---|---|---|
| Reasoning | `QwQ-32B` | Approved | Deep reasoning, synthesis, complex problem solving |
| Coding | `Qwen2.5-Coder-32B-Instruct` | Approved | Code generation, refactors, repo work |
| General | `Qwen2.5-32B-Instruct` | Approved | Balanced default assistant tasks |
| Fast | `Ministral-3-8B-Instruct-2512` | Approved | Low-latency fallback and lightweight tasks |
| Embeddings | `jina-embeddings-v3` | Approved | Retrieval, indexing, semantic search |
| Reranker | `mxbai-rerank-large-v1` | Approved | Retrieval quality improvement |
| Premium | `Qwen2.5-72B-Instruct` | Experimental | Higher-quality general model for evaluation |
| Premium | `Llama-3.3-70B-Instruct` | Experimental | Alternate premium general model for evaluation |
| Vision | `Qwen2.5-VL-72B-Instruct` | Experimental | Vision and multimodal testing |

## Notes

- Only the models listed above should be treated as in-scope for the current NOC build.
- Any older candidate list should be considered superseded by this stack definition.
- When the broader registry is updated, it should align to this file.
