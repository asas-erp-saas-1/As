# ADR-0038 — Canonical Unit State Dimensions and Commercial Lifecycle Reconciliation

> **CANONICALIZATION NOTICE (2026-10-16):** This is preserved from source branch `cline/hp1c6fdq` as candidate evidence for review. Any source-branch `ACCEPTED` labels, claimed delegation, and “finding closed” statements are not independent proof of canonical approval. This archive does not ratify the decision, close a gate/C-track, authorize implementation, or permit schema/migration/RLS/production changes.


**Status:** PROPOSED CANDIDATE — not ratified on the canonical branch; implementation gated
**Date:** 2026-10-14
**Source branch:** `cline/hp1c6fdq` — source-branch assertion, not canonical acceptance
**Decision owner:** Engineering Conference under founder delegation (2026-09-26)
**Conference route:** C03 → GATE-01 / GATE-03
**Resolves:** integrity finding F-06; C03 open decision C03-O09; the `BLOCKED-ON-F-06` statuses in the commercial edge contract matrix

## 1. Problem

Three authoritative artifact sets describe the same Unit lifecycle with
different enum values, different triggers and different release paths:

| Source | Commercial states | Release path |
|---|---|---|
| `registers/state-machines.json` B.1 (A2, normative) | 9 | two-hop |
| `ADR-0031`, `ADR-0033`, `ADR-0028`, `ASAS-UNIT-STATE-CONTRACT-2026.md`, `ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md` | 6 | direct |
| `ASAS-RESERVATION-STATE-MACHINE-CONTRACT-2026.md` (PROPOSED) | reservation states that appear nowhere in the register | n/a |

Additionally the construction dimension diverges: the register defines 6 values,
the contracts define 8.

This is not a naming preference. Every downstream contract, permission key, event
mapping, test matrix and schema decision depends on which enum is authoritative.
Leaving it unresolved is why the commercial edge matrix could only reach
`BLOCKED-ON-F-06`.

## 2. Authority basis

1. `registers/state-machines.json` is a promoted A2 canonical shadow whose meta
   block states that enum values are "character-for-character normative" and
   that there is "one StateMachine implementation, every lifecycle".
2. C03 decision C03-D03 records that `apartment.commercial_status` "must not be
   duplicated/renamed without superseding authority". This ADR is that
   superseding authority, and it **exercises that authority in the direction that
   requires no register edit**.
3. The founder delegation of 2026-09-26 authorises the Engineering Conference to
   close open architecture questions that do not require legal interpretation,
   destructive production authority or unavailable runtime evidence. Enum
   reconciliation, trigger semantics and release-path shape are architecture
   questions, so they are decidable here.
4. Policy *values* that depend on them — hold duration, cooling-period length,
   deposit amounts, approval thresholds — are commercial/product decisions and
   are explicitly **not** decided here.

**Blast radius.** The register is the normative source. The contracts are
incomplete. Therefore the contracts are corrected and the register is left
untouched: no enum value changes, no event is added, no permission is created,
and the canonical artifact register's structural counts (103 events / 11 machines
/ 50 permission keys) remain valid.

## 3. Decision 1 — Register enum values are authoritative for state names

State names and transition tables come from `registers/state-machines.json`.
Contracts may add semantics, guards, ownership and failure behaviour to a
transition, but a contract must never introduce a state name that the register
does not define, nor omit a state the register defines.

**Consequence:** `ADR-0031`, `ADR-0033`, `ADR-0028`,
`ASAS-UNIT-STATE-CONTRACT-2026.md` and `ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md`
are superseded **for their enumerated state lists only**. Their doctrines,
invariants, prohibitions and evidence requirements remain fully in force.

## 4. Decision 2 — Canonical Unit commercial dimension

The canonical commercial dimension of a Unit is the register's nine states, in
this exact spelling:

```text
DRAFT | AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | BLOCKED | OFF_MARKET | CANCELLED
```

### 4.1 State definitions

