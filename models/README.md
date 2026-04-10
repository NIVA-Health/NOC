# models

This directory contains the current NOC model stack and related governance artifacts.

## Current source of truth
- `STACK.md` contains the active approved and experimental model lineup.
- `../docs/models/CURRENT_MODEL_STACK.md` contains the operational summary.
- `../docs/models/MODEL_REGISTRY.md` contains the concrete working registry.

## Current stack

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
