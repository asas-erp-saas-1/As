# ASAS Real Estate OS — Domain Contracts Map

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Authority:** Blueprint v1.6.1, registers, ADRs, founder Product Truth and canonical context classification.

## 1. Purpose

This document converts the Blueprint's domain architecture into an implementation contract. It defines bounded-context ownership, mutations, facts, invariants and cross-context boundaries.

The implementation remains a modular monolith. Bounded contexts are logical ownership boundaries, not microservices.

## 2. Canonical dependency rule

`Presentation → Application → Domain`

`Infrastructure → Application/Domain ports`

Domain code never imports UI, HTTP, Prisma, Supabase clients, provider SDKs, or framework-specific request objects.

Cross-context collaboration uses explicit application contracts, domain/integration events or read models. No direct mutation of another context's aggregates.

## 3. Canonical chain

`Agency/Workspace → Developer relationship → Project → Building → Unit → Public presentation → Lead → Qualification → Visit → Offer → Reservation → Contract → Payment schedule → Collection → Accounting/Finance → Post-sale`

Inventory is transactional truth. Finance is contractual/financial truth. Studio owns public publishing state. Integrations are adapters, never alternate sources of truth.

## 4. Contract vocabulary

- **Entity:** identity-bearing business object.
- **Aggregate:** consistency boundary with one authoritative mutation root.
- **Value Object:** immutable value with domain semantics.
- **Command:** requested intent to change state.
- **Query:** read operation with no business mutation.
- **Domain Event:** immutable fact that a business transition occurred.
- **Invariant:** condition that must never be violated.
- **Policy:** decision rule that may depend on context/configuration.
- **Projection:** derived/read-optimized representation; never the source of transactional truth.

## 5. Canonical bounded contexts

The Blueprint operating protocol defines nine contexts. Scheduling is hosted inside CRM; it is not a tenth context. Public website is a product surface, not a bounded context. Integration, notification, workflow/approval and audit mechanisms are platform capabilities unless the authoritative register explicitly assigns ownership elsewhere.

### 5.1 Core / Identity & Access
**Owns:** tenant/workspace hierarchy, companies, branches, teams, users, roles, permissions, grants, sessions and impersonation.

**Commands:** assign role, revoke grant, create/revoke session, impersonate subject.

**Invariants:** deny by default; tenant guard first; scope cannot exceed grant; explicit deny overrides; privileged actions are auditable.

### 5.2 CRM
**Owns:** leads, lead working/lifecycle state, customer context, opportunities, appointments/scheduling submodule, commercial activity and source references.

**Commands:** create/qualify/assign lead, schedule appointment, advance opportunity, record activity, issue/advance commercial opportunity where assigned by the contract.

**Invariants:** lifecycle transitions use canonical state machines; ownership/scoping is authorization-aware; public lead capture cannot bypass tenant attribution; ASAS appointment truth is authoritative over external calendars.

### 5.3 Sales
**Owns:** offers, reservation/contract commercial lifecycle, sales approvals and sales-side contractual workflow.

**Commands:** issue offer, request reservation, approve/reject, confirm/cancel/expire reservation, create/activate contract.

**Invariants:** reservation is race-safe; eligibility/approval gates are enforced; historical commercial facts are immutable; every governed transition records actor/reason.

### 5.4 Inventory
**Owns:** projects, buildings, apartments/units, floor plans, inventory media associations, commercial status, construction status, holds, milestones and availability truth/projection.

**Commands:** create/update inventory entity, transition commercial/construction status, place/release/expire hold, publish availability projection.

**Invariants:** dual-axis lifecycle; no arbitrary status setter; database-enforced reservation/hold race safety; unique inventory identity; published availability is derived from transactional truth.

### 5.5 Finance
**Owns:** payment plans, schedule items, receipts, allocations, accounts, ledger entries, accounting periods, commissions and payouts.

**Commands:** generate schedule, record receipt, allocate receipt, post ledger, close period, calculate/approve/pay commission.

**Invariants:** integer DZD centimes plus explicit currency; double-entry balance; posted records immutable; allocation cannot exceed available receipt; closed periods reject mutation except governed reversal/correction.