| State | Definition | Reachable from | Exits to |
|---|---|---|---|
| `DRAFT` | The Unit exists in inventory but has not been released to the commercial offering. Initial state of every Unit. | creation | `AVAILABLE` |
| `AVAILABLE` | The Unit may be commercially offered subject to allocation, project and policy rules. The only state from which a hold may be placed, and the only state from which `BLOCKED` / `OFF_MARKET` may be entered. | `DRAFT`, `HELD`, `CANCELLED`, `BLOCKED`, `OFF_MARKET` | `HELD`, `BLOCKED`, `OFF_MARKET` |
| `HELD` | Temporary, identified commercial control with a bounded hold window. Not a reservation; creates no contract; confers no ownership. | `AVAILABLE` | `RESERVED`, `AVAILABLE` |
| `RESERVED` | A reservation has won the Unit's single-winner boundary **and** the governing deposit has been recorded. Reservation terms are separate transactional facts. | `HELD` | `CONTRACTED`, `CANCELLED` |
| `CONTRACTED` | The governing contract has reached its contractual state. Contract remains a separate lifecycle. | `RESERVED` | `SOLD`, `CANCELLED` |
| `SOLD` | The platform's final sold milestone. Register note: "final payment + handover confirmed". Terminal for this dimension. | `CONTRACTED` | — |
| `BLOCKED` | The Unit is withheld from commercial allocation by a legal or operational restriction. | `AVAILABLE` | `AVAILABLE` |
| `OFF_MARKET` | The Unit is deliberately withheld from ordinary commercial allocation/publication by commercial policy. Not a synonym for deleted, archived or sold. | `AVAILABLE` | `AVAILABLE` |
| `CANCELLED` | A commitment (reservation or contract) has ended but the Unit has not yet returned to the offering. Carries the release/cooling interval. | `RESERVED`, `CONTRACTED` | `AVAILABLE` |

### 4.2 Derived semantic classes (ENGINEERING-DERIVATION — navigational aid, not authority)

- **Pre-offer:** `DRAFT`
- **Offerable:** `AVAILABLE`, `HELD`
- **Committed:** `RESERVED`, `CONTRACTED`
- **Withheld by policy or restriction:** `BLOCKED`, `OFF_MARKET`
- **Release-pending:** `CANCELLED`
- **Terminal:** `SOLD`

### 4.3 Why the nine states are adopted rather than the six

`DRAFT`, `BLOCKED`, `CANCELLED` are not redundant with the six-state contract
set; each carries semantics that the six-state set cannot express:

1. **`CANCELLED` carries the cooling period.** Register B.6 states that "cooling
   period applies before unit returns AVAILABLE". A direct
   `RESERVED → AVAILABLE` edge cannot represent a unit whose commitment has ended
   but which is not yet re-offerable. Collapsing it would make the cooling
   interval unrepresentable without inventing a second field.
2. **`BLOCKED` ≠ `OFF_MARKET`.** `BLOCKED` expresses a legal/operational
   restriction on a unit that is otherwise sellable; `OFF_MARKET` expresses a
   commercial decision to withhold. Merging them would destroy the audit
   distinction that `ADR-0033` already relies on when it states that `OFF_MARKET`
   is not a synonym for deleted, archived or sold.
3. **`DRAFT` separates inventory creation from commercial release.** Without it,
   a newly created unit is immediately offerable, and there is no state that
   means "exists but not yet released".
4. **Enum fidelity.** The register is normative and character-for-character.
   Adopting fewer values would require editing the register and would weaken a
   canonical control for no architectural gain.

## 5. Decision 3 — Canonical Unit construction dimension

The canonical construction dimension is the register's six values:

```text
NOT_STARTED | IN_CONSTRUCTION | STRUCTURE_COMPLETE | FINISHING | DELIVERY_READY | DELIVERED
```

The eight-value contract list (`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY |
MEP | FINISHING | READY | DELIVERED`) is superseded.

### 5.1 Construction state is a derived projection, not an authored state

Register B.2 states that the chain is "driven by `milestone.certified` events per
building; regressions forbidden except by director-approved change order".

Two consequences follow, and they are the reason this matters beyond naming:

1. **Construction state has no direct setter and needs no dedicated permission
   key.** The authorising action is milestone certification
   (`milestone.certified`) and, for regressions, `change_order.approved`. A
   `unit.set_construction_status` command does not exist and must not be created.
2. **Construction state may be shared across the units of a building**, because
   the driver is per-building milestone certification. A Unit's construction
   value may therefore be a projection of building progress rather than an
   independent per-unit fact.

### 5.2 Named open question

Register B.2 says milestones are certified "per building", while
`milestone.certified` is grouped under the Inventory emission lane. Whether
certification is scoped to a building, to a unit, or to both is **not** decided
here. It is recorded as open question **G-9** and it does not block the
commercial lifecycle, because construction never performs a commercial
transition (ADR-0033 invariant 5, reaffirmed).

