# ASAS Canonical Artifact Register

**Status:** CANONICAL FOUNDATION CONTROL  
**Version:** 1.8  
**Date:** 2026-09-29  
**Active engineering line:** `platform-architecture-2026`

## Purpose

This register defines which repository artifacts are authoritative, derived, operational, evidence, procedure, consolidated control, or historical. It prevents Codex or another agent from treating a referenced artifact as authoritative merely because it exists.

## Authority classes

- **A1 — Source of record:** authoritative business/architecture decision.
- **A2 — Canonical executable shadow:** machine-readable artifact derived from A1 and consumed by tooling.
- **A3 — Operational state:** current verified repository/session state.
- **A4 — Procedure:** workflow/runbook/instruction; cannot override A1/A2.
- **A5 — Evidence:** proof of an observed condition; never a substitute for a contract.
- **A6 — Consolidated engineering control:** cross-source synthesis used for routing, reconciliation and context; cannot silently override an A1 source.
- **H — Historical:** retained for provenance only; never current source of truth.

## Single consolidation resource

`docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`

This is the canonical consolidation/routing resource for the 2026 architecture program. It records provenance, reconciled facts, conflicts, current statuses and next checkpoints. It does not erase source authority.

## Engineering Conference control ownership

| Artifact | Authority | Status | Rule |
|---|---|---|---|
| `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md` | A1/A4 | ACTIVE | Conference constitution; higher-level operating authority |
| `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md` | A1/A6 | ACTIVE / CANONICAL | **Only authoritative GATE-00…GATE-07 semantics** |
| `docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md` | A6 | ACTIVE / CANONICAL | Evidence/closure matrix for gates + C-track/domain work |
| `docs/architecture/DOMAIN-ENGINEERING-TRACK-REGISTER-2026.md` | A6 | ACTIVE / CANONICAL | D01–D09 topology work packages + C01–C22 reconciliation register |
| `docs/governance/FOUNDATION-GATE-MATRIX.md` | A6 | ACTIVE INDEX | Compact operational index; must not redefine gate semantics |
| `docs/governance/FOUNDATION-GATE-REGISTER.md` | A3/A4 | ACTIVE DOWNSTREAM CONTROL | F0–F13 implementation/foundation controls; not conference gates |
| `docs/handoff/CURRENT-SESSION-STATE.md` | A3 | ACTIVE | Sole current checkpoint |

**Numeric collision rule:** GATE-00…GATE-07 belong to the Engineering Conference. F0…F13 belong to downstream foundation/implementation controls. No other document may redefine these numeric sequences without explicit amendment.

## Canonical handoff chain

