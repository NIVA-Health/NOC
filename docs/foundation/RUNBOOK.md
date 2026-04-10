# RUNBOOK

## Purpose
This is the operating runbook for the NIVA Health OpenClaw workstation. It should tell a future operator how to start, validate, troubleshoot, and safely stop the environment without relying on memory.

Related documents:
- `openclaw_workstation_foundation_plan.md`
- `WORKSTATION_BASELINE.md`
- `MODEL_REGISTRY.md`
- `CHANGELOG.md`

---

## 1. Operating Principles
1. Prefer boring, repeatable startup over clever shortcuts.
2. Keep services local-first until auth and exposure are proven.
3. Change one variable at a time during debugging.
4. Record anything non-obvious in `CHANGELOG.md`.
5. If startup requires tribal knowledge, the runbook is incomplete.

---

## 2. Expected Directory Map

```text
C:\OpenClaw\
  apps\
  backups\
  config\
  docs\
  logs\
  repos\
  scripts\

D:\Models\
  approved\
  experimental\
  embeddings\
  rerankers\
  vision\
```

---

## 3. Service Inventory

Update this table as components become real.

| Service / Component | Purpose | Path | Port / Endpoint | Start Method | Status |
|---|---|---|---|---|---|
| OpenClaw gateway | Orchestration / sessions | `TBD` | `TBD` | `TBD` | Planned |
| Local model backend | Inference | `TBD` | `TBD` | `TBD` | Planned |
| LM Studio | Local model serving / testing | `TBD` | `TBD` | App / service | Planned |
| ClawOps UI | Optional frontend | `TBD` | `TBD` | `TBD` | Optional |

---

## 4. Standard Startup Sequence

Use this order unless documented otherwise.

### Phase A: Machine readiness
1. Power on workstation.
2. Log in with the intended operator account.
3. Confirm sufficient free space on both C: and D:.
4. Confirm network is available if the workflow needs it.
5. Confirm no unexpected pending Windows restart.

### Phase B: Backend readiness
1. Start LM Studio or the chosen local inference backend.
2. Confirm the intended model is loaded or loadable.
3. Confirm the backend endpoint is responding.
4. Record any model warmup delay if unusually long.

### Phase C: OpenClaw readiness
1. Open PowerShell 7.
2. Navigate to the scripts or app directory.
3. Start OpenClaw using the approved script or command.
4. Confirm config loaded from the expected path.
5. Confirm logs are writing to the expected log directory.

### Phase D: Session readiness
1. Open the intended interface or CLI.
2. Create a test session.
3. Validate one known-good prompt.
4. Confirm agent output appears and logs remain clean.

---

## 5. Health Checks

Perform these after startup.

| Check | Method | Expected Result | Status |
|---|---|---|---|
| Model backend reachable | Curl / browser / app test | Endpoint responds | |
| OpenClaw gateway running | Process check / log | No fatal errors | |
| Config path correct | Startup log | Expected config path | |
| Agent session opens | Manual test | Success | |
| Logs writable | Check log folder | New entries present | |
| Disk pressure acceptable | Free space check | No critical shortage | |

### Suggested PowerShell checks
```powershell
Get-Process | Where-Object {$_.ProcessName -match 'openclaw|lm studio|node|python'}
Get-Volume | Select-Object DriveLetter, SizeRemaining, Size
```

---

## 6. Normal Shutdown Sequence

1. Finish or save active work.
2. Stop active sessions cleanly.
3. Stop OpenClaw using the approved stop script.
4. Stop the local model backend if not needed.
5. Confirm no lingering heavy processes remain.
6. Archive or note any errors before logging off.

### Shutdown rule
Do not hard-kill processes unless normal shutdown fails and the incident is recorded.

---

## 7. Startup / Shutdown Scripts

Document actual script names once created.

| Script | Purpose | Path | Status | Notes |
|---|---|---|---|---|
| `start-openclaw.ps1` | Start core environment | `C:\OpenClaw\scripts\` | Planned | |
| `stop-openclaw.ps1` | Stop core environment | `C:\OpenClaw\scripts\` | Planned | |
| `health-check.ps1` | Validate environment | `C:\OpenClaw\scripts\` | Planned | |
| `clean-logs.ps1` | Log hygiene | `C:\OpenClaw\scripts\` | Planned | |
| `backup-config.ps1` | Backup config/docs | `C:\OpenClaw\scripts\` | Planned | |

---

## 8. Common Failure Modes

### A. Model backend will not start
Possible causes:
- bad model path
- corrupted download
- unsupported format
- GPU resource conflict
- backend configuration drift

First actions:
1. Check model path.
2. Check backend logs.
3. Try a known-good smaller model.
4. Confirm GPU driver is healthy.
5. Record result in `CHANGELOG.md`.

### B. OpenClaw starts but cannot reach model endpoint
Possible causes:
- wrong port
- wrong host binding
- stale config
- backend not ready
- auth mismatch

First actions:
1. Confirm backend is alive independently.
2. Confirm endpoint in config.
3. Confirm no old environment variables are overriding config.
4. Retry with known-good minimal config.

### C. Session opens but behavior is unstable
Possible causes:
- bad model fit for task
- context too large
- tool-use mismatch
- prompt / agent config issue

First actions:
1. Test with a simpler prompt.
2. Try another approved model.
3. Check whether the failure is model-specific or agent-specific.
4. Log the pattern, not just the symptom.

### D. Disk usage climbs unexpectedly
Possible causes:
- duplicate model downloads
- runaway logs
- cache bloat
- forgotten benchmark assets

First actions:
1. Check `D:\Models\downloads\` and `cache\`.
2. Check `C:\OpenClaw\logs\`.
3. Review recent changes in `CHANGELOG.md`.

---

## 9. Incident Template

Copy-paste this when something breaks.

```md
## Incident Record
- Date:
- Operator:
- Symptom:
- What changed recently:
- Affected service:
- Reproduction steps:
- Logs checked:
- Temporary workaround:
- Root cause:
- Final fix:
- Follow-up action:
```

---

## 10. Change Control Rules
- Any change to config path, ports, startup method, model backend, or agent defaults should be logged.
- Any change that affects reproducibility belongs in `CHANGELOG.md` the same day.
- Any secret handling change should be documented in redacted form only.

---

## 11. Recovery Priorities
If the workstation is degraded, restore in this order:
1. OS and hardware sanity
2. GPU driver sanity
3. Model backend sanity
4. OpenClaw startup sanity
5. Agent/session sanity
6. Optional UI and extras

This prevents wasting time debugging app-level issues caused by lower-level breakage.

---

## 12. Open Decisions

| Decision | Status | Notes |
|---|---|---|
| Final startup script implementation | Open | |
| Final backend serving path | Open | |
| Whether UI starts automatically | Open | |
| Whether remote access is enabled later | Open | |

---

## 13. Quick Daily Checklist

| Task | Done |
|---|---|
| Confirm free disk space | |
| Confirm model backend reachable | |
| Confirm OpenClaw starts cleanly | |
| Confirm test session works | |
| Review any unusual log errors | |
| Log material changes | |

---

## Notes
```text
[Add notes here]
```