## 6. Decision 4 — Release is a two-hop path; direct release is prohibited

The register defines exactly one return-to-offering path for committed
inventory:

```text
RESERVED   → CANCELLED (on reservation.cancelled)
CONTRACTED → CANCELLED (on contract.terminated)
CANCELLED  → AVAILABLE (on apartment.released)
```

**Decision:** `RESERVED → AVAILABLE` and `CONTRACTED → AVAILABLE` are
**prohibited** transitions. The `CANCELLED` intermediate is mandatory.

**Rationale.** The two-hop path is the only representation of the register's own
requirement that a cooling period applies before a unit returns to `AVAILABLE`.
The one-hop form asserted by `ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md`
("`RESERVED → AVAILABLE` (authorized release/cancellation/expiration where policy
permits)") is withdrawn. It would either lose the cooling interval or force a
second, unregistered field to carry it — exactly the kind of hidden state the
register exists to prevent.

**Consequence for the edge matrix.** Edge E4 must be read as two governed
transitions, not one, and each carries its own actor, permission, precondition
and event.

## 7. Decision 5 — `apartment.published` means release to the commercial offering

The register's `DRAFT → AVAILABLE` transition is triggered by
`apartment.published`. That event name is ambiguous between two readings:

- **(a)** the Unit is released into the commercial offering (it becomes sellable); or
- **(b)** the Unit is published on the public website.

**Decision:** reading **(a)**. `apartment.published` is the commercial-release
event and is **not** public-web publication.

**Evidence and rationale.**

1. Only reading (a) is consistent with the transition: the event *causes*
   commercial availability, so it must be a commercial-release act.
2. Reading (b) would make a private or off-plan sale impossible: a Unit that is
   never publicly published could never leave `DRAFT`, and therefore could never
   be held, reserved or sold. That is commercially implausible and contradicts
   `ADR-0028`, which treats the public listing as a *representation* of
   inventory, not as a precondition of its existence.
3. The register already provides a separate public-publication surface: the
   `apartment.marketing.publish` permission and the Studio page-version machine
   (B.10 `DRAFT → IN_REVIEW → PUBLISHED → ARCHIVED`). Public publication is a
   projection with its own lifecycle, consistent with C03 artifact 22.
4. `ADR-0033` invariant 7 already states that public publication never implies
   operational availability. Reading (b) would invert that invariant.

**Non-authorization:** this decision interprets the event's meaning. It does not
rename the event, and it does not authorise a second publication state on the
Unit. Public publication remains a Studio projection.

## 8. Decision 6 — `HELD` is a mandatory commercial waypoint

The register contains **no** `AVAILABLE → RESERVED` edge. The only route to
`RESERVED` is `AVAILABLE → HELD → RESERVED`.

**Decision:** a Unit may not enter `RESERVED` without having passed through
`HELD`. The hold is therefore not optional convenience — it is a mandatory
commercial waypoint on the path to every reservation.

**Consequences.**

1. The `apartment.hold.create` permission is on the mandatory path of every
   reservation, not only of explicitly "held" units. Any actor authorised to
   reserve must be authorised to hold.
2. The intermediate `HELD` transition and its `apartment.held` fact must be
   recorded even when a single user-facing action composes hold and reservation.
   No command may skip the waypoint.
3. The hold must carry an identity, because expiry must be conditional on the
   obligation that created it (see Decision 7).
4. `DRAFT → HELD` and `CANCELLED → HELD` are not permitted by the register. A
   Unit must be released to the offering and be `AVAILABLE` before it can be
   held.

## 9. Decision 7 — `HELD → RESERVED` trigger, projection doctrine, and winner authority

### 9.1 Trigger

`HELD → RESERVED` is triggered by `deposit.recorded` (a Finance fact). The Unit
transition and the fired Unit-side fact `apartment.reserved` occur when the
governing deposit is recorded, and the reservation becomes `ACTIVE` in the same
transaction boundary.

### 9.2 Winner authority (reaffirms ADR-0034)

The authoritative single-winner boundary is the **Reservation record**, not the
Unit's commercial status. `unit.commercial_status = RESERVED` is a governed
projection of a successful reservation, exactly as `ADR-0034` §Decision states.

This resolves the apparent conflict between a deposit-driven Unit transition and
a reservation-driven winner: the two are not competitors, they are a fact and its
projection.

