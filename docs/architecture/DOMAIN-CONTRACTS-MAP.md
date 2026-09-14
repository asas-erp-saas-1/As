# ASAS Real Estate OS — Domain Contracts Map

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Authority:** Blueprint v1.6.1, registers, ADRs, founder Product Truth.

## 1. Purpose

This document converts the Blueprint's domain architecture into an implementation contract. It defines what belongs to a bounded context, which mutations are commands, which facts become domain events, and which invariants must be enforced below the UI.

The implementation must remain a modular monolith. Module boundaries are logical ownership boundaries, not a mandate for microservices.

## 2. Canonical dependency rule

`Presentation → Application → Domain`

`Infrastructure → Application/Domain ports`

Domain code never imports UI, HTTP, Prisma, Supabase clients, provider SDKs, or framework-specific request objects.

Cross-context collaboration uses explicit application contracts, domain events, or read models. No direct mutation of another context's aggregates.

## 3. Canonical chain

`Agency/Workspace → Developer relationship → Project → Building → Unit → Public presentation → Lead → Qualification → Visit → Offer → Reservation → Contract → Payment schedule → Collection → Accounting/Finance → Post-sale`

Inventory is transactional truth. Finance is the contractual/financial truth. Integrations are adapters and never alternate sources of truth.

## 4. Contract vocabulary

Every context must distinguish:

- **Entity:** identity-bearing business object.
- **Aggregate:** consistency boundary with one authoritative mutation root.
- **Value Object:** immutable value with domain semantics.
- **Command:** requested intent to change state.
- **Query:** read operation with no business mutation.
- **Domain Event:** immutable fact that a business transition occurred.
- **Invariant:** condition that must never be violated.
- **Policy:** decision rule that may depend on context/configuration.
- **Projection:** derived/read-optimized representation; never the source of truth.

## 5. Context map

### 5.1 Core / Organization & IAM
**Owns:** tenant/workspace hierarchy, companies, branches, teams, users, roles, permissions, grants, sessions, impersonation.

**Commands:** assign role, revoke grant, create session, revoke session, impersonate subject.

**Events:** UserRoleGranted, UserRoleRevoked, SessionCreated, SessionRevoked, ImpersonationStarted.

**Invariants:** deny by default; tenant guard first; scope cannot exceed grant; deny overrides; privileged actions are auditable.

### 5.2 Inventory
**Owns:** projects, buildings, apartments/units, floor plans, media associations, commercial status, construction status, holds, milestones, published availability projection.

**Commands:** create/update inventory entity, transition commercial status, transition construction status, place/release/expire hold, publish availability.

**Events:** ProjectCreated, BuildingCreated, ApartmentCreated, ApartmentCommercialStatusChanged, ApartmentConstructionStatusChanged, HoldPlaced, HoldReleased, AvailabilityPublished.

**Invariants:** dual-axis lifecycle; no arbitrary status setter; reservation/hold race safety; unique inventory identity; published availability is derived from transactional truth.

### 5.3 CRM & Sales
**Owns:** leads, lead working state, opportunities, offers, appointments, sales ownership, source/attribution references.

**Commands:** create/qualify/assign lead, schedule appointment, advance opportunity, issue offer, withdraw/loss.

**Events:** LeadCreated, LeadQualified, AppointmentScheduled, AppointmentCompleted, OpportunityStageChanged, OfferIssued, OpportunityWon, OpportunityLost.

**Invariants:** lifecycle transitions use canonical state machines; ownership/scoping is authorization-aware; public lead capture cannot bypass tenant attribution.

### 5.4 Reservations & Contracts
**Owns:** reservation lifecycle, contractual reservation facts, contracts, approval requests and decisions where contractually required.

**Commands:** request reservation, approve/reject, confirm reservation, cancel/expire, create/activate contract.

**Events:** ReservationRequested, ReservationApproved, ReservationConfirmed, ReservationExpired, ContractCreated, ContractActivated.

