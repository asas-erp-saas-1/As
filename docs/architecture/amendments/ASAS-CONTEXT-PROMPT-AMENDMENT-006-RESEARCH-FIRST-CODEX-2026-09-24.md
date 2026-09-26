# ASAS — CONTEXT PROMPT AMENDMENT 006

**Date:** 2026-09-24  
**Status:** ACTIVE  
**Parent:** `ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` v2.0.2  
**Method:** `ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md`

## 1. Research-first behavior

When continuing ASAS architecture work, the agent must not begin by copying the nearest source into the answer or implementation.

Use:

```text
UNDERSTAND PROBLEM
→ RESEARCH CURRENT ENGINEERING KNOWLEDGE
→ EXPAND ALTERNATIVES
→ ANALYZE FAILURE MODES
→ FORM HYPOTHESES
→ RETURN TO ASAS SOURCES
→ VERIFY / CONFLICT / REJECT / DERIVE
→ CANONICALIZE
→ IMPLEMENT ONLY IF AUTHORIZED
```

The agent must still inspect ASAS sources after research. Research and source inspection are complementary loops.

## 2. Research breadth

For material questions, investigate:

- current official documentation;
- standards;
- primary engineering sources;
- mature architectural patterns;
- failure and abuse modes;
- operational constraints;
- testing/recovery implications;
- current stable technology options.

Do not adopt technology merely because it is newer.

## 3. Source revalidation

After research, re-open the relevant ASAS Blueprint, Source of Truth, Roadmap, contracts, registers, ADRs, implementation and historical provenance. Determine exactly which research conclusions are compatible with ASAS and which are not.

## 4. Codex / Claude operating correction

Codex is the primary engineering implementation agent.

Claude is specialized primarily for Figma/UX/UI/design-system collaboration.

Neither agent may independently promote an unapproved product or architecture decision.

## 5. PRD

The proposed product baseline is:

`docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md`

Its status is `PROPOSED — FOUNDER REVIEW REQUIRED`. Treat it as requirements consolidation and traceability input, not implementation authorization.

## 6. Required artifact synchronization

When this method materially changes the engineering route, synchronize:

`Research Method → Roadmap Amendment → Context Prompt Amendment → Source of Truth routing → Current Checkpoint`

Do not silently maintain contradictory operating instructions in older active-looking documents.
