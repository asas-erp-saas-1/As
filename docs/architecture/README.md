# ASAS — Architecture Program Index 2026

**Status:** ACTIVE NAVIGATION / ORGANIZATIONAL CONTROL (A6)
**Branch:** `platform-architecture-2026`
**Repository:** `asas-erp-saas-1/As`
**Owner:** Lead Architecture
**Last reconciled:** 2026-10-14

> This index is navigation and organizational control only. It does not create
> authority, does not close a gate, and does not override any A1/A2 artifact.
> Where this index and a canonical artifact disagree, the canonical artifact wins
> and this index is corrected.

## 1. Purpose and rule

The architecture corpus grew by accretion. It now contains 230+ files across
`docs/architecture/` and its subdirectories, with several historical naming
lineages, two amendment directories, two ADR directories and two audit
directories. That is provenance, not chaos — but it is not navigable.

**Organizational rule (inherited, not invented):**

`docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md` §2 rule 13 states that
existing historical artifacts are **not bulk-moved merely for cosmetic
organization**. They are indexed and reconciled first; relocation happens only
when canonical ownership is proven and the move destroys no provenance and
creates no duplicate authority.

Therefore this program organizes by **index and reconciliation**, not by mass
`git mv`. Every physical location below is recorded as-is.

## 2. Control plane (load in this order)

| Order | Artifact | Authority |
|---|---|---|
| 1 | `AGENTS.md` | A4 root operating contract |
| 2 | `docs/handoff/CURRENT-SESSION-STATE.md` | A3 sole active checkpoint |
| 3 | `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md` | A1/A6 sole owner of GATE-00…GATE-07 |
| 4 | `docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md` | A6 evidence/closure owner |
| 5 | `docs/architecture/DOMAIN-ENGINEERING-TRACK-REGISTER-2026.md` | A6 D01–D09 + C01–C22 register |
| 6 | `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` | A6 consolidation/routing |
| 7 | `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` | A6 artifact authority classes |
| 8 | `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` + amendments | A4 route |
| 9 | `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` + amendments | A4 execution sequence |
| 10 | affected contract / register / ADR / task packet | A1/A2 |

## 3. Directory map

| Path | Contents | Authority role |
|---|---|---|
| `docs/architecture/` (root) | Program-level control, blueprints, context prompts, roadmaps, cross-domain registers, plus a historical naming lineage of `ASAS-*-CONTRACT/REGISTER-2026.md` files | Mixed A1/A4/A6 + H |
| `docs/architecture/conference/` | Constitution, Gate Model, founder-decision gate | A1/A4/A6 |
| `docs/architecture/contracts/` | Canonical domain contracts (25 files) | A1 |
| `docs/architecture/decisions/` | ADR-0021…0034 | A1 |
| `docs/architecture/adr/` | ADR-0035…0037 | A1 |
| `docs/architecture/amendments/` | Second amendment lineage (Roadmap/SoT/Context amendments 005–016) | A4 |
| `docs/architecture/research/` | Research records (C02/C03/C06, environment mapping) | A5 |
| `docs/architecture/reconciliation/` | Cross-source reconciliation evidence | A5/A6 |
| `docs/architecture/reconciliation/phase-c/C01…C22/` | One canonical directory per conference track | A6 organizational |
| `docs/architecture/reconciliation/phase-c/Source/` | Filename-based C-track discovery corpus (index layer, **not** a second source of truth) | A5 index |
| `docs/architecture/task-packets/` | Authorized work packets | A4 |
| `docs/governance/` | Repository governance, closure, CI and gate controls | A3/A4/A6 |
| `docs/audit/` + `docs/audits/` | Forensic/audit evidence — **two sibling directories, one singular and one plural** | A5 |
| `registers/`, `schema/`, `design/`, `config/` | Machine-readable shadows | A2 |

**ADR index:** `docs/architecture/ASAS-ADR-REGISTER-2026.md`
**Integrity findings:** `docs/architecture/reconciliation/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md`

## 4. Current status dashboard (as recorded, not as claimed)

Gates — authoritative semantics owned by the Gate Model; evidence state owned by
the Closure Matrix and the checkpoint.

| Gate | State |
|---|---|
| GATE-00 Platform Identity & Control Plane | OPEN / BLOCKED FOR FINAL IDENTITY PROOF |
| GATE-01 Architecture Authority & Canonical Baseline | IN PROGRESS / REBASELINED |
| GATE-02 Domain Topology & Ontology | PENDING |
| GATE-03 Contracts, Invariants & Behaviour | PENDING |
| GATE-04 Kernel, Security, Tenancy & Data Governance | PENDING |
| GATE-05 Experience, Integration & Operations | PENDING |
| GATE-06 Engineering System & AI-Agent Governance | PENDING |
| GATE-07 Slice-Specific Implementation Authorization | NOT AUTHORIZED |

