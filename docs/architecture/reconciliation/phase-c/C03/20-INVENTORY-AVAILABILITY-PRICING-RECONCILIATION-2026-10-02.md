# C03 — Inventory / Availability / Pricing Reconciliation

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION  
**Depends on:** `19-BUILDING-FLOOR-UNIT-OWNERSHIP-SEMANTICS-2026-10-02.md`  
**Scope:** Reconcile the Real Estate structural model with inventory, availability and pricing, while preserving the separate Sales/Reservation and Finance consistency boundaries.

## 1. Evidence classification

- **SOURCE-VERIFIED:** directly supported by current repository artifacts.
- **ENGINEERING-DERIVATION:** consequence of source-verified facts plus explicit consistency reasoning.
- **OPEN:** current evidence is insufficient to authorize the contract.
- **HISTORICAL:** prior implementation evidence retained only for provenance.
- **NOT AUTHORIZED:** behavior must not be implemented merely because the data model could represent it.

## 2. Source-verified facts

### 2.1 Real Estate ownership

The canonical capability matrix assigns **Projects / Buildings / Units** and **Inventory availability** to the **Real Estate** context. Inventory availability is explicitly marked as requiring a contract, permission, state, events, tenant-scoped data and **concurrency verification**. fileciteturn62file0L2-L2

The master execution path places `developers/promoters, projects, buildings, units, inventory, pricing, availability` together in the Real Estate Core, followed by CRM & Sales for leads, opportunities, visits, options and reservations. fileciteturn63file0L2-L2

### 2.2 Transactional source of truth

The scalability blueprint explicitly identifies PostgreSQL as authoritative for **inventory availability**, reservations and contractual state, receivables/posted financial records and audit records. Caches, search indexes, analytics stores and AI indexes are derived systems and must be rebuildable. fileciteturn66file0L2-L2

The same blueprint states that financial truth, authorization decisions and inventory locks cannot depend on stale cache state, and that asynchronous consumers must be idempotent. fileciteturn66file0L2-L2

### 2.3 One system of truth

Founder-confirmed product truth requires property, inventory, pricing, lead, campaign, reservation, contract and financial state not to be manually duplicated between website, CRM and ERP. A single apartment record is intended to drive its public page, inventory, cards, search, filters, SEO, admin and structured data. fileciteturn69file0L2-L2

### 2.4 Reservation boundary

The capability matrix assigns **Reservations** to **Sales**, while explicitly requiring an **Inventory + tenant** data boundary and **idempotency + concurrency** verification. Options are similarly assigned to Sales with an Inventory boundary. fileciteturn62file0L2-L2

This establishes an important boundary:

```text
Real Estate
  owns/reconciles inventory availability

Sales
  owns reservation workflow

Finance
  owns financial truth
```

It does not establish that these contexts share one aggregate or one application transaction.

## 3. Inventory versus Unit

### 3.1 What is established

A Unit is a canonical real-estate structural/commercial object. Inventory availability is a distinct capability owned by Real Estate.

### 3.2 What is not established

Current evidence does not yet lock whether:

- inventory is a field/state directly owned by Unit;
- inventory is a separate domain object keyed by Unit;
- inventory is a separate bounded-context model/projection;
- availability is stored state, derived state, or a hybrid;
- one Unit can have multiple independently allocatable inventory positions;
- inventory can be allocated to channels, agencies, campaigns or partners;
- inventory can be temporarily held by an Option before Reservation;
- reservation creates inventory state synchronously or through a governed command/event sequence.

Therefore no exact persistence model is authorized here.

## 4. Availability semantics

The strongest current source statement is:

> PostgreSQL is authoritative for inventory availability.

That establishes the **source of truth**, not the complete availability state machine. fileciteturn66file0L2-L2

The following states are therefore **examples of questions, not authorized enum values**:

```text
AVAILABLE
HELD
RESERVED
SOLD
BLOCKED
OFF_MARKET
```

No state list should be promoted into implementation until the canonical commercial/reservation contract defines it.

### Critical distinction

```text
Availability truth
        ≠
Public availability projection
        ≠
Reservation workflow status
        ≠
Contract status
        ≠
Payment status
```

A website may display an availability projection, but it must not become the authority for availability.

