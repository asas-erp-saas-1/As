# C03 — Post-Source-Register Red-Team Reconciliation

**Date:** 2026-10-03  
**Status:** RED-TEAM COMPLETE — CLOSURE REVIEW STILL REQUIRED  
**Depends on:** C03 artifacts `17–26`, especially `26-SOURCE-RECONCILIATION-STATE-MACHINE-COMMERCIAL-STATUS-2026-10-02.md`.  
**Purpose:** Re-attack C03 after discovering that the authoritative v1.6.1 state-machine register already defines `apartment.commercial_status`. This pass exists to prevent closure against an outdated interpretation of Unit/Apartment commercial state.

## 1. Source precedence

The current evidence chain is:

1. Blueprint / architecture authority.
2. Authoritative registers derived from that authority.
3. Current C03 reconciliation artifacts.
4. Historical implementation evidence, retained only as provenance.

The reading protocol explicitly states that when a register and Blueprint disagree, the Blueprint wins and the register is stale; no code is written around the disagreement. The current C03 correction therefore treats the v1.6.1 state-machine register as authoritative only insofar as it remains consistent with the Blueprint/source authority.

## 2. Source-locked correction

`registers/state-machines.json` defines:

```text
aggregate: apartment.commercial_status

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

with event-driven transitions and an implementation rule requiring typed illegal-transition errors, audit information and the corresponding domain event.

Therefore C03 must no longer describe the existence of a commercial lifecycle as wholly unresolved.

The unresolved question is narrower:

```text
Does the normative `apartment` aggregate
map exactly to the canonical `Unit` domain object
through every authoritative architecture layer?
```

## 3. Attack: invent a competing Unit lifecycle

**Scenario:** implementation creates a new `UnitStatus` lifecycle with different enum names.

**Result:** BLOCKED.

The existing normative `apartment.commercial_status` machine must not be silently duplicated, renamed or normalized. A superseding decision would be required before changing its contract.

## 4. Attack: equate commercial status with all inventory semantics

**Scenario:** `commercial_status = AVAILABLE` is treated as the entire inventory model.

**Result:** BLOCKED / UNSUPPORTED.

The state machine establishes an apartment commercial lifecycle, but it does not prove:

- inventory cardinality;
- allocation positions;
- channel allocation;
- reservation lock mechanics;
- hold expiry implementation;
- pricing commitment;
- tenant persistence constraints.

Therefore:

```text
apartment.commercial_status
        ≠ automatically complete Inventory model
```

## 5. Attack: equate commercial status with Reservation status

**Scenario:** `RESERVED` is used as a substitute for the reservation aggregate lifecycle.

**Result:** BLOCKED.

The authoritative register separately defines `B.6_reservation` with its own lifecycle. Therefore the platform has at least two distinct state machines whose meanings must be reconciled rather than collapsed.

## 6. Attack: infer one aggregate from multiple state machines

**Scenario:** because apartment commercial and construction states both exist, Unit + Inventory + Reservation become one aggregate.

**Result:** BLOCKED.

Multiple state machines on related objects do not prove a single transactional consistency boundary. The existing architecture explicitly assigns Inventory availability to Real Estate and Reservation workflow to Sales, with concurrency/idempotency verification at the boundary.

## 7. Attack: infer `AVAILABLE → RESERVED` as a direct state-machine transition

**Scenario:** a reservation command directly mutates `apartment.commercial_status` without respecting the registered transition path.

**Result:** BLOCKED.

The registered path is:

```text
AVAILABLE → HELD → RESERVED
```

with the specified events. The exact application command orchestration remains a separate contract question, but implementation must not invent a shortcut that violates the normative transition table.

## 8. Attack: treat `HELD` as merely a UI concept

**Scenario:** hold state exists only in frontend/session state.

**Result:** BLOCKED.

The state machine makes `HELD` a normative commercial state and the broader architecture requires authoritative transactional inventory handling. Frontend-only hold state cannot satisfy the commercial lifecycle contract.

Exact hold ownership, expiry and concurrency mechanics remain OPEN until the Reservation/Inventory contract is closed.

## 9. Attack: construction state mutates commercial state automatically

**Scenario:** `DELIVERY_READY` or another construction state automatically forces `AVAILABLE`.

**Result:** BLOCKED.

Construction and commercial axes are explicitly distinct. The construction register is driven by certified milestones; commercial state follows its own transition contract.

## 10. Attack: publication state mutates commercial state

**Scenario:** publishing a Studio page automatically makes an apartment `AVAILABLE`.

**Result:** BLOCKED.

The commercial machine permits `DRAFT → AVAILABLE` on `apartment.published`, but this does not authorize Studio to become the transactional owner. The event must be interpreted through the authoritative domain/application contract. Publication remains a projection/editorial capability, not inventory authority.

This is a critical distinction:

```text
registered transition event
        ≠
