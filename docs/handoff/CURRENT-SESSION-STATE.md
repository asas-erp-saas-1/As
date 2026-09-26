# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE ENGINEERING CHECKPOINT  
**Version:** 3.28  
**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase

`ARCHITECTURE ENGINEERING — RESEARCH-FIRST + SOURCE-VALIDATION → C03 REAL ESTATE DOMAIN`

## 2. Current checkpoint

`ARCH-2026-H1.13-C03-UNIT-SEMANTICS-CLOSED-01`

This file remains the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## 3. Conference decisions closed to date

- broad Real Estate Operating System + future SaaS direction;
- extensible multi-organization model;
- Organization as business principal;
- Developer authoritative Project/Inventory ownership as the initial/common case, while the platform supports other inventory actors;
- first-class Organization Relationship;
- Hybrid D collaboration boundary: Relationship + Project context + Resource Scope;
- Hybrid E configurable Developer partner-performance visibility;
- Hybrid D employee authorization: relationship + team/role + project assignment + individual exception;
- `Visibility follows responsibility` principle;
- Workspace as operational/UX container, not automatic security boundary;
- Branch as organizational subdivision, not automatic tenant boundary;
- nine canonical bounded contexts; historical 15-module material is implementation/provenance evidence, not a competing bounded-context model;
- Lead ownership ≠ operational assignment ≠ source attribution ≠ commercial attribution ≠ commission entitlement ≠ commission payout;
- reservation/sale attribution is snapshotted at the governing milestone;
- Inventory ownership ≠ inventory visibility ≠ commercial allocation ≠ reservation control;
- Developer internal sales team is a valid sales actor;
- Agency may own/control its own inventory and may also represent another organization's inventory;
- organization type does not automatically determine commercial priority;
- allocation/priority is configurable by Project/Inventory Batch within platform invariants;
- same-tier competition resolves by the first valid reservation transaction to commit successfully against the Unit single-winner boundary;
- if no allocation/priority applies, first valid committed reservation is the deterministic fallback;
- Hold is distinct from Reservation;
- manual adjudication is available for attribution disputes and audited overrides;
- Scheduling is a Core-hosted platform capability, not a separate bounded context and not CRM-owned persistence;
- Commission is Finance-owned, policy-versioned, milestone-derived, snapshot-based and distinct from payout;
- Offer is Sales-owned, versioned and distinct from Hold/Reservation;
- Real Estate Resource is a conceptual category, not a mandatory universal database entity;
- development inventory uses Unit as the canonical resource;
- brokerage uses Listing under Owner/Mandate semantics;
- Building is a first-class structural domain/ontology object but optional at Project topology level;
- Floor is optional;
- Unit identity is stable and does not depend on human numbering;
- Project is a first-class development/commercial domain object and the primary development collaboration context;
- Project visibility is authorization-derived and does not imply ownership transfer;
- Project publication is a projection and is not a second source of truth;
- Project semantics are closed while lifecycle, inventory batches, pricing, permissions and persistence remain separate gated slices;
- Building semantics are closed: Building is a structural entity under Project, optional at topology level, not automatically an aggregate root, and not a commercial/financial/security principal;
- Project → Building → [Floor] → Unit and Project → Building → Unit are both valid development topologies;
- Building identity is stable and independent of mutable reference/name/slug;
- Building-scoped access derives from Relationship + Project Context + Resource Scope + Permission; the Building record itself grants no authority;
- Floor semantics are closed: Floor is a structural level object when independent floor-level semantics are required, but a standalone Floor entity is not mandatory merely because a Unit has a floor/level value;
- Floor technical identity, when represented as an entity, is stable and independent of display numbering/labels;
- Floor is not automatically an aggregate root or security boundary;
- **Unit is the canonical development-inventory domain entity with stable technical identity;**
- **Unit may exist directly under Project or through optional Building/Floor topology;**
- **Unit human reference/number/slug is mutable business/display identity, not technical identity;**
- **Unit commercial state and construction state are independent dimensions;**
- **Unit does not own Reservation, Contract, Payment, Commission, Lead, Listing or Media lifecycles; those reference Unit through their own contracts;**
- **Unit ownership ≠ visibility ≠ allocation ≠ reservation control;**
- **Unit reservation is a critical single-winner consistency boundary, while the exact database mechanism remains implementation-gated;**
- **Unit price is a versioned commercial fact, not immutable Unit identity;**
- **Development Unit and brokerage Listing remain distinct domain concepts.**
- Codex as primary engineering executor;
- Claude/Figma as design collaboration path;
- v1.6.1 as architect research/provenance input, not coding-agent authority.

## 4. Canonical control plane