## 5. Reservation and double-booking boundary

The architecture already requires concurrency and idempotency for Reservations and for Inventory availability. fileciteturn62file0L2-L2

Engineering consequence:

A reservation workflow must ultimately enforce an invariant equivalent to:

```text
A commercially exclusive inventory position
cannot be successfully committed to two incompatible active reservations.
```

This is an **ENGINEERING-DERIVATION**, not yet a finalized business contract because the exact reservation states, hold semantics, expiry rules and conflict policy remain open.

The invariant must be protected at the authoritative transactional boundary, not by:

- frontend checks;
- cached availability;
- search indexes;
- eventual public-page refresh;
- AI recommendations;
- optimistic UI alone.

The exact database/concurrency mechanism is deliberately deferred to GATE-03 contract engineering and later persistence design.

## 6. Pricing boundary

Current product truth explicitly treats **pricing** as part of the one-system-of-truth principle and the Real Estate Core. fileciteturn69file0L2-L2

However, current evidence does **not** yet establish:

- whether the Unit is the pricing aggregate/root;
- whether pricing is versioned;
- effective-from/effective-to semantics;
- whether a price can be overridden per channel/agency/customer;
- whether promotional prices coexist with base prices;
- whether reservation captures a price snapshot;
- whether contract price is derived from reservation or independently governed;
- whether taxes/fees are included in the inventory price or computed elsewhere;
- who may approve price changes;
- whether price changes are allowed while an option/reservation is active.

Therefore pricing is **owned conceptually by Real Estate**, but its behavioral contract remains OPEN.

## 7. Price snapshot versus live price

A critical unresolved distinction is:

```text
Current Unit Price
        ≠
Price offered to a lead
        ≠
Price locked by an Option
        ≠
Price committed by a Reservation
        ≠
Contractual price
        ≠
Financial receivable schedule
```

The architecture must not assume these are identical values.

A future contract must explicitly define which commercial action creates a price commitment and what evidence preserves the agreed amount.

No price mutation rule is authorized by this document.

## 8. Structural changes versus inventory

From the preceding C03 structural analysis, Building/Floor/Unit hierarchy changes must not automatically mutate inventory, reservation or finance state. The structural document explicitly rejects inferred destructive cascade and automatic commercial-state mutation. fileciteturn58file0L2-L2

Therefore:

| Structural action | Inventory consequence |
|---|---|
| Amend Building metadata | No automatic availability mutation established |
| Amend Floor metadata | No automatic availability mutation established |
| Amend Unit structural data | Commercial effect OPEN; must be governed explicitly |
| Detach Unit | No automatic deletion/release authorized |
| Archive Building | No automatic inventory release authorized |
| Construction milestone | Must not be silently converted into inventory state |

This prevents a dangerous coupling where a technical correction to a building hierarchy accidentally makes units available or unavailable for sale.

## 9. Inventory and construction

The current Building lifecycle analysis establishes that apartment construction state is driven by `milestone.certified` events per building and that no Building lifecycle state machine has been defined. fileciteturn65file0L2-L2

Therefore construction completion cannot be assumed to equal commercial availability.

Examples that remain policy questions:

```text
Construction complete
    ≠ automatically Available for Sale

Available for Sale
    ≠ automatically Reserved

Reserved
    ≠ automatically Contracted

Contracted
    ≠ automatically Paid
```

The exact transitions require cross-context contracts.

## 10. Public website and read models

The public website is a projection/read surface. Product truth requires one canonical apartment record to drive public page, inventory, cards, search, filters, SEO, admin and structured data. fileciteturn69file0L2-L2

Engineering consequence:

```text
Authoritative transactional state
        ↓
publication/read model
        ↓
public website/search/filters
```

not:

```text
public page/search cache
        ↓
availability authority
```

Search indexes and caches must be rebuildable and cannot be the inventory lock authority. fileciteturn66file0L2-L2

## 11. Cross-context consistency model

Current evidence supports this preliminary ownership map:

```text
REAL ESTATE
  ├── Project / Building / Floor / Unit topology
  ├── Inventory availability
  └── Pricing (ownership direction; behavior OPEN)

SALES
  ├── Option
  └── Reservation

CONTRACTS
  └── Legal / VSP / contractual state

FINANCE
  ├── Receivables
  ├── Payments
  └── Accounting

DIGITAL EXPERIENCE
  └── Public publication/read models
```

