# ASAS Reservation Consistency Contract — 2026

**Status:** Accepted semantic contract; implementation gated  
**Workstream:** C03.12  
**Branch:** `platform-architecture-2026`

## Canonical invariant

```text
For each development Unit U:
there may be at most one active winning Reservation R at any instant.
```

The winner is determined by the authoritative transaction commit, never by client timestamp, UI order, HTTP arrival order, cache order, or analytics/search state.

## Reservation identity

A Reservation has its own stable identity. Unit identity is referenced, not replaced by Reservation identity.

Minimum semantic references:

- reservation_id
- unit_id
- organization/tenant context
- actor/initiator identity
- authorization context or policy decision reference
- idempotency_key / command identity
- lifecycle timestamps
- reservation commercial snapshot
- expiration data where applicable
- audit/correlation metadata

Exact persistence field names are implementation-gated.

## Allowed semantic actions

```text
create reservation
confirm/convert eligible hold to reservation
release reservation
expire reservation
cancel reservation (policy-controlled)
```

Raw `status = RESERVED` mutation is prohibited as an application-level authority.

## Eligibility

A reservation may succeed only when:

- the caller is authenticated;
- the caller is authorized for the Unit and relevant Project scope;
- the Unit is in an eligible commercial state;
- no competing active reservation has already won;
- the command is valid and not a conflicting replay;
- required commercial terms are snapshot-able;
- the transaction can establish the invariant atomically.

## Idempotency

The same logical command retried after timeout or network failure must not create multiple reservations.

Idempotency semantics must distinguish:

```text
same key + same command → same result
same key + different command → deterministic conflict
new key + same Unit → normal concurrency competition
```

## Expiration

Expiration is conditional on the reservation identity/version that created the expiry obligation. A stale job must never release a newer reservation.

Conceptually:

```text
expire(R_old)
only if active_reservation == R_old
```

## Snapshot

At successful reservation, ASAS records the commercial terms required to reconstruct the agreed reservation economics. This may include base price version, currency, approved adjustments/discounts and policy references.

A later Unit price version does not mutate the historical reservation snapshot.

## Events

Canonical semantic events include, subject to register reconciliation:

- `ReservationCreated`
- `ReservationRejected`
- `ReservationReleased`
- `ReservationExpired`
- `ReservationCancelled`

Event names must be reconciled against the canonical 103-event register before implementation. This contract does not silently create duplicate event definitions.

## State relationship

Reservation lifecycle and Unit commercial state are distinct state machines.

A successful reservation may cause the Unit projection to become `RESERVED`, but the Reservation record remains the authority for reservation lifecycle.

## Transactional outbox

The implementation must persist the outbox record in the same transaction as the authoritative reservation transition. Event consumers must tolerate duplicate delivery and retry safely.

## Security

Authorization is evaluated against the caller's effective authority, including tenant/organization, relationship, role/team, resource/project scope, action and policy. AI/automation uses the caller's effective authority and cannot escalate it.

## Required adversarial test matrix

| Scenario | Required result |
|---|---|
| Two callers / same Unit | Exactly one winner |
| Two agencies / same Unit | Exactly one winner |
| Duplicate same idempotency key | One reservation, stable result |
| Same key, different command | Deterministic conflict |
| Expiry vs new reservation | No stale release of new winner |
| Release vs new reservation | No double winner |
| Stale Unit state submitted | Server rejects/reconciles |
| Unit already RESERVED | New reservation rejected |
| Unit CONTRACTED/SOLD | Reservation rejected |
| Cross-tenant access | Denied |
| Lost response after commit | Retry returns committed result |
| Duplicate event delivery | Consumer remains idempotent |
| Cache says AVAILABLE but DB says RESERVED | DB/domain authority wins |

## Implementation gate

Do not implement this contract until the team has:

1. independently identified the live database/runtime;
2. mapped current Unit/Reservation persistence;
3. reconciled canonical permission, state and event registers;
4. selected the concrete transaction/constraint strategy;
5. added adversarial race tests;
6. verified tenant isolation;
7. recorded evidence and residual risks.
