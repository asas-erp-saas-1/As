# ASAS — Inventory / Unit / Reservation Commercial Edge Contract Matrix 2026-10-14

**Artifact ID:** `ASAS-CONTRACT-C03-COMMERCIAL-EDGE-MATRIX-2026-001`
**Status:** PROPOSED / ENGINEERING-DERIVATION — OPEN / IMPLEMENTATION BLOCKED
**Authority:** Architecture/contract engineering only. Authorizes no schema,
ORM, migration, RLS or production API.
**Conference:** C03 → GATE-03
**Branch:** `platform-architecture-2026`
**Owner:** Engineering Conference (Real Estate / Inventory ↔ Sales boundary)
**Produced by:** authoring engineering stream (not independent review evidence)

## 1. Purpose

This matrix is the concrete contract artifact requested as the next work unit by
`docs/handoff/CURRENT-SESSION-STATE.md` and
`ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026-AMENDMENT-006-ZERO-TRUST-REBASELINE-2026-10-04.md` §8,
and by C03 artifact 31 §10.

It reconciles six commercial edges against the existing accepted semantic
artifacts and the canonical machine-readable registers, and it records — rather
than hides — where those sources disagree.

## 2. Non-goals

This artifact does **not**:

- select a PostgreSQL locking or isolation mechanism;
- define table, column, ORM or RLS shapes;
- create permission keys, event names or states that do not exist in the
  canonical registers;
- resolve the register/contract state conflict recorded as F-06;
- close C03 or authorize implementation.

## 3. Sources reconciled

| Source | Role here |
|---|---|
| `decisions/ADR-0031-UNIT-STATE-DOCTRINE-2026-09-26.md` | two independent state dimensions |
| `decisions/ADR-0032-PRICING-VERSIONING-SEMANTICS-2026-09-26.md` | price versioning + snapshot |
| `decisions/ADR-0033-INVENTORY-LIFECYCLE-SEMANTICS-2026-09-26.md` | lifecycle + release doctrine |
| `decisions/ADR-0034-RESERVATION-CONSISTENCY-BOUNDARY-2026-09-26.md` | single-winner consistency boundary |
| `contracts/ASAS-UNIT-STATE-CONTRACT-2026.md` | state dimensions |
| `contracts/ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md` | allowed transitions |
| `contracts/ASAS-PRICING-VERSIONING-CONTRACT-2026.md` | snapshot rules |
| `contracts/ASAS-RESERVATION-CONSISTENCY-CONTRACT-2026.md` | reservation identity/idempotency/expiry |
| `contracts/ASAS-RESERVATION-STATE-MACHINE-CONTRACT-2026.md` | proposed reservation lifecycle |
| `contracts/ASAS-RESERVATION-RACE-TEST-MATRIX-2026.md` | RACE-01…16 |
| `ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md` | INV-UR-001, ADR-0017 protocol provenance |
| `registers/state-machines.json` (A2) | normative state machines |
| `registers/events.json` (A2) | canonical event names |
| `registers/permissions.csv` (A2) | canonical permission keys |
| `ASAS-COMMAND-ACTION-CONTRACT-REGISTER-2026.md` | action inventory + 16-field rule |
| `reconciliation/phase-c/C03/31-INVENTORY-UNIT-RESERVATION-CONTRACT-RECONCILIATION-2026-10-04.md` | blocker set B1–B5 |

## 4. Governing conflict notice (F-06)

The canonical state-machine register and the accepted ADR/contract set do not
agree on the commercial state enum or on the `HELD → RESERVED` trigger. See
`reconciliation/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md` F-06.

This matrix is therefore written to be **resolution-neutral**: every edge is
expressed in terms of the six contract states that both sources agree exist
(`AVAILABLE, HELD, RESERVED, CONTRACTED, SOLD, OFF_MARKET`), and every edge whose
behaviour depends on the disputed portion is marked `BLOCKED-ON-F-06`.

## 5. Edge field definition

Each edge is expressed with the field set required by the Core Lifecycle
Canonical Map:

`actor → permission → tenant → preconditions → invariant → command →
consistency/transaction boundary → concurrency → idempotency → resulting state →
event → audit → failure/retry → acceptance evidence`

An edge is implementation-ready only when every field is populated from an
authoritative source. Fields marked `GAP` or `BLOCKED` are not populated by
inference.

## 6. E1 — `AVAILABLE → HELD`

| Field | Value |
|---|---|
| Actor | `field.agent`, `sales.agent`, `sales.manager`, `director`, `ceo` |
| Permission | `apartment.hold.create` — registered (YES for the five roles above; `—` for marketing, accountant, admin) |
| Tenant | tenant/organization scope; resource scope by assignment (`apartment.read` = OWN-assigned for agents, BRANCH for manager) |
| Preconditions | Unit exists and is commercially eligible; no competing active hold/reservation; caller authorized for the Unit/project scope; commercial terms snapshot-able |
| Invariant | at most one active commercial control per exclusively allocatable Unit; a hold is not a reservation and creates no contract (ADR-0033) |
| Command | `place_hold` (ACT-007; status OPEN — governed by the Unit/Reservation consistency contract) |
| Consistency boundary | the Unit — same single-winner boundary as reservation (ADR-0034) |
| Concurrency | winner determined by authoritative commit, never by arrival order, cache or client clock |
| Idempotency | required; command identity + idempotency key |
| Resulting state | Unit commercial = `HELD` |
| Event | `apartment.held` — registered (Inventory group) |
| Audit | actor, organization, resource, policy, correlation/idempotency, timestamps (ADR-0034 §6) |
| Failure/retry | no partial hold; typed conflict for the loser; retry of the same logical request returns the original result |
| Acceptance evidence | INVENTORY-LIFECYCLE-CONTRACT acceptance 1; RACE-01/02/03/16 |
| Open | hold expiry rule undefined; no registered permission for hold release/expiry (F-08) |

## 7. E2 — `HELD → RESERVED`

| Field | Value |
|---|---|
| Actor | `field.agent`, `sales.agent`, `sales.manager`, `director`, `ceo` |
| Permission | `reservation.create` — registered; deposit capture uses `receipt.record` — registered (sales.agent YES "deposit at reservation") |
| Tenant | tenant/organization scope; Unit/project resource scope |
| Preconditions | an active, unexpired, un-released hold or an eligible Unit; caller authorized; no competing active reservation has won; commercial terms snapshot-able; transaction can establish the invariant atomically |
| Invariant | INV-UR-001 single active reservation winner; reservation snapshot immutability (ADR-0032 rule 5) |
| Command | `create_reservation` / hold conversion (ACT-008; status OPEN) |
| Consistency boundary | the Unit; reservation persistence and the Unit commercial consequence commit atomically (ADR-0034 §8) |
| Concurrency | application pre-checks insufficient; one winner under contention (ADR-0034 §2) |
| Idempotency | same key + same command → same result; same key + different command → deterministic conflict |
| Resulting state | Unit commercial = `RESERVED`; reservation becomes its own authoritative record |
| Event | `apartment.reserved` (registered, Inventory) and `reservation.created` (registered, Sales) |
| Audit | reservation creation/rejection with actor, org, resource, policy, correlation/idempotency, timestamps |
| Failure/retry | failed attempt leaves no second winner, no false `RESERVED` projection, no orphaned side effect |
| Acceptance evidence | RACE-01…07, RACE-12, RACE-14, RACE-16; RESERVATION-CONSISTENCY adversarial matrix |
| **Status** | **BLOCKED-ON-F-06** |

### 7.1 Reconciliation hypothesis for the `HELD → RESERVED` trigger (ENGINEERING-DERIVATION)

The register and the ADR set can be read as compatible rather than contradictory,
and this reading is offered for conference ratification:

- register `apartment.commercial_status` moves `HELD → RESERVED` on
  `deposit.recorded`;
- register `reservation.status` (B.6) contains `DRAFT → PENDING_DEPOSIT → ACTIVE`,
  i.e. deposit capture is an internal stage of the reservation lifecycle;