This is a reconciliation model, not a final implementation topology. Cross-context writes must use explicit contracts rather than shared-table ownership. The capability matrix explicitly requires an authoritative owner and boundary contract when a capability crosses contexts. fileciteturn62file0L2-L2

## 12. Concurrency red-team

### Case A — Two agents reserve the same Unit

Required property: at most one incompatible reservation can commit for the same exclusive inventory position.

**Status:** invariant direction LOCKED; exact reservation state/locking contract OPEN.

### Case B — Availability cache says AVAILABLE after another reservation commits

The cache must lose; authoritative PostgreSQL state wins.

**Status:** ENGINEERING-DERIVATION from source-of-truth and cache rules. fileciteturn66file0L2-L2

### Case C — Price changes while a reservation is being created

The architecture must define whether reservation uses the old price, new price, or fails/retries under a version/commit rule.

**Status:** OPEN.

### Case D — Construction milestone changes during reservation

Construction state must not silently mutate reservation or availability without an explicit cross-context policy.

**Status:** OPEN / no inferred transition.

### Case E — Website displays stale availability

Website projection may become stale, but must not be authoritative for booking.

**Status:** LOCKED engineering principle.

### Case F — Duplicate reservation command/event

Reservation path must be idempotent according to the capability matrix.

**Status:** requirement direction LOCKED; exact idempotency contract OPEN. fileciteturn62file0L2-L2

## 13. Aggregate-boundary impact

This reconciliation materially weakens the case for a single aggregate:

```text
Project
  └── Building
       └── Floor
            └── Unit
                 ├── Inventory
                 ├── Pricing
                 ├── Reservation
                 └── Finance
```

The current architecture assigns these capabilities across distinct ownership boundaries and explicitly requires concurrency/idempotency at Inventory/Reservation and ledger integrity in Finance. fileciteturn62file0L2-L2

**Current decision:** do not model the entire real-estate hierarchy plus commercial transaction state as one aggregate.

This does **not** yet select the final Unit/Inventory aggregate design.

## 14. LOCKED / OPEN / NOT AUTHORIZED

### LOCKED

- Inventory availability belongs to the Real Estate capability owner.
- PostgreSQL is authoritative for inventory availability.
- Reservation belongs to Sales and crosses the Inventory boundary.
- Inventory/Reservation requires concurrency and idempotency verification.
- Caches/search/analytics/AI indexes are derived and rebuildable.
- Public website availability is a projection, not the authority.
- Structural hierarchy does not automatically mutate commercial state.
- Project/Building/Floor/Unit hierarchy is not one aggregate merely because it is hierarchical.

### OPEN

- Exact inventory entity/model.
- Availability state machine.
- Unit ↔ inventory ownership cardinality.
- Option hold semantics.
- Reservation commit semantics.
- Reservation expiry/release.
- Pricing versioning and effective dates.
- Price snapshot/commit semantics.
- Price authority/approval workflow.
- Cross-context command/event contracts.
- Final Unit aggregate boundary.

### NOT AUTHORIZED

- Frontend-only reservation conflict prevention.
- Cache/search as inventory authority.
- Automatic inventory release from structural archive/detach.
- Automatic price mutation from Building/Floor changes.
- Automatic reservation cancellation from construction-state changes.
- Shared-table ownership without an explicit context contract.
- Production schema/migrations/API implementation from this reconciliation alone.

## 15. Next C03 dependency

The next reconciliation must close the **Construction ↔ Inventory ↔ Unit commercial readiness** relationship and then reconcile **Studio/Publication ↔ Unit/Inventory**.

Required questions:

1. Does construction define eligibility for commercial availability, and if so through what explicit policy?
2. Can an unpublished or incomplete Unit be inventory-available?
3. What exact event/command changes availability?
4. What happens when inventory is blocked after an Option or Reservation exists?
5. What data is captured as the commercial price commitment?
6. What is the authoritative state at every step from availability to reservation?
7. Which transitions require synchronous consistency versus asynchronous projection?

**C03 remains OPEN. No implementation authorization is created by this artifact.**
