# ASAS — OFFER DOMAIN CONTRACT 2026

**Artifact ID:** ASAS-ARCH-OFFER-2026-001  
**Status:** DERIVED DOMAIN CONTRACT — OPEN / NOT IMPLEMENTATION AUTHORITY  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Owner:** Sales / Commercial Domain — ownership confirmation required  
**Branch:** `platform-architecture-2026`  
**Authority:** Derived from the 2026 Blueprint, Command/Action Register, Aggregate/Invariant Register and source schema evidence. It does not override an approved ADR, founder decision, canonical register, live runtime or live database.

## 1. PURPOSE

Establish the minimum semantic contract for `Offer` before schema or application implementation is authorized.

This artifact exists because `Offer` is explicitly present in the commercial traceability spine and source schema evidence, but its complete aggregate ownership, lifecycle, authorization and event contract was not previously closed.

An Offer is not automatically:

- a bounded context;
- a module;
- a database table;
- an API endpoint;
- a payment object;
- a Reservation.

## 2. SOURCE-DERIVED FACTS

Current source evidence establishes an Offer representation associated with:

- an organization/tenant boundary;
- an opportunity/commercial lead relationship;
- an apartment/unit relationship;
- list price;
- discount percentage;
- effective price;
- status;
- validity/expiration information;
- supporting document/reference information.

These facts establish semantic existence, not final persistence design.

## 3. PROVISIONAL OWNERSHIP

**Candidate owner:** Sales / Commercial domain.

**Status:** `CANDIDATE — OWNERSHIP NOT YET ACCEPTED`.

Rationale:

- Offer is a commercial negotiation artifact.
- Its terms are derived from inventory and commercial opportunity context.
- Approval of discounts is an authorization/policy concern.
- Reservation is a subsequent, distinct lifecycle object.

No new bounded context is created for Offer.

## 4. CORE SEMANTIC MODEL

An Offer represents a time-bounded commercial proposal for a specific opportunity/client interaction and a specific property/unit reference.

Conceptual relationships:

```text
Lead / Opportunity
        │
        ▼
      Offer
        │
   ┌────┴────┐
   ▼         ▼
 Unit     Commercial Terms
             │
             ├── list price
             ├── discount
             ├── effective price
             └── validity
        │
        ▼
 Reservation (separate lifecycle)
```

The Offer does not itself establish reservation ownership of inventory.

## 5. REQUIRED INVARIANTS — BASELINE

### OFF-INV-001 — Tenant ownership
The Offer must be evaluated within the caller's organization/tenant scope before access or mutation.

Status: `SUPPORTED TARGET RULE / RUNTIME UNVERIFIED`.

### OFF-INV-002 — Unit/property reference integrity
An Offer must reference a valid commercial property/unit object according to the accepted inventory contract.

Status: `SUPPORTED SEMANTIC RULE / IMPLEMENTATION UNVERIFIED`.

### OFF-INV-003 — Opportunity relationship
An Offer must be associated with the relevant commercial opportunity/lead according to the accepted CRM contract.

Status: `SUPPORTED SEMANTIC RULE / IMPLEMENTATION UNVERIFIED`.

### OFF-INV-004 — Deterministic effective price
The effective price must be derivable from the authoritative pricing inputs and explicit rounding/currency semantics. Client-calculated price is never authoritative.

Status: `SUPPORTED TARGET RULE`.

### OFF-INV-005 — Discount authority
A discount above the configured authorization threshold must not become effective merely because a client or AI supplied it. Approval policy must be evaluated server-side.

Status: `SUPPORTED TARGET RULE / THRESHOLDS OPEN`.

### OFF-INV-006 — Validity semantics
An expired Offer cannot be treated as a current valid commercial proposal without an explicit new/reissued lifecycle action.

Status: `SUPPORTED TARGET RULE / STATE MODEL OPEN`.

### OFF-INV-007 — Reservation separation
Creating or submitting an Offer must not silently reserve inventory. Reservation ownership follows the Reservation contract and its concurrency protocol.

Status: `SUPPORTED`.

### OFF-INV-008 — Auditability
Changes to material Offer terms and approval status must produce auditable evidence.

Status: `SUPPORTED TARGET RULE`.

### OFF-INV-009 — Idempotent mutation
Retryable external/API/AI actions that can create duplicate Offers or duplicate approval effects must be idempotent.

Status: `SUPPORTED TARGET RULE / KEY DESIGN OPEN`.

