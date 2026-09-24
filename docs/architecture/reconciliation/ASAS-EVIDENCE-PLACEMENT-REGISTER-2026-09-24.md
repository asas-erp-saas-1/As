# ASAS Evidence Placement Register — 2026-09-24

**Artifact ID:** ASAS-EVIDENCE-PLACEMENT-2026-09-24
**Status:** ACTIVE / EVIDENCE REGISTER
**Authority:** Reconciliation artifact; does not override founder decisions, live runtime, approved contracts, or the canonical architecture blueprint.
**Branch:** `platform-architecture-2026`
**Purpose:** Record verified information discovered during the current forensic architecture pass and place each fact in its correct architectural location without promoting inference to truth.

## 1. Repository identity evidence

**Verified:** The canonical repository is `asas-erp-saas-1/As` and the active architecture branch is `platform-architecture-2026`.

**Verified current HEAD after this pass:** `14ae56388bce0cddf05e809c2f22eba66019bc94`.

**Previous verified source-of-truth update HEAD:** `71a9392addaae3a2c9fcdebfec627a67a501fc1a`.

**Evidence:** GitHub branch metadata and repository tree. The branch contains `AGENTS.md`, `.agents/skills/`, `.github/workflows/`, `docs/architecture/`, `docs/handoff/`, contracts, reconciliation artifacts, and design artifacts.

**Placement:** Repository identity / control plane. Do not copy this as runtime identity evidence.

## 2. Agent engineering surface

The branch contains a registered `.agents/skills/` surface with nine ASAS skills:

- `asas-architecture-governance`
- `asas-database-engineering`
- `asas-design-fidelity`
- `asas-domain-contracts`
- `asas-engineering`
- `asas-observability-reliability`
- `asas-repository-forensics`
- `asas-security-ai-safety`
- `asas-testing-verification`

**Evidence:** Repository tree at the active architecture branch.

**Placement:** Agent operating environment / skills catalog. These are procedural controls and do not become architecture authority.

## 3. Canonical control-plane artifacts

The repository currently identifies the following control-plane resources:

- `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` — consolidation/routing resource.
- `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — architecture target.
- `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — engineering route.
- `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — continuation/loading context.
- `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` — execution path.
- `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md` — agent operating model.
- `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` — artifact authority register.
- `docs/governance/FOUNDER-DECISIONS.md` — founder decision boundary.
- `docs/handoff/CURRENT-SESSION-STATE.md` — sole active checkpoint.

**Placement:** Canonical control plane. Do not create another competing "master" source for these same concepts.

## 4. Context authority

Current target bounded-context grouping remains:

`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

The historical 15-module proposal is implementation evidence, not a second bounded-context architecture. Context and module must remain separate concepts.

**Status:** Current target / architecture baseline; repository-to-runtime implementation mapping remains subject to verification.

**Placement:** Domain architecture / context authority.

## 5. Scheduling

Scheduling ownership remains unresolved. Current architecture materials contain conflicting provenance between the Master Spec/current CRM placement and historical ADR-0018/Core placement.

**Status:** `FOUNDER-DECISION-REQUIRED`.

**Rule:** Do not reassign persistence ownership, event ownership, permissions, or dependency direction until the authority conflict is closed.

**Placement:** Founder decision register + context reconciliation, not implementation code.

## 6. Building

`Building` is verified as a real-estate structural domain concept in the current reconciliation work. Historical evidence supports the existence of a Building schema concept, but that evidence does not prove the current executable schema or live database representation.

**Status:** `OPEN / IMPLEMENTATION BLOCKED`.

**Placement:** Building domain contract + schema provenance/reconciliation. Do not invent a table, aggregate root, cardinality, or migration from the historical evidence alone.

## 7. Offer / Reservation

Current domain safety establishes:

- Opportunity stage is distinct from Offer lifecycle state.
- Approved Offer does not itself create inventory ownership.
- Reservation is the single-winner consistency boundary for a Unit.
- Offer implementation remains blocked until lifecycle, authorization, approval, idempotency, and concurrency semantics are closed.

**Placement:** Sales domain contract + Reservation consistency contract + invariant register.

## 8. Database engineering

The repository explicitly separates:

`Target Domain Model != Schema Contract != Prisma Contract != Migration History != Live Database`

The required brownfield sequence remains:

`Introspect → Capture → Drift Inventory → Compare → ADR → Migration Plan → Backup Verification → Rehearsal → Forward-only Migration → Verification → Evidence`

Current external verification also confirms that Prisma provides schema-diff tooling and brownfield baselining workflows; these are implementation references, not proof of ASAS runtime state. PostgreSQL documents row-level locking as an available concurrency control when application correctness requires explicit locking.

**External evidence:** Prisma documentation on `migrate diff` and baselining; PostgreSQL 17 explicit-locking documentation.

**Placement:** Database architecture / persistence reconciliation / research evidence. No production migration is authorized by this entry.

## 9. AI authority

AI remains a non-authoritative actor:

`Intent → Proposal → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`

AI does not receive direct database authority and cannot widen caller permissions.

**Placement:** AI governance / agent operating model / security contract.

## 10. Design-to-code authority

Design artifacts are upstream inputs to implementation, but Figma itself is not the authorization source. Accepted design contracts and architecture contracts authorize implementation.

The repository contains a design system surface and an explicit design-to-code continuity contract.

**Placement:** Design architecture / design-to-code contract.

## 11. Scope protection

The following remain architectural reservations rather than automatic implementation requirements unless separately authorized:

- microservices;
- Kafka;
- Kubernetes/service mesh;
- multi-region;
- global data lake;
- ontology database;
- marketplace;
- autonomous finance;
- broad action-taking AI;
- advanced construction ERP;
- global multi-country platform capabilities.

**Placement:** Architecture blueprint non-goals/future reservations and roadmap scope control.

## 12. Evidence classification rule

Every newly discovered item must be placed into exactly one evidence class before it is reused:

`SOURCE-VERIFIED | RUNTIME-VERIFIED | TEST-VERIFIED | EXTERNALLY-VERIFIED | SUPPORTED | ENGINEERING-DERIVATION | PROPOSED | UNVERIFIED | CONFLICT | BLOCKED | FOUNDER-DECISION-REQUIRED | ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

A source-package claim is not runtime proof. A historical branch is not current authority. A design proposal is not an implementation contract.

## 13. Branch provenance and V2 authority recovery — 2026-09-24

A repository branch inventory confirmed numerous historical feature/foundation branches and the active `platform-architecture-2026` branch. Architecture-authority inspection specifically covered:

- `foundation/architecture-lineage-reconciliation-v1` — contains the architecture-lineage reconciliation contract;
- `foundation/source-authority-ledger-v1` — explicitly records that the exact approved Phase 1.5 Domain Model v2 and Context Map v2 are unlocated;
- `foundation/reconcile-context-map-v2` — contains a 15-module candidate map and ADR-0001, with ADR status `PROPOSED — awaiting explicit founder acceptance`;
- `foundation/blueprint-canonical-shadows` — inspected architecture directory does not expose the missing approved v2 domain artifact;
- `foundation/blueprint-register-ingestion` — direct lookup of the expected `ASAS_Enterprise_Domain_Model.md` path did not locate that artifact on the branch.

**Conclusion:** the exact approved Phase 1.5 Domain Model v2 and Context Map v2 remain **UNLOCATED / UNVERIFIED**. This is not evidence that the artifacts never existed. It is evidence that the inspected branch set did not recover them. The historical 15-module candidate remains a proposal and cannot be promoted by inference.

**Placement:** Context authority reconciliation / source provenance ledger / checkpoint. Do not create a synthetic "approved v2" document from the missing evidence.

## 14. Event and permission register placement

The current `registers/events.json` states `103 events across 11 emission modules` and explicitly notes that emission groups are routing lanes, not bounded contexts. It also requires events to be represented in the register and committed through transactional outbox semantics. This is register evidence, not proof of runtime event execution.

The current `registers/permissions.csv` contains commercial vocabulary including `offer.create`, `offer.discount.request`, and `reservation.create`. Presence in the register establishes declared authorization vocabulary only; runtime enforcement remains unverified.

**Placement:** Event register / permission register / verification backlog.

## 15. Next reconciliation dependency

The next architectural dependency is not schema coding. It is closure of the remaining domain-authority blockers:

`V2 Authority Recovery → Building → Offer → Finance → Scheduling → Cross-context contracts → Data reconciliation → Security/Tenancy → Architecture-as-Code → Implementation authorization`

No evidence in this register authorizes application-code or production-database changes.
