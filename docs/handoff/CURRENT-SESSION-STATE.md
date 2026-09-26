# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE ENGINEERING CHECKPOINT  
**Version:** 3.30  
**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase
`ARCHITECTURE ENGINEERING — RESEARCH-FIRST + SOURCE-VALIDATION → C03 REAL ESTATE DOMAIN`

## 2. Current checkpoint
`ARCH-2026-H1.15-C03-MULTI-ACTOR-AUTHORITY-CLOSED-01`

This file is the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## 3. Closed conference decisions
- ASAS is a real-estate Enterprise Operating System with future multi-tenant SaaS evolution.
- Organization is the business principal; Organization Relationship is first-class.
- Collaboration boundary: Relationship + Project context + Resource Scope.
- Visibility follows responsibility.
- Workspace is UX/operational, not an automatic security boundary.
- Branch is an organizational subdivision, not an automatic tenant boundary.
- Nine canonical bounded contexts; historical fifteen-module material is implementation/provenance evidence.
- Lead ownership, operational assignment, source attribution, commercial attribution, commission entitlement and commission payout are distinct.
- Reservation/sale attribution is snapshotted at the governing milestone.
- Inventory ownership, visibility, allocation and reservation control are distinct.
- Developer internal sales is valid; agency may own/control inventory or represent another organization's inventory.
- Organization type does not automatically determine commercial priority.
- Allocation/priority is configurable by Project/Inventory Batch within platform invariants.
- Same-tier inventory competition resolves by first valid reservation transaction to commit against the Unit single-winner boundary.
- Hold ≠ Reservation.
- Scheduling is Core-hosted, not CRM-owned and not a separate bounded context.
- Commission is Finance-owned, policy-versioned, milestone-derived and snapshot-based; payout is distinct.
- Offer is Sales-owned, versioned and distinct from Hold/Reservation.
- Real Estate Resource is conceptual, not a mandatory universal database entity.
- Development inventory uses Unit as canonical resource.
- Brokerage uses Listing under Owner/Mandate semantics.
- Project is first-class and primary development collaboration context.
- Building is structural and optional in Project topology; Floor is optional.
- Unit technical identity is stable and independent of human numbering.
- Unit commercial and construction states are independent.
- Unit does not own Reservation, Contract, Payment, Commission, Lead, Listing or Media lifecycles.
- Unit price is a versioned commercial fact.
- Development Unit and brokerage Listing are distinct.
- Listing is the brokerage commercial representation of an underlying property interest under Owner/Mandate semantics.
- Listing ≠ Unit ≠ Property ≠ Mandate.
- Listing does not transfer legal ownership and does not itself grant authorization.
- Publication/channel projections are not independent inventory truth.
- Development Unit may be publicly published without becoming a brokerage Listing.
- Listing withdrawal/expiry preserves historical transactions and audit facts.
- **C03.8: authority is evaluated by identity + tenant/organization + relationship + role/team + scope + attributes + purpose + resource + action + policy + audit; role-only authorization is rejected.**
- **Organization type, Listing existence, Workspace membership, visibility or public publication do not automatically grant operational authority.**
- **Visibility, operational control, allocation, reservation, publication, contract, finance, commission and administration are distinct authority dimensions.**
- **Mandate/relationship determines brokerage authority; Listing itself does not.**
- **Project/resource scope can narrow development authority; AI inherits caller authority and cannot escalate it.**
- **Tenant isolation must hold across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations.**
- Codex is primary engineering executor; Claude/Figma design collaboration path; v1.6.1 architect research/provenance input, not coding-agent authority.

## 4. Canonical control plane
- Product requirements: `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` — PROPOSED / FOUNDER REVIEW REQUIRED
- Blueprint: `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — PROPOSED v1.5.1
- Roadmap: `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — ACTIVE
- Conference: `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md` — ACTIVE / CANONICAL DECISION WORKSTREAM
- Context Prompt: `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — ACTIVE
- Master Execution Path: `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
- Source of Truth: `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
- Research-first method: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md` — CANONICAL
- ADRs: `ADR-0021` Scheduling through `ADR-0030` Multi-Actor Authority — accepted for their semantic slices.
- Contracts: Project, Unit, Listing and Multi-Actor Authority are semantically closed / implementation blocked.
- Research records: Building, Floor, Unit and Listing accepted research basis.
- Historical Building contract reference remains NOT VERIFIED and must not be treated as current evidence until recovered/reconciled.