### 5.6 Website Studio
**Owns:** pages, page versions, section composition, SEO metadata, forms/CTA bindings, contextual public presentation and publishing lifecycle.

**Commands:** create page, edit draft, autosave, create version, preview, submit approval, publish, rollback.

**Invariants:** published versions are immutable; publication is explicit; rollback is governed; public output comes from approved/published state; operational inventory truth is not silently mutated by content editing.

### 5.7 Marketing
**Owns:** campaigns, lead sources, UTM/web events, ad leads, attribution touches, campaign spend and conversion attribution.

**Commands:** register campaign/source, ingest ad lead, attribute touch, record spend, create conversion task.

**Invariants:** provider payloads are idempotent; attribution is traceable; raw provider identifiers remain available for reconciliation; marketing consent is respected.

### 5.8 Analytics
**Owns:** derived analytical models, KPI/read models, executive reporting and analytical projections.

**Commands:** rebuild/refresh projections, define governed analytical models where the contract permits.

**Invariants:** analytics does not become transactional source of truth; projections are rebuildable; stale/partial analytical data is surfaced rather than presented as authoritative current state.

### 5.9 Documents
**Owns:** document metadata, attachment references, templates, versions and document lifecycle capabilities.

**Commands:** create document, attach/version, generate from approved template, approve/archive according to applicable workflow.

**Invariants:** version history is preserved; document access is permission/tenant scoped; document storage credentials never leak to domain/UI code.

## 6. Hosted submodules and platform capabilities

### Scheduling
Hosted under CRM. External calendars are integrations; ASAS owns appointment truth.

### Integrations
Provider adapters, webhook verification, credentials, retries and delivery state are infrastructure/application capabilities. Provider SDKs do not cross into domain code.

### Workflow / approvals / notifications
Reusable platform capabilities. They execute policies for context-owned operations and do not acquire ownership of those aggregates.

### Audit / timeline
Append-only evidence/projection mechanisms over governed events. They do not own the business state they describe.

### Search
Derived read model. Search results never authorize or mutate transactional state.

### Public Experience
Product surface composed from approved Studio content plus canonical Inventory/Marketing/CRM data. It is not an alternate database of property truth.

## 7. State machines

The 11 Blueprint machines are canonical:

`B.1 apartment commercial status`
`B.2 apartment construction status`
`B.3 lead lifecycle`
`B.4 lead working`
`B.5 opportunity pipeline`
`B.6 reservation`
`B.7 contract`
`B.8 payment schedule item`
`B.9 approval request`
`B.10 Studio page version`
`B.11 appointment`

Implementation rule: one transition service per machine; illegal transitions return typed domain errors; no generic `setStatus`; audit and required domain event are committed with the transition.

## 8. Command contract

Every state-changing command declares:

`actor → tenant → target aggregate → preconditions → authorization → idempotency → mutation → audit → outbox event → response`

A command must be retry-safe or explicitly reject duplicate execution.

## 9. Event contract

The registered dotted event identity is canonical. In-code PascalCase names, if used, are aliases/symbols only and must map one-to-one to the registered event identity and version. See `EVENT-TAXONOMY-CONTRACT.md`.

## 10. Read-model contract

Read models may denormalize for speed, search and dashboards. They must be rebuildable from canonical state/events where applicable. No UI may treat an analytical, availability or search projection as authoritative for a financial or inventory mutation.

## 11. Cross-context rule

When a feature appears to require direct access to another module's tables, stop and determine whether the correct solution is:

1. application port,
2. domain/integration event,
3. projection/read model,
4. shared kernel value object,
5. or founder-approved boundary change.

Do not solve boundary pressure with uncontrolled imports.

## 12. Acceptance criteria

Before a context is considered implemented:

- aggregates and commands are mapped to authoritative contracts;
- invariants have executable tests;
- authorization and tenant scope are explicit;
- events are registered before emission;
- state transitions are exhaustive for governed machines;
- database constraints exist for invariants requiring database enforcement;
- failure/retry behavior is specified;
- audit/outbox behavior is demonstrated;
- UI workflows map to commands rather than arbitrary field setters.