**Invariants:** single-winner inventory reservation; eligibility/approval gates; immutable historical facts; every state transition records actor/reason.

### 5.5 Finance
**Owns:** payment plans, schedule items, receipts, allocations, accounts, ledger entries, accounting periods, commissions and payouts.

**Commands:** generate schedule, record receipt, allocate receipt, post ledger, close period, calculate/approve/pay commission.

**Events:** PaymentScheduleCreated, ReceiptRecorded, ReceiptAllocated, LedgerPosted, AccountingPeriodClosed, CommissionAccrued, CommissionPaid.

**Invariants:** integer DZD centimes plus explicit currency; double-entry balance; posted records immutable; allocation cannot exceed available receipt; closed periods reject mutation except governed reversal/correction.

### 5.6 Studio / Publishing
**Owns:** pages, page versions, publishing status, section composition, SEO metadata, forms/CTA bindings and contextual public presentation configuration.

**Commands:** create page, edit draft, create version, preview, submit approval, publish, rollback.

**Events:** PageDraftSaved, PageVersionCreated, PageSubmittedForApproval, PagePublished, PageRolledBack.

**Invariants:** published versions are immutable; publication is explicit; rollback creates a governed version transition; public output is generated from approved state.

### 5.7 Marketing & Attribution
**Owns:** campaigns, lead sources, UTM events, ad leads, attribution touches, campaign spend, conversion tasks and web events.

**Commands:** register campaign/source, ingest ad lead, attribute touch, record spend, create conversion task.

**Events:** CampaignCreated, AdLeadIngested, AttributionRecorded, CampaignSpendRecorded, ConversionTaskCreated.

**Invariants:** provider payloads are idempotent; attribution is traceable; raw provider identifiers remain available for reconciliation.

### 5.8 Integrations & Scheduling
**Owns:** provider accounts/credentials metadata, provider events, webhook endpoints/deliveries, calendar connections, availability rules/overrides, external busy blocks and integration delivery state.

**Commands:** connect provider, rotate credential, receive webhook, acknowledge/retry delivery, sync calendar, create/update availability rule.

**Events:** IntegrationConnected, ProviderEventReceived, WebhookDeliverySucceeded, WebhookDeliveryFailed, CalendarSynced.

**Invariants:** signatures verified before processing; secrets never exposed to clients/logs; retries are bounded and idempotent; external systems cannot directly mutate canonical domain state.

## 6. State machines

The 11 Blueprint machines are canonical. Current structured machines include apartment commercial status, with the remaining prose-defined machines to be canonicalized before implementation where the register requires it.

Implementation rule: one transition service per state machine; illegal transitions return a typed domain error; no generic `setStatus`; transition emits audit + domain event in the same business transaction.

## 7. Command contract

Every state-changing command must declare:

`actor → tenant → target aggregate → preconditions → authorization → idempotency → mutation → audit → outbox event → response`

A command must be safe to retry or explicitly reject duplicate execution.

## 8. Read-model contract

Read models may denormalize for speed, search and dashboards. They must be rebuildable from canonical state and events where applicable. No UI may treat a projection as authoritative for a financial or inventory mutation.

## 9. Cross-context rule

When a feature appears to require direct access to another module's tables, stop and determine whether the correct solution is:

1. an application port,
2. a domain event,
3. a projection/read model,
4. an explicit shared kernel value object,
5. or a founder-approved boundary change.

Do not solve boundary pressure with uncontrolled imports.

## 10. Acceptance criteria for future implementation

Before a context is considered implemented:

- all aggregates and commands are mapped to a contract;
- invariants have executable tests;
- authorization and tenant scope are explicit;
- domain events are registered before emission;
- state transitions are exhaustive for the governed machine;
- persistence constraints exist for invariants that require database enforcement;
- failure/retry behavior is specified;
- audit/outbox behavior is demonstrated;
- UI workflows map to commands rather than arbitrary field setters.