- Product requirements: `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` — PROPOSED / FOUNDER REVIEW REQUIRED
- Blueprint: `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — PROPOSED v1.5.1
- Roadmap: `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — ACTIVE
- Conference: `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md` — ACTIVE / CANONICAL DECISION WORKSTREAM
- Context Prompt: `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — ACTIVE
- Master Execution Path: `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
- Source of Truth: `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
- Research-first method: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md` — CANONICAL
- Scheduling ADR: `docs/architecture/decisions/ADR-0021-SCHEDULING-OWNERSHIP-2026-09-26.md` — ACCEPTED
- Commission ADR: `docs/architecture/decisions/ADR-0022-COMMISSION-ENTITLEMENT-SEMANTICS-2026-09-26.md` — ACCEPTED / SEMANTICALLY CLOSED
- Offer ADR: `docs/architecture/decisions/ADR-0023-OFFER-LIFECYCLE-SEMANTICS-2026-09-26.md` — ACCEPTED / SEMANTICALLY CLOSED
- Real-estate resource ADR: `docs/architecture/decisions/ADR-0024-REAL-ESTATE-RESOURCE-IDENTITY-2026-09-26.md` — ACCEPTED / C03.1–C03.2 SEMANTICALLY CLOSED
- Project ADR: `docs/architecture/decisions/ADR-0025-PROJECT-DOMAIN-SEMANTICS-2026-09-26.md` — ACCEPTED / C03.3 SEMANTICALLY CLOSED
- Building ADR: `docs/architecture/decisions/ADR-0026-BUILDING-DOMAIN-SEMANTICS-2026-09-26.md` — ACCEPTED / C03.4 SEMANTICALLY CLOSED
- Floor ADR: `docs/architecture/decisions/ADR-0027-FLOOR-DOMAIN-SEMANTICS-2026-09-26.md` — ACCEPTED / C03.5 SEMANTICALLY CLOSED
- Unit ADR: `docs/architecture/decisions/ADR-0028-UNIT-DOMAIN-SEMANTICS-2026-09-26.md` — ACCEPTED / C03.6 SEMANTICALLY CLOSED
- Project domain contract: `docs/architecture/contracts/ASAS-PROJECT-DOMAIN-CONTRACT-2026.md` — PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
- Unit domain contract: `docs/architecture/contracts/ASAS-UNIT-DOMAIN-CONTRACT-2026.md` — PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
- Building research: `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-BUILDING-2026-09-26.md` — ACCEPTED RESEARCH BASIS
- Floor research: `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-FLOOR-2026-09-26.md` — ACCEPTED RESEARCH BASIS
- Unit research: `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-UNIT-2026-09-26.md` — ACCEPTED RESEARCH BASIS
- Historical Building contract reference: `docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026-09-24.md` — NOT VERIFIED IN CURRENT BRANCH CONTENT ENDPOINT; do not treat as current repository evidence until recovered/reconciled
- Inventory competition contract: `docs/architecture/contracts/ASAS-INVENTORY-CHANNEL-PRIORITY-AND-RESERVATION-COMPETITION-CONTRACT-2026.md` — PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
- Evidence register: `docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md`
- Skills catalog: `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`
- Agent operating model: `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md`
- Design/code continuity: `docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`

## 5. Operating method

`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Founder product/business decisions define desired future behavior. Sources and research are used to discover omissions, contradictions, risks, and better alternatives; they do not override a founder-approved decision. Brownfield runtime/repository facts remain authoritative for what is already implemented.

## 6. C02 status

`C02 SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED`

Remaining C02 implementation/reconciliation work is evidence-driven:

- exact Project Inventory Access permission mapping;
- brownfield persistence reconciliation;
- reservation concurrency mechanism;
- event/state/permission registration;
- Finance executable contract details.

## 7. C03 status

`C03.1 RESOURCE IDENTITY CLOSED / C03.2 ASSET TAXONOMY CLOSED / C03.3 PROJECT CLOSED / C03.4 BUILDING CLOSED / C03.5 FLOOR CLOSED / C03.6 UNIT CLOSED / C03 ACTIVE`

### C03.3 Project — closed semantic slice

Project is a first-class real-estate development/commercial domain object and the primary development collaboration context.

Canonical meaning:

`Organization → Project → [Building] → [Floor] → Unit`

Project does not become the owner of downstream CRM, Reservation, Contract, Finance, Commission, Campaign attribution or Scheduling facts merely because those facts reference it.

### C03.4 Building — closed semantic slice

Building is a first-class structural real-estate entity within the development/inventory model.

Valid topology variants include:

`Project → Unit`
`Project → Building → Unit`
`Project → Building → Floor → Unit`

Building is optional when the Project has no meaningful building-level subdivision. It has stable technical identity independent of human reference/name/slug. It is not an Organization, tenant, commercial actor, reservation authority, financial object, legal contract or automatic security boundary. It is not automatically an aggregate root.

### C03.5 Floor — closed semantic slice

Floor is a structural level object when independent floor-level semantics are meaningful.

Valid topology remains:

`Project → Building → Unit`
`Project → Building → Floor → Unit`

A standalone Floor entity is not mandatory merely because a Unit has a floor/level value. If the project only needs a simple level attribute, an approved Unit-level representation may be sufficient. If the level has its own identity, metadata, authorization scope, topology or business semantics, a Floor object is appropriate.

When a Floor entity exists, its technical identity is stable and independent of display numbering/labels.

Floor is not automatically an aggregate root, tenant boundary or commercial authority.

### C03.6 Unit — closed semantic slice

Unit is the canonical development-inventory domain entity.

Valid topology:

`Project → Unit`
`Project → Building → Unit`
`Project → Building → Floor → Unit`

Unit has stable technical identity independent of `unit_number`, reference, slug, name or display label. A human-facing reference can change without changing the Unit identity.

Unit represents stable development-inventory identity and applicable physical/inventory characteristics. It does not own the lifecycles of Reservation, Contract, Payment, Commission, Lead, Listing or MediaAsset.

Unit retains two independent state dimensions:

Commercial:
`AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

