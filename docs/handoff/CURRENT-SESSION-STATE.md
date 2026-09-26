# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE ENGINEERING CHECKPOINT
**Version:** 3.24
**Date:** 2026-09-26
**Repository:** `asas-erp-saas-1/As`
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase

`ARCHITECTURE ENGINEERING — RESEARCH-FIRST + SOURCE-VALIDATION → C03 REAL ESTATE DOMAIN`

## 2. Current checkpoint

`ARCH-2026-H1.9-C03-RESOURCE-IDENTITY-TAXONOMY-CLOSED-01`

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
- **Real Estate Resource is a conceptual category, not a mandatory universal database entity; development inventory uses Unit as the canonical resource, brokerage uses Listing under Owner/Mandate semantics;**
- **Building is a first-class structural domain/ontology object but is optional at Project topology level; Floor is optional; Unit identity is stable and does not depend on human numbering;**
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
- Inventory competition contract: `docs/architecture/contracts/ASAS-INVENTORY-CHANNEL-PRIORITY-AND-RESERVATION-COMPETITION-CONTRACT-2026.md` — PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
- Inventory competition research: `docs/architecture/research/ASAS-C02-INVENTORY-COMPETITION-RESEARCH-2026-09-25.md`
- Founder decision: `docs/architecture/decisions/C02-03-INVENTORY-COMPETITION-FOUNDER-DECISION-2026-09-25.md` — CLOSED
- Organization collaboration contract: `docs/architecture/contracts/ASAS-ORGANIZATION-COLLABORATION-AUTHORIZATION-CONTRACT-2026.md` — PROPOSED / IMPLEMENTATION BLOCKED
- Team/project authorization contract: `docs/architecture/contracts/ASAS-TEAM-PROJECT-ASSIGNMENT-AUTHORIZATION-CONTRACT-2026.md` — PROPOSED / IMPLEMENTATION BLOCKED
- Lead ownership/assignment/attribution contract: `docs/architecture/contracts/ASAS-LEAD-OWNERSHIP-ASSIGNMENT-ATTRIBUTION-CONTRACT-2026.md` — PROPOSED / SEMANTIC SLICE CLOSED / IMPLEMENTATION BLOCKED
- Project inventory collaboration contract: `docs/architecture/contracts/ASAS-PROJECT-INVENTORY-COLLABORATION-CONTRACT-2026.md` — PROPOSED / IMPLEMENTATION BLOCKED
- Building research: `docs/architecture/research/ASAS-RESEARCH-RECORD-Q1-BUILDING-2026-09-24.md`
- Building domain contract: `docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026-09-24.md` — PROPOSED / OPEN / IMPLEMENTATION BLOCKED
- Evidence register: `docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md`
- Skills catalog: `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`
- Agent operating model: `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md`
- Design/code continuity: `docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`

## 5. Operating method

