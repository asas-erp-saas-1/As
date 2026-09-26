# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE + PLATFORM ENGINEERING CHECKPOINT  
**Version:** 3.42  
**Date:** 2026-09-27  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## Current checkpoint
`ARCH-2026-H1.26-DEEP-C03-C06-REVIEW-SERIAL-GATE-EXECUTION-01`

This file is the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## Deep-review authority
C03–C06 semantic baselines have been re-audited. The active rule is now: **semantic baseline does not equal conference completion**. Full closure requires cross-context reconciliation, canonical contracts, registry IDs, invariant-to-test mapping, data-impact analysis, security/tenant review, current external authority where applicable, rejected alternatives, checkpoint evidence, and applicable foundation gates. The detailed record is `docs/architecture/reconciliation/ASAS-C03-C06-DEEP-CLOSURE-DECISIONS-2026-09-27.md`.

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
- Scheduling is Core-hosted by the conference decision.
- Commission is Finance-owned, policy-versioned, milestone-derived and snapshot-based; payout is distinct.
- Offer is Sales-owned, versioned and distinct from Hold/Reservation.
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
- Offer/Hold/Reservation/Contract capture applicable commercial terms; later price changes do not rewrite prior transaction economics.
- Discounts and price overrides are explicit adjustments subject to policy/approval.
- Future-effective prices cannot become current before their effective time.
- Public/search/analytics projections consume pricing authority and cannot mutate it.
- Development Unit and brokerage Listing are distinct.
- Listing is the brokerage commercial representation under Owner/Mandate semantics.
- Listing ≠ Unit ≠ Property ≠ Mandate.
- Listing does not transfer legal ownership and does not itself grant authorization.
- Publication/channel projections are not independent inventory truth.
- Listing withdrawal/expiry preserves historical transactions and audit facts.
- Multi-actor authority is evaluated by identity + tenant/organization + relationship + role/team + scope + attributes + purpose + resource + action + policy + audit.
- Visibility, operational control, allocation, reservation, publication, contract, finance, commission and administration are distinct authority dimensions.
- Mandate/relationship determines brokerage authority; Listing itself does not.
- Project/resource scope can narrow development authority; AI inherits caller authority and cannot escalate it.
- Tenant isolation must hold across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations.
- Unit commercial lifecycle and construction lifecycle are independent.
- Commercial: `AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`.
- Construction: `NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`.
- These states must never be collapsed.
- Inventory lifecycle is controlled by domain actions/state-machine policy, not raw status setters.
- Hold expiration/release is authorized and deterministic.
- Contracted/Sold inventory cannot be made available by stale projection state.
- OFF_MARKET is a commercial policy state, not deletion and not SOLD.
- Construction progress cannot create/release/transfer a reservation.
- Offer, Hold, Reservation, Contract, Payment, Commission and Listing/publication retain separate lifecycles.
- Direct raw status mutation is prohibited.
- Reservation is a first-class transactional consistency boundary for the development Unit.
- At most one active winning Reservation may exist for a Unit under canonical policy.
- The winner is the successful transaction commit, never UI order, timestamp, cache or analytics.
- Reservation success and the Unit commercial-state consequence must be committed atomically within the selected transaction boundary.
- Reservation requires database-enforced single-winner integrity.
- Reservation commands must be idempotent; same key + same command returns the committed result; conflicting reuse is rejected.
- Expiration/release is conditional on reservation identity/version; stale jobs cannot release a newer winner.
- Reservation records capture milestone commercial terms; later price versions do not rewrite them.
- Reservation events are emitted from committed state through a transactional outbox boundary.
- Concrete PostgreSQL locking/isolation/constraint strategy remains implementation-gated.
- **C04 CRM:** Person is canonical human identity; Customer is an organization-scoped relationship over Person.
- **C04 CRM:** Lead is organization-owned; multiple active Leads for one Person require materially distinct commercial engagements.
- **C04 CRM:** The existing 17-stage unified sales pipeline remains the semantic baseline; `Deal` is a derived view.
- **C04 CRM:** Lead ownership, operational assignment, team scope, branch scope and organization/tenant are distinct.
- **C04 CRM:** Assignment changes preserve history; merge is an authorized domain action, never silent deletion.
- **C04 CRM:** Source, campaign, channel/touch, operational assignment, commercial attribution and commission entitlement are distinct.
- **C04 CRM:** Communication transport is platform-owned; CRM owns the relationship/projection.
- **C04 CRM:** Consent/purpose are first-class governed facts; legal basis/retention/data-subject execution remain C15/country-pack governed.
- **C04 CRM:** Activity, Task, Appointment and Communication are distinct.
- **C04 CRM:** AI may read/recommend/draft within caller authority; sensitive/financial/destructive/mass actions require applicable approval.
- **Deep-review decisions:** independently salable parking/storage are ancillary Inventory items; Release/InventoryBatch is optional control metadata; Unit PriceVersion is the authoritative price fact; a reservation may contain one primary Unit plus eligible ancillary items subject to atomic package policy; Person may have multiple Leads for distinct engagements; lost leads reopen only when materially the same engagement; Hold may exist only through explicit authorized operational policy; multiple Offers may coexist; required documents are transition-policy driven; Finance supports many-to-many Payment/Installment allocation via explicit allocation facts; commission entitlement is policy-versioned and cancellation creates adjustment/recovery rather than rewriting history.

