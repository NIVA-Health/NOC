# WORKSTATION_BASELINE

## Purpose
This document is the canonical baseline record for the NIVA Health OpenClaw workstation. Update it whenever hardware, drivers, operating system, core tools, storage layout, or network posture materially change.

Related documents:
- `openclaw_workstation_foundation_plan.md`
- `MODEL_REGISTRY.md`
- `RUNBOOK.md`
- `CHANGELOG.md`

---

## 1. Identity

| Field | Value | Status |
|---|---|---|
| System Role | OpenClaw primary workstation | Locked |
| Owner / Team | NIVA Health | Locked |
| Vendor | Puget Systems | Confirmed |
| Order Reference | Order #287143 | Confirmed |
| Hostname | `TBD_OPENCLAW_HOSTNAME` | Fill in |
| Environment | Local workstation / operator node | Planned |
| Primary Operator | `TBD` | Fill in |
| Date Baseline Created | `2026-04-09` | Confirmed |
| Last Updated | `TBD` | Update each revision |

---

## 2. Hardware Baseline

Use this section as the hardware source of truth unless the machine is physically upgraded.

| Component | Value | Notes |
|---|---|---|
| Platform | Puget Workstation Ryzen X870E R121-L | From packet |
| Motherboard | ASUS ProArt X870E-Creator WiFi | From packet |
| CPU | AMD Ryzen 9 9950X3D | 16-core |
| RAM | 256GB DDR5-5600 | 4 x 64GB |
| GPU | NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition | 96GB VRAM |
| OS Drive | WD_BLACK SN850X 2TB Gen4 M.2 SSD | Planned as C: |
| Model / Secondary Drive | Samsung 990 Pro 1TB Gen4 M.2 SSD | Planned as D: |
| Case | Fractal Design Define 7 | From packet |
| PSU | Super Flower LEADEX VII Gold 1300W | From packet |
| CPU Cooling | Asetek 624S-M2 240mm CPU Cooler | From packet |
| Additional Fans | Noctua upgrade set | From packet |

### Physical notes
- GPU monitor connections should use the discrete NVIDIA card outputs, not motherboard display outputs.
- Board includes both **10G LAN** and **2.5G LAN**, plus Wi‑Fi.
- Packet indicates courtesy install of **LM Studio** and **Chrome**.

---

## 3. Operating System Baseline

| Field | Value | Status |
|---|---|---|
| OS | Windows 11 Pro 64-bit | Confirmed |
| Windows Build | `TBD` | Capture from system |
| Windows Activation | `TBD` | Confirm |
| BIOS Version | `TBD` | Capture |
| BIOS Date | `TBD` | Capture |
| Secure Boot | `TBD` | Confirm in OS / BIOS |
| Restore Media Present | Yes per packet | Verify physically |
| Recovery Image Created | `TBD` | Recommended |

### Capture commands
Use these after first login and paste the results into this doc.

```powershell
winver
systeminfo
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsBuildNumber, BiosBIOSVersion
Confirm-SecureBootUEFI
```

---

## 4. Driver Baseline

| Driver / Firmware | Target | Current | Status |
|---|---|---|---|
| NVIDIA GPU Driver | Stable workstation / production-safe | `TBD` | Capture |
| AMD Chipset Driver | Latest stable | `TBD` | Capture |
| ASUS Board / LAN / Wi‑Fi | Latest stable | `TBD` | Capture |
| SSD Firmware, WD | Current | `TBD` | Capture |
| SSD Firmware, Samsung | Current | `TBD` | Capture |

### Capture commands / locations
```powershell
nvidia-smi
Get-WmiObject Win32_PnPSignedDriver | Sort-Object DeviceName | Select-Object DeviceName, DriverVersion
```

---

## 5. Storage Layout

## Planned volume roles

| Drive | Label | Planned Role | Notes |
|---|---|---|---|
| C: | `OPENCLAW_SYS` | OS, apps, repos, scripts, logs, configs | Larger general-purpose drive |
| D: | `OPENCLAW_MODELS` | Models, embeddings, caches, experimental downloads | Easier cleanup and migration |