## 5. Operating method
`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Founder/product decisions define desired future behavior. Research discovers omissions/conflicts but does not override founder decisions. Brownfield repository/runtime facts remain authoritative for what is already implemented.

## 6. C02
`SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED`
Remaining evidence-driven work: Project Inventory Access permission mapping; brownfield persistence reconciliation; reservation concurrency mechanism; event/state/permission registration; Finance executable contract.

## 7. C03
`C03.1 RESOURCE IDENTITY CLOSED / C03.2 ASSET TAXONOMY CLOSED / C03.3 PROJECT CLOSED / C03.4 BUILDING CLOSED / C03.5 FLOOR CLOSED / C03.6 UNIT CLOSED / C03.7 LISTING CLOSED / C03.8 MULTI-ACTOR AUTHORITY CLOSED / C03 ACTIVE`

### C03.8 Multi-Actor Authority — closed semantic slice
Authority is a decision over identity, tenant/organization, relationship, role/team, scope, attributes, purpose, resource, action, policy and audit. A missing required predicate is denial by default.

Canonical development path:
`Organization → Project → [Building] → [Floor] → Unit`

Canonical brokerage path:
`Owner → Mandate → Listing → Property`

Authority dimensions are independent: visibility, operational control, allocation, reservation, publication, contract, finance, commission and administration. They must not be collapsed into broad role shortcuts.

Public publication grants only permitted public projection fields. It never grants operational authority. Revoked operational access must not silently erase historical facts. Stale cache/search/event/job paths must not preserve revoked tenant authority.

Exact permission keys, Mandate contract, Listing state registration, resource-scope persistence and live RLS evidence remain gated.

## 8. Real-estate state doctrine
Commercial: `AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

Construction: `NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

Never collapse these into one status.

## 9. C03 adversarial model
Must survive: developer/internal sales; developer + multiple agencies; agency-owned inventory; agency representing developer; mixed-use; no-building projects; buildings with/without floors; scalar Unit level vs Floor entity; reference-number changes; reassignment; reservation races; Offer/Reservation ordering; price changes after milestones; media changes; independent construction/commercial state; Listing withdrawal/mandate expiry with stale channel projections; same property across channels; publication after availability change; revoked agency access while cached public publication remains; cross-tenant reads/writes; visibility without mutation; AI action exceeding caller authority.

## 10. Inventory competition
`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`. Same-tier winner is first valid reservation transaction to commit against Unit. UI/client timestamps are never authoritative. Exact DB mechanism remains implementation-gated and must be proven by race tests.

## 11. Architecture truth / brownfield distinction
`Founder/Product Constitution → Architecture → Contracts → Registers → Repository → Runtime → Evidence`

V3 is target architecture, not proof of current implementation. Verified live DB wins for runtime reality only after its identity is independently established.

## 12. Evidence blockers
- canonical runtime/database identity;
- RLS/runtime security evidence;
- Building/Floor/Unit/Listing persistence representation;
- exact Project Inventory Access mapping;
- Owner/Mandate semantics and permissions;
- Listing lifecycle/state-machine registration;
- publication/channel contract;
- reservation concurrency mechanism;
- price/version persistence;
- Inventory Batch relationship/persistence;
- Finance executable semantics;
- event implementation evidence;
- architecture-as-code enforcement;
- governance/readiness hygiene where unresolved;
- implementation authorization.

## 13. Verification
CI for current HEAD is `NOT VERIFIED` until workflow is rerun after latest checkpoint/ADR/research changes. Previous runs are historical evidence only. No schema/RLS implementation has been authorized by conference decisions.

## 14. Required continuation output
Every continuation reports: verified facts; corrections; derivations; external research; canonical artifacts updated; conflicts; blockers; founder decisions required; tests/evidence; exact next checkpoint.

## 15. Resume rule
`load checkpoint → inspect HEAD → load Source of Truth/Roadmap/Context/Conference → identify highest unresolved dependency → research → reconcile → decide within authority → update affected canonical artifacts → verify → checkpoint → continue`

Do not implement merely because a conference decision exists.
