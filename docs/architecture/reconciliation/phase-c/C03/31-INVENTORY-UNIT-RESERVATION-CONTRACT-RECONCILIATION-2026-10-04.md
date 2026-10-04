# C03 — Inventory–Unit–Reservation Contract Reconciliation

**Date:** 2026-10-04
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION
**Trigger:** Independent Closure Review artifact 30

## 1. Objective

Resolve the five load-bearing blockers identified by the independent closure review without inventing unsupported domain contracts.

## 2. Current source-backed ownership model

```text
Real Estate
  ├── Project / Building / Unit
  ├── Inventory availability
  └── Pricing (conceptual capability ownership)

Sales
  ├── Options
  └── Reservations

Finance
  └── Receivables / payments / accounting truth
```

The architecture explicitly requires cross-context ownership and consistency strategy for writes. Reservation/option operations require actor, scope, preconditions, idempotency and audit evidence. Inventory must not be mutated by an unqualified public-web action.

## 3. Blocker B1 — Apartment ↔ Unit identity

### Evidence

The structural ontology uses `Unit`; the normative commercial state machine uses `apartment.commercial_status`. Product truth describes a single apartment record driving public page, inventory, search and admin surfaces.

### Decision status

**OPEN — identity equivalence is strongly suggested but not formally locked as a character-for-character canonical identifier contract.**

### Required contract

The architecture must explicitly define whether `Apartment` is:

1. the canonical domain name for Unit;
2. a legacy/application synonym for Unit;
3. a commercial projection over Unit;
4. a separate object linked one-to-one to Unit.

Until that decision is authoritative, no second independent identity should be created.

## 4. Blocker B2 — Unit ↔ Inventory ownership

### Evidence

Inventory availability belongs to the Real Estate capability and PostgreSQL is authoritative. The source does not establish a separate inventory aggregate schema.

### Engineering position

The safest current boundary is:

```text
Unit identity / structural data
        │
        │ stable reference
        ▼
Real Estate Inventory authority
```

This is a **boundary position**, not a persistence prescription. It does not authorize a `unit.inventory_status` column, an `inventory` table shape, or a separate aggregate until the GATE-03 contract defines the invariants.

### Required invariant

For every commercially allocatable inventory position, there must be one authoritative identity and one authoritative concurrency boundary preventing incompatible simultaneous commitments.

## 5. Blocker B3 — Commercial status ↔ availability

The two concepts must remain distinct:

```text
apartment.commercial_status
        = normative commercial lifecycle

inventory availability
        = authoritative allocatability truth
```

A state such as `HELD` or `RESERVED` may have inventory consequences, but the exact mapping is not inferred here. The mapping must be expressed as governed commands/events with preconditions and failure behavior.

### Prohibited shortcuts

- UI visibility changing inventory;
- public website changing commercial status directly;
- cache deciding whether a reservation succeeds;
- construction completion automatically setting availability;
- search index state being treated as inventory truth.

## 6. Blocker B4 — Hold / reservation concurrency

The canonical lifecycle requires idempotency and concurrency controls for options and reservations.

### Minimum invariant

```text
For a mutually exclusive inventory position:
no two incompatible active commitments may both commit successfully.
```

### Contract fields still required

- command identity;
- idempotency key scope;
- tenant scope;
- actor and permission;
- target inventory identity;
- precondition version/lock semantics;
- hold expiry rule;
- conflict outcome;
- retry outcome;
- audit evidence;
- committed event;
- external side-effect handling.

No exact SQL locking mechanism is selected in this artifact. That belongs to GATE-03 after the semantic contract is closed.

## 7. Blocker B5 — Pricing commitment

The following values must not be conflated:

```text
current price
→ offered price
→ option price
→ reservation price
→ contractual price
→ receivable schedule
```

### Required decision

The product contract must identify the action that creates a price commitment and the evidence/snapshot that preserves it.

Until then, price changes must not silently rewrite an already committed commercial amount.

## 8. Cross-context command boundary

The provisional contract shape is:

```text
Sales command
    ↓
Real Estate / Inventory authority
    ↓
transactional decision
    ↓
committed domain fact/event
    ↓
Sales / CRM / Finance / publication consumers
```

The exact commands/events are intentionally not finalized here. The Core Lifecycle Canonical Map requires source state, command, actor, permission, tenant scope, preconditions, target state, event, transaction boundary, side effects, idempotency, concurrency, audit evidence, failure behavior and acceptance test for every lifecycle edge.

## 9. Reconciliation conclusion

This pass materially narrows the problem but does **not** close the five blockers. The evidence supports separate Real Estate inventory authority and Sales reservation workflow, but the exact aggregate/persistence boundary and commercial-to-availability mapping remain contract work.

**Status: OPEN.**

**No schema / ORM / migration / production API authorization.**

## 10. Next evidence target

The next pass must build the **contract matrix for the concrete commercial edges**:

```text
AVAILABLE → HELD
HELD → RESERVED
RESERVED → CONTRACTED
RESERVED → CANCELLED / RELEASED
price change while active hold/reservation
structural Unit amendment while active commitment
```

Each edge must be tested against actor, tenant, invariant, concurrency, idempotency, audit, event and failure semantics before implementation is authorized.
