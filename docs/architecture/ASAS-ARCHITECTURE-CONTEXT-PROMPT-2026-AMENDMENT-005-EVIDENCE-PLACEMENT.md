# ASAS Architecture Context Prompt 2026 — Amendment 005
## Evidence Placement & Truth Classification

**Status:** ACTIVE
**Effective date:** 2026-09-24
**Parent:** `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md`
**Control resource:** `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
**Evidence register:** `docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md`

## 1. Mandatory behavior

When new information is discovered, do not immediately insert it into the architecture narrative. First classify the information and determine its authority, provenance, scope and designated artifact.

## 2. Required sequence

`SOURCE → PROVENANCE → EVIDENCE CLASS → AUTHORITY TEST → DESIGNATED ARTIFACT → CROSS-REFERENCE → VERIFICATION → CHECKPOINT`

## 3. Critical distinctions

- repository structure is not runtime truth;
- historical branch evidence is not current authority;
- source-package counts are observations, not runtime proof;
- external documentation is engineering evidence, not ASAS implementation evidence;
- an inference is not a discovered fact;
- a proposal is not an approved decision;
- a design artifact is not implementation authorization;
- a database target is not the live database.

## 4. Current verified repository facts

At the latest verified branch inspection, `platform-architecture-2026` pointed to `4efb961d5ad1d685d6e69cba7b5f5eee5a7a836d`. The repository contains the registered nine ASAS agent skills under `.agents/skills/` and the canonical architecture/control-plane directories.

These facts are repository-verified only.

## 5. Current unresolved facts

Keep these explicitly unresolved until their evidence exists:

- exact approved Phase 1.5 Domain Model v2;
- exact approved Context Map v2;
- Scheduling ownership;
- live Supabase/database identity and schema;
- production RLS posture;
- current runtime behavior;
- implementation authorization.

## 6. Research behavior

If the repository does not answer a required engineering question, search historical ASAS sources and current authoritative external sources. Use the external source to establish technical knowledge, then derive the smallest safe ASAS-specific conclusion and label it `ENGINEERING-DERIVATION` unless the ASAS source itself establishes the fact.

Do not use external research to silently overwrite a founder decision or live-runtime fact.

## 7. Continuation instruction

At every continuation session, load the evidence-placement register in addition to the Source of Truth, Roadmap, Blueprint, current checkpoint, Master Execution Path, Agent Operating Model, Skills Catalog and applicable amendments.

Resume from the highest-priority unresolved dependency. Do not restart the architecture from zero and do not convert useful information into authority merely by copying it.
