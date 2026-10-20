# ASAS — Hold Lifecycle Contract 2026-10-14

**Artifact ID:** `ASAS-CONTRACT-HOLD-LIFECYCLE-2026-001`
**Status:** SEMANTIC CONTRACT — derived from ADR-0038 / ADR-0033 / ADR-0034; implementation gated
**Branch:** `platform-architecture-2026`
**Owner:** Sales (Hold obligation) referencing Unit identity owned by Real Estate / Inventory
**Conference:** C03 → GATE-03
**Policy values pending:** hold duration, price-protection policy, approval authority (`FOUNDER-DECISION-REQUIRED`)

> This contract exists because the Hold is referenced by the normative register
> (`apartment.hold.create`, `hold.expired`, `hold.released`, and the `HELD`
> commercial state) but had **no contract** defining its identity, expiry
> conditionality or boundary. `ADR-0028` places the Hold lifecycle outside Unit
> ownership; `ADR-0038` Decision 6 makes it a mandatory commercial waypoint. Both
> statements require an explicit contract.

## 1. Position in the architecture

```text
Unit (Real Estate / Inventory)          Hold (Sales)
  owns the HELD commercial state   ←──  owns the temporary control obligation
  owns availability truth               owns the hold window and its expiry
```

- The **Unit** owns the resulting commercial state (`HELD`) and the availability
  truth. A hold never writes Unit state directly; it commands a governed
  transition.
- The **Hold** owns the temporary commercial control obligation: its window, its
  expiry and its release.
- A hold is **not** a reservation and creates no contract (`ADR-0033`).
- A hold confers no ownership, visibility or allocation right beyond the
  temporary control it represents (`ADR-0024` §7).

## 2. Hold identity is required

**Decision:** a hold must be individually identifiable, because expiry must be
conditional on the obligation that created it.

Register and contract evidence:

- `hold.expired` and `hold.released` are registered events, so the obligation's
  termination is a first-class fact that must be attributable;
- `ASAS-RESERVATION-CONSISTENCY-CONTRACT-2026.md` §Expiration already establishes
  the conditional-expiry doctrine for reservations
  (`expire(R_old) only if active_reservation == R_old`);
- `ADR-0034` §2 requires expiry safety: "stale timers/jobs cannot release a newer
  reservation".

Without an identifiable hold, a stale expiry job cannot determine whether it is
terminating the current hold or a superseded one, and could release a Unit that a
newer hold or a pending reservation legitimately controls.

**No hold state machine is created.** The register defines no hold machine, and
adding one is outside this contract's authority. The hold's observable lifecycle is
expressed through the Unit's `HELD` interval and its registered terminal events.

**Open (G-13):** whether the hold obligation is persisted as its own record, as
fields on the Unit with an audit trail, or otherwise. This contract requires the
*semantic* identity, not a persistence shape. The persistence choice is
implementation-gated.

## 3. Hold creation

| Field | Value |
|---|---|
| Actor | `field.agent`, `sales.agent`, `sales.manager`, `director`, `ceo` |
| Permission | `apartment.hold.create` — registered (YES for those five roles; `—` for marketing, accountant, admin) |
| Tenant | tenant/organization scope; Unit/project resource scope by assignment (`apartment.read` = OWN-assigned for agents, BRANCH for manager) |
| Preconditions | Unit commercial state is `AVAILABLE`; no competing active hold or reservation on the Unit; caller authorised for the Unit/project scope; hold window resolvable from policy; commercial terms snapshot-able if policy requires |
| Invariant | at most one active commercial control per exclusively allocatable Unit; a hold creates no reservation, no contract and no ownership |
| Command | `place_hold` (ACT-007) |
| Consistency boundary | the Unit — the same single-winner boundary as reservation (`ADR-0034`) |
| Concurrency | winner determined by authoritative commit, never by arrival order, cache, client clock or UI state |
| Idempotency | required; command identity + idempotency key scoped to the actor/operation boundary |
| Resulting state | Unit commercial: `AVAILABLE → HELD` |
| Event | `apartment.held` — registered (Inventory lane) |
| Audit | actor, organization, resource, policy, correlation/idempotency, timestamps, hold window |
| Failure/retry | no partial hold; typed conflict for the loser; retry of the same logical request returns the original result |
| Acceptance evidence | RACE-01/02/03/16; `ASAS-INVENTORY-LIFECYCLE-CONTRACT` acceptance 1 |