Construction:
`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

Price is a versioned commercial fact and will be closed separately in C03.10. Historical transaction snapshots must remain stable.

Unit ownership, visibility, allocation and reservation control remain separate.

Unit is a critical reference point for reservation concurrency, but the exact reservation DB mechanism remains implementation-gated and must be proven by race tests.

Development Unit and brokerage Listing remain distinct domain concepts.

## 8. Real-estate state doctrine

Unit retains separate dimensions:

Commercial:
`AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

Construction:
`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

These must never be collapsed into one status.

## 9. C03 adversarial model

The next decisions must survive:

- Developer-owned project + internal sales;
- Developer project + multiple agencies;
- Agency-owned inventory;
- Agency representing Developer inventory;
- brokerage participating alongside Developer internal sales;
- mixed-use project;
- project without conventional buildings;
- project with buildings but no meaningful floor model;
- Building with and without Floors;
- Unit with scalar floor/level only;
- Unit with a Floor entity;
- human reference-number changes;
- Building/Floor reference changes without Unit identity change;
- reassignment and historical preservation;
- concurrent reservation attempts;
- accepted Offer without Reservation;
- Reservation without accepted Offer where policy permits;
- price/version change after Offer/Reservation;
- media replacement without Unit identity change;
- construction progress changing independently from commercial availability.

## 10. Inventory competition

Closed founder/product decision:

`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`

Same-tier competition is resolved by the first valid reservation transaction to commit successfully against the Unit single-winner boundary. Client timestamps and UI ordering are not authoritative. Exact DB mechanism remains implementation-gated and must be proven by race tests.

## 11. Architecture truth / brownfield distinction

V3 architecture is target architecture. It is not evidence that the repository/runtime already implements it.

Authority chain:

`Founder/Product Constitution → Architecture → Contracts → Registers → Repository → Runtime → Evidence`

For existing implementation reality, the verified live database wins after its identity is independently established.

## 12. Evidence blockers

- canonical runtime/database identity;
- RLS/runtime security evidence;
- Building/Floor/Unit persistence representation;
- exact Project Inventory Access permission mapping;
- reservation concurrency implementation mechanism;
- price/version persistence model;
- Inventory Batch relationship and persistence;
- Finance executable contract details;
- event implementation evidence;
- architecture-as-code enforcement;
- canonical artifact/readiness/governance hygiene where still unresolved;
- implementation authorization.

## 13. Verification status

CI for the current HEAD remains `NOT VERIFIED` until the workflow is rerun after the latest checkpoint/ADR/research changes. Previous runs are historical evidence only.

No schema/RLS implementation has been authorized by conference decisions.

## 14. Required end-of-session output

Every continuation must report:

1. verified facts;
2. corrected items;
3. engineering derivations;
4. external research;
5. canonical artifacts updated;
6. unresolved conflicts;
7. blockers;
8. founder decisions required;
9. tests/evidence;
10. exact next checkpoint.

## 15. Resume rule

When the operator says `Continue / أكمل العمل على المسار`:

`load checkpoint → inspect HEAD → load Source of Truth/Roadmap/Context/Conference → identify highest unresolved dependency → research → reconcile → decide within authority → update all affected canonical artifacts → verify → checkpoint → continue`

Do not implement merely because a conference decision exists.
