# ASAS Architecture Engineering Roadmap 2026 — Amendment 004
## Evidence Placement & Provenance Discipline

**Status:** ACTIVE
**Effective date:** 2026-09-24
**Parent:** `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`
**Control resource:** `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
**Evidence register:** `docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md`

## 1. Purpose

This amendment formalizes the rule that every newly verified fact, derived conclusion, unresolved conflict, or future reservation must be placed in its designated canonical location rather than copied opportunistically into unrelated architecture documents.

## 2. Placement rule

Before adding information, classify it as:

`SOURCE-VERIFIED | RUNTIME-VERIFIED | TEST-VERIFIED | EXTERNALLY-VERIFIED | SUPPORTED | ENGINEERING-DERIVATION | PROPOSED | UNVERIFIED | CONFLICT | BLOCKED | FOUNDER-DECISION-REQUIRED | ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

Then place it according to concern:

| Concern | Canonical destination |
|---|---|
| Overall architecture target | `ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` |
| Engineering sequence/gates | `ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` + amendments |
| Session loading/continuation rules | `ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` + amendments |
| Consolidated truth/routing | `ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` |
| Domain ownership conflict | context reconciliation / founder decision register |
| Domain contract | applicable `contracts/` artifact |
| Evidence/provenance | reconciliation/evidence register |
| Tasks | canonical task register / task packet |
| Events | event register |
| Permissions | permission register |
| State machines | state-machine register |
| Schema target | schema contract + promotion protocol |
| Live database | live introspection evidence |
| Agent procedure | skills catalog / `.agents/skills/` |
| Design authority | design-to-code continuity contract / design system |

## 3. No duplicate truth

A new file must not duplicate a canonical concept merely because it is convenient. If a canonical artifact can safely absorb the information, update that artifact. Create a separate artifact only when it provides a distinct authority, evidence, contract, or procedure role.

## 4. Current pass result

The 2026-09-24 forensic pass produced the evidence-placement register and routed its summary into the Engineering Source of Truth. The current branch HEAD was verified as `4efb961d5ad1d685d6e69cba7b5f5eee5a7a836d`. Repository-side facts were explicitly kept separate from live runtime claims.

## 5. External research rule

External technical research may strengthen an engineering method but does not become ASAS runtime evidence. Current examples used in this pass include official PostgreSQL locking documentation and official Prisma schema-diff/baselining documentation. These sources support the database reconciliation method; they do not prove the state of ASAS's live database.

## 6. Execution consequence

Future architecture sessions must:

`DISCOVER → CLASSIFY → PLACE → RECONCILE → VERIFY → UPDATE CANONICAL CONTROL → CHECKPOINT`

The agent must not use a source simply because it contains useful information. It must also determine whether that source is authoritative for the particular claim.
