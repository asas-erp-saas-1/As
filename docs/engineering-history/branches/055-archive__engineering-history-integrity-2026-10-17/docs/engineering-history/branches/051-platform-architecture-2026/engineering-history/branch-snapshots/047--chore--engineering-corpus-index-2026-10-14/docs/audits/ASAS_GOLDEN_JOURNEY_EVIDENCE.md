# ASAS Golden Journey Evidence

**Target journey**

`Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment → Receipt → Audit`

**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  
**HEAD:** `a9fdfdfe16864881b47b6ec1e8712a3124fdb9dd`

## Executive result

**Executable Golden Journey: NOT PRESENT.**

The current repository contains architecture, contracts and registers describing the journey, but no application runtime capable of executing it. The journey therefore cannot be proven end-to-end.

## Evidence table

| Stage | Target behavior | Current evidence | Status | Break |
|---|---|---|---|---|
| Lead | create/capture qualified lead | no executable lead module | MISSING | yes |
| Assignment | assign owner within tenant | permission/architecture doctrine only | SCAFFOLDED | yes |
| Activity | record commercial activity | no runtime | MISSING | yes |
| Visit | schedule/record visit | architecture candidate only | SCAFFOLDED | yes |
| Offer | governed offer lifecycle | Offer contract v1.1.0; closure remains partial | PARTIAL | yes |
| Reservation | atomic hold/reservation | Unit/Reservation consistency contract | SCAFFOLDED | yes |
| Contract | contract lifecycle | no runtime | MISSING | yes |
| Payment Plan | schedule obligations | source schema semantics | SCAFFOLDED | yes |
| Payment | controlled financial fact | finance semantic reconciliation only | PARTIAL | yes |
| Receipt | receipt/allocation | source semantics; no runtime | SCAFFOLDED | yes |
| Audit | immutable trace of material changes | doctrine/register only | SCAFFOLDED | yes |

## Why this is a hard break

The current Blueprint requires authoritative lifecycle mutations to follow:

`Command → Authentication → Authorization → Tenant Scope → Aggregate Load → Preconditions → Legal Transition → Domain Invariants → State Mutation → Audit → Domain Event → Transactional Outbox → Commit`

None of those runtime stages can be demonstrated in the current `As` repository because the application and executable schema are absent.

## Stage-by-stage gap

### 1. Lead

**Required:** tenant-scoped lead aggregate, validated intake, assignment-ready status, audit.

**Current:** no application implementation.

**Validation needed:** create lead, reject invalid input, verify tenant scope, persist, audit.

### 2. Assignment

**Required:** explicit owner assignment with permission and audit.

**Current:** target permission model exists; no command/runtime.

**Validation:** unauthorized assignment rejected; authorized assignment audited.

### 3. Activity

**Required:** appendable commercial activity/timeline with actor and timestamp.

**Current:** architecture only.

**Validation:** create activity under tenant, enforce actor scope, audit.

### 4. Visit

**Required:** controlled scheduling/visit lifecycle.

**Current:** Scheduling ownership remains an open/founder decision in the checkpoint; no implementation.

**Validation:** once ownership is closed, test create/reschedule/cancel and authorization.

### 5. Offer

**Required:** deterministic effective price, discount authority, validity, Unit/opportunity integrity, Offer/Reservation separation and idempotent mutation.

**Current:** Offer contract exists but exact state machine, canonical permission keys, discount approval authority, event schema and idempotency design remain open.

**Status:** PARTIAL / implementation blocked.

### 6. Reservation

**Required:** transactional lock/re-verification, active-reservation uniqueness/hold rules, expiry and audit.

**Current:** approved logical protocol exists; executable enforcement is unverified.

**Validation:** concurrent reservation race test, retry test, expiry test and rollback test.

### 7. Contract

**Required:** contract lifecycle linked to the reserved Unit and commercial terms.

**Current:** no application implementation.

**Validation:** contract creation only from valid state; immutable signed/posted facts as appropriate.

### 8. Payment Plan

**Required:** deterministic schedule and relationship to contract/receipts.

**Current:** source contract semantics exist.

**Important:** the source model supports `Contract → PaymentPlan/PaymentScheduleItem → Receipt → ReceiptAllocation`. Do not invent a standalone Payment aggregate solely from lifecycle wording.

### 9. Payment

**Required:** controlled financial recording, allocation and idempotency.

**Current:** semantic reconciliation only; no executable finance path.

**Validation:** duplicate command, amount/currency/rounding, allocation balance and reversal tests.

### 10. Receipt

**Required:** immutable receipt fact and controlled allocations.

**Current:** source semantics; no runtime.

**Validation:** allocation reconciliation and audit.

### 11. Audit

**Required:** material lifecycle mutations produce actor/tenant/entity/action/before-after evidence.

**Current:** audit architecture exists, but no executable audit writer is present.

**Validation:** golden journey must produce an auditable trail with causation/correlation context.

## End-to-end proof required for internal production

A single deterministic fixture should prove:

1. create tenant/workspace;
2. authenticate user;
3. create project/building/unit;
4. create lead;
5. assign lead;
6. record activity;
7. create visit;
8. create valid offer;
9. reserve Unit under concurrency control;
10. create contract;
11. create payment plan;
12. record receipt/payment;
13. allocate receipt;
14. verify financial invariants;
15. verify audit trail;
16. verify emitted event/outbox record;
17. replay the same idempotency key and prove no duplicate business effect;
18. run a second tenant in parallel and prove zero cross-tenant visibility.

Until this passes in an automated test environment, the Golden Journey is not production-ready.