- ADR-0034 requires that exactly one reservation wins the Unit boundary.

A single reading that satisfies all three is: the reservation record is created
and wins the Unit boundary first (internally `DRAFT`/`PENDING_DEPOSIT`), and the
Unit's commercial status becomes `RESERVED` when the deposit is recorded
(`ACTIVE`). Under that reading `deposit.recorded` is the projection trigger, not
the winner-determination event.

This hypothesis is `ENGINEERING-DERIVATION`. It is **not** a decision and does
not close F-06. It requires a superseding ADR from the Engineering Conference.

## 8. E3 — `RESERVED → CONTRACTED`

| Field | Value |
|---|---|
| Actor | `sales.agent`, `sales.manager`, `director`, `ceo` |
| Permission | `contract.generate` — registered; `contract.read` — registered. **GAP:** no registered key for contract signature/execution |
| Tenant | tenant/organization scope; contract/Unit resource scope |
| Preconditions | an approved reservation exists — SoT §9 invariant 6: "Contract requires an approved Reservation"; contract reaches the contractual state required by policy |
| Invariant | contract is a separate aggregate/lifecycle (ADR-0033); `CONTRACTED` does not imply `SOLD`, and neither implies construction delivery (ADR-0031 rule 3/4) |
| Command | `prepare_contract` (ACT-010) plus the contract-execution command — the latter is not in the action inventory |
| Consistency boundary | contract aggregate; Unit commercial consequence committed atomically with the contract state change |
| Concurrency | must not permit a second Unit commitment; must not release or re-win an existing reservation |
| Idempotency | required for externally retried contract-execution commands |
| Resulting state | Unit commercial = `CONTRACTED` |
| Event | `contract.signed` (registered, Sales); `apartment.contracted` (registered, Inventory) |
| Audit | actor, org, resource, policy, correlation, timestamps, contract identity |
| Failure/retry | no partial contract; no `CONTRACTED` projection without a committed contract fact |
| Acceptance evidence | INVENTORY-LIFECYCLE-CONTRACT acceptance 6; RACE-10 |
| **Status** | **BLOCKED-ON-F-06** (and on the missing execution permission key) |

## 9. E4 — `RESERVED → CANCELLED / RELEASED`

| Field | Value |
|---|---|
| Actor | `sales.agent` (request), `sales.manager`, `director`, `ceo`; expiry/release additionally requires a system actor |
| Permission | `reservation.cancel` — registered (sales.agent = REQUEST, sales.manager = YES, ceo = YES). **GAP:** no registered key for reservation release or expiry, hold release/expiry, `apartment.release`, `apartment.unblock`, `apartment.off_market` |
| Tenant | tenant/organization scope; Unit/project resource scope |
| Preconditions | an active reservation exists; cancellation is policy-permitted; the acting identity matches the reservation's authority; expiry is conditional on the reservation identity/version that created the obligation |
| Invariant | a stale job must never release a newer reservation (`expire(R_old)` only if `active_reservation == R_old`); contracted/sold inventory is never released by a listing or cache |
| Command | `release_reservation` (ACT-009, OPEN); reservation cancel/expire commands |
| Consistency boundary | the Unit; the release and the Unit availability consequence commit atomically |
| Concurrency | release racing a new reservation must not produce a double winner or a stale release (RACE-06, RACE-07) |
| Idempotency | required — repeated release must not produce duplicate business effects |
| Resulting state | reservation terminal; Unit commercial returns to availability **via the governed path** |
| Event | `reservation.cancelled` (registered, Sales); `apartment.released` (registered, Inventory); `hold.expired` / `hold.released` (registered, Inventory) |
| Audit | actor or system identity, reason, org, resource, correlation, timestamps |
| Failure/retry | no partial release; no release of a newer reservation; deterministic conflict on a stale version |
| Acceptance evidence | RACE-06, RACE-07, RACE-14; RESERVATION-CONSISTENCY adversarial matrix |
| **Status** | **BLOCKED-ON-F-06** (permission gap + release-path conflict below) |

### 9.1 Release-path reconciliation (OPEN — authority required)

