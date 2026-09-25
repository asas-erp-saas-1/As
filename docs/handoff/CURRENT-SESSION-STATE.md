# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE ENGINEERING CHECKPOINT  
**Version:** 3.21  
**Date:** 2026-09-25  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase

`ARCHITECTURE ENGINEERING — RESEARCH-FIRST + SOURCE-VALIDATION → ENGINEERING CONFERENCE → C02 INVENTORY COMPETITION → C03 REAL ESTATE DOMAIN`

## 2. Current checkpoint

`ARCH-2026-H1.6-C02-INVENTORY-COMPETITION-CLOSED-01`

This file remains the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## 3. Conference path

Canonical conference route:
`docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`

Current conference decisions closed:

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
- Lead ownership ≠ operational assignment ≠ source attribution ≠ commercial attribution ≠ commission entitlement;
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

## 6. Organization / collaboration status

`C02 CORE MODEL CLOSED / ATTRIBUTION CLOSED / INVENTORY COMPETITION CLOSED / IMPLEMENTATION BLOCKED`

The current model is:

`Organization → Membership → Relationship → Team/Role Scope → Project Assignment → Individual Exception → Resource Authorization`

The Project is the primary commercial collaboration context. Resource Scope supplies fine-grained authorization. A separate Collaboration Space remains reserved and is not required now.

Developer-side partner performance visibility is Hybrid E/configurable. Employee access is Hybrid D.

## 7. Attribution status

Closed semantic slice:

`Lead Ownership ≠ Operational Assignment ≠ Source Attribution ≠ Commercial Attribution ≠ Commission Entitlement`

- Ownership identifies the organization responsible for the CRM relationship record.
- Assignment identifies current operational responsibility and is mutable/auditable.
- Source attribution preserves acquisition origin.
- Commercial attribution records credit for defined milestones.
- Commission entitlement is Finance-owned and rule-derived.
- Reservation/sale attribution is snapshotted at the governing milestone.
- Cross-agency collaboration does not merge private CRM data.
- Manual adjudication is allowed for attribution disputes through audited correction workflows.

## 8. Project inventory collaboration status

Current closed semantic model:

`Inventory Ownership ≠ Inventory Visibility ≠ Commercial Allocation ≠ Reservation Control`

- an organization may own/control inventory;
- partners receive scoped visibility;
- optional commercial allocation is a policy/control object, not ownership transfer;
- Developer internal sales and external agencies are both valid sales actors;
- an Agency may also own/control its own inventory;
- a Project may have multiple legitimate commercial actors;
- reservation/hold remains governed by Inventory/Sales state machines and concurrency controls;
- allocation does not itself establish reservation or sales attribution.

## 9. Inventory competition status

Closed founder/product decision:

`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`

Rules:

1. Organization type does not automatically establish reservation priority.
2. Active allocation determines eligibility/priority where applicable.
3. Hard allocation can restrict eligibility during its effective period.
4. Same-tier competition is resolved by the first valid reservation transaction to commit successfully against the Unit single-winner consistency boundary.
5. If no priority/allocation applies, first valid committed reservation is the fallback.
6. Client timestamps and UI ordering are never authoritative.
7. Failed/rolled-back transactions do not create winners.
8. Manual attribution adjudication and audited overrides are permitted without silently rewriting historical facts.

Exact database concurrency mechanism remains an implementation decision gated by adversarial concurrency testing.

## 10. Building status

`OPEN / IMPLEMENTATION BLOCKED`

Current provisional model:
`Real Estate / Inventory → Project → Building (structural Entity candidate) → Floor (if required) → Unit aggregate`

No Building schema, aggregate root, state machine, event stream or service is authorized until persistence and semantic reconciliation close.

## 11. C03 entry conditions

C03 Real Estate Domain is now active.

The next semantic workstream is:

`Resource Identity → Asset Taxonomy → Project/Building/Floor/Unit hierarchy → Multi-actor authority → Listing representation → Construction vs commercial state → Pricing/versioning → Inventory lifecycle → Reservation boundary → schema contract`

C03 must be tested against at least:

- Developer-owned project + internal sales;
- Developer project + multiple agencies;
- Agency-owned inventory;
- Agency representing Developer inventory;
- Brokerage participating alongside Developer internal sales;
- mixed-use project;
- project without conventional buildings;
- unit/listing separation;
- reassignment and historical preservation.

## 12. Existing blockers

- Scheduling ownership conflict;
- exact approved historical Context Map v2 / Domain Model v2 remains unlocated;
- Building persistence representation;
- live DB/runtime identity/evidence where unavailable;
- exact inventory permission mapping;
- reservation concurrency mechanism;
- commission semantics;
- Offer lifecycle closure;
- Finance executable semantics;
- RLS/runtime security evidence;
- event implementation evidence;
- architecture-as-code enforcement;
- implementation authorization.

## 13. Verification status

CI for the current HEAD remains `NOT VERIFIED` until the workflow is rerun after the latest checkpoint/contract changes. Previous run `35879311233` is historical evidence only.

No schema/RLS implementation has been authorized by the conference decisions.

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
