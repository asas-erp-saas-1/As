# ASAS — OFFER DOMAIN CONTRACT 2026

**Artifact ID:** ASAS-ARCH-OFFER-2026-001  
**Status:** DERIVED DOMAIN CONTRACT — PARTIAL / NOT IMPLEMENTATION AUTHORITY  
**Version:** 1.1.0  
**Effective date:** 2026-09-20  
**Owner:** Sales / Commercial Domain — ownership confirmation required  
**Branch:** `platform-architecture-2026`  
**Authority:** Derived from the 2026 Blueprint, Command/Action Register, Aggregate/Invariant Register, State Machine Register, Permission Register and Event Register. It does not override an approved ADR, founder decision, canonical register, live runtime or live database.

## 1. PURPOSE

Establish the minimum semantic contract for `Offer` before schema or application implementation is authorized.

An Offer is not automatically a bounded context, module, database table, API endpoint, payment object, or Reservation.

## 2. SOURCE-DERIVED FACTS

Current canonical evidence establishes Offer semantics within the commercial chain:

- organization/tenant boundary;
- opportunity/commercial lead relationship;
- apartment/unit relationship;
- list price;
- discount percentage;
- effective price;
- status/validity semantics;
- supporting document/reference information.

The canonical event register contains `offer.created`, `offer.submitted`, `offer.approved`, `offer.rejected`, and `offer.expired` in the Sales emission group. The permission register contains `offer.create` and `offer.discount.request`. The state-machine register currently models `opportunity.stage` with `OFFER_SENT`, but does **not** define an authoritative `offer.status` state machine. Therefore Offer-specific lifecycle closure is still required.

## 3. PROVISIONAL OWNERSHIP

**Candidate owner:** Sales / Commercial domain.

**Status:** `CANDIDATE — OWNERSHIP NOT YET ACCEPTED`.

No new bounded context is created for Offer.

## 4. CORE SEMANTIC MODEL

An Offer represents a time-bounded commercial proposal for a specific opportunity/client interaction and a specific property/unit reference.

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

`APPROVED Offer ≠ Reservation`. Approval does not itself establish inventory ownership.

## 5. REQUIRED INVARIANTS — BASELINE

### OFF-INV-001 — Tenant ownership
Offer access/mutation requires tenant scope evaluation first. **Target rule; runtime unverified.**

### OFF-INV-002 — Unit/property reference integrity
Offer references a valid inventory unit. **Target rule; implementation unverified.**

### OFF-INV-003 — Opportunity relationship
Offer is associated with the relevant opportunity/lead. **Target rule; implementation unverified.**

### OFF-INV-004 — Deterministic effective price
Effective price derives from authoritative pricing inputs with explicit currency/rounding semantics; client-calculated price is not authoritative. **Target rule.**

### OFF-INV-005 — Discount authority
Discount policy is enforced server-side. Existing permission evidence includes `offer.discount.request`; exact threshold semantics remain open. **Target rule; thresholds open.**

### OFF-INV-006 — Validity semantics
An expired Offer is not a current valid commercial proposal without an explicit lifecycle action. **Target rule; state model open.**

### OFF-INV-007 — Reservation separation
Offer creation/submission does not silently reserve inventory. **Supported target rule.**

### OFF-INV-008 — Auditability
Material Offer terms and approval status require auditable evidence. **Target rule.**

### OFF-INV-009 — Idempotent mutation
Retryable creation/submission/approval effects require idempotency. **Target rule; key design open.**

## 6. CANONICAL REGISTER RECONCILIATION

### 6.1 Events — VERIFIED AGAINST REGISTER

Existing canonical event names relevant to Offer are:

- `offer.created`
- `offer.submitted`
- `offer.approved`
- `offer.rejected`
- `offer.expired`

These are Sales emission-module events in `registers/events.json`. They are not yet a complete proof of transition coverage or payload schemas.

### 6.2 Permissions — VERIFIED AGAINST REGISTER

Existing canonical permission keys relevant to Offer are:

- `offer.create`
- `offer.discount.request`

The register expresses scope/authority by persona. Exact approval thresholds for discount effects remain unresolved and must not be invented in this contract.

### 6.3 State — CONFLICT / OPEN

The canonical state register has no dedicated `offer.status` machine. It does contain `opportunity.stage` with `OFFER_SENT`, `NEGOTIATION`, and related stages.

Therefore the following distinction is mandatory:

`Opportunity stage ≠ Offer lifecycle state`.

No implementation may use `opportunity.stage` as an implicit substitute for an Offer state machine without an approved contract/ADR.

## 7. COMMAND CONTRACTS

### `submit_offer`

**Status:** OPEN.

Required before implementation: actor, tenant scope, opportunity, unit, authoritative pricing inputs, currency, validity, authorization, preconditions, idempotency, resulting state, audit and registered event, failure semantics.

### `approve_discount`

**Status:** OPEN.

The existing permission register provides `offer.discount.request`, but the canonical command/event/state linkage is not yet closed. Approval thresholds and final command naming require reconciliation with the approval policy before implementation.

## 8. CONCURRENCY

Required tests/design:

1. concurrent material Offer edits;
2. approval versus expiry;
3. duplicate submit retries;
4. discount approval versus material-term mutation;
5. Offer approval while inventory availability changes.

The Offer is not the inventory lock. Unit/Reservation concurrency remains authoritative for inventory ownership.

## 9. CLOSURE GATE — H1.4.2

**Status:** `PARTIAL`

Blocking conditions:

1. dedicated Offer state machine not yet present in canonical state register;
2. command-to-permission-to-event mapping not fully reconciled;
3. discount threshold policy unresolved;
4. idempotency key semantics unresolved;
5. concurrency acceptance tests not yet evidenced;
6. Offer ownership remains candidate until context ownership is accepted.

**Implementation authorization:** `BLOCKED`.

No Prisma model, migration, API, service implementation or production mutation is authorized by this document.

## 10. REQUIRED NEXT ARTIFACTS

Before schema implementation:

- Offer state-machine contract/ADR;
- command/action mapping;
- permission/approval policy mapping;
- event payload/version contract;
- idempotency/concurrency test specification;
- acceptance evidence.

## 11. AUTHORITY RULE

If this contract conflicts with a higher-authority founder decision, approved ADR, canonical register, live runtime or live database, mark the conflict explicitly and do not silently reconcile it.