The register models release as two hops: `RESERVED → CANCELLED` on
`reservation.cancelled`, then `CANCELLED → AVAILABLE` on `apartment.released`.
`ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md` states `RESERVED → AVAILABLE` as an
allowed transition.

These are not equivalent: a two-hop model creates an intermediate `CANCELLED`
commercial state, while a one-hop model returns directly to `AVAILABLE`. This is
part of F-06 and is **not** resolved here.

## 10. E5 — Price change during an active hold or reservation

| Field | Value |
|---|---|
| Actor | `sales.manager` (2–5% approve), `director` (> 5% approve), `ceo` (any, audited); see `apartment.price.override` |
| Permission | `apartment.price.override` — registered with approval thresholds; **GAP:** no distinct key for scheduling a future price or for retroactive correction |
| Tenant | tenant/organization scope; resource scope |
| Preconditions | caller authorized for price mutation; approval obtained where the threshold requires it; effective period does not overlap an existing active version |
| Invariant | price is a versioned commercial fact, never a mutable scalar (ADR-0032); a committed snapshot is immutable; a price change never performs a commercial state transition (ADR-0033 invariant 6) |
| Command | create/schedule/override price (not present in the action inventory — see gap G-6) |
| Consistency boundary | the price version itself; **not** the Unit commitment |
| Concurrency | two overlapping active versions must be rejected by the final persistence design (PRICING-VERSIONING acceptance 8) |
| Idempotency | required for retried price commands |
| Resulting state | a new price version exists; **no change** to Unit commercial state; active hold/reservation snapshots unchanged |
| Event | `apartment.price_changed` — registered (Inventory). This is the registered equivalent of the `PriceUpdated` name used by ADR-0032 |
| Audit | actor, approval reference, resource, prior/new version, effective period, reason, correlation |
| Failure/retry | unauthorized or unapproved change rejected; failed change leaves the prior version authoritative |
| Acceptance evidence | PRICING-VERSIONING acceptance 1–10 |
| **Status** | contract semantics sufficient; permission-key gaps remain (F-08) |

## 11. E6 — Structural Unit amendment during an active commitment

| Field | Value |
|---|---|
| Actor | `sales.manager` (BRANCH), `director`, `ceo` |
| Permission | `apartment.update` — registered (BRANCH for sales.manager; ORG for director/ceo) |
| Tenant | tenant/organization scope; resource scope |
| Preconditions | identity is immutable (ADR-0024 §2.5); the amendment does not alter the commercial or construction state dimension; the amendment is not silently absorbed into a commitment snapshot |
| Invariant | structural mutation must not release, cancel, re-price or re-win an active commitment; structural archive/detach does not imply inventory release or financial reversal (C03-D07) |
| Command | structural amendment command — **not present** in the action inventory |
| Consistency boundary | the Unit structural record; never the commitment |
| Concurrency | an amendment concurrent with a commitment command must not corrupt either; deterministic outcome required |
| Idempotency | required for retried structural commands |
| Resulting state | Unit structural attributes changed; commercial state unchanged; commitment unchanged |
| Event | **GAP:** the canonical event register has no structural-amendment event (no `apartment.updated`) |
| Audit | actor, before/after structural facts, org, resource, reason, correlation |
| Failure/retry | amendment rejected if it would invalidate an active commitment; no partial structural mutation |
| Acceptance evidence | ADR-0031 rules 5–6; C03 artifact 19; new tests required |
| **Status** | OPEN — no registered event; policy for structural amendment under commitment undefined |

## 12. Cross-edge invariants

1. **Single winner.** For any exclusively allocatable Unit, at most one active
   commercial control path (hold or reservation) may win at any instant.
2. **Atomic consequence.** A reservation/contract state change and its Unit
   commercial consequence commit in one transaction boundary.
3. **Outbox after commit.** Externally observed lifecycle events are emitted from
   committed state through the transactional outbox, never as pre-commit side
   effects.
4. **No projection authority.** Cache, search, public website, partner portal,
   analytics and AI read models can never win a race or create availability.