permission for every producer of a similarly named action
```

## 11. Attack: cancellation semantics are interchangeable

**Scenario:** any cancellation event simply sets `CANCELLED` across Reservation, Contract and Apartment.

**Result:** BLOCKED.

The state-machine register defines separate machines for apartment commercial status, reservation and contract. Their cancellation transitions and downstream consequences cannot be collapsed without explicit cross-context policy.

## 12. Attack: price mutation during HELD / RESERVED

**Scenario:** current price overwrites the amount associated with a hold/reservation.

**Result:** OPEN / HIGH-RISK.

The state-machine register does not itself settle pricing snapshot/version semantics. The pricing contract must define whether a commercial commitment captures a versioned amount and how later price changes interact with that commitment.

No implementation shortcut is authorized.

## 13. Attack: tenant crossing through inventory or reservation

**Scenario:** an apartment belongs to Tenant A while an inventory/reservation operation is executed in Tenant B scope.

**Result:** BLOCKED.

Structural identity, inventory availability, reservation and attachments must remain within the governed tenant boundary unless an explicit cross-tenant capability exists.

## 14. Attack: stale projection overwrites authoritative commercial state

**Scenario:** public/search/cache data says AVAILABLE and a projection worker writes that value back into the transactional source.

**Result:** BLOCKED.

The direction remains one-way:

```text
authoritative domain state
        ↓
projection / publication
```

not the reverse.

## 15. Attack: duplicate event replays a commercial transition

**Scenario:** `apartment.published`, `deposit.recorded` or another event is delivered twice.

**Result:** OPEN / idempotency required.

The state machine requires legal transitions and audit/event behavior, while the broader architecture requires idempotent asynchronous consumers. Exact event deduplication/idempotency keys remain implementation-contract work and must not be guessed here.

## 16. Attack: historical schema terminology is treated as canonical

**Scenario:** a historical database column/table named `unit` or `apartment` is used to settle the semantic identity question.

**Result:** BLOCKED.

Historical implementation is provenance unless explicitly promoted by current architecture authority. The current task must reconcile terminology against the authoritative Blueprint/registers rather than allowing legacy naming to decide domain semantics.

## 17. Aggregate-boundary conclusion

After this second red-team pass, the evidence supports rejecting the following default:

```text
Project
  └── Building
       └── Floor
            └── Unit
                 ├── Inventory
                 ├── Reservation
                 └── Finance
```

The evidence instead supports separate consistency boundaries with explicit contracts:

```text
REAL ESTATE
  Project / Building / Floor / Unit
  Inventory availability
  Pricing authority

SALES
  Option / Reservation

CONTRACTS
  Contractual state

FINANCE
  Financial truth

STUDIO
  Publication projection
```

The final Unit ↔ Inventory boundary remains the principal unresolved aggregate decision.

## 18. Updated LOCKED / OPEN / NOT AUTHORIZED

### LOCKED

- `apartment.commercial_status` exists as a normative v1.6.1 state machine.
- Its enum values and legal transitions are normative until superseded by an explicit authoritative decision.
- Reservation has a separate state machine.
- Construction has a separate state axis.
- Commercial lifecycle, Inventory authority and Reservation workflow must not be silently collapsed.
- Public Studio/search/cache state is derived, not transactional authority.
- Structural hierarchy is not automatically one aggregate.

### OPEN

- Exact `apartment` ↔ canonical `Unit` identity mapping.
- Exact Inventory entity/aggregate boundary.
- `commercial_status` ↔ inventory availability relationship.
- Hold/Reservation concurrency and idempotency contract.
- Pricing snapshot/version semantics.
- Cross-context command/event contracts.
- Final Unit/Inventory aggregate topology.

### NOT AUTHORIZED

- Creating a competing commercial lifecycle.
- Renaming normative enum values without a superseding decision.
- Treating `commercial_status` as proof of complete Inventory ownership.
- Treating Reservation status as the apartment commercial status.
- Using publication/cache/search as availability authority.
- Deriving aggregate boundaries from hierarchy or state-machine existence alone.

## 19. Closure impact

C03 is **still not closed**.

The prior closure packet must explicitly include this post-register reconciliation before an independent reviewer can issue a valid verdict. The next artifact should therefore be an updated closure packet referencing both the original red-team and this post-source-register attack pass.

**No persistence/API implementation is authorized by this document.**
