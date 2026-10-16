# ASAS Canonical Artifact Register

**Status:** CANONICAL FOUNDATION CONTROL  
**Version:** 1.14  
**Date:** 2026-10-16  
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
| `docs/architecture/README.md` | A6 | PRESENT / NAVIGATION ONLY | Engineering corpus index; does not create authority or close gates |
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

## Branch and corpus inventory

| Artifact | Authority | Current state | Rule |
|---|---|---|---|
| `docs/governance/BRANCH-HYGIENE-REGISTER.md` | A6/A4 | ACTIVE REPOSITORY CONTROL | Branch policy and cleanup safeguards; no destructive Git action is authorized by this register |
| `docs/governance/BRANCH-INVENTORY-AND-RECONCILIATION-2026-10-14.md` | A5 | DATED SNAPSHOT / REVIEW REQUIRED | Evidence snapshot of observed refs and compare results; recheck PRs, deployments and unique commits before cleanup |
| `docs/governance/ENGINEERING-BRANCH-CONSOLIDATION-2026-10-16.md` | A5/A6 | LIVE CONSOLIDATION CONTROL / RETIREMENT PENDING | Records the canonical engineering line, exact branch-head groups, PR dispositions, promotion evidence and safe retirement criteria; default-branch migration is now verified, while branch deletion remains pending |
| `README.md` | A6 | REPOSITORY FRONT DOOR | Navigation and project orientation; must not override canonical controls |
| `docs/architecture/README.md` | A6 | ACTIVE NAVIGATION INDEX | Architecture corpus navigation; not a source of decisions or implementation authority |
| `docs/architecture/reconciliation/ASAS-UNMERGED-BRANCH-PROMOTION-REVIEW-2026-10-15.md` | A5/A6 | DATED PROMOTION REVIEW | File-level review of unmerged branch evidence; authorizes no merge, closure, or implementation |
| `docs/architecture/reconciliation/BRANCH-ARTIFACT-PROMOTION-REGISTER-2026-10-16.md` | A5/A6 | LIVE PROMOTION / RETIREMENT LEDGER | Records exact source SHAs, promoted/candidate/discard dispositions and branch retirement gates |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/` | A5 / PROPOSED | CANDIDATE EVIDENCE ARCHIVE | Preserves unratified ADRs, candidate contracts, context-map proposals and integrity findings; source-branch status labels do not become canonical approval |
| `docs/architecture/EXTERNAL-INTEGRATION-ECOSYSTEM-STRATEGY.md` | A5 / PROPOSED | HISTORICAL INTEGRATION STRATEGY | Preserved from the September source corpus; provider recommendations require fresh validation and owner acceptance |
| `docs/audit/B6-ALGERIA-PAYMENT-PROVIDER-FEASIBILITY.md` | A5 / EVIDENCE | DATED PAYMENT RESEARCH | Source-era capability findings only; current provider/API/legal onboarding must be revalidated |
| `docs/audit/B6-COMMAND-EVENT-TRANSACTION-MATRIX.md` | A5 / PROPOSED | CANDIDATE TRANSACTION MATRIX | No permission/event/register mutation authorized |
| `docs/audit/B6-RESERVATION-HOLD-DEPOSIT-ATOMICITY.md` | A5 / PROPOSED | CANDIDATE ATOMICITY CONTRACT | Concurrency and hold/deposit policy remains gated |
| `docs/audit/CONCURRENCY-RACE-CATALOG.md` | A5 / PROPOSED | CANDIDATE RACE CATALOGUE | Mechanism selection and race-test execution remain open |
| `docs/audit/FINANCE-CORRECTNESS-CONTRACT.md` | A5 / PROPOSED | CANDIDATE FINANCE CONTRACT | Accounting and commercial policies remain open |
| `docs/audit/IDEMPOTENCY-CATALOG.md` | A5 / PROPOSED | CANDIDATE IDEMPOTENCY CATALOGUE | Derivation, retention, and storage details remain source-open |
| `docs/audit/OUTBOX-INBOX-CONTRACT.md` | A5 / PROPOSED | CANDIDATE OUTBOX/INBOX CONTRACT | Reliability pattern candidate; no runtime implementation proof |
| `docs/security/SECURITY-CONTROL-MATRIX.md` and `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md` | A5 / DESIGN ONLY | HISTORICAL SECURITY CANDIDATES | Preserved for review; no security control implementation or gate closure implied |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/` | A5 / HISTORICAL | HISTORICAL PRODUCT / DESIGN / RESEARCH EVIDENCE | Contains source-era product-scope, UX, quality, technology, persona/autonomy, invariant and dependency artifacts; each carries source SHA and candidate warning |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/source-ingestion-candidates/` | A5 / PROPOSED | SOURCE-INGESTION CANDIDATES | Older ingestion/provenance/validation plans preserved without replacing canonical manifest, task map or schema index |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/main-divergent-source/Source-README-from-main.md` | A5 / HISTORICAL | LEGACY `main` FILE PRESERVATION | Retained for provenance only; canonical Source Corpus README remains authoritative |
| `docs/architecture/DOMAIN-OWNERSHIP-AND-TRACEABILITY-CONTRACT.md` | A4 / PROPOSED | WORKING CONTRACT | Traceability only; C2-001/ADR-0021 acceptance remains a hard stop |
| `docs/architecture/EVENT-OWNERSHIP-TRACEABILITY-WAVE-2.md` | A4 / PROPOSED | WORKING TRACEABILITY | Derived from event register and working contracts; does not redefine event ownership authority |
| `docs/architecture/EVENT-STATE-PERMISSION-TRACEABILITY-MATRIX.md` | A5 / PROPOSED | WORKING TRACEABILITY MATRIX | Derived view; canonical event/state/permission registers remain the source of record |
| `docs/architecture/STATE-MACHINE-IMPLEMENTATION-CONTRACT.md` | A4 / PROPOSED | PRE-IMPLEMENTATION CONTRACT | No schema, migration, or application implementation authorization |
| `docs/audit/PLATFORM-IDENTITY-VERIFICATION-CONTRACT.md` | A4 / PROPOSED | GATE-00 SAFETY PROCEDURE | Defines fail-closed evidence needs; does not verify/select runtime resource identity |
| `docs/governance/TASK-REGISTER-RECONCILIATION-PROTOCOL.md` | A4 / PROPOSED | TASK COUNT RECONCILIATION PROCEDURE | Preserves 114 vs 119 discrepancy; no source task is renumbered/deleted to force agreement |