**Note.** Because `ADR-0038` Decision 6 makes `HELD` mandatory on the path to
`RESERVED`, `apartment.hold.create` is on the mandatory authorisation path of every
reservation.

## 4. Hold expiry

| Field | Value |
|---|---|
| Actor | system principal (deterministic expiry processing), not a persona |
| Permission | **GAP** — the permission register contains no key for hold expiry. See the register-delta record; expiry is a system-authorised transition, not a persona action |
| Tenant | tenant/organization scope inherited from the hold |
| Preconditions | the hold window has elapsed; **H is the active hold**; **no active reservation references the Unit** |
| Invariant | a stale expiry job must never release a newer hold, and must never release a Unit whose reservation is awaiting deposit |
| Command | `expire_hold` (system) |
| Consistency boundary | the Unit |
| Concurrency | expiry racing a new hold, a conversion, or an `OFF_MARKET` transition must resolve deterministically to a single outcome |
| Idempotency | required — repeated expiry processing must not produce duplicate effects |
| Resulting state | Unit commercial: `HELD → AVAILABLE` |
| Event | `hold.expired` — registered (Inventory lane) |
| Audit | system identity, hold identity, resource, reason, correlation, timestamps |
| Failure/retry | a failed expiry leaves the hold active (fail-closed) and retries; it must never partially release |
| Acceptance evidence | RACE-06 extended (expiry vs replacement); RACE-16 extended (expiry vs conversion) |

**Conditional expiry rule (normative).**

```text
expire(H) is permitted only if:
    H is the active hold on the Unit
    AND no active reservation references the Unit
```

If a reservation references the Unit, expiry is **suppressed**; the hold ends when
that reservation resolves through its own lifecycle. Without this rule,
`hold.expired` would be a double-booking path.

**Cooling.** Register B.1 returns `HELD → AVAILABLE` directly on
`hold.expired`. The cooling period applies to reservation/contract cancellation
(`CANCELLED` intermediate), **not** to hold expiry. Expiry therefore restores
availability immediately.

## 5. Hold release

| Field | Value |
|---|---|
| Actor | the holder's own authority, or a manager/director/ceo acting within scope |
| Permission | **GAP** — no registered key for hold release. Proposed `apartment.hold.release` (see register-delta record) |
| Preconditions | H is the active hold; **no active reservation references the Unit** |
| Invariant | a manual release must not bypass a pending reservation |
| Command | `release_hold` |
| Consistency boundary | the Unit |
| Idempotency | required |
| Resulting state | Unit commercial: `HELD → AVAILABLE` |
| Event | `hold.released` — registered (Inventory lane) |
| Audit | actor, organization, resource, reason, correlation, timestamps |
| Failure/retry | no partial release; typed conflict when a reservation references the Unit |
| Acceptance evidence | RACE-07 extended |

## 6. Hold → reservation conversion

Conversion is not a hold event and emits no hold event. It is observed through the
reservation facts:

```text
create_reservation   → reservation.created   (winner established; Unit remains HELD)
record deposit       → deposit.recorded      (Finance)
                     → apartment.reserved    (Unit HELD → RESERVED)
```

Rules:

1. Conversion does **not** emit `hold.released` or `hold.expired`. Releasing the
   hold's expiry obligation while the Unit is committed would be a false fact.
2. After conversion, the conditional expiry rule (§4) suppresses the hold's
   expiry, because a reservation references the Unit.
3. The reservation may reference the hold that preceded it; the reservation must
   remain independently valid under the inventory concurrency and authorisation
   rules (`ADR-0023` §Offer and Unit state, applied to holds).
4. **Register observation:** there is no `hold.converted` event. Conversion is
   observable through `reservation.created` plus `apartment.reserved`. No event is
   invented.

## 7. Participation in the single-winner boundary

1. At most one active hold may exist on a Unit at any instant. Concurrent holds
   are prohibited — the register provides no state for "held by two actors".
2. A hold and a reservation may not both be active as competing controls on the
   same Unit. The hold precedes the reservation; once the reservation exists, the
   **reservation record** is the authoritative winner (`ADR-0034` §Decision,
   reaffirmed by `ADR-0038` Decision 7).
