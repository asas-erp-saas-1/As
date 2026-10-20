# C03 — Construction ↔ Inventory ↔ Commercial Readiness Reconciliation

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION  
**Depends on:** `20-INVENTORY-AVAILABILITY-PRICING-RECONCILIATION-2026-10-02.md`  
**Scope:** Reconcile construction progress, Unit commercial state, inventory availability and downstream Sales/Finance boundaries without inferring lifecycle inheritance.

## 1. Evidence classification

- **SOURCE-LOCKED:** directly supported by current ASAS architecture/register evidence.
- **ENGINEERING-DERIVATION:** follows from source-locked facts plus explicit consistency reasoning.
- **OPEN:** evidence is insufficient to authorize the behavior.
- **NOT AUTHORIZED:** technically representable behavior that has no closed domain contract.
- **HISTORICAL:** prior implementation evidence retained only for provenance.

## 2. Source-locked construction model

The current state-machine register defines two Unit-level axes:

- `apartment.commercial_status`;
- `apartment.construction_status`.

The construction axis is a linear forward chain driven by `milestone.certified` events per building, with regression restricted to an explicit director-approved change operation. The register does not define a Building lifecycle machine. fileciteturn20file0L8-L18

The architecture therefore establishes a distinction between:

```text
Unit commercial state
        ×
Unit construction state
```

and does not authorize replacing both with one inherited Building state.

## 3. Construction progress versus commercial availability

The following implications are **not** authorized merely from construction progress:

```text
construction milestone certified
        ≠
Unit automatically AVAILABLE

construction complete
        ≠
Unit automatically publishable

construction complete
        ≠
Unit automatically reservable
```

A construction milestone is evidence about physical/project progress. Commercial availability is an inventory/business decision with its own consistency boundary.

This preserves the distinction established in C03.20: PostgreSQL is authoritative for inventory availability, while construction state is a separate concern.

## 4. Construction readiness policy

A future readiness policy may require several predicates before a Unit becomes commercially available, for example:

```text
structural identity valid
AND inventory position valid
AND commercial state permits sale
AND required publication/compliance conditions satisfied
AND no active blocking hold/reservation
```

These are **policy candidates**, not a locked implementation predicate set.

The architecture must not encode a guessed boolean such as:

```text
is_ready = construction_status == COMPLETED
```

without a source-locked readiness contract.

## 5. Building-level milestones and Unit-level state

The existing model creates an important many-to-many semantic risk:

```text
Building milestone
       ↓
multiple Units
```

A certified building milestone can provide a common construction signal, but it does not prove that every Unit has identical physical readiness, documentation, defects, inspection status or commercial eligibility.

Therefore:

- a building milestone may drive a governed projection/update rule;
- the exact affected Units and transition authorization remain OPEN;
- no Unit commercial transition may be inferred solely from Building hierarchy.

## 6. Construction regression

The state-machine register permits construction regression only through a director-approved change path rather than ordinary workflow movement. fileciteturn20file0L8-L18

Engineering consequence:

- normal milestone certification must remain monotonic;
- a correction/reversal is a governed exception;
- construction correction must not silently reverse a reservation, contract or financial posting;
- downstream commercial consequences require explicit policy.

## 7. Inventory interaction

The authoritative relationship remains:

```text
Construction evidence
        ↓
readiness policy / governed command
        ↓
Inventory availability
        ↓
Sales reservation workflow
```

not:

```text
Construction event
        ↓
blind availability mutation
```

Inventory availability remains authoritative in PostgreSQL and cannot depend on a stale projection or public website state.

## 8. Reservation and contract safety

A Unit may have commercial activity while construction progresses. Therefore the following cases require explicit policy rather than inferred cascade:

### Case A — construction milestone improves while Unit is RESERVED

No automatic status rewrite is authorized.

### Case B — construction issue blocks a Unit already RESERVED

