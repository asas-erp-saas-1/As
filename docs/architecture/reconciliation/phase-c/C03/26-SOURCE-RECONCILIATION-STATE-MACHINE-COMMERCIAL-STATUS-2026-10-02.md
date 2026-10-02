# C03 — Source Reconciliation: Apartment Commercial State Machine vs Closure Packet

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / IMPLEMENTATION NOT AUTHORIZED  
**Purpose:** Resolve whether the authoritative state-machine register already establishes a commercial lifecycle for the real-estate Unit/apartment, and prevent the closure packet from incorrectly treating an existing normative lifecycle as merely hypothetical.

## 1. Evidence reviewed

Primary evidence:

- `registers/state-machines.json` — ASAS Real Estate OS State Machine Register v1.6.1.
- `20-INVENTORY-AVAILABILITY-PRICING-RECONCILIATION-2026-10-02.md`.
- `24-C03-CROSS-DOMAIN-RED-TEAM-2026-10-02.md`.
- `25-C03-INDEPENDENT-CLOSURE-REVIEW-PACKET-2026-10-02.md`.

## 2. Source-locked finding

The state-machine register is explicitly normative for lifecycle implementation and defines:

`B.1_apartment_commercial_status`

with aggregate:

`apartment.commercial_status`

and states:

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

It also defines the transition/event contract for this machine, including publication, hold, deposit, contract signing, sale, cancellation, blocking and return-to-market events.

Therefore the previous C03 wording that the Unit commercial lifecycle is simply an unresolved/open concept must be narrowed. The existence of this normative state-machine contract is source-locked evidence that ASAS has already defined a commercial lifecycle for the `apartment` aggregate.

## 3. What this does NOT prove

The state-machine register does **not by itself** prove all of the following:

- whether `apartment` is exactly synonymous with the canonical `Unit` entity in every artifact;
- the full transactional identity/uniqueness contract of the Unit;
- whether inventory is embedded in the apartment aggregate or separated as another model;
- the exact reservation/hold locking mechanism;
- pricing snapshot/version semantics;
- aggregate boundary between Unit/apartment and Inventory;
- tenant-scoped persistence constraints;
- exact command authorization for every transition.

Those questions remain governed by their respective contracts.

## 4. Important architectural distinction

The existence of the commercial state machine must not be misread as evidence for a giant aggregate:

```text
Project
  └── Building
       └── Floor
            └── Unit/apartment
                 ├── Inventory
                 ├── Reservation
                 └── Finance
```

The state machine establishes a lifecycle contract for `apartment.commercial_status`; it does not automatically establish aggregate ownership of Inventory, Reservation or Finance.

The red-team conclusion remains valid: the hierarchy and downstream commercial/financial domains should not be collapsed into one aggregate without concrete transactional invariants.

## 5. Reconciliation with the inventory analysis

`20-INVENTORY-AVAILABILITY-PRICING-RECONCILIATION` correctly distinguishes availability truth from reservation workflow and contractual state, but its statement that the availability state list is entirely hypothetical must now be qualified.

The normative commercial lifecycle establishes `AVAILABLE`, `HELD`, `RESERVED`, `CONTRACTED`, `SOLD`, `BLOCKED`, `OFF_MARKET`, `CANCELLED` as apartment commercial states.

However:

```text
commercial_status
    ≠ automatically the complete inventory model
```

In particular, the register does not prove that every inventory concept is represented by this one status field. Inventory ownership/cardinality and concurrency semantics therefore remain open until their authoritative contract is reconciled.

## 6. Reconciliation with the red-team

The red-team identified the critical invariant direction for concurrent reservation and rejected cache/search as booking authority. Nothing in the state-machine register contradicts that position.

The state-machine contract instead strengthens the need to reconcile:

```text
apartment.commercial_status
        ↕
Inventory availability authority
        ↕
Reservation status / commit
```

without assuming that these are three names for one field.

## 7. Closure impact

This artifact resolves one previously over-opened question:

**Commercial lifecycle existence:** LOCKED by the normative state-machine register.

It does not close:

- Unit/apartment identity equivalence;
- Inventory aggregate/entity boundary;
- reservation concurrency/idempotency;
- pricing commitment/versioning;
- final aggregate topology.

The independent reviewer must explicitly consider this artifact before issuing a C03 closure verdict.

## 8. Updated LOCKED / OPEN classification

### LOCKED

- ASAS has a normative `apartment.commercial_status` state machine in v1.6.1.
- Its enum values are character-for-character normative according to the register.
- Commercial lifecycle transitions are event-driven and audited according to the register's implementation rule.
- This lifecycle does not by itself absorb Inventory, Reservation or Finance into the same aggregate.

### OPEN

- Exact mapping of `apartment` to canonical Unit terminology.
- Unit transactional identity/uniqueness.
- Inventory entity/aggregate ownership.
- Availability versus commercial-status relationship.
- Reservation concurrency/idempotency.
- Pricing snapshot/version/approval semantics.
- Final Unit/Inventory aggregate boundary.

### NOT AUTHORIZED

- Inventing a second competing Unit commercial state machine.
- Renaming or normalizing the normative enum values in implementation without an explicit superseding decision.
- Treating `commercial_status` as proof that cache/search/publication owns availability.
- Treating the apartment commercial aggregate as proof of Project→Building→Floor→Unit aggregate containment.

## 9. Required independent-review question

The independent reviewer must answer:

> Does the normative `apartment.commercial_status` machine constitute the authoritative commercial lifecycle of the canonical Unit, and if so, what exact boundary separates that lifecycle from Inventory availability and Sales Reservation state?

Until that question is independently recorded, C03 remains OPEN.

**No schema, ORM, migration, API or production implementation is authorized by this reconciliation artifact.**