3. Winner determination is by authoritative commit. Cache, search, public website,
   analytics and AI read models can never win a hold race.

## 8. Price protection during the hold window

`ADR-0032` rule 3 and `ASAS-PRICING-VERSIONING-CONTRACT-2026.md` §6 permit a hold
to reference a price/terms snapshot when commercial policy requires price
protection during the hold window.

**Decision:** whether holds carry price protection is a **commercial policy
decision** and is `FOUNDER-DECISION-REQUIRED`. This contract fixes only the
consequences:

- if policy requires protection, the hold records the applicable price version and
  the snapshot is immutable for the hold window;
- if policy does not require protection, the price applicable at reservation time
  governs, and the hold confers no price right;
- either way, a later price version never rewrites a committed reservation
  snapshot (`ADR-0032` rule 5).

## 9. Prohibitions

1. No direct write to the Unit commercial state. A hold commands a governed
   transition; it never sets status.
2. No hold expiry or release while an active reservation references the Unit.
3. No conversion that skips the `HELD` waypoint.
4. No second concurrent hold on the same Unit.
5. No hold on a Unit whose commercial state is not `AVAILABLE` (`DRAFT`, `HELD`,
   `RESERVED`, `CONTRACTED`, `SOLD`, `BLOCKED`, `OFF_MARKET`, `CANCELLED` are all
   ineligible).
6. No hold conferring ownership, visibility, allocation or reservation rights.
7. No cache, search index, public website, partner portal or AI surface winning a
   hold race or creating a hold without authorisation.
8. No hold record duplicating Unit identity — the hold references the Unit.
9. No `hold.converted` event invented; no hold state machine invented.

## 10. Acceptance evidence

Every scenario must be proven against authoritative persistence, not UI state.

| ID | Scenario | Required outcome |
|---|---|---|
| HOLD-01 | Two actors place a hold on one `AVAILABLE` Unit concurrently | exactly one hold is created |
| HOLD-02 | Hold placed on a Unit not in `AVAILABLE` | rejected, no state change |
| HOLD-03 | Hold expiry elapses | `hold.expired`; Unit returns to `AVAILABLE` |
| HOLD-04 | Stale expiry job runs after a newer hold exists | newer hold is untouched |
| HOLD-05 | **Expiry job runs while a reservation references the Unit** | **expiry suppressed; Unit remains `HELD`; no release** |
| HOLD-06 | Duplicate `place_hold` with the same idempotency key | one hold, stable result |
| HOLD-07 | Same key, different command | deterministic conflict |
| HOLD-08 | Manual release with a pending reservation | rejected, no release |
| HOLD-09 | Hold converted to reservation, then expiry attempted | expiry suppressed; no release |
| HOLD-10 | Cross-tenant hold attempt | authorization denied |
| HOLD-11 | Transaction fails before commit | no hold, no event |
| HOLD-12 | Duplicate `hold.expired` delivery | consumers remain idempotent |

HOLD-05 and HOLD-09 are the two scenarios that the register's transition table
implies but that no prior contract stated. They are mandatory.

## 11. Open items and founder decisions

| ID | Item | Owner |
|---|---|---|
| G-13 | Whether the hold obligation is a persisted record, Unit fields plus audit, or otherwise | GATE-03 (implementation-gated) |
| G-14 | Hold duration and expiry window values | `FOUNDER-DECISION-REQUIRED` |
| G-15 | Price protection during the hold window (yes/no + scope) | `FOUNDER-DECISION-REQUIRED` |
| G-16 | Approval authority for long or exceptional holds | `FOUNDER-DECISION-REQUIRED` |
| G-17 | Whether partner/channel holds differ from direct holds | C02 allocation contracts |
| G-18 | Permission keys for hold release and expiry | register-delta record (owner ratification) |

## 12. Implementation gate

No schema, ORM, migration, RLS, API or production change is authorized by this
contract. Implementation additionally requires:

1. brownfield persistence identity and existing hold/unit representation (G-7);
2. the concrete concurrency mechanism and passing race tests (G-8);
3. the register-delta decisions for hold permissions (G-18);
4. the founder decisions G-14 to G-16;
5. GATE-03 closure evidence.


