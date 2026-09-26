# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE + PLATFORM ENGINEERING CHECKPOINT  
**Version:** 3.38  
**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## Current checkpoint
`ARCH-2026-H1.23-GATE-00-PLATFORM-IDENTITY-PARTIAL-01`

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
- ADRs: `ADR-0021` Scheduling through `ADR-0034` Reservation Boundary — accepted for their semantic slices.
- Contracts: Project, Unit, Listing, Multi-Actor Authority, Unit State, Pricing Versioning, Inventory Lifecycle and Reservation Consistency are semantically closed / implementation blocked.
- Research records: Building, Floor, Unit and Listing accepted research basis; Pricing, Inventory Lifecycle and Reservation research basis recorded in ADR-0032/0033/0034.
- Brownfield reality report: `docs/architecture/reconciliation/ASAS-BROWNFIELD-REALITY-REPORT-2026-09-26.md` — ACTIVE / EVIDENCE BASELINE.
- Brownfield drift matrix: `docs/architecture/reconciliation/ASAS-BROWNFIELD-DRIFT-MATRIX-2026-09-26.md` — ACTIVE / EVIDENCE CONTROL.
- Brownfield task packet: `docs/architecture/task-packets/ASAS-TASK-Q1-SCHEMA-03-04-BROWNFIELD-PERSISTENCE-RECONCILIATION-2026-09-26.md` — OPEN / EVIDENCE-GATED.
- Runtime identity task: `docs/architecture/task-packets/ASAS-TASK-Q1-SCHEMA-05-RUNTIME-IDENTITY-AND-READONLY-INTROSPECTION-2026-09-26.md` — EXECUTED READ-ONLY / PARTIAL.
- GATE-00 evidence: `docs/architecture/reconciliation/ASAS-GATE-00-PLATFORM-IDENTITY-EVIDENCE-2026-09-26.md` — PARTIAL / EVIDENCE BASELINE.
- H0 foundation convergence packet: `docs/architecture/task-packets/ASAS-TASK-H0-FOUNDATION-GATE-CONVERGENCE-2026-09-26.md` — ACTIVE / HIGHEST PRIORITY.
- Platform Engineering control board: `docs/architecture/ASAS-PLATFORM-ENGINEERING-CONTROL-BOARD-2026.md` — ACTIVE.

## Operating method
`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Founder/product decisions define desired future behavior. Research discovers omissions/conflicts but does not override founder decisions. Brownfield repository/runtime facts remain authoritative for what is already implemented.

## Platform Engineering track
`REALITY LOCK → REPOSITORY FORENSICS → RUNTIME IDENTITY → FOUNDATION GATES → DRIFT MATRIX → CONTRACT RECONCILIATION → IMPLEMENTATION PLAN → CODE → TEST / RED TEAM → EVIDENCE → CONVERGENCE → CHECKPOINT`

The Platform Engineering track is active alongside the Conference. Conference decisions are semantic authority; platform engineering converts them into evidence-backed implementation only after foundation reality is established.

## Foundation execution state

```text
GATE-00 Platform Identity        PARTIAL / REPOSITORY + SUPABASE CANDIDATE VERIFIED / VERCEL+ENV MAPPING OPEN
GATE-01 Canonical Artifacts      OPEN / CONVERGENCE REQUIRED
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

## C03
`C03.1 RESOURCE IDENTITY CLOSED / C03.2 ASSET TAXONOMY CLOSED / C03.3 PROJECT CLOSED / C03.4 BUILDING CLOSED / C03.5 FLOOR CLOSED / C03.6 UNIT CLOSED / C03.7 LISTING CLOSED / C03.8 MULTI-ACTOR AUTHORITY CLOSED / C03.9 UNIT STATE DOCTRINE CLOSED / C03.10 PRICING & VERSIONING CLOSED / C03.11 INVENTORY LIFECYCLE CLOSED / C03.12 RESERVATION BOUNDARY SEMANTICS CLOSED / C03.13 BROWNFIELD RECONCILIATION OPEN`

## Evidence blockers
- Vercel project identity and environment mapping;
- canonical runtime/database identity across all ASAS environments;
- canonical artifact convergence;
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
- No DDL, migration, RLS modification, seed, reset, or destructive operation executed.
- Live runtime mapping remains PARTIAL until Vercel/environment evidence is obtained.
- CI has not been independently rerun after this checkpoint change.

## Next execution step
**GATE-00 completion:** verify Vercel project identity and environment-variable mapping, then reconcile the runtime target with the Supabase candidate before any schema-touching implementation.