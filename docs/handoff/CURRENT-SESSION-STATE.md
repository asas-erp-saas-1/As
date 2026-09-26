# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE + PLATFORM ENGINEERING CHECKPOINT  
**Version:** 3.40  
**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## Current checkpoint
`ARCH-2026-H1.25-C04-CRM-SEMANTIC-CLOSURE-IMPLEMENTATION-BLOCKED-01`

This file is the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## Closed semantic decisions
- ASAS is a real-estate Enterprise Operating System with future multi-tenant SaaS evolution.
- Organization is the business principal; Organization Relationship is first-class.
- Collaboration boundary: Relationship + Project context + Resource Scope.
- Visibility follows responsibility.
- Workspace is UX/operational, not an automatic security boundary.
- Branch is organizational subdivision, not an automatic tenant boundary.
- Nine canonical bounded contexts; historical fifteen-module material is implementation/provenance evidence.
- Lead ownership, operational assignment, source attribution, commercial attribution, commission entitlement and commission payout are distinct.
- Inventory ownership, visibility, allocation and reservation control are distinct.
- Same-tier inventory competition resolves by first valid reservation transaction to commit against the Unit single-winner boundary.
- Hold ≠ Reservation.
- Scheduling is Core-hosted by the conference decision. Current branch governance is authoritative; older source-package/library copies are historical evidence only.
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
- Unit price is a versioned commercial fact; mutable scalar price is not historical pricing authority.
- Price versions are immutable commercial facts with resource subject, amount/currency, effective time, revision and audit provenance.
- Current price is a deterministic projection of the applicable effective price version.
- Historical price must be reconstructable at a specified time.
- Offer/Hold/Reservation/Contract capture the applicable commercial terms required by their governing milestone; later price changes do not rewrite prior transaction economics.
- Discounts and price overrides are explicit adjustments subject to policy/approval; they do not rewrite base-price history.
- Future-effective prices are allowed but cannot become current before their effective time.
- Public/search/analytics projections consume pricing authority and cannot mutate it.
- Development Unit and brokerage Listing are distinct.
- Listing is the brokerage commercial representation of an underlying property interest under Owner/Mandate semantics.
- Listing ≠ Unit ≠ Property ≠ Mandate.
- Listing does not transfer legal ownership and does not itself grant authorization.
- Publication/channel projections are not independent inventory truth.
- Development Unit may be publicly published without becoming a brokerage Listing.
- Listing withdrawal/expiry preserves historical transactions and audit facts.
- Multi-actor authority is evaluated by identity + tenant/organization + relationship + role/team + scope + attributes + purpose + resource + action + policy + audit; role-only authorization is rejected.
- Visibility, operational control, allocation, reservation, publication, contract, finance, commission and administration are distinct authority dimensions.
- Mandate/relationship determines brokerage authority; Listing itself does not.
- Project/resource scope can narrow development authority; AI inherits caller authority and cannot escalate it.
- Tenant isolation must hold across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations.
- Unit commercial lifecycle and construction lifecycle are independent state dimensions.
- Commercial: `AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`.
- Construction: `NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`.
- These states must never be collapsed into one status.
- Inventory lifecycle is controlled by domain actions and canonical state-machine policy, not raw status setters.
- Hold expiration/release can restore availability only through authorized deterministic processing.
- Contracted/Sold inventory cannot be made available by stale public/search/cache state.
- OFF_MARKET is a commercial policy state, not deletion and not a synonym for SOLD.
- Construction progress cannot create/release/transfer a reservation; commercial transitions cannot silently rewrite construction progress.
- Offer, Hold, Reservation, Contract, Payment, Commission and Listing/publication retain separate lifecycles.
- Direct raw status mutation is prohibited; state transitions are governed domain actions/events with audit coverage.
- Reservation is a first-class transactional consistency boundary for the development Unit.
- At most one active winning Reservation may exist for a Unit at any instant under the canonical policy.
- The authoritative winner is the successful transaction commit, never UI order, client timestamp, cache order or analytics state.
- Reservation success and the Unit commercial-state consequence must be committed atomically within the selected transaction boundary.
- Reservation requires database-enforced single-winner integrity; application/UI checks alone are insufficient.
- Reservation commands must be idempotent; same key + same command returns the committed result, while same key + conflicting command is rejected deterministically.
- Expiration/release must be conditional on the reservation identity/version that created the obligation; stale jobs cannot release a newer winner.
- Reservation records capture the commercial terms required at the reservation milestone; later price versions do not rewrite reservation economics.
- Authoritative reservation state is independent of website/search/cache/analytics projections.
- Reservation lifecycle events must be emitted from committed state through a transactional outbox boundary.
- Concrete PostgreSQL locking/isolation/constraint strategy remains implementation-gated pending brownfield schema reconciliation and race-test evidence.
- **C04 CRM:** Person is the canonical human identity; Customer is an organization-scoped customer relationship over Person, not a second human identity.
- **C04 CRM:** Lead is organization-owned; multiple active Leads for one Person are permitted only for materially distinct commercial engagements, with duplicate detection before creation.
- **C04 CRM:** The existing 17-stage unified sales pipeline remains the semantic baseline; `Deal` is a derived view, not a separate CRM authority.
- **C04 CRM:** Lead ownership, operational assignment, team scope, branch scope and organization/tenant are distinct responsibilities.
- **C04 CRM:** Assignment changes preserve history; merge is an authorized domain action and never a silent destructive operation.
- **C04 CRM:** Source, campaign, channel/touch, operational assignment, commercial attribution and commission entitlement remain distinct facts/authorities.
- **C04 CRM:** Communication transport is platform-owned; CRM owns the relationship/projection to Person/Lead.
- **C04 CRM:** Consent/purpose are first-class governed facts; legal basis, retention and data-subject execution remain country-pack/C15 governed.
- **C04 CRM:** Activity, Task, Appointment and Communication are distinct objects/capabilities and must not be collapsed into one generic timeline record.
- **C04 CRM:** AI may read/recommend/draft within caller authority; sensitive/financial/destructive/mass-communication actions require the applicable approval policy.
- Codex is primary engineering executor; Claude/Figma design collaboration path; v1.6.1 architect research/provenance input, not coding-agent authority.

