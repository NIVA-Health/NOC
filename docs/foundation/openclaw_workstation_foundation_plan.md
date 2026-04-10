# OpenClaw Workstation Foundation Plan

## Purpose
This document is the working roadmap for building, configuring, and operationalizing the NIVA Health OpenClaw workstation. It is based on the Puget Systems packet for Order #287143 and is intended to serve as the single planning document we can update as the workstation evolves.

## Hardware Baseline
Source of truth: **Puget Systems Information Booklet, Order #287143**.

### Confirmed system specs
- **Platform:** Puget Workstation Ryzen X870E R121-L
- **Motherboard:** ASUS ProArt X870E-Creator WiFi
- **CPU:** AMD Ryzen 9 9950X3D, 16-core, 170W
- **RAM:** 4 x 64GB Crucial Pro DDR5-5600 UDIMM = **256GB total**
- **GPU:** NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition, **96GB VRAM**
- **Storage 1:** WD_BLACK SN850X 2TB Gen4 M.2 SSD
- **Storage 2:** Samsung 990 Pro 1TB Gen4 M.2 SSD
- **Power Supply:** Super Flower LEADEX VII Gold 1300W
- **Case:** Fractal Design Define 7
- **Cooling:** Asetek 240mm CPU cooler + upgraded Noctua fan setup
- **OS:** Windows 11 Pro 64-bit
- **Courtesy installed by Puget:** LM Studio, Chrome

## Planning Principles
1. **Keep the workstation stable first, fast second.** Do not chase performance gains before we have a reproducible working stack.
2. **Separate system, models, code, and data.** This reduces recovery time and makes upgrades safer.
3. **Design for operator clarity.** Every service, folder, port, and credential should have one obvious place.
4. **Minimize hidden dependencies.** Favor explicit config, local documentation, and scripts over tribal knowledge.
5. **Treat this as production-capable infrastructure.** Even if initial use is experimental, build with recoverability in mind.

## Target Outcome
A reliable local AI workstation that can:
- Run OpenClaw as the orchestration layer
- Host one or more local model backends
- Support coding, agent execution, and testing workflows
- Serve as the foundation for a multi-agent local AI environment
- Scale into repeatable operational use for NIVA Health projects

## Recommended System Layout

### Drive roles
Use a clean role split across the two internal SSDs.

#### C: drive (2TB WD_BLACK SN850X)
Use for:
- Windows 11 and system apps
- OpenClaw core install
- CLI tooling and package managers
- Git repos and active development workspaces
- Docker or container tooling if used later
- Logs and lightweight local configs

Why:
- The larger 2TB drive gives room for OS, toolchains, repos, and general workstation growth.
- This reduces the chance that Windows and daily dev work collide with model storage pressure.

#### D: drive (1TB Samsung 990 Pro)
Use for:
- Model files
- Quantized model variants
- Inference cache directories
- LM Studio model storage
- Temporary benchmark/test models
- Experimental model downloads pending promotion to approved set

Why:
- Keeping model artifacts isolated makes them easier to prune, move, back up, and document.
- It also simplifies later migration if you add external NVMe or network-attached storage.

### Suggested top-level folder structure
Create a consistent folder map early.

```text
C:\OpenClaw\
  apps\
  config\
  logs\
  scripts\
  repos\
  docs\
  backups\

D:\Models\
  approved\
  experimental\
  embeddings\
  rerankers\
  vision\
  downloads\
  cache\
```

### Recommended repo layout under `C:\OpenClaw\repos\`
```text
C:\OpenClaw\repos\
  openclaw-main\
  clawops-ui\
  infra-scripts\
  prompt-library\
  niva-agents\
  sandbox\
```

## Foundational Software Stack

### Core layer
Install and verify these first:
1. **Windows updates** fully applied
2. **NVIDIA drivers** appropriate for the RTX PRO 6000 Blackwell workstation GPU
3. **Git**
4. **Node.js LTS**
5. **Python 3.11+**
6. **Visual Studio Code** or Cursor
7. **PowerShell 7**
8. **OpenClaw**
9. **LM Studio**
10. **Google Chrome**

### Optional but high-value tools
- 7-Zip
- Everything Search
- Windows Terminal
- Notepad++
- Docker Desktop, only if clearly needed
- GitHub Desktop, only if preferred for some workflows
- Tailscale, if secure remote access becomes part of the plan

## OpenClaw Foundation Architecture

### Proposed role split
Use a simple, understandable architecture first.

#### Layer 1: Operator shell
- OpenClaw gateway
- Primary config
- Agent definitions
- Session management
- Basic auth model

#### Layer 2: Local model providers
- LM Studio for local model serving and experimentation
- Potential future dedicated inference server if needed