## C03 source corpus and reconciliation controls

| Artifact | Authority | State | Rule |
|---|---|---|---|
| `docs/architecture/reconciliation/phase-c/Source/README.md` | A5/A6 | ACTIVE INDEX | Source-corpus navigation; source presence does not confer canonical authority |
| `docs/architecture/reconciliation/phase-c/Source/C03/00-SOURCE-REGISTER.md` | A5/A6 | ACTIVE SOURCE INDEX | Classifies C03 source material; does not duplicate decision authority |
| `docs/architecture/reconciliation/phase-c/C03/02-SOURCE-RECONCILIATION-QUEUE.md` | A6 | OPEN WORK QUEUE | Tracks required source reconciliation, red-team review and independent closure review; does not close C03 |

## Engineering delivery workflow

| Artifact | Authority | Status | Rule |
|---|---|---|---|
| `docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md` | A4 | ACTIVE OPERATIONAL PROCEDURE | Task-to-merge, verification, review, post-merge evidence and recovery; cannot redefine authority or gates |
| `docs/governance/ENGINEERING-TASK-PACKET-TEMPLATE-2026.md` | A4 | TEMPLATE | Reuse for material work or an equivalent task packet; not itself authorization |
| `docs/governance/ENGINEERING-EVIDENCE-RECORD-TEMPLATE-2026.md` | A4 | TEMPLATE | Records exact tested commit, checks, outcome and evidence; not proof until populated |
| `docs/governance/work-items/ENG-WORKFLOW-2026-10-16-01.md` | A4/A5 | COMPLETED CONTROL-PLANE WORK ITEM | Scope and acceptance criteria for workflow/verifier promotion |
| `docs/governance/evidence/ENG-WORKFLOW-2026-10-16-01-EVIDENCE.md` | A5 | DATED VERIFICATION RECORD | Evidence for the source workflow task; do not generalize it to later heads |
| `scripts/verify-engineering-workflow.sh` | A4 | STRUCTURAL CI CHECK | Validates control-file anchors; does not prove approval, runtime state, gate closure or deployment success |
| `.github/PULL_REQUEST_TEMPLATE.md` | A4 | ACTIVE TEMPLATE | Enforces task scope, authority, safety, verification and disposition fields |

## Source, task and audit reconciliation evidence

| Artifact | Authority | Status | Rule |
|---|---|---|---|
| `docs/architecture/SOURCE-AUTHORITY-LEDGER.md` | A5/A6 | RECONCILIATION REQUIRED | Distinguishes claimed approval from source artifacts actually identified; does not synthesize missing Domain Model v2 |
| `docs/architecture/ARCHITECTURE-LINEAGE-RECONCILIATION.md` | A4/A6 | PROPOSED CONTROL | Defines evidence states and non-equivalence between contexts, modules, schemas and aggregates; does not resolve C2-001 itself |
| `docs/handoff/CLAUDE-AGENT-OPERATING-PROTOCOL.md` | A4 | NON-IMPLEMENTATION PROCEDURE | Agent operating procedure subordinate to `AGENTS.md`, canonical governance and approved decisions |
| `docs/audit/FOUNDATION-EXTERNAL-DEEP-AUDIT-2026-09-18.md` | A5 | DATED EXTERNAL AUDIT | Historical findings to reproduce against current state; not a current runtime claim |
| `docs/governance/EXTERNAL-AUDIT-INTEGRATION-PLAN.md` | A4/A6 | CONTROLLED WORK PLAN | Routes audit findings into existing controls; does not override canonical authority |
| `docs/governance/BLUEPRINT-REGISTER-RECONCILIATION-REPORT.md` | A5 | OPEN / SOURCE-COUNT RECONCILIATION | Preserves 114-vs-119 task and 59/17/56 schema observations without normalizing counts |
| `registers/tasks.source-map.json` | A2/A5 | SOURCE MAP / RECONCILIATION REQUIRED | Lists source task IDs by phase; is not a complete canonical task body or implementation authorization |
| `registers/BLUEPRINT-SOURCE-OBSERVATIONS.json` | A5 | PROVENANCE MANIFEST / RECONCILIATION REQUIRED | Retains source hashes and observed metrics; extraction evidence does not promote task or schema content automatically |

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