## Canonical control plane
- Product requirements: `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` — PROPOSED / FOUNDER REVIEW REQUIRED
- Blueprint: `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — PROPOSED v1.5.1
- Roadmap: `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — ACTIVE
- Conference: `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md` — ACTIVE / CANONICAL DECISION WORKSTREAM
- Context Prompt: `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — ACTIVE
- Master Execution Path: `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
- Source of Truth: `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
- Research-first method: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md` — CANONICAL
- ADRs: `ADR-0021` Scheduling through `ADR-0034` Reservation Boundary — accepted for their semantic slices; **ADR-0035 CRM accepted**.
- Contracts: Project, Unit, Listing, Multi-Actor Authority, Unit State, Pricing Versioning, Inventory Lifecycle, Reservation Consistency and **CRM** are semantically closed / implementation blocked.
- Research records: Building, Floor, Unit and Listing accepted research basis; Pricing, Inventory Lifecycle and Reservation research basis recorded in ADR-0032/0033/0034.
- CRM ADR: `docs/architecture/adr/ADR-0035-CRM-CANONICAL-SEMANTICS-2026-09-26.md` — ACCEPTED / SEMANTIC / IMPLEMENTATION BLOCKED.
- CRM contract candidate: `docs/architecture/contracts/ASAS-CRM-CONTRACT-CANDIDATE-2026-09-26.md` — CANDIDATE / NOT IMPLEMENTATION AUTHORITY.
- Brownfield reality report: `docs/architecture/reconciliation/ASAS-BROWNFIELD-REALITY-REPORT-2026-09-26.md` — ACTIVE / EVIDENCE BASELINE.
- Brownfield drift matrix: `docs/architecture/reconciliation/ASAS-BROWNFIELD-DRIFT-MATRIX-2026-09-26.md` — ACTIVE / EVIDENCE CONTROL.
- Brownfield task packet: `docs/architecture/task-packets/ASAS-TASK-Q1-SCHEMA-03-04-BROWNFIELD-PERSISTENCE-RECONCILIATION-2026-09-26.md` — OPEN / EVIDENCE-GATED.
- Runtime identity task: `docs/architecture/task-packets/ASAS-TASK-Q1-SCHEMA-05-RUNTIME-IDENTITY-AND-READONLY-INTROSPECTION-2026-09-26.md` — EXECUTED READ-ONLY / PARTIAL.
- GATE-00 evidence: `docs/architecture/reconciliation/ASAS-GATE-00-PLATFORM-IDENTITY-EVIDENCE-2026-09-26.md` — PARTIAL / EVIDENCE BASELINE.
- GATE-00 Vercel reconciliation: `docs/architecture/reconciliation/ASAS-GATE-00-VERCEL-ENVIRONMENT-RECONCILIATION-2026-09-26.md` — OPEN / PARTIAL.
- H0 foundation convergence packet: `docs/architecture/task-packets/ASAS-TASK-H0-FOUNDATION-GATE-CONVERGENCE-2026-09-26.md` — ACTIVE / HIGHEST PRIORITY.
- GATE-01 canonical artifact task: `docs/architecture/task-packets/ASAS-TASK-H0-GATE-01-CANONICAL-ARTIFACT-CONVERGENCE-2026-09-26.md` — OPEN / EVIDENCE-GATED.
- C04 CRM task: `docs/architecture/task-packets/ASAS-TASK-C04-CRM-ENGINEERING-CONFERENCE-2026-09-26.md` — SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED.
- Platform Engineering control board: `docs/architecture/ASAS-PLATFORM-ENGINEERING-CONTROL-BOARD-2026.md` — ACTIVE.
- Canonical artifact register: `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` — v1.5 / reconciled for the current platform track.