#### Layer 3: Working agents
- Maude: planning, operations, synthesis
- Walter: coding, implementation, repo work
- Ralph or other specialist agents as needed

#### Layer 4: Project attachments
- Note Scrubber work
- NIVA internal tooling
- QC engine support agents
- Experimental copilots

## Initial Build Sequence
This is the order of operations to reduce risk.

### Phase 1: Workstation hardening
Goal: establish a clean and recoverable machine.

Tasks:
1. Rename the machine consistently.
2. Confirm Windows activation.
3. Apply all Windows updates.
4. Install latest stable NVIDIA driver.
5. Confirm disk labels and assign clear volume names.
6. Create the base folder structure on C: and D:.
7. Enable restore options or create a baseline recovery image if desired.
8. Export a machine baseline document with:
   - hostname
   - Windows version
   - GPU driver version
   - Python version
   - Node version
   - available disk space
   - key installed apps

Deliverable:
- Stable baseline workstation with known-good OS and driver state.

### Phase 2: Dev environment setup
Goal: make the machine ready for repeatable software work.

Tasks:
1. Install Git.
2. Install Node.js LTS.
3. Install Python 3.11+.
4. Install VS Code or Cursor.
5. Install PowerShell 7.
6. Configure Git identity.
7. Configure SSH keys or PAT workflow for GitHub.
8. Create `C:\OpenClaw\repos\` and clone required repositories.
9. Create `C:\OpenClaw\docs\` for local operational notes.

Deliverable:
- Reproducible development environment.

### Phase 3: Model storage and inference layout
Goal: establish clean model management.

Tasks:
1. Point LM Studio model storage to `D:\Models\`.
2. Create approved vs experimental model folders.
3. Define a naming convention for models.
4. Keep a simple registry file such as `D:\Models\MODEL_REGISTRY.md`.
5. Select initial model set based on use case:
   - coding
   - general reasoning
   - summarization
   - embeddings
6. Record which models are approved for production-like workflows versus temporary tests.

Deliverable:
- Organized model layer with low confusion and low cleanup cost.

### Phase 4: OpenClaw install and base config
Goal: get OpenClaw running locally in a boring, repeatable way.

Tasks:
1. Install OpenClaw in a dedicated directory.
2. Store config under `C:\OpenClaw\config\`.
3. Keep any local secrets out of shared docs.
4. Start with one known-good agent and one known-good local model endpoint.
5. Validate:
   - gateway starts
   - local model endpoint reachable
   - agent session opens
   - logs are readable
6. Create a startup script and a shutdown script.

Deliverable:
- Minimal working local OpenClaw instance.

### Phase 5: Agent bootstrapping
Goal: move from infrastructure to useful workflows.

Tasks:
1. Define core agents and roles.
2. Create a consistent prompt and config layout.
3. Separate experimental agents from production agents.
4. Test:
   - basic chat
   - file reading
   - code generation
   - session persistence
5. Create a standard agent template.

Deliverable:
- First operational agent set.

### Phase 6: Operationalization
Goal: make the system usable beyond setup.

Tasks:
1. Add log rotation or log cleanup scripts.
2. Create backup/export plan for configs and prompts.
3. Document standard restart procedure.
4. Document model swap procedure.
5. Create a troubleshooting checklist.
6. Define update policy for:
   - OpenClaw
   - model files
   - GPU drivers
   - Python packages
   - Node packages

Deliverable:
- Maintainable local AI workstation.

## Recommended Folder and File Conventions

### Configuration files
Use one place for config and one place for notes.

```text
C:\OpenClaw\config\
  openclaw\
  agents\
  models\
  secrets-template\

C:\OpenClaw\docs\
  WORKSTATION_BASELINE.md
  MODEL_REGISTRY.md
  CHANGELOG.md
  INCIDENT_LOG.md
  RUNBOOK.md
```

### Scripts
Keep operational scripts together.

```text
C:\OpenClaw\scripts\
  start-openclaw.ps1
  stop-openclaw.ps1
  health-check.ps1
  backup-config.ps1
  update-env.ps1
  clean-logs.ps1
