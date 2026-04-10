# MODEL_REGISTRY_V2

Updated: 2026-04-10

This file is the concrete working registry for the current NOC model stack. It supersedes the placeholder template in `docs/models/MODEL_REGISTRY.md` until that file is replaced in a later edit-capable pass.

## Registry Table

| Model ID | Family / Model Name | Function | Size / Params | Quant / Format | Context | Storage Path | Backend | Status | Approval Tier | Primary Use Case | VRAM / RAM Notes | Owner | Date Added | Date Reviewed | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| MOD-001 | `QwQ-32B` | Reasoning | `32B` | `TBD` | `TBD` | `D:\\Models\\approved\\reasoning\\QwQ-32B` | OpenClaw / serving backend TBD | Approved | Primary | Deep reasoning, synthesis, complex problem solving | `TBD` | Josh | 2026-04-10 | 2026-04-10 | First-wave approved reasoning model |
| MOD-002 | `Qwen2.5-Coder-32B-Instruct` | Coding | `32B` | `TBD` | `TBD` | `D:\\Models\\approved\\coding\\Qwen2.5-Coder-32B-Instruct` | OpenClaw / serving backend TBD | Approved | Primary | Repo work, coding, refactors, implementation support | `TBD` | Josh | 2026-04-10 | 2026-04-10 | First-wave approved coding model |
| MOD-003 | `Qwen2.5-32B-Instruct` | General | `32B` | `TBD` | `TBD` | `D:\\Models\\approved\\general\\Qwen2.5-32B-Instruct` | OpenClaw / serving backend TBD | Approved | Primary | Balanced general assistant tasks | `TBD` | Josh | 2026-04-10 | 2026-04-10 | Default general-purpose model |
| MOD-004 | `Ministral-3-8B-Instruct-2512` | Fast | `8B` | `TBD` | `TBD` | `D:\\Models\\approved\\fast\\Ministral-3-8B-Instruct-2512` | OpenClaw / serving backend TBD | Approved | Fallback | Lightweight low-latency tasks and fallback routing | `TBD` | Josh | 2026-04-10 | 2026-04-10 | Fast path model |
| MOD-005 | `jina-embeddings-v3` | Embeddings | `TBD` | `TBD` | `TBD` | `D:\\Models\\approved\\embeddings\\jina-embeddings-v3` | Retrieval backend TBD | Approved | Primary | Semantic search, retrieval, indexing | `TBD` | Josh | 2026-04-10 | 2026-04-10 | Approved embeddings model |
| MOD-006 | `mxbai-rerank-large-v1` | Reranker | `TBD` | `TBD` | `TBD` | `D:\\Models\\approved\\rerankers\\mxbai-rerank-large-v1` | Retrieval backend TBD | Approved | Primary | Reranking for higher retrieval precision | `TBD` | Josh | 2026-04-10 | 2026-04-10 | Approved reranker |
| MOD-007 | `Qwen2.5-72B-Instruct` | General / Premium | `72B` | `TBD` | `TBD` | `D:\\Models\\experimental\\premium\\Qwen2.5-72B-Instruct` | OpenClaw / serving backend TBD | Testing | Experimental | Premium general evaluation | `TBD` | Josh | 2026-04-10 | 2026-04-10 | Experimental premium candidate |
| MOD-008 | `Llama-3.3-70B-Instruct` | General / Premium | `70B` | `TBD` | `TBD` | `D:\\Models\\experimental\\premium\\Llama-3.3-70B-Instruct` | OpenClaw / serving backend TBD | Testing | Experimental | Alternate premium general evaluation | `TBD` | Josh | 2026-04-10 | 2026-04-10 | Experimental premium candidate |
| MOD-009 | `Qwen2.5-VL-72B-Instruct` | Vision | `72B` | `TBD` | `TBD` | `D:\\Models\\experimental\\vision\\Qwen2.5-VL-72B-Instruct` | OpenClaw / serving backend TBD | Testing | Experimental | Vision and multimodal evaluation | `TBD` | Josh | 2026-04-10 | 2026-04-10 | Experimental vision candidate |

## Bucket Decisions

| Bucket | Decision | Model | Status |
|---|---|---|---|
| Primary reasoning model | Selected | `QwQ-32B` | Approved |
| Primary coding model | Selected | `Qwen2.5-Coder-32B-Instruct` | Approved |
| Primary general model | Selected | `Qwen2.5-32B-Instruct` | Approved |
| Small fallback model | Selected | `Ministral-3-8B-Instruct-2512` | Approved |
| Embeddings model | Selected | `jina-embeddings-v3` | Approved |
| Reranker | Selected | `mxbai-rerank-large-v1` | Approved |
| Premium general evaluation | Selected | `Qwen2.5-72B-Instruct`, `Llama-3.3-70B-Instruct` | Experimental |
| Vision evaluation | Selected | `Qwen2.5-VL-72B-Instruct` | Experimental |