```text
place_hold                → apartment.held       (Unit AVAILABLE → HELD)
create_reservation        → reservation.created (winner established; Unit stays HELD)
record deposit            → deposit.recorded    (Finance)
                          → apartment.reserved  (Unit HELD → RESERVED; reservation ACTIVE)
```

### 9.3 The window between reservation creation and deposit

A reservation may legitimately exist while the Unit is still `HELD`
(reservation in `DRAFT`/`PENDING_DEPOSIT`). During that window:

1. no second reservation may win the Unit — the invariant is enforced on the
   reservation record, not on the Unit status;
2. **the hold must not expire while a reservation is pending.** Expiry is
   conditional on the obligation that created it:

```text
expire(H) only if H is the active hold
          and no active reservation references the Unit
```

Without this condition, `hold.expired` could legally release a Unit whose
reservation is awaiting deposit — a double-booking path. This condition is
derived from, and required by, the register's own transition table plus
`ADR-0034` §2.

### 9.4 Cancellation paths are state-dependent

Two distinct cancellation paths exist, and conflating them would produce a false
release:

| Situation at cancellation | Unit transition | Events |
|---|---|---|
| Reservation cancelled before the deposit was recorded (Unit is `HELD`) | `HELD → AVAILABLE` | `reservation.cancelled`, `hold.released` |
| Reservation cancelled after the deposit was recorded (Unit is `RESERVED`) | `RESERVED → CANCELLED → AVAILABLE` | `reservation.cancelled`, `apartment.released` |
| Contract terminated (Unit is `CONTRACTED`) | `CONTRACTED → CANCELLED → AVAILABLE` | `contract.terminated`, `apartment.released` |

A Unit that never reached `RESERVED` must never pass through `CANCELLED`; a Unit
that reached `RESERVED` must never return directly to `AVAILABLE`.

### 9.5 Refund path

Register B.6 places `REFUND_PROCESSING` after `CANCELLED` on the reservation
machine. That path applies when funds were actually received. A reservation
cancelled from `PENDING_DEPOSIT` has no deposit to refund and proceeds
`CANCELLED → CLOSED` without entering `REFUND_PROCESSING`. This is a derived
clarification, consistent with the reservation machine's own ordering.

## 10. Decision 8 — Reservation lifecycle aligns with the register; the proposed state list is withdrawn

The reservation lifecycle is register B.6:

```text
DRAFT → PENDING_DEPOSIT → ACTIVE → CONVERTED
                            ↓
                        CANCELLED → REFUND_PROCESSING → CLOSED
```

**`ASAS-RESERVATION-STATE-MACHINE-CONTRACT-2026.md` (status PROPOSED) is
withdrawn for its state list.** Its candidate states
(`REQUESTED`, `PENDING_APPROVAL`, `CONFIRMED`, `ACTIVE`, `CANCELLED`, `EXPIRED`,
`CONVERTED`) must not be implemented.

Mapping and rationale:

| Withdrawn candidate | Register-aligned expression | Reason |
|---|---|---|
| `REQUESTED` | `DRAFT` | The register's initial state. |
| `PENDING_APPROVAL` | `DRAFT` **plus** an open Approval Engine request (`approval.requested`) | Approval is a cross-cutting control (register B.9, `ADR-0023`), not a reservation state. Modelling it as a state would create a second, competing approval lifecycle. |
| `CONFIRMED` | `ACTIVE` | `ACTIVE` already means the deposit has been recorded; a separate `CONFIRMED` would duplicate it. |
| `EXPIRED` | `CANCELLED` with an expiry reason (after auto-cancel approval for `PENDING_DEPOSIT`) | Register B.6 expresses `PENDING_DEPOSIT` expiry as auto-cancel approval. There is no `ACTIVE → EXPIRED` edge: an `ACTIVE` reservation ends through cancellation and, where funds were received, the refund path. Silently expiring an `ACTIVE` reservation would bypass refund processing. |
| `REJECTED` | not a reservation state | Rejection is an approval outcome (`approval.rejected`) or a failed command, not a persisted reservation lifecycle state. |

**Consequence.** The register's reservation model is strictly more correct than
the withdrawn proposal: it keeps approval in the Approval Engine, keeps expiry in
the cancellation/refund path, and prevents an `ACTIVE` reservation from
disappearing without financial resolution.

## 11. Decision 9 — Event semantics; no event is created