## Canonical control plane
- Product requirements: `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` — PROPOSED / FOUNDER REVIEW REQUIRED
- Blueprint: `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — PROPOSED v1.5.1
- Roadmap: `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — ACTIVE
- Conference: `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md` — ACTIVE / CANONICAL DECISION WORKSTREAM
- Context Prompt: `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — ACTIVE
- Master Execution Path: `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
- Source of Truth: `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
- Research-first method: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md` — CANONICAL
- ADRs: `ADR-0021` through `ADR-0037` are semantic decision history; C03–C06 remain implementation blocked pending convergence/evidence.
- Deep C03–C06 decision record: `docs/architecture/reconciliation/ASAS-C03-C06-DEEP-CLOSURE-DECISIONS-2026-09-27.md` — ACTIVE / DEEP REVIEW.
- External research record: `docs/architecture/research/ASAS-C03-C06-EXTERNAL-RESEARCH-2026-09-27.md` — ACTIVE / CURRENT EVIDENCE.
- Environment mapping research: `docs/architecture/research/ASAS-VERCEL-SUPABASE-ENVIRONMENT-MAPPING-2026-09-27.md` — CANONICAL GATE-00 INPUT.
- Brownfield reality report: `docs/architecture/reconciliation/ASAS-BROWNFIELD-REALITY-REPORT-2026-09-26.md` — ACTIVE / EVIDENCE BASELINE.
- Brownfield drift matrix: `docs/architecture/reconciliation/ASAS-BROWNFIELD-DRIFT-MATRIX-2026-09-26.md` — ACTIVE / EVIDENCE CONTROL.
- Brownfield task packet: `docs/architecture/task-packets/ASAS-TASK-Q1-SCHEMA-03-04-BROWNFIELD-PERSISTENCE-RECONCILIATION-2026-09-26.md` — OPEN / EVIDENCE-GATED.
- Runtime identity task: `docs/architecture/task-packets/ASAS-TASK-Q1-SCHEMA-05-RUNTIME-IDENTITY-AND-READONLY-INTROSPECTION-2026-09-26.md` — EXECUTED READ-ONLY / PARTIAL.
- GATE-00 evidence: `docs/architecture/reconciliation/ASAS-GATE-00-PLATFORM-IDENTITY-EVIDENCE-2026-09-26.md` — PARTIAL / EVIDENCE BASELINE.
- GATE-00 Vercel reconciliation: `docs/architecture/reconciliation/ASAS-GATE-00-VERCEL-ENVIRONMENT-RECONCILIATION-2026-09-26.md` — OPEN / PARTIAL.
- H0 foundation convergence packet: `docs/architecture/task-packets/ASAS-TASK-H0-FOUNDATION-GATE-CONVERGENCE-2026-09-26.md` — ACTIVE / HIGHEST PRIORITY.
- GATE-01 canonical artifact task: `docs/architecture/task-packets/ASAS-TASK-H0-GATE-01-CANONICAL-ARTIFACT-CONVERGENCE-2026-09-26.md` — OPEN / EVIDENCE-GATED.
- Platform Engineering control board: `docs/architecture/ASAS-PLATFORM-ENGINEERING-CONTROL-BOARD-2026.md` — ACTIVE.
- Canonical artifact register: `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` — v1.5 / reconciled for current platform track.

