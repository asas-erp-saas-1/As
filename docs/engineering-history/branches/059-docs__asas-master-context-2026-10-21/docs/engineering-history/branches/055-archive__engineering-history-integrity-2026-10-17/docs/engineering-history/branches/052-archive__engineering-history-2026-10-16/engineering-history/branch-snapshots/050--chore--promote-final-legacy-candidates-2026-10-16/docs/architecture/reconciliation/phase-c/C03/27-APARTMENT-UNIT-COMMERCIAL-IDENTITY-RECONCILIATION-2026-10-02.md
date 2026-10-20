# C03 — Apartment ↔ Unit Commercial Identity Reconciliation

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION  
**Purpose:** Resolve the ambiguity introduced by the normative state-machine register using repository evidence only.

## 1. Source-locked evidence

`registers/state-machines.json` defines:

```text
B.1_apartment_commercial_status
aggregate: apartment.commercial_status
```

with normative states:

```text
DRAFT
AVAILABLE
HELD
RESERVED
CONTRACTED
SOLD
BLOCKED
OFF_MARKET
CANCELLED
```

The register also defines the exact transitions and requires one StateMachine implementation, no direct status setter, audit append and corresponding domain event for every transition.

Therefore the previous C03 wording that treated the Unit commercial lifecycle as wholly undefined is too broad and must be corrected.

## 2. What is now LOCKED

The ASAS architecture has a normative commercial lifecycle for an object named `apartment`.

The lifecycle is distinct from:

```text
apartment.construction_status
reservation.status
contract.status
payment_schedule_item.status
```

The state-machine register is authoritative for those lifecycle names and values where it defines them.

## 3. What remains OPEN

The source corpus reviewed in C03 does not yet provide sufficient evidence to assert, without qualification, that:

```text
apartment === Unit
```

at every architectural boundary.

The semantic possibility is strong because Unit is the canonical structural real-estate object and the state machine treats apartment as a commercial aggregate, but identity equivalence must not be invented from naming similarity alone.

The remaining question is therefore narrower:

> Is `apartment` the canonical commercial representation of the structural `Unit`, or is it a distinct domain representation linked to Unit?

## 4. Commercial lifecycle versus inventory availability

Even if `apartment === Unit` is ultimately confirmed, the state machine does not authorize collapsing:

```text
commercial_status
≠ inventory availability
```

For example, `AVAILABLE` is a state of `apartment.commercial_status`. It does not by itself prove the complete inventory allocation model, channel allocation, hold semantics, concurrency mechanism, or reservation ownership.

Likewise:

```text
HELD
```

must not be assumed identical to the full `reservation.status = ACTIVE` lifecycle without an explicit cross-context contract.

## 5. Cross-state-machine boundary

Current authoritative registers establish separate machines:

```text
Apartment commercial status
Apartment construction status
Reservation status
Contract status
Payment schedule item status
Studio page version status
```

Therefore a transition such as:

```text
AVAILABLE → HELD
```

must be understood as a governed commercial transition triggered by `apartment.held`, not as proof that every reservation, finance or publication state changes in the same aggregate transaction.

Similarly:

```text
CONTRACTED → SOLD
```

has an explicit note requiring final payment + handover confirmation. This is stronger evidence than an inferred generic lifecycle and must be preserved exactly.

## 6. Aggregate impact

The normative state machine proves that `apartment.commercial_status` has lifecycle invariants.

It does **not** prove that:

```text
Project
  └── Building
       └── Floor
            └── Apartment
                 ├── Inventory
                 ├── Reservation
                 └── Finance
```

is one aggregate.

The aggregate decision still requires the invariant and transaction boundary to be explicit.

## 7. Required correction to C03 interpretation

Replace the earlier broad statement:

> Unit commercial lifecycle is undefined.

with:

> A normative `apartment.commercial_status` state machine exists in the authoritative register. The remaining C03 question is the semantic identity relationship between `apartment` and canonical `Unit`, and the consistency boundary between commercial status, inventory, reservation, contract and finance.

## 8. Closure consequences

C03 cannot close until the reviewer confirms one of the following from authoritative evidence:

### Option A — Identity equivalence

```text
Unit = Apartment
```

with explicit explanation of naming/context boundaries.

### Option B — Distinct representations

```text
Unit ──linked-to── Apartment
```

with explicit ownership, identity, synchronization and lifecycle rules.

No third interpretation should be invented merely for implementation convenience.

## 9. NOT AUTHORIZED

- Renaming the normative state machine merely for terminology consistency.
- Adding a second competing apartment/unit commercial state machine.
- Collapsing commercial status into inventory availability.
- Collapsing commercial status into reservation status.
- Adding direct status setters.
- Treating the state machine as proof of a Project aggregate.
- Implementing schema/API changes from this reconciliation alone.

## 10. Next action

The next C03 closure pass must reconcile the authoritative state-machine register against:

1. canonical Unit identity artifacts;
2. target schema contract where available;
3. event register;
4. historical implementation evidence;
5. inventory/reservation ownership contracts.

**C03 remains OPEN. No implementation authorization is created by this artifact.**
