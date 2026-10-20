# C03 — Studio / Publication ↔ Unit / Inventory Reconciliation

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION  
**Depends on:** `21-CONSTRUCTION-INVENTORY-COMMERCIAL-READINESS-RECONCILIATION-2026-10-02.md`  
**Scope:** Reconcile public publication, Studio-managed content, Unit identity, inventory availability and pricing without making the website an authority for transactional state.

## 1. Evidence classification

- **SOURCE-LOCKED:** directly supported by current ASAS architecture/product truth.
- **ENGINEERING-DERIVATION:** consequence of source-locked publication and transactional rules.
- **OPEN:** evidence is insufficient to close the behavior.
- **NOT AUTHORIZED:** technically possible but not contractually established.

## 2. Source-locked publication model

The product architecture treats Website Studio as the internal publishing/editorial capability and requires a single canonical property/unit record to drive the public page, cards, search, filters, SEO, admin and structured data.

The public website is therefore a **projection/read surface**, not an independent source of property truth.

The publication flow must preserve this direction:

```text
Authoritative domain state
        ↓
publication/read model
        ↓
public website / search / SEO
```

and never:

```text
public website
        ↓
transactional inventory authority
```

## 3. Publication versus inventory availability

Publication and availability answer different questions:

```text
Publication:
"Should this property/unit be exposed publicly?"

Availability:
"Can this inventory position be commercially allocated?"
```

Therefore these combinations are architecturally possible unless a future policy explicitly forbids them:

| Publication | Inventory | Meaning |
|---|---|---|
| unpublished | available | internal / pre-publication inventory |
| published | available | public commercially available inventory |
| published | blocked | public page may remain visible while CTA/status changes |
| unpublished | reserved | commercially committed but not public |
| published | reserved | public page may show reserved/unavailable projection |

The exact UX and policy for each combination remains OPEN.

## 4. Unit identity and public identity

A public route, slug, SEO document or Studio page must not become the authoritative identity of a Unit.

The domain Unit identity must remain stable enough to support:

- inventory;
- reservation;
- contract references;
- financial allocations;
- audit history;
- media attachments;
- publication versions.

A slug or public URL may change as a publication concern without creating a new Unit.

No destructive identity replacement is authorized from publication operations.

## 5. Price propagation

The C03.20 reconciliation established that current Unit price, offered price, reserved price and contractual price are not proven to be the same value.

Therefore Studio must not treat a displayed price as the authoritative transactional price merely because it appears on a public page.

Required direction:

```text
Real Estate pricing authority
        ↓
validated publication projection
        ↓
public displayed price
```

A public price edit must not directly mutate transactional pricing unless an explicit authorized command crosses the domain boundary.

## 6. Availability propagation

The same principle applies to availability:

```text
PostgreSQL authoritative inventory state
        ↓
publication/read model
        ↓
public availability indicator
```

The website may temporarily display stale information, but stale publication must never be accepted as proof that an inventory position is reservable.

The reservation path must revalidate authoritative state at its transactional boundary.

## 7. Publication versioning and rollback

The architecture already defines a versioned publication model with a published pointer and cache/tag revalidation in the broader Website Studio contract.

This creates an important separation:

```text
Domain truth
        ≠
Publication version
        ≠
Rendered page cache
```

A rollback of a publication version must not roll back transactional inventory, pricing, reservations or finance.

Likewise, a transactional correction must not rewrite historical publication versions without an explicit publication operation.

## 8. Structural changes and publication

A Building/Floor/Unit structural amendment may require a publication reaction, but that reaction is downstream.

Examples:

- changing Unit area may invalidate a public specification block;
- changing Floor association may alter navigation/breadcrumb information;
- changing Building metadata may alter project/building context;
- changing Unit inventory status may alter CTA/availability projection.

None of these reactions justify making Studio the owner of structural or transactional state.

## 9. Publication eligibility

A future publication policy should explicitly define predicates such as:

```text
identity valid
AND required content complete
AND required media available
AND publication authorization granted
AND tenant scope valid
```

Commercial availability may be one input to the presentation policy but must not be assumed to be the sole publication gate.

No exact eligibility predicate is locked here.

## 10. Staleness and repair

Because publication is derived, the architecture needs a bounded way to detect and repair stale projections.

Required conceptual properties:

- source state remains authoritative;
- publication updates are replayable/idempotent;
- failed publication delivery is observable;
- stale projections can be rebuilt;
- cache invalidation cannot be the only correctness mechanism;
- historical publication versions remain auditable.

The exact queue, retry and repair implementation is outside this reconciliation step.

## 11. Concurrency red-team

### Case A — Unit reserved while publication says AVAILABLE

Reservation path must use authoritative inventory state and reject/resolve conflict according to Sales rules. Public content cannot authorize the reservation.

### Case B — Price changes while page regeneration is running

The page must converge to the latest authorized publication projection; a stale render must not become transactional truth.

### Case C — Publication rollback after inventory change

Rollback affects presentation only. It must not reverse inventory or reservation state.

### Case D — Unit detached structurally while page is published

The structural command must not silently delete transactional records. Publication should react according to an explicit policy.

### Case E — Duplicate publication event

The consumer must be idempotent and safe to replay.

## 12. Cross-context ownership

Current ownership direction is:

```text
REAL ESTATE
  ├── Project / Building / Floor / Unit
  ├── Inventory availability
  └── Pricing authority (behavior still open)

SALES
  └── Option / Reservation

FINANCE
  └── Financial truth

STUDIO
  └── Publication/editorial projection
```

Studio consumes authoritative domain data; it must not silently become a second owner of inventory or price.

## 13. Aggregate-boundary impact

The publication layer provides additional evidence against a single aggregate spanning the full real-estate hierarchy and public experience.

A Unit can be represented in multiple read models without those projections becoming aggregate members:

```text
Unit
 ├── Inventory projection
 ├── Search projection
 ├── Public page
 ├── SEO/structured-data projection
 ├── Admin workspace
 └── Analytics events
```

These are projections/consumers, not evidence of transactional aggregate containment.

## 14. LOCKED / OPEN / NOT AUTHORIZED

### LOCKED

- Studio/public website is a projection/read surface.
- Transactional inventory remains authoritative in PostgreSQL.
- Public URL/slug is not Unit identity.
- Displayed price is not automatically contractual price.
- Publication rollback must not reverse transactional state.
- Derived publication state must be replayable/rebuildable.
- Reservation correctness must not depend on public-page freshness.

### OPEN

- Exact publication eligibility policy.
- Availability-to-publication presentation rules.
- Price projection contract.
- Stale projection detection SLA.
- Publication event names/consumer contract.
- Rollback semantics at each publication layer.
- Exact Studio/Real Estate command boundary.

### NOT AUTHORIZED

- Website as inventory authority.
- Public price edit as direct transactional price mutation.
- Publication rollback as inventory/finance rollback.
- Deleting Unit transactional records because a page is unpublished.
- Treating a slug/public page as the domain Unit identity.

## 15. Next closure gate

The next reconciliation is **Documents / Media ↔ Real Estate / Studio / Sales evidence**.

Required questions:

1. Which media/documents are authoritative domain evidence versus presentation assets?
2. Who owns document lifecycle and retention?
3. Can a document/media attachment survive Unit structural changes?
4. Which documents are required for publication or commercial readiness?
5. How are legal/commercial documents protected from ordinary Studio mutation?
6. What audit trail is required for document replacement or removal?
7. Which attachments participate in cross-context workflows?

**C03 remains OPEN. No schema, ORM, migration, API or production implementation is authorized by this artifact.**