**Rule.** For every Unit commercial transition, the register's `on:` field names
the triggering event. Where an `apartment.*` event exists for that transition, it
is the Unit-side domain fact. Where the transition is triggered by a cross-context
event (`deposit.recorded`, `reservation.cancelled`, `contract.terminated`), the
cross-context event is the trigger, and **no additional Unit-side event is
invented**.

**Applied to the full transition table:**

| Transition | Trigger (`on:`) | Unit-side fact | Cross-context |
|---|---|---|---|
| `DRAFT → AVAILABLE` | `apartment.published` | `apartment.published` | — |
| `AVAILABLE → HELD` | `apartment.held` | `apartment.held` | — |
| `HELD → RESERVED` | `deposit.recorded` | `apartment.reserved` | Finance |
| `HELD → AVAILABLE` | `hold.expired` / `hold.released` | `hold.expired` / `hold.released` | Sales/Inventory |
| `RESERVED → CONTRACTED` | `contract.signed` | `apartment.contracted` | Sales |
| `RESERVED → CANCELLED` | `reservation.cancelled` | *(none registered)* | Sales |
| `CONTRACTED → SOLD` | `apartment.sold` | `apartment.sold` | — |
| `CONTRACTED → CANCELLED` | `contract.terminated` | *(none registered)* | Sales |
| `CANCELLED → AVAILABLE` | `apartment.released` | `apartment.released` | — |
| `AVAILABLE → BLOCKED` | `apartment.blocked` | `apartment.blocked` | — |
| `BLOCKED → AVAILABLE` | `apartment.unblocked` | `apartment.unblocked` | — |
| `AVAILABLE → OFF_MARKET` | `apartment.off_marketed` | `apartment.off_marketed` | — |
| `OFF_MARKET → AVAILABLE` | `apartment.back_on_market` | `apartment.back_on_market` | — |

**Recorded asymmetry (observation, not a defect to fix by invention).** The
register provides `apartment.contracted` for the contract-signing transition but
no `apartment.cancelled` for the two cancellation transitions. Consumers of
cancellation must therefore subscribe to `reservation.cancelled` /
`contract.terminated` plus `apartment.released`. This is recorded as an
observation about the source register; no `apartment.cancelled` event is created,
because inventing register events is outside this ADR's authority.

**Resolution of finding F-07.** The event names used by the reservation
consistency contract map onto registered events without any register edit:

| Contract name | Registered expression |
|---|---|
| `ReservationCreated` | `reservation.created` |
| `ReservationCancelled` | `reservation.cancelled` |
| `ReservationReleased` | `hold.released` (pre-deposit) / `apartment.released` (post-deposit) |
| `ReservationExpired` | `hold.expired` for a hold; for a reservation, `reservation.cancelled` with an expiry reason after auto-cancel approval |
| `ReservationRejected` | not a domain event — `approval.rejected` or a failed command |

No event is added, renamed or removed. The register's structural count remains
103 events.

## 12. Decision 10 — Supersession scope and implementation gate

### 12.1 Superseded, in part

| Artifact | Superseded portion | Retained |
|---|---|---|
| `decisions/ADR-0028-UNIT-DOMAIN-SEMANTICS-2026-09-26.md` | §State doctrine enum lists | All identity, ownership, boundary, aggregate, pricing, listing, media and AI doctrine |
| `decisions/ADR-0031-UNIT-STATE-DOCTRINE-2026-09-26.md` | §Commercial state, §Construction state value lists | The two-independent-dimensions doctrine and all ten semantic rules |
| `decisions/ADR-0033-INVENTORY-LIFECYCLE-SEMANTICS-2026-09-26.md` | The six-state list and the direct `RESERVED → AVAILABLE` release | Lifecycle semantics, invariants, concurrency and projection doctrine |
| `contracts/ASAS-UNIT-STATE-CONTRACT-2026.md` | State value lists | Cross-dimensional invariant, mutation doctrine, separation rule |
| `contracts/ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md` | State list and direct release transition | State ownership, independence rules, projection doctrine, command behaviour, acceptance tests |
| `contracts/ASAS-RESERVATION-STATE-MACHINE-CONTRACT-2026.md` | Entire candidate state list (withdrawn) | Ownership statement (Reservation owned by Sales; Inventory authoritative for availability) |

### 12.2 Explicitly not superseded