5. **No direct status setters.** Commercial and construction transitions occur
   only through governed commands.
6. **Tenant isolation.** Tenant/organization/resource authorization is evaluated
   before every mutation; AI/automation inherits caller authority and cannot
   escalate it.
7. **Audit completeness.** Every material transition carries actor, org,
   resource, policy, correlation/idempotency and timestamps.
8. **Snapshot immutability.** Later price or structural changes never rewrite a
   committed commercial snapshot.

## 13. Register gaps and required decisions

| ID | Gap | Type | Owner | Blocks |
|---|---|---|---|---|
| G-1 | Commercial state enum and release path disagree between register and contracts (F-06) | CONFLICT — authority required | Engineering Conference | E2, E3, E4 |
| G-2 | Hold expiry policy/duration undefined; no registered permission for hold release/expiry | FOUNDER-DECISION-REQUIRED (commercial policy) + register gap | Founder / Security-Tenancy | E1, E2 |
| G-3 | Deposit ↔ reservation semantics; who may confirm and what approval authority applies | FOUNDER-DECISION-REQUIRED (commercial) | Founder | E2 |
| G-4 | No registered permission for reservation release/expiry, `apartment.release`, `apartment.unblock`, `apartment.off_market`, contract execution | Register gap | Security/Tenancy | E3, E4 |
| G-5 | Reservation lifecycle events used by the consistency contract are not in the 103-event register (F-07) | Contract-register drift | Domain Architecture | E2, E4 |
| G-6 | Price mutation and structural amendment commands are absent from the action inventory; no structural-amendment event | Register gap | Domain Architecture | E5, E6 |
| G-7 | Brownfield persistence identity and existing Unit/Reservation representation unverified | EVIDENCE BLOCKED | GATE-00 / GATE-03 | all edges |
| G-8 | Concrete transaction/isolation/constraint mechanism not selected | OPEN (deliberate) | GATE-03 | all edges |

G-2, G-3 and the F-06 resolution are **not** engineering-derivable. They are
recorded as founder/authority decisions rather than inferred.

## 14. Acceptance evidence requirements

Before any edge may be marked implementation-ready, the following must exist:

1. the edge's field set fully populated from authoritative sources (no `GAP`);
2. the applicable RACE-01…16 scenario executed against authoritative persistence;
3. the emitted outbox record observed for each committed transition;
4. the rejected/loser path observed producing no false state and no false event;
5. the audit record observed with actor, org, resource, policy, correlation and
   timestamps;
6. cross-tenant attempts denied;
7. the register entry for every event and permission referenced by the edge.

A green unit-test suite without concurrent integration evidence is insufficient
(`ASAS-RESERVATION-RACE-TEST-MATRIX-2026.md` closure rule).

## 15. Closure position

| Item | Position |
|---|---|
| C03 blockers B1 (Apartment ↔ Unit identity) | unaffected by this artifact; still OPEN |
| C03 blocker B2 (Unit ↔ Inventory ownership) | boundary position confirmed; aggregate/persistence still OPEN |
| C03 blocker B3 (commercial status ↔ availability) | mapping expressed as governed edges; exact mapping BLOCKED-ON-F-06 |
| C03 blocker B4 (hold/reservation concurrency) | **narrowed** — edge-level contract shape now exists; mechanism selection and expiry policy still OPEN |
| C03 blocker B5 (pricing commitment) | **narrowed** — snapshot/commit semantics mapped to ADR-0032 and the registered event; approval/key gaps remain |
| C03 status | remains **OPEN / BLOCKED** |
| Independent review prerequisite | **not satisfied** by this artifact |

**No schema, ORM, migration, RLS or production API is authorized by this
artifact.**

## 16. Next work unit after this artifact

1. Resolve F-06 by superseding ADR (commercial state enum + release path).
2. Founder decisions G-2 and G-3 (hold expiry, deposit semantics/approval).
3. Reconcile G-4 and G-5 register gaps against `registers/permissions.csv` and
   `registers/events.json`.
4. Only then select the concrete concurrency mechanism under GATE-03.