The architecture must define whether the reservation is preserved, suspended, re-offered, cancelled by governed command, or escalated. No choice is locked here.

### Case C — construction correction occurs after CONTRACTED

No automatic contract or finance reversal is authorized. Legal and financial consequences belong to their respective contexts.

### Case D — Unit becomes construction-ready while still commercially blocked

Construction readiness does not override inventory or commercial policy.

## 9. Concurrency implications

Potential races include:

- milestone certification concurrent with availability mutation;
- availability mutation concurrent with reservation creation;
- construction correction concurrent with public publication;
- price change concurrent with a readiness transition.

The architecture therefore requires explicit consistency ordering. The exact mechanism remains a later contract concern, but the system must not depend on frontend ordering or asynchronous event timing for exclusive inventory correctness.

## 10. Event boundary

The following categories must remain distinct:

```text
Construction event
    ≠
Inventory availability event
    ≠
Commercial status event
    ≠
Reservation event
    ≠
Contract event
    ≠
Finance event
```

A future consumer may react to a construction event, but that reaction must be an explicitly governed policy and must be idempotent.

No new canonical event names are invented in this reconciliation.

## 11. Red-team findings

### Failure 1 — Building reaches handover and every Unit becomes available

**Result:** invalid inference. Unit-specific commercial constraints can still block sale.

### Failure 2 — Construction regression cancels reservations automatically

**Result:** not authorized. Reservation is a Sales consistency boundary.

### Failure 3 — Website marks Unit available because construction is complete

**Result:** invalid authority path. Website is a projection.

### Failure 4 — Duplicate milestone event causes repeated commercial transition

**Result:** consumers must be idempotent; exact transition contract remains OPEN.

### Failure 5 — Historical Unit has a construction value outside the new chain

**Result:** historical data is evidence only. Migration/repair must be defined during persistence reconciliation.

## 12. Aggregate-boundary impact

Construction evidence further argues against a single aggregate spanning:

```text
Project → Building → Floor → Unit → Inventory → Reservation → Finance
```

The same physical hierarchy can feed multiple consistency boundaries without requiring one transaction.

Current position:

- Building construction observations are building-scoped.
- Unit construction status is a distinct state axis.
- Inventory availability is separately authoritative.
- Reservation is a Sales boundary.
- Finance remains a separate integrity domain.

Therefore no enlarged aggregate is justified by construction hierarchy alone.

## 13. LOCKED / OPEN / NOT AUTHORIZED

### LOCKED

- Unit commercial and construction concerns are distinct axes.
- Construction progress does not automatically equal commercial availability.
- Building milestones do not automatically define Building lifecycle.
- Inventory remains the authoritative commercial availability boundary.
- Reservation and Finance remain separate downstream consistency boundaries.
- Construction corrections cannot silently mutate contractual or financial truth.

### OPEN

- Exact commercial-readiness predicate.
- Unit eligibility rules by construction stage.
- Blocking-condition model.
- Exact milestone-to-Unit projection policy.
- Construction exception/escalation workflow.
- Cross-context event/command contract.
- Price/readiness interaction.
- Reservation behavior when readiness becomes blocked.

### NOT AUTHORIZED

- `construction_status == completed` as an automatic availability rule.
- Automatic reservation cancellation from construction events.
- Automatic contract/finance reversal from construction correction.
- Website as readiness authority.
- Building lifecycle inference from construction milestones.

## 14. Next closure gate

The next reconciliation is **Studio / Publication ↔ Unit / Inventory**.

Required questions:

1. What exact Unit state is eligible for public publication?
2. Can a Unit be inventory-available while unpublished?
3. Can a published Unit become inventory-blocked without unpublishing?
4. Which authoritative fields drive the public Unit page?
5. How do price and availability changes propagate to publication?
6. Which publication reactions are synchronous versus asynchronous?
7. How are stale public projections detected and repaired?

**C03 remains OPEN. No schema, ORM, migration, API or production implementation is authorized by this artifact.**