## Planned folder map

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
  cache\
  downloads\
  embeddings\
  experimental\
  rerankers\
  vision\
```

## Actual storage check

| Check | Value | Status |
|---|---|---|
| C: total size | `TBD` | Capture |
| C: free space | `TBD` | Capture |
| D: total size | `TBD` | Capture |
| D: free space | `TBD` | Capture |
| Folder structure created | `TBD` | Update |
| LM Studio moved to D:\Models | `TBD` | Update |

### Capture commands
```powershell
Get-Volume | Select-Object DriveLetter, FileSystemLabel, SizeRemaining, Size
```

---

## 6. Core Software Baseline

Mark each tool only after verified install.

| Tool | Target Version / Track | Installed Version | Status | Notes |
|---|---|---|---|---|
| Git | Current stable | `TBD` | Pending | |
| Node.js | LTS | `TBD` | Pending | |
| npm | Matching Node LTS | `TBD` | Pending | |
| Python | 3.11+ | `TBD` | Pending | |
| pip | Current | `TBD` | Pending | |
| PowerShell 7 | Current stable | `TBD` | Pending | |
| VS Code or Cursor | Current stable | `TBD` | Pending | |
| OpenClaw | Initial known-good version | `TBD` | Pending | |
| LM Studio | Current stable | `TBD` | Pending | Courtesy installed |
| Chrome | Current stable | `TBD` | Pending | Courtesy installed |

### Capture commands
```powershell
git --version
node --version
npm --version
python --version
pip --version
pwsh --version
```

---

## 7. Network Baseline

| Field | Value | Status |
|---|---|---|
| Primary NIC in use | `TBD` | Fill in |
| 10G LAN enabled | `TBD` | Confirm |
| 2.5G LAN enabled | `TBD` | Confirm |
| Wi‑Fi enabled | `TBD` | Confirm |
| Static IP | `TBD` | Fill in if used |
| Local-only mode | Planned for early phases | Planned |
| Remote exposure enabled | No | Planned |
| Tailscale / VPN | `TBD` | Optional later |

### Capture commands
```powershell
ipconfig /all
Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MacAddress
```

---

## 8. Benchmark Baseline from Packet

Use this as the pre-deployment performance baseline for comparison if the workstation later underperforms.

| Benchmark | Result | Notes |
|---|---|---|
| CrystalDiskMark C: Sequential Read | 7363.901 MB/s | WD_BLACK SN850X |
| CrystalDiskMark C: Sequential Write | 6635.437 MB/s | WD_BLACK SN850X |
| CrystalDiskMark D: Sequential Read | 6572.795 MB/s | Samsung 990 Pro |
| CrystalDiskMark D: Sequential Write | 6416.802 MB/s | Samsung 990 Pro |
| NBody CUDA Host to Device | 51726.0 MB/s | GPU bandwidth check |
| NBody CUDA Device to Host | 53717.1 MB/s | GPU bandwidth check |
| Superposition 8K Optimized | 104.8 FPS | GPU sanity baseline |
| OctaneBench Total | 1562.9 | GPU render baseline |
| V-Ray RTX Mode GPUs Only | 14831 vpaths | GPU baseline |

---

## 9. Baseline Validation Checklist

| Task | Owner | Status | Notes |
|---|---|---|---|
| Confirm hostname |  | Not started | |
| Confirm Windows build and activation |  | Not started | |
| Confirm BIOS version |  | Not started | |
| Confirm NVIDIA driver version |  | Not started | |
| Label drives |  | Not started | |
| Create folder structure |  | Not started | |
| Capture versions for core tools |  | Not started | |
| Confirm LM Studio storage path |  | Not started | |
| Confirm no public exposure |  | Not started | |
| Save initial screenshots / exports |  | Not started | |

---

## 10. Notes / Exceptions
- Use this section for deviations from plan.
- Record any hardware changes here before updating the main tables.
- If the workstation ever shifts from local-first to hybrid or remote inference, record that transition here first.
