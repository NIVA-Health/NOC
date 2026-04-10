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
Status Definitions
Status	Meaning
Proposed	Candidate not yet downloaded
Downloaded	Present on disk, not yet validated
Testing	In active evaluation
Approved	Allowed for normal workflow use
Limited	Approved only for narrow use cases
Deprecated	No longer preferred, may still exist
Removed	No longer on disk
Registry Table
Model ID	Family / Model Name	Function	Size / Params	Quant / Format	Context	Storage Path	Backend	Status	Approval Tier	Primary Use Case	VRAM / RAM Notes	Owner	Date Added	Date Reviewed	Notes
MOD-001	QwQ-32B	Reasoning	32B	TBD	TBD	D:\Models\approved\reasoning\QwQ-32B	OpenClaw / serving backend TBD	Approved	Primary	Deep reasoning, synthesis, complex problem solving	TBD	Josh	2026-04-10	2026-04-10	First-wave approved reasoning model
MOD-002	Qwen2.5-Coder-32B-Instruct	Coding	32B	TBD	TBD	D:\Models\approved\coding\Qwen2.5-Coder-32B-Instruct	OpenClaw / serving backend TBD	Approved	Primary	Repo work, coding, refactors, implementation support	TBD	Josh	2026-04-10	2026-04-10	First-wave approved coding model
MOD-003	Qwen2.5-32B-Instruct	General	32B	TBD	TBD	D:\Models\approved\general\Qwen2.5-32B-Instruct	OpenClaw / serving backend TBD	Approved	Primary	Balanced general assistant tasks	TBD	Josh	2026-04-10	2026-04-10	Default general-purpose model
MOD-004	Ministral-3-8B-Instruct-2512	Fast	8B	TBD	TBD	D:\Models\approved\fast\Ministral-3-8B-Instruct-2512	OpenClaw / serving backend TBD	Approved	Fallback	Lightweight low-latency tasks and fallback routing	TBD	Josh	2026-04-10	2026-04-10	Fast path model
MOD-005	jina-embeddings-v3	Embeddings	TBD	TBD	TBD	D:\Models\approved\embeddings\jina-embeddings-v3	Retrieval backend TBD	Approved	Primary	Semantic search, retrieval, indexing	TBD	Josh	2026-04-10	2026-04-10	Approved embeddings model
MOD-006	mxbai-rerank-large-v1	Reranker	TBD	TBD	TBD	D:\Models\approved\rerankers\mxbai-rerank-large-v1	Retrieval backend TBD	Approved	Primary	Reranking for higher retrieval precision	TBD	Josh	2026-04-10	2026-04-10	Approved reranker
MOD-007	Qwen2.5-72B-Instruct	General / Premium	72B	TBD	TBD	D:\Models\experimental\premium\Qwen2.5-72B-Instruct	OpenClaw / serving backend TBD	Testing	Experimental	Premium general evaluation	TBD	Josh	2026-04-10	2026-04-10	Experimental premium candidate
MOD-008	Llama-3.3-70B-Instruct	General / Premium	70B	TBD	TBD	D:\Models\experimental\premium\Llama-3.3-70B-Instruct	OpenClaw / serving backend TBD	Testing	Experimental	Alternate premium general evaluation	TBD	Josh	2026-04-10	2026-04-10	Experimental premium candidate
MOD-009	Qwen2.5-VL-72B-Instruct	Vision	72B	TBD	TBD	D:\Models\experimental\vision\Qwen2.5-VL-72B-Instruct	OpenClaw / serving backend TBD	Testing	Experimental	Vision and multimodal evaluation	TBD	Josh	2026-04-10	2026-04-10	Experimental vision candidate
Current Bucket Decisions
Bucket	Decision	Model	Status
Primary reasoning model	Selected	QwQ-32B	Approved
Primary coding model	Selected	Qwen2.5-Coder-32B-Instruct	Approved
Primary general model	Selected	Qwen2.5-32B-Instruct	Approved
Small fallback model	Selected	Ministral-3-8B-Instruct-2512	Approved
Embeddings model	Selected	jina-embeddings-v3	Approved
Reranker	Selected	mxbai-rerank-large-v1	Approved
Premium general evaluation	Selected	Qwen2.5-72B-Instruct, Llama-3.3-70B-Instruct	Experimental
Vision evaluation	Selected	Qwen2.5-VL-72B-Instruct	Experimental
Evaluation Criteria

Score each model before approval.

Criterion	Weight	Notes
Output quality	5	Accuracy, usefulness, coherence
Latency	4	Real response speed for your use cases
Stability	5	Long sessions, no weird failures
Tool-use reliability	5	Important for OpenClaw workflows
Context handling	4	Large docs, long prompts, chaining
VRAM efficiency	4	Practical fit for this machine
Operational simplicity	3	Easy to serve, easy to document
Optional scoring template
Model ID	Quality	Latency	Stability	Tool Use	Context	VRAM Efficiency	Simplicity	Total	Verdict
MOD-001									
Naming Convention

Use a predictable naming pattern in docs and folder names.

[family]-[size]-[quant]-[context]-[purpose]

Example:

qwen-coder-32b-q4km-128k-coding

Rules:

Keep names short but unambiguous.
Include quant when relevant.
Include intended role when useful.
Match folder names to the registry where possible

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
Deprecation / Removal Template
### Model Removal Record
- Model ID:
- Model Name:
- Date Deprecated or Removed:
- Action Taken:
- Reason:
- Replacement Model:
- Disk reclaimed:
- Notes:
Quick Rules for Disk Hygiene
Do not leave large downloads in downloads\ once classified.
Do not let experimental variants accumulate without review.
Remove duplicate quantizations unless they serve a real comparison purpose.
Review the registry whenever free space drops materially.
Review Cadence
Cadence	Task
Weekly during buildout	Review testing and experimental models
Monthly once stable	Review approved list and prune drift
Any major backend change	Revalidate approved models