## Operating method
`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Founder/product decisions define desired future behavior. Research discovers omissions/conflicts but does not override founder decisions. Brownfield repository/runtime facts remain authoritative for what is already implemented.

## Platform Engineering track
`REALITY LOCK → REPOSITORY FORENSICS → RUNTIME IDENTITY → FOUNDATION GATES → DRIFT MATRIX → CONTRACT RECONCILIATION → IMPLEMENTATION PLAN → CODE → TEST / RED TEAM → EVIDENCE → CONVERGENCE → CHECKPOINT`

The Platform Engineering track is active. Conference decisions are semantic authority; platform engineering converts them into evidence-backed implementation only after foundation reality is established.

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

This is strong evidence that the inspected `Asas platform` project is currently a platform shell rather than an already-populated ASAS application database. It does **not** prove that this project is the runtime target of every ASAS environment.

Therefore:
- source-package schema counts remain source-package evidence, not live schema proof;
- `Asas platform` is the current inspected candidate;
- Vercel/environment mapping and any other runtime target must be independently verified;
- no production schema/RLS/reservation implementation is authorized.

## Environment identity doctrine

`Vercel Environment ≠ Supabase Environment`.

Vercel currently distinguishes Production, Preview and Development, with custom environments available where supported. Supabase uses Projects and database branches as the relevant runtime/isolation units; the names do not automatically map one-to-one.

ASAS canonical mapping:

```text
Vercel Production
    ↓
Production deployment from configured Production Branch
    ↓
EXACT VERIFIED Supabase Production Project
    ↓
PROJECT_REF
```

`platform-architecture-2026` remains the sole active ASAS engineering work line. We do not create a staging branch merely to satisfy environment naming. Preview/non-production remote verification, when required, must use an explicitly isolated Supabase project/branch and must never point schema mutation or destructive testing at Production. Development is local-first; any remote development project requires a separately verified PROJECT_REF.

For every candidate Supabase target, verify `Settings → General → Project Settings → Reference ID`, confirm the dashboard URL, then use `Connect` for the actual database connection configuration. Never identify a target by display name alone.

For Vercel, verify `Settings → Git`, `Deployments`, `Settings → Environments`, and `Settings → Environment Variables`; compare non-secret Supabase URL/reference information with the intended PROJECT_REF and redeploy after variable changes.

A technical guard must eventually compare the verified Production `PROJECT_REF` against one repository-controlled non-secret identity declaration and hard-fail before schema-touching work on mismatch.

## Conference state
```text
C01     CLOSED
C02     SEMANTICALLY CLOSED / downstream refinement remains explicit
C03.1-12 CLOSED
C03.13  OPEN — BROWNFIELD RECONCILIATION
C04     SEMANTIC BASELINE / CONVERGENCE OPEN — DEEP REVIEW COMPLETED
C05     SEMANTIC BASELINE / CONVERGENCE OPEN — DEEP REVIEW COMPLETED
C06     SEMANTIC BASELINE / CONVERGENCE OPEN — DEEP REVIEW COMPLETED
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

## Evidence blockers
- exact Vercel project identity;
- configured Production Branch;
- Production deployment commit/environment;
- exact Production Supabase `PROJECT_REF` mapping;
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
- ancillary inventory / Inventory Batch persistence representation;
- Finance executable semantics and country/accounting authority;
- event implementation evidence.

## Serial execution rule

**No parallel gate hopping.** Work proceeds one gate at a time. Complete the active gate's evidence and closure criteria before advancing. The required order is:

`GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07`

Only after GATE-00..06 are green may implementation begin. Domain conference work may be documented only when it does not bypass the active gate; schema, RLS, migrations, production mutations and implementation are prohibited until authorization.