```

## Model Strategy for This Machine
Given the hardware profile, this workstation should comfortably support serious local inference experimentation, but model governance still matters.

### Recommended policy
- Keep only a small number of approved models active at once.
- Use `experimental` for everything not yet validated.
- Separate coding models from reasoning models.
- Track context window, quantization, VRAM use, and best use case in the registry.

### Initial model buckets
1. **Primary reasoning model**
2. **Primary coding model**
3. **Fallback smaller model**
4. **Embeddings model**
5. **Optional vision model**

### Selection criteria
Evaluate each candidate model on:
- response quality
- latency
- VRAM footprint
- stability over long sessions
- tool-use reliability
- config simplicity

## Security and Governance Basics
Do this early so the machine does not become a sprawl box.

### Minimum controls
- Use a password manager for tokens and secrets.
- Do not store live secrets in general notes.
- Keep a redacted config template for documentation.
- Maintain a list of external services connected to the workstation.
- Separate personal experiments from NIVA production-adjacent work.

### Recommended access posture
- Single primary operator account initially
- Admin rights only where necessary
- Remote access only after local setup is stable
- No public exposure of local services until auth is tested end-to-end

## Logging and Observability
A local AI workstation becomes hard to manage when logs are scattered.

### Minimum logging plan
- Gateway logs in one folder
- Agent logs in one folder
- Startup and shutdown logs in one folder
- Incident notes in `INCIDENT_LOG.md`

### Example structure
```text
C:\OpenClaw\logs\
  gateway\
  agents\
  startup\
  archive\
```

## Backup and Recovery Plan
This is the difference between a workstation and an operational platform.

### Back up regularly
- OpenClaw config
- agent definitions
- prompt libraries
- scripts
- docs
- model registry

### Do not prioritize backing up
- re-downloadable installers
- temporary model downloads
- disposable caches
- generated logs older than retention threshold

### Recovery goal
Be able to rebuild the working environment from:
1. this roadmap
2. config backups
3. scripts
4. repo clones
5. model registry

## First Success Criteria
We should consider the foundation complete when all of the following are true:
- Workstation folders are created and documented
- Dev tooling is installed and version-checked
- LM Studio is pointed to the correct model storage path
- OpenClaw launches locally without brittle hacks
- At least one local model is reachable through the intended path
- At least one agent runs a successful session
- Start/stop scripts exist
- A basic runbook exists

## Risks and Trade-Offs

### Risk 1: Tool sprawl
Installing too many tools too early creates version conflicts and hidden dependencies.

Mitigation:
- Install only the minimum needed for Phase 1 through Phase 4.

### Risk 2: Model sprawl
A powerful workstation invites downloading too many models too quickly.

Mitigation:
- Enforce approved vs experimental folders and maintain the registry.

### Risk 3: Config drift
Manual edits across multiple config files become hard to track.

Mitigation:
- Centralize config and keep a changelog.

### Risk 4: Premature remote exposure
Opening services externally before auth is solid is high risk.

Mitigation:
- Keep the system local-first until the base stack is stable.

### Risk 5: Recovery blind spot
If the machine breaks and the process is undocumented, rebuild time balloons.

Mitigation:
- Maintain scripts, docs, and backups from the start.

## Recommended Immediate Next Actions
These are the highest-ROI next steps.

1. Create the folder structure on both drives.
2. Label and document drive roles.
3. Install or verify the core software stack.
4. Point LM Studio storage to `D:\Models\`.
5. Create the local docs set:
   - `WORKSTATION_BASELINE.md`
   - `MODEL_REGISTRY.md`
   - `CHANGELOG.md`
   - `RUNBOOK.md`
6. Install and validate OpenClaw in a minimal local-only configuration.

## Suggested Companion Files to Create Next
To keep this roadmap actionable, create these markdown files next:

### 1. `WORKSTATION_BASELINE.md`
Should include:
- hostname
- Windows build
- BIOS version
- GPU driver version
- installed tool versions
- disk layout
- network notes

### 2. `MODEL_REGISTRY.md`
Should include a table for:
- model name
- size
- quantization
- use case
- location
- approved status
- notes

### 3. `RUNBOOK.md`
Should include:
- boot sequence
- service start order
- health checks
- shutdown procedure
- known issues

### 4. `CHANGELOG.md`
Should include:
- date
- change made
- reason
- operator
- rollback notes if needed

## Contrarian View
A valid alternative is to **not** optimize around local-first inference immediately and instead use this machine mainly as the control plane while higher-demand inference runs elsewhere. That would reduce local complexity, but it would also reduce the strategic value of having a 96GB workstation GPU on site. For your use case, local-first still appears to be the better long-term bet.

## Decision Log
### Locked decisions
- This Puget workstation packet is the hardware source of truth.
- Markdown documentation is the primary planning format.
- The system should be built as a stable local AI workstation first.
- Model storage should be logically separated from OS and code.

### Open decisions
- Exact initial model lineup
- Whether Docker is part of the first-wave architecture
- Whether remote access is needed in Phase 1 or later
- Which agents are considered production vs experimental

## Next Build Prompt
Use this prompt when you want to continue the project:

> Continue the OpenClaw workstation build using `openclaw_workstation_foundation_plan.md` as the roadmap. Work from the current phase, preserve prior decisions, update assumptions explicitly, and produce any new documentation in markdown.
