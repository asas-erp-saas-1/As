# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE ENGINEERING CHECKPOINT  
**Version:** 3.29  
**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase
`ARCHITECTURE ENGINEERING — RESEARCH-FIRST + SOURCE-VALIDATION → C03 REAL ESTATE DOMAIN`

## 2. Current checkpoint
`ARCH-2026-H1.14-C03-LISTING-SEMANTICS-CLOSED-01`

This file is the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## 3. Closed conference decisions
- broad Real Estate Operating System + future SaaS direction;
- extensible multi-organization model;
- Organization as business principal;
- first-class Organization Relationship;
- Hybrid D collaboration boundary: Relationship + Project context + Resource Scope;
- Hybrid E configurable Developer partner-performance visibility;
- Hybrid D employee authorization: relationship + team/role + project assignment + individual exception;
- `Visibility follows responsibility`;
- Workspace is UX/operational container, not automatic security boundary;
- Branch is organizational subdivision, not automatic tenant boundary;
- nine canonical bounded contexts; historical 15-module material is implementation/provenance evidence;
- Lead ownership ≠ operational assignment ≠ source attribution ≠ commercial attribution ≠ commission entitlement ≠ commission payout;
- reservation/sale attribution is snapshotted at the governing milestone;
- Inventory ownership ≠ inventory visibility ≠ commercial allocation ≠ reservation control;
- Developer internal sales is a valid sales actor;
- Agency may own/control inventory and may represent another organization's inventory;
- organization type does not automatically determine commercial priority;
- allocation/priority is configurable by Project/Inventory Batch within platform invariants;
- same-tier competition resolves by first valid reservation transaction to commit against the Unit single-winner boundary;
- Hold ≠ Reservation;
- audited manual adjudication is allowed for attribution disputes;
- Scheduling is Core-hosted, not CRM-owned and not a separate bounded context;
- Commission is Finance-owned, policy-versioned, milestone-derived, snapshot-based and distinct from payout;
- Offer is Sales-owned, versioned and distinct from Hold/Reservation;
- Real Estate Resource is conceptual, not a mandatory universal database entity;
- development inventory uses Unit as canonical resource;
- brokerage uses Listing under Owner/Mandate semantics;
- Building is a first-class structural object but optional at Project topology level;
- Floor is optional;
- Unit technical identity is stable and independent of human numbering;
- Project is first-class and is the primary development collaboration context;
- Project publication is projection, not second source of truth;
- Building is structural, optional in topology, not automatically an aggregate root or commercial/financial/security principal;
- Project → Building → [Floor] → Unit and Project → Building → Unit are valid;
- Floor is a structural level object only when independent semantics justify it;
- Unit is the canonical development-inventory entity;
- Unit may exist directly under Project or through optional Building/Floor topology;
- Unit commercial state and construction state are independent;
- Unit does not own Reservation, Contract, Payment, Commission, Lead, Listing or Media lifecycles;
- Unit ownership ≠ visibility ≠ allocation ≠ reservation control;
- Unit reservation is a critical single-winner boundary; DB mechanism remains implementation-gated;
- Unit price is versioned commercial fact;
- Development Unit and brokerage Listing remain distinct;
- **Listing is the brokerage commercial representation of an underlying property interest under Owner/Mandate semantics;**
- **Listing ≠ Unit ≠ Property ≠ Mandate;**
- **Listing does not transfer legal ownership and does not itself grant authorization;**
- **Listing/publication/channel projections are not independent inventory truth;**
- **A development Unit may be publicly published without becoming a brokerage Listing;**
- **Listing availability/pricing are versioned/represented commercial facts and cannot create a second reservation truth;**
- **Listing withdrawal/expiry preserves historical transactions and audit facts.**
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
- ADRs: `ADR-0021` Scheduling; `ADR-0022` Commission; `ADR-0023` Offer; `ADR-0024` Resource Identity; `ADR-0025` Project; `ADR-0026` Building; `ADR-0027` Floor; `ADR-0028` Unit; `ADR-0029` Listing — all accepted for their semantic slices.
- Contracts: Project, Unit and Listing domain contracts are PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED.
- Research records: Building, Floor, Unit and Listing records are ACCEPTED RESEARCH BASIS.
- Historical Building contract reference remains NOT VERIFIED in current branch content endpoint and must not be treated as current evidence until recovered/reconciled.

## 5. Operating method
`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Founder/product decisions define desired future behavior. Research discovers omissions/conflicts but does not override founder decisions. Brownfield repository/runtime facts remain authoritative for what is already implemented.

## 6. C02
`SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED`
Evidence-driven remaining work: Project Inventory Access permission mapping; brownfield persistence reconciliation; reservation concurrency mechanism; event/state/permission registration; Finance executable contract.

## 7. C03
`C03.1 RESOURCE IDENTITY CLOSED / C03.2 ASSET TAXONOMY CLOSED / C03.3 PROJECT CLOSED / C03.4 BUILDING CLOSED / C03.5 FLOOR CLOSED / C03.6 UNIT CLOSED / C03.7 LISTING CLOSED / C03 ACTIVE`

### C03.7 Listing — closed semantic slice
Canonical brokerage path:
`Owner → Mandate → Listing → Property`

Canonical development path:
`Organization → Project → [Building] → [Floor] → Unit`

Listing is a brokerage representation, not legal title, mandate authority itself, reservation authority, contract authority, finance authority, commission authority or channel cache authority. Authorization derives from relationship/scope/permission/mandate rules.

Website Studio, partner portals, search indexes, campaigns and external channels consume publication/projection representations and never become inventory authorities. A development Unit can be publicly published without becoming a Listing.

Listing commercial facts such as asking price and availability are versioned/represented. Historical Offer/Reservation/Contract milestones snapshot governing terms. Withdrawal/expiry preserves historical facts.

Exact Listing state enumeration, Mandate contract, publication/channel contract, permission mapping and persistence remain gated implementation slices.

## 8. Real-estate state doctrine
Commercial: `AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

Construction: `NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

Never collapse these into one status.

## 9. C03 adversarial model
Must survive: developer/internal sales; developer + multiple agencies; agency-owned inventory; agency representing developer; mixed-use; no-building projects; buildings with/without floors; scalar Unit level vs Floor entity; reference-number changes; reassignment; reservation races; Offer/Reservation ordering; price changes after milestones; media changes; independent construction/commercial state; Listing withdrawal/mandate expiry with stale channel projections; same property across channels; publication after availability change; revoked agency access while cached public publication remains.

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