| Artifact | Authority | Required for Codex | Rule |
|---|---|---:|---|
| `AGENTS.md` | A4 | YES | Root operating contract |
| `docs/handoff/CODEX-START-HERE.md` | A4 | YES | Codex entry point; cannot override higher authority |
| `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` | A4 | YES | Execution sequence |
| `docs/handoff/CURRENT-SESSION-STATE.md` | A3 | YES | Sole current checkpoint |
| `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md` | A4/A6 | YES | Agent operating model |
| `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` | A4/A6 | YES | AI engineering operating context |
| `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` | A6 | YES | Consolidated architecture-engineering routing resource |
| `docs/architecture/ASAS-ARCHITECTURE-V3.md` | A1 | YES when V3 is referenced | Architecture target/reference; does not create a parallel control route |
| `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | A1 candidate | YES | Desired architecture; unresolved items remain blocked |
| `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` | A4/A6 | YES | Ordered engineering route |
| `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md` | A4 | YES | Skill routing and capability catalog |
| `docs/governance/CONTRACT-RECONCILIATION-PROTOCOL.md` | A4 | YES | Conflict resolution |
| `docs/governance/RECONCILIATION-RECORD-TEMPLATE.md` | A4 | WHEN RECONCILING | Evidence format |
| `docs/governance/REPOSITORY-REALITY-MAP.md` | A5/A3-derived | YES for forensic state | Observed repository reality; never overrides contracts |
| `docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md` | A5 | YES for audit continuation | Evidence-backed forensic findings |
| `docs/governance/FOUNDER-DECISIONS.md` | A1 decision boundary | WHEN BLOCKED | Founder/product decision boundary; open items do not authorize implementation |

## Platform identity and brownfield evidence

| Artifact | Authority | Current state | Rule |
|---|---|---|---|
| `config/platform-identity.json` | A2 | FAIL-CLOSED / VERCEL RUNTIME MAPPING OPEN | Machine-readable identity; Supabase project ref is pinned to `oliiumegstqujwexikhr` |
| `scripts/verify-platform-identity.sh` | A4 | PRESENT / SUPABASE REF PINNED | Fails closed on missing/mismatched identity inputs; no runtime mutation |
| `docs/architecture/reconciliation/ASAS-GATE-00-PLATFORM-IDENTITY-EVIDENCE-2026-09-26.md` | A5 | PARTIAL | Supabase identity runtime-verified; Vercel production mapping remains open |
| `docs/architecture/reconciliation/ASAS-GATE-00-VERCEL-ENVIRONMENT-RECONCILIATION-2026-09-26.md` | A5 | OPEN / PARTIAL | Vercel/environment mapping evidence |
| `docs/architecture/reconciliation/ASAS-BROWNFIELD-REALITY-REPORT-2026-09-26.md` | A5 | ACTIVE | Observed repository/runtime reality |
| `docs/architecture/reconciliation/ASAS-BROWNFIELD-DRIFT-MATRIX-2026-09-26.md` | A5/A6 | ACTIVE | Reconciliation control; does not override runtime truth |

## Machine-readable shadows

| Artifact | Authority | State | Verification |
|---|---|---|---|
| `registers/events.json` | A2 | PRESENT | VERIFIED structurally — 103 events / 11 groups |
| `registers/permissions.csv` | A2 | PRESENT | VERIFIED structurally — 50 keys / 8 persona columns |
| `registers/state-machines.json` | A2 | PRESENT | VERIFIED structurally — 11 machines |
| `registers/tasks.index.json` | A2 | PRESENT | OPEN/RECONCILED |
| `registers/tasks/phase-P.json` | A2 | PRESENT | VERIFIED for declared source slice |
| `schema/asas-contracts.index.json` | A2 | PRESENT | OPEN — reconciliation required |
| `schema/asas-contracts.prisma` | A2 | NOT PRESENT | BLOCKED until complete source extraction/reconciliation and authorization |
| `registers/tasks.json` | A2 | NOT PRESENT | BLOCKED; source semantics represented by shards/indexes |
| `design/design-tokens.json` | A2 | PRESENT | SOURCE-DERIVED |
| `design/component-inventory.md` | A2 | PRESENT | VERIFIED structurally — 42 primitives |

## Canonicality rules

1. One concept has one canonical owner.
2. A derived artifact cannot silently redefine its source.
3. Historical artifacts remain available for provenance.
4. Runtime facts are not replaced by target architecture.
5. Missing canonical artifacts are foundation gaps, not permission to invent replacements.
6. Conflicts remain `CONFLICT` until authority resolves them.
7. `VERIFIED` requires objective evidence.
8. Branch content does not become canonical merely because it is newer or more detailed.
9. The consolidated Source of Truth is routing/control, not permission to flatten provenance.
10. The Engineering Conference Gate Model is the sole owner of GATE-00…GATE-07 semantics.
11. The Closure Matrix owns evidence/closure status; it cannot rewrite architecture authority.
12. C01–C22 remain conference track IDs; D01–D09 organize V3 bounded-context ownership and do not replace C numbering.

## Branch consolidation rule

Historical branches may be reviewed for provenance and unique evidence. They are not active architecture authority. Branch deletion is not performed by pretending a ref move is deletion; deletion requires an appropriate GitHub capability and provenance verification.

## Promotion rule

An artifact becomes canonical only when:

1. authority source is identified;
2. provenance is recorded;
3. terminology and IDs are reconciled;
4. internal references resolve;
5. required validation passes;
6. gate status is updated with evidence.

## Anti-drift rule

Never edit a canonical register merely to make it agree with implementation. If implementation conflicts with a register, stop, classify the conflict and reconcile the contract first.

## Forensic correction

Presence of event/permission/state-machine/design shadows is not equivalent to runtime enforcement.

## Codex control-plane verification

Repository-side skill discovery is enforced by `.github/workflows/foundation-verify.yml`. A green repository check does not by itself prove that a live Codex session loaded or executed a skill; runtime agent discovery remains `NOT_EXECUTED` until Codex-side evidence exists.
