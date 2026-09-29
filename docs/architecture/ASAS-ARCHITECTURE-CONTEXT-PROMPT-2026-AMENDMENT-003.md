# ASAS — ARCHITECTURE CONTEXT PROMPT 2026 — AMENDMENT 003

**Artifact ID:** ASAS-ARCH-CONTEXT-2026-A003  
**Status:** CANONICAL AI OPERATING AMENDMENT  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Applies to:** `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md`  
**Canonical branch:** `platform-architecture-2026`

## 1. Agent authority correction

Interpret all generic references to `Claude Code or another autonomous engineering agent` as **Codex-first** for ASAS implementation.

```text
Lead Architect
→ canonical decision
→ authorized task packet
→ Codex
→ implementation
→ independent verification
```

Claude is a specialized design/visual collaborator, primarily for Figma workflows. It is not the default repository writer.

## 2. Agent operating model

The canonical detailed operating model is:

`docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md`

The agent must load it when selecting an AI/tool workflow.

## 3. Design integration

For design-heavy tasks use:

`docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`

Preferred flow:

`UX → design system → Figma → acceptance → Figma MCP/Code Connect → Codex → browser/visual verification`

Figma design does not override business/domain contracts.

## 4. Codex skill expectation

For each task, Codex should use the strongest applicable skill set rather than a generic coding prompt:

- forensic repository inspection;
- DDD/domain modeling;
- database/schema engineering;
- security/tenancy;
- implementation;
- testing;
- browser/visual QA;
- adversarial review;
- CI/architecture-as-code;
- evidence capture.

Task complexity determines whether parallel Codex work is justified. Do not parallelize merely for appearance.

## 5. External tool rule

Use external tools and official sources when they materially improve correctness. Tool selection is subordinate to architecture authority.

For Figma integration, prefer official Figma MCP/Code Connect documentation and verified configuration.

For OpenAI/Codex behavior, prefer official OpenAI documentation.

For all third-party technology, prefer official vendor documentation and standards.

## 6. Error-prevention protocol

No system can honestly promise literal zero defects.

ASAS therefore enforces:

```text
eliminate ambiguity
→ constrain authority
→ validate inputs
→ implement narrowly
→ test critical paths
→ adversarially review
→ verify independently
→ capture evidence
→ block unsafe promotion
```

## 7. Continuation instruction

When the operator says `Continue / أكمل العمل على المسار`, do not restart the architecture. Load the checkpoint, base control plane, applicable amendments, and first unresolved dependency; then continue from that dependency.