## 6. LIFECYCLE — NOT YET CLOSED

The exact state machine remains `OPEN`.

Minimum candidate states inferred from source semantics:

```text
DRAFT
  ↓
SUBMITTED
  ↓
APPROVAL_REQUIRED ──→ REJECTED
  ↓
APPROVED
  ↓
EXPIRED
  ↓
WITHDRAWN
```

This is a candidate model only. It must not be implemented until the canonical state-machine register establishes the authoritative states and transitions.

Important distinction:

`APPROVED Offer ≠ Reservation`

Approval means the commercial proposal passed the applicable policy. It does not grant inventory ownership unless a separate authorized Reservation command succeeds.

## 7. COMMAND CONTRACTS

Source-derived actions currently mapped to Offer:

### `submit_offer`

Purpose: submit a commercial Offer for evaluation.

Required contract fields before implementation:

- actor;
- tenant scope;
- opportunity/lead;
- unit/property;
- pricing inputs;
- currency;
- validity;
- authorization;
- preconditions;
- idempotency;
- resulting state;
- audit event;
- domain event;
- failure semantics.

Status: `OPEN`.

### `approve_discount`

Purpose: authorize a discount or commercial deviation according to policy.

Required contract fields before implementation:

- actor;
- tenant scope;
- Offer;
- requested discount;
- threshold/policy;
- approval authority;
- resulting state;
- audit;
- event;
- rejection semantics.

Status: `OPEN`.

## 8. PERMISSION BOUNDARY

Do not invent permission keys here.

The Offer contract must reference an existing canonical permission key once the permission register is reconciled.

Required mapping dimensions:

`permission → action → resource → tenant/scope → persona → approval threshold → test`

Status: `OPEN`.

## 9. CONCURRENCY

Potential races requiring explicit design/test include:

1. two actors modifying the same Offer terms;
2. approval racing with expiry;
3. duplicate submit retries;
4. discount approval racing with another material term change;
5. Offer approval occurring while inventory availability changes.

The Offer itself must not solve the Unit/Reservation race by becoming the inventory lock. Inventory ownership remains governed by the Unit/Reservation consistency contract.

Status: `OPEN — TEST MODEL REQUIRED`.

## 10. EVENTS

Do not invent event names.

The successful Offer transitions must be mapped to the canonical event register before implementation authorization.

Required eventual mapping:

`Offer transition → registered event → producer → schema/version → tenant identity → consumers → idempotency → outbox → test`.

Status: `OPEN`.

## 11. DOCUMENTS

Supporting Offer documents/references must follow the canonical Document/Attachment ownership and tenant-access rules. An attachment reference does not become part of the Offer aggregate merely because the Offer points to it.

## 12. FAILURE SEMANTICS

Implementation must distinguish at least:

- unauthorized actor;
- wrong tenant/scope;
- invalid Offer data;
- invalid unit/property reference;
- invalid opportunity reference;
- illegal lifecycle transition;
- approval policy failure;
- expired Offer;
- stale version/concurrency conflict;
- duplicate/idempotent retry;
- downstream integration failure.

Exact error codes are not yet defined and must not be invented in this contract.

## 13. TRACEABILITY

```text
Commercial requirement
 → Offer domain concept
 → candidate Sales ownership
 → OFF-INV invariants
 → submit_offer / approve_discount
 → state machine [OPEN]
 → permission [OPEN]
 → event [OPEN]
 → schema [NOT AUTHORIZED]
 → task [NOT AUTHORIZED]
 → implementation [BLOCKED]
 → tests [TO BE DEFINED]
```

## 14. NON-GOALS

This contract does not:

- authorize a Prisma model;
- authorize a database table;
- define API URLs;
- create permission keys;
- create event names;
- define a new bounded context;
- define discount thresholds;
- define legal contract semantics;
- authorize production changes.

## 15. CLOSURE CRITERIA

Offer is implementation-ready only when all are evidenced:

1. owner accepted;
2. lifecycle/state machine accepted;
3. invariants accepted;
4. permission mapping accepted;
5. approval thresholds/policy accepted;
6. event mapping accepted;
7. idempotency strategy accepted;
8. concurrency tests defined;
9. schema mapping reviewed;
10. task packet authorized;
11. implementation and verification evidence exists.

**Current status:** `OPEN — DOMAIN CONTRACT CLOSURE IN PROGRESS`.

**Next dependency:** canonical state-machine, permission and event registers.