C-track semantic state (evidence-backed only):

| Track | Scope established from repository evidence | State |
|---|---|---|
| C01 | not recovered from a canonical track artifact | MAPPING OPEN |
| C02 | Inventory authority / attribution / competition | ACTIVE, closure mapping OPEN |
| C03 | Real Estate domain semantics / resource model | **OPEN / BLOCKED** |
| C04 | CRM | SEMANTIC BASELINE, convergence OPEN |
| C05 | Sales | SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED |
| C06 | Finance | SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED |
| C07–C14, C16–C22 | not recovered | MAPPING OPEN |
| C15 | Security/Tenancy (referenced downstream, artifact not recovered) | MAPPING OPEN |

Authorization is unchanged: `implementationAuthorized = false`,
`schemaDesignAuthorized = false`, `databaseCreationAuthorized = false`,
`migrationAuthorized = false`, `codeFeatureImplementationAuthorized = false`.

## 5. Amendment inventory

Two physical amendment lineages coexist and their numbers overlap. Neither is
wrong; there is simply no global registry. Recorded here so it stops being a
navigation trap.

| Parent | Root `docs/architecture/` | `docs/architecture/amendments/` |
|---|---|---|
| Context Prompt | 002, 003, 004-CODEX-FIRST, 005, 006, **004-AGENT-SKILLS** | 006-RESEARCH-FIRST-CODEX, 012-AGENT-ROUTING |
| Roadmap | 002, **003**, **003-CODEX-FIRST**, 004, **005**, 006-ZERO-TRUST | **005**, 008, 009, 010, 011, 012, 013, 014, 016 |
| Source of Truth | — | 007, 011, 014, 015 |
| Other | AGENT-SKILLS-AMENDMENT-001 | ARCHITECTURE-GATE-ROUTE-001, CANONICAL-ARCHITECTURE-013, CONFERENCE-GOVERNANCE-CORRECTION-008, CONFERENCE-PATH-002/003, SINGLE-ENGINEERING-PATH-007, C02-INVENTORY-AUTHORITY-015 |

Collisions in **bold**: two different Context Prompt amendments numbered 004, two
different Roadmap amendments numbered 003, and two different Roadmap amendments
numbered 005. All colliding files remain in place for provenance. New amendments
must carry the parent name, a unique number and a descriptive slug.

## 6. Navigation rules for agents

1. Never treat a file's existence as evidence of its authority — check the
   Canonical Artifact Register class first.
2. Never close a gate, C-track or domain by editing an index. Closure requires
   the evidence path in `ENGINEERING-CLOSURE-MATRIX-2026.md` §13.
3. Never invent a missing canonical artifact. Record the gap instead.
4. A conflict stays `CONFLICT` until an authority resolves it.
5. Branch content is not canonical because it is newer.
6. Referenced-but-absent artifacts are tracked in the integrity review with
   their recovery provenance.
7. Every C-track keeps exactly one directory under
   `docs/architecture/reconciliation/phase-c/CNN/`.

## 7. Recent material decisions

| Date | Artifact | Effect |
|---|---|---|
| 2026-10-14 | `adr/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md` | Nine canonical commercial states, six construction states; two-hop release; mandatory `HELD` waypoint; deposit trigger; event semantics. Supersedes the enum lists of `ADR-0028`, `ADR-0031`, `ADR-0033` and three contracts |
| 2026-10-14 | `adr/ADR-0039-UNIT-APARTMENT-CANONICAL-IDENTITY-2026-10-14.md` | `Unit = Apartment`: one identity, `apartment.*` as the source namespace |
| 2026-10-14 | `adr/ADR-0040-INVENTORY-AVAILABILITY-OWNERSHIP-2026-10-14.md` | Availability *is* the Unit commercial dimension; no separate Inventory entity |
| 2026-10-14 | `contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` | Hold identity and conditional expiry (suppressed while a reservation references the Unit) |
| 2026-10-14 | `reconciliation/ASAS-REGISTER-DELTA-2026-10-14.md` | F-07 resolved with zero register edits; F-08 permission deltas proposed, awaiting owner ratification |
| 2026-10-14 | `reconciliation/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md` | Corpus integrity findings F-01…F-15 and the resolution log |
| 2026-10-14 | `reconciliation/ASAS-CI-REPAIR-2026-10-14.md` + `.patch` | CI control-plane repair (blocked on `workflows` permission) |