`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Founder product/business decisions define desired future behavior. Sources and research are used to discover omissions, contradictions, risks, and better alternatives; they do not override a founder-approved decision. Brownfield runtime/repository facts remain authoritative for what is already implemented.

External validation supports the chosen strategy: domain boundaries should follow business capabilities and bounded-context semantics rather than technology-first decomposition; authorization should be least-privilege and deny-by-default; database constraints and transaction isolation should enforce critical invariants rather than relying on application checks alone. citeturn0search0turn0search1turn0search4turn0search6

## 6. C02 status

`C02 SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED`

Closed slices:

1. Organization / Membership
2. Organization Relationship
3. Project + Resource Scope collaboration boundary
4. Employee authorization
5. Lead ownership / assignment / source / commercial attribution separation
6. Reservation/sale attribution snapshot
7. Inventory ownership / visibility / allocation / reservation control separation
8. Inventory competition / deterministic winner
9. Hold vs Reservation
10. Scheduling ownership
11. Commission entitlement semantics
12. Offer lifecycle semantics

Remaining C02 implementation/reconciliation work is evidence-driven, not open founder-product questions:

- exact Project Inventory Access permission mapping;
- brownfield persistence reconciliation;
- reservation concurrency mechanism;
- event/state/permission registration;
- Finance executable contract details.

## 7. C03 status

`C03.1 RESOURCE IDENTITY CLOSED / C03.2 ASSET TAXONOMY CLOSED / C03 ACTIVE`

### Resource identity

`Real Estate Resource` is a conceptual category, not a mandatory universal table.

Development:

`Organization → Project → [Building] → [Floor] → Unit`

Brokerage:

`Owner → Mandate → Listing → Property representation`

Unit is the canonical development inventory resource. Listing is the canonical brokerage commercial representation. A universal Property aggregate is deliberately not introduced at this stage.

Building is a first-class structural domain/ontology object but is not mandatory for every Project. Floor is conditional on project topology.

Human references are not primary technical identity. Stable internal identity must survive renumbering, relabeling and structural changes.

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
- Unit/listing separation;
- human reference-number changes;
- reassignment and historical preservation;
- concurrent reservation attempts;
- accepted Offer without Reservation;
- Reservation without accepted Offer where policy permits;
- price/version change after Offer/Reservation.

## 10. Building status

`OPEN / IMPLEMENTATION BLOCKED`

The domain decision is now stronger: Building is a structural entity, but persistence shape remains a brownfield/schema reconciliation question. No Building schema or aggregate implementation is authorized until current repository/database evidence is inspected.

## 11. Inventory competition

Closed founder/product decision:

`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`

Same-tier competition is resolved by the first valid reservation transaction to commit successfully against the Unit single-winner boundary. Client timestamps and UI ordering are not authoritative. PostgreSQL unique constraints and transaction isolation are candidate implementation mechanisms, but the exact mechanism remains implementation-gated and must be proven by race tests. citeturn0search4turn0search6

## 12. Architecture truth / brownfield distinction

V3 architecture is target architecture. It is not evidence that the repository/runtime already implements it.

Authority chain:

`Founder/Product Constitution → Architecture → Contracts → Registers → Repository → Runtime → Evidence`

For existing implementation reality, the verified live database wins after its identity is independently established. Documentation must never be changed merely to match an incorrect implementation. fileciteturn47file0L172-L194

## 13. Evidence blockers

- canonical runtime/database identity remains unverified after the documented wrong-project near-miss;
- canonical artifact register/context-loading drift/readiness consolidation require repository closure where still unresolved;
- RLS/runtime security evidence;
- Building persistence representation;
- exact Project Inventory Access permission mapping;
- reservation concurrency implementation mechanism;
- Finance executable contract details;
- event implementation evidence;
- architecture-as-code enforcement;
- implementation authorization.

The external audit independently verified the ingested registers: 103 events, 50 permission keys × 8 personas, 11 state machines and 42 design primitives; task/schema discrepancies remain pending controlled sharding rather than verified canonical counts. fileciteturn48file9L1112-L1125

## 14. Governance corrections still required

The external audit identified:

- stale canonical-artifact register;
- deprecated `SESSION_STATE.md` references in context-loading governance documents;
- incomplete CI scan for deprecated session-state references;
- unresolved runtime/database identity;
- multiple overlapping readiness documents;
- repository hygiene/visibility decisions where still open.

These remain control-plane closure work and must be resolved before implementation authorization. fileciteturn48file0L10-L33 fileciteturn48file4L288-L305

## 15. Verification status

CI for the current HEAD remains `NOT VERIFIED` until the workflow is rerun after the latest checkpoint/ADR changes. Previous run `35879311233` is historical evidence only.

No schema/RLS implementation has been authorized by conference decisions.

## 16. Required end-of-session output

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

## 17. Resume rule

When the operator says `Continue / أكمل العمل على المسار`:

`load checkpoint → inspect HEAD → load Source of Truth/Roadmap/Context/Conference → identify highest unresolved dependency → research → reconcile → decide within authority → update all affected canonical artifacts → verify → checkpoint → continue`

Do not implement merely because a conference decision exists.