## Operating method
`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Founder/product decisions define desired future behavior. Research discovers omissions/conflicts but does not override founder decisions. Brownfield repository/runtime facts remain authoritative for what is already implemented.

## Platform Engineering track
`REALITY LOCK → REPOSITORY FORENSICS → RUNTIME IDENTITY → FOUNDATION GATES → DRIFT MATRIX → CONTRACT RECONCILIATION → IMPLEMENTATION PLAN → CODE → TEST / RED TEAM → EVIDENCE → CONVERGENCE → CHECKPOINT`

The Platform Engineering track is active alongside the Conference. Conference decisions are semantic authority; platform engineering converts them into evidence-backed implementation only after foundation reality is established.

## Foundation execution state

```text
GATE-00 Platform Identity        PARTIAL / REPOSITORY + SUPABASE CANDIDATE VERIFIED / VERCEL+ENV MAPPING OPEN
GATE-01 Canonical Artifacts      PARTIAL / REGISTER RECONCILED / READINESS OWNERSHIP STILL OPEN
GATE-02 Architecture Conflict    OPEN / RECONCILIATION REQUIRED
GATE-03 Database Reality         OPEN / RUNTIME TARGET CONFIRMATION REQUIRED
GATE-04 Security Baseline        BLOCKED BY GATE-03
GATE-05 Architecture CI          PARTIAL / EVIDENCE REQUIRED
GATE-06 Repository Hygiene       PARTIAL / RECONCILIATION REQUIRED
GATE-07 Implementation Auth      BLOCKED
```

## GATE-00 runtime evidence

The connected Supabase account exposes:

- `asas-web-site` — ref `xwokfufeeodobkuaxvgx`.
- `Asas platform` — ref `oliiumegstqujwexikhr`, `eu-west-1`, PostgreSQL 17.6, GA.

Read-only introspection was executed against `oliiumegstqujwexikhr`.

Observed:

- database `postgres`;
- PostgreSQL 17.6;
- cluster `main`;
- zero base tables in `public`;
- no ASAS application tables observed in `public`;
- only Supabase-managed `auth`, `realtime`, `storage`, and `vault` tables observed outside system schemas;
- Supabase migration inventory returned zero migrations.

This is strong evidence that the inspected `Asas platform` project is currently a platform shell rather than an already-populated ASAS application database. It does **not** yet prove that this project is the runtime target of every ASAS environment.

Therefore:

- 59/17/56 remains source-package evidence, not live schema proof;
- `Asas platform` is the current inspected candidate;
- Vercel/environment mapping and any other runtime target must be independently verified;
- no production schema/RLS/reservation implementation is authorized.

## Conference state

```text
C01     CLOSED
C02     SEMANTICALLY CLOSED / downstream refinement remains explicit
C03.1   CLOSED
C03.2   CLOSED
C03.3   CLOSED
C03.4   CLOSED
C03.5   CLOSED
C03.6   CLOSED
C03.7   CLOSED
C03.8   CLOSED
C03.9   CLOSED
C03.10  CLOSED
C03.11  CLOSED
C03.12  CLOSED
C03.13  OPEN — BROWNFIELD RECONCILIATION
C04     SEMANTICALLY CLOSED — IMPLEMENTATION BLOCKED
C05     OPEN — NEXT CONFERENCE WORK
C06     OPEN
C07     OPEN
C08     OPEN
C09     OPEN
C10     OPEN
C11     SEMANTIC OWNERSHIP CLOSED / CONTRACT OPEN
C12     OPEN
C13     OPEN
C14     OPEN
C15     OPEN
```

## C04 closure record

C04 CRM is semantically closed by ADR-0035. The closure covers Person/Customer identity, Lead ownership and duplicate policy, the 17-stage pipeline baseline, assignment/ownership distinctions, attribution boundaries, communication boundary, consent/purpose handling, Activity/Task/Appointment/Communication separation and AI authority. Legal basis/retention execution remains explicitly delegated to the country-pack/security authority in C15; executable state/event/permission registry IDs remain blocked on registry reconciliation. No implementation authorization is implied.

## Evidence blockers
- Vercel project identity and environment mapping;
- canonical runtime/database identity across all ASAS environments;
- canonical artifact convergence, including readiness-document ownership;
- architecture conflict reconciliation;
- RLS/runtime security evidence;
- Building/Floor/Unit/Listing/Reservation persistence representation if another runtime DB exists;
- exact Project Inventory Access mapping;
- Owner/Mandate semantics and permissions;
- Listing lifecycle/state-machine registration;
- publication/channel contract;
- state-machine register reconciliation;
- reservation concurrency mechanism;
- price/version persistence and overlap enforcement;
- Inventory Batch relationship/persistence;
- Finance executable semantics;
- event implementation evidence;
- architecture-as-code enforcement;
- governance/readiness hygiene;
- implementation authorization.

## Verification
- Repository/branch identity verified through GitHub.
- Supabase project inventory verified through connected Supabase tooling.
- `Asas platform` project identity and PostgreSQL version verified.
- Read-only database introspection executed successfully.
- Canonical artifact register updated to v1.5 and reconciled with current Platform Engineering artifacts.
- GATE-01 task packet created; closure remains evidence-gated.
- C04 task packet reviewed against V3, Enterprise Domain Model and Master Implementation Specification.
- ADR-0035 created and accepted as the C04 semantic decision record.
- CRM contract candidate created without promoting it to executable schema authority.