`ADR-0034` (reservation consistency boundary) is **reaffirmed**, not superseded.
Its single-winner doctrine, idempotency, expiry-conditionality, snapshot
integrity, outbox boundary and non-selection of a locking mechanism all remain in
force.

`ADR-0032` (pricing and versioning) is unaffected.

### 12.3 Implementation gate

This ADR closes a semantic reconciliation. It authorizes **no** schema, ORM,
migration, RLS, API or production change. Implementation remains blocked by:

- brownfield runtime identity and existing Unit/Reservation persistence (F-01, G-7);
- the concrete transaction/isolation/constraint mechanism (G-8);
- the permission-key register gaps for the newly clarified transitions (F-08);
- adversarial race-test evidence (RACE-01…16).

## 13. Rejected alternatives

**A. Narrow the register to the six contract states.**
Rejected: destroys the cooling period, the `BLOCKED`/`OFF_MARKET` distinction and
the `DRAFT` pre-release state; requires editing a normative A2 register for no
architectural gain; contradicts C03-D03's prohibition on renaming without
superseding authority.

**B. Keep two parallel enums (six for contracts, nine for the register).**
Rejected: guarantees permanent drift, makes the state machine unimplementable as
"one StateMachine, every lifecycle", and leaves every downstream consumer to
choose an enum.

**C. Model `CANCELLED` as an event outcome rather than a state.**
Rejected: makes the cooling interval unrepresentable without an unregistered
field, and breaks the register's own `CANCELLED → AVAILABLE` edge.

**D. Keep the direct `RESERVED → AVAILABLE` release and model cooling elsewhere.**
Rejected: introduces hidden state outside the state machine and outside audit.

**E. Keep the proposed reservation states and add them to the register.**
Rejected: the proposal is semantically weaker (approval as a reservation state,
`ACTIVE` expirable without refund processing), and adding states to the register
is outside this ADR's authority.

**F. Allow `AVAILABLE → RESERVED` directly to avoid the mandatory hold.**
Rejected: requires amending the normative transition table, and would bypass the
`apartment.hold.create` authorization that the register places on the path.

## 14. Consequences

**Positive.**

- One commercial enum, one construction enum, one reservation enum — all
  traceable to a single normative source.
- The commercial edge matrix can move from `BLOCKED-ON-F-06` to concrete,
  decision-backed contract text.
- Two previously invisible safety conditions become explicit: the mandatory
  `HELD` waypoint, and hold expiry being conditional on the absence of a pending
  reservation.
- The cooling period becomes representable and auditable.
- No register, event or permission file is edited, so canonical counts and
  structural verification remain valid.

**Costs and constraints.**

- Every contract and test referencing the six-state set must be read through this
  ADR.
- `DRAFT` means a newly created Unit is not offerable until released; creation
  flows must include an explicit release step.
- Cancellation is two transitions, so cancellation UX and audit must handle an
  intermediate `CANCELLED` state.
- `RESERVED` now requires a recorded deposit, so "reserved without deposit" does
  not exist as a state; it is a reservation in `DRAFT`/`PENDING_DEPOSIT` on a
  `HELD` Unit.

## 15. Verification required before implementation

1. Reconcile the nine commercial and six construction states against the existing
   brownfield `Apartment` persistence representation (read-only).
2. Prove the mandatory `HELD` waypoint and conditional hold expiry in the race
   matrix (extend RACE-06 / RACE-16).
3. Prove the two-hop release, including that no code path can move
   `RESERVED → AVAILABLE` directly.
4. Map every transition to a registered event and an existing or proposed
   permission key (see the register-delta record).
5. Confirm in the Studio/publication contract that `apartment.published` is
   commercial release, not public publication.
6. Record all evidence against GATE-03 and update the checkpoint.

## 16. Reopen triggers

This ADR reopens if: the register's state machine is amended; brownfield
persistence proves a materially different lifecycle; a legal requirement changes
the release or refund path; or a concurrency finding shows the mandatory hold
waypoint cannot be enforced without a transition the register does not define.

## 17. What this ADR does not close

- `G-9` construction milestone scope (building vs unit).
- Hold duration and cooling-period **values** — `FOUNDER-DECISION-REQUIRED`.
- Deposit semantics and approval authority — `FOUNDER-DECISION-REQUIRED`.
- Permission-key register gaps — see the register-delta record (owner ratification).
- Brownfield persistence identity and the concrete concurrency mechanism.
- C03 independent-review evidence.





