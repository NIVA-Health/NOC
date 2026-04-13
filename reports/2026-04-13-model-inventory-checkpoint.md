# NOC model inventory checkpoint

**Date:** 2026-04-13  
**Prepared by:** ChatGPT / Maude + Josh  
**Checkpoint:** Pre-OpenClaw installation

---

## Detailed log update

### What was completed
- Confirmed the local Ollama runtime remained healthy after initial setup and validation.
- Reviewed `docs/models/MODEL_REGISTRY_V2.md` to align the next installs with the approved NOC model strategy.
- Installed `qwen2.5:32b` as the first approved-style primary general model.
- Installed `mistral:7b` as the practical local fallback lane for first-pass serving.
- Preserved the bootstrap models `qwen2.5:7b` and `qwen2.5:3b` as backup options.
- Confirmed current local model inventory with `ollama list`.

### Current model inventory
- `qwen2.5:32b`
- `mistral:7b`
- `qwen2.5:7b`
- `qwen2.5:3b`

### Recommended first-pass model role mapping
- `general_primary` -> `qwen2.5:32b`
- `helper_fallback` -> `mistral:7b`
- `bootstrap_general` -> `qwen2.5:7b`
- `bootstrap_helper` -> `qwen2.5:3b`

### Notes / caveats
- The registry label for the approved fast fallback model did not map 1:1 to an Ollama tag, so `mistral:7b` is being used as the practical first-pass fallback lane pending later refinement.
- This checkpoint is intended to establish the local model shelf before beginning OpenClaw installation and wiring.

### Next actions
- [ ] Start OpenClaw installation on the NOC machine.
- [ ] Configure OpenClaw to use the local Ollama endpoint at `http://127.0.0.1:11434`.
- [ ] Create role-based model aliases in OpenClaw.
- [ ] Stand up the first operator agent.
- [ ] Run one end-to-end prompt through OpenClaw.

---

## Dr. Foss TL;DR

### What happened
We expanded the local model inventory on the NOC machine so it now includes a larger primary model and a practical fallback model for the first orchestration pass. We also kept the earlier smaller models in place as backups. The local model layer is now ready for the next phase.

### Why it matters
This gives us a usable model shelf to connect to OpenClaw. In practical terms, the system is ready to move from local model setup into orchestration and agent configuration.

### What is next
Next we will install OpenClaw, connect it to the local model runtime, assign the first model roles, and test the first operator agent.

### Traffic light
- **Status:** Green
- **Reason:** The local model inventory is in place and the next major phase is OpenClaw integration.
