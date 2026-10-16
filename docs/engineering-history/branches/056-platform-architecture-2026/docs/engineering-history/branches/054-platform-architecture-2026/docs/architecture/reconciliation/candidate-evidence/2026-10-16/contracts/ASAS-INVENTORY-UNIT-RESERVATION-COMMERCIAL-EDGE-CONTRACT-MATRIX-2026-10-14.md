# ASAS — Inventory / Unit / Reservation Commercial Edge Contract Matrix 2026-10-14

> **CANONICALIZATION NOTICE (2026-10-16):** This is preserved from source branch `cline/hp1c6fdq` as candidate evidence for review. Any source-branch `ACCEPTED` labels, claimed delegation, and “finding closed” statements are not independent proof of canonical approval. This archive does not ratify the decision, close a gate/C-track, authorize implementation, or permit schema/migration/RLS/production changes.


**Artifact ID:** `ASAS-CONTRACT-C03-COMMERCIAL-EDGE-MATRIX-2026-001`
**Status:** PROPOSED CANDIDATE MATRIX — semantic dependencies not yet ratified on the canonical branch; implementation blocked
**Authority:** Architecture/contract engineering only. Authorizes no schema,
ORM, migration, RLS or production API.
**Conference:** C03 → GATE-03
**Source branch:** `cline/hp1c6fdq` — source-branch assertion, not canonical acceptance
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
| `adr/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md` | canonical state dimensions, release path, mandatory HELD waypoint, event semantics |
| `adr/ADR-0039-UNIT-APARTMENT-CANONICAL-IDENTITY-2026-10-14.md` | Unit/Apartment identity equivalence |
| `adr/ADR-0040-INVENTORY-AVAILABILITY-OWNERSHIP-2026-10-14.md` | availability ownership; no separate Inventory entity |
| `contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` | hold identity and conditional expiry |
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

## 4. Resolution notice — F-06 is closed by ADR-0038

When this matrix was first authored, the canonical state-machine register and the
accepted ADR/contract set disagreed on the commercial state enum, the
`HELD → RESERVED` trigger and the release path (integrity finding F-06). The
matrix was therefore written resolution-neutral and its disputed edges were
marked `BLOCKED-ON-F-06`.

**That conflict is now resolved by `ADR-0038`**, which:

1. adopts the register's nine commercial states as canonical;
2. makes the release path two-hop (`RESERVED → CANCELLED → AVAILABLE`);
3. makes `HELD` a mandatory commercial waypoint;
4. fixes `deposit.recorded` as the `HELD → RESERVED` trigger with the reservation
   record as single-winner authority;
5. withdraws the divergent reservation state list;
6. maps every transition to a registered event without editing any register.

This matrix is consequently re-expressed in terms of the **nine** canonical
states. Edges are no longer `BLOCKED-ON-F-06`; what remains open per edge is
recorded explicitly as permission gaps, founder policy decisions, or brownfield
evidence.

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
| Open | hold expiry is now contracted (`ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` §4); the permission key `apartment.hold.release` and system-principal expiry authority remain a register gap (F-08) |

## 7. E2 — `HELD → RESERVED`

| Field | Value |
|---|---|
| Actor | `field.agent`, `sales.agent`, `sales.manager`, `director`, `ceo` |
| Permission | `reservation.create` — registered; deposit capture uses `receipt.record` — registered (sales.agent YES "deposit at reservation") |
| Tenant | tenant/organization scope; Unit/project resource scope |
| Preconditions | **the Unit is in `HELD` with an active hold — the mandatory commercial waypoint (`ADR-0038` Decision 6)**; caller authorized; no competing active reservation has won; commercial terms snapshot-able; transaction can establish the invariant atomically |
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
| **Status** | SEMANTIC CLOSED — decision-backed (`ADR-0038` Decisions 6 and 7); deposit semantics and approval authority remain `FOUNDER-DECISION-REQUIRED` |

### 7.1 Resolution of the `HELD → RESERVED` trigger (decided by ADR-0038)

The register and the ADR set were reconciled rather than left in tension, and the
reconciliation is now a decision rather than a hypothesis:

- the register moves `apartment.commercial_status` `HELD → RESERVED` on
  `deposit.recorded`;
- register `reservation.status` (B.6) places deposit capture inside the
  reservation lifecycle (`DRAFT → PENDING_DEPOSIT → ACTIVE`);
- `ADR-0034` requires exactly one reservation to win the Unit boundary.

`ADR-0038` Decision 7 resolves all three simultaneously: the reservation record is
created first and wins the Unit boundary (internally `DRAFT`/`PENDING_DEPOSIT`,
Unit still `HELD`), and the Unit's commercial status becomes `RESERVED` when the
deposit is recorded. `deposit.recorded` is therefore the **projection trigger**,
not the winner-determination event, and the reservation record remains the
single-winner authority.

The earlier `ENGINEERING-DERIVATION` label on this reading has been replaced by
`ADR-0038` Decision 7.

### 7.2 Mandatory hold waypoint (decided by ADR-0038 Decision 6)

Because the register contains no `AVAILABLE → RESERVED` edge, this edge can only
be reached from `HELD`. A reservation attempt on an `AVAILABLE` Unit must first
establish a hold; the `apartment.held` fact is recorded even when a single
user-facing action composes both steps.

### 7.3 The window between reservation creation and deposit

While a reservation exists and the Unit is still `HELD`, the hold must not be
allowed to expire. The conditional-expiry rule is normative in
`ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` §4:

```text
expire(H) only if H is the active hold
          and no active reservation references the Unit
```

Without it, `hold.expired` would release a Unit whose reservation is awaiting
deposit — a double-booking path that the register's transition table implies but
no prior contract stated.

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
| **Status** | SEMANTIC CLOSED — decision-backed; permission key `contract.sign` (P-9) remains a register gap |

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
| **Status** | SEMANTIC CLOSED — two-hop release decided by `ADR-0038` Decision 4; permission keys P-2/P-4/P-7 and system-expiry authority remain register gaps |

### 9.1 Release path is two-hop (decided by ADR-0038 Decision 4)

The register models release as two hops: `RESERVED → CANCELLED` on
`reservation.cancelled`, then `CANCELLED → AVAILABLE` on `apartment.released`.
`ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md` asserted a direct
`RESERVED → AVAILABLE`; that assertion is **withdrawn**.

`ADR-0038` Decision 4 prohibits direct release because the `CANCELLED`
intermediate is the only representation of the cooling period that register B.6
requires before a Unit returns to `AVAILABLE`.

Consequently this edge is **two governed transitions**, each with its own actor,
precondition and event:

| Transition | Trigger event | Permission |
|---|---|---|
| `RESERVED → CANCELLED` | `reservation.cancelled` | `reservation.cancel` (registered) |
| `CANCELLED → AVAILABLE` | `apartment.released` | `apartment.release` (proposed P-7) |

**State-dependent cancellation.** A reservation cancelled *before* the deposit was
recorded leaves the Unit in `HELD`, not `RESERVED`, and returns it by
`HELD → AVAILABLE` on `hold.released`. The `CANCELLED` path applies only once the
Unit actually reached `RESERVED`. Using the `CANCELLED` path for a pre-deposit
cancellation would fabricate a state the Unit never occupied.

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
| **Status** | SEMANTIC CLOSED — `ADR-0032` unaffected by `ADR-0038`; identity settled by `ADR-0039`; permission-key gaps remain (F-08) |

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
| **Status** | PARTIAL — identity immutability and dimension independence are decided (`ADR-0039`, `ADR-0038`); no registered structural-amendment event exists and none is invented; policy for amendment during an active commitment remains OPEN |

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

| ID | Gap | Type | Owner | Blocks | State |
|---|---|---|---|---|---|
| G-1 | Commercial state enum and release path disagreed between register and contracts (F-06) | CONFLICT — authority required | Engineering Conference | E2, E3, E4 | **CLOSED by `ADR-0038`** |
| G-2 | Hold expiry policy/duration undefined; no registered permission for hold release/expiry | FOUNDER-DECISION-REQUIRED (commercial policy) + register gap | Founder / Security-Tenancy | E1, E2 | OPEN — expiry semantics contracted; duration and keys still open (G-14, P-2) |
| G-3 | Deposit ↔ reservation semantics; who may confirm and what approval authority applies | FOUNDER-DECISION-REQUIRED (commercial) | Founder | E2 | OPEN |
| G-4 | No registered permission for reservation release/expiry, `apartment.release`, `apartment.block/unblock/off_market`, contract execution | Register gap | Security/Tenancy | E3, E4 | OPEN — exact deltas specified in the register-delta record |
| G-5 | Reservation lifecycle events used by the consistency contract are not in the 103-event register (F-07) | Contract-register drift | Domain Architecture | E2, E4 | **CLOSED — zero register edits; contract names map to registered events (`ADR-0038` §11)** |
| G-6 | Price mutation and structural amendment commands are absent from the action inventory; no structural-amendment event | Register gap | Domain Architecture | E5, E6 | OPEN |
| G-7 | Brownfield persistence identity and existing Unit/Reservation representation unverified | EVIDENCE BLOCKED | GATE-00 / GATE-03 | all edges | OPEN |
| G-8 | Concrete transaction/isolation/constraint mechanism not selected | OPEN (deliberate) | GATE-03 | all edges | OPEN |
| G-9 | Construction milestone scope (building vs unit) | OPEN | GATE-02/03 | E-construction | OPEN |
| G-13 | Whether the hold obligation is a persisted record | OPEN | GATE-03 | E1, E2 | OPEN |
| G-18 | Permission keys for hold release and expiry | Register gap | Security/Tenancy | E1, E2 | OPEN |

G-2, G-3 and the founder policy items are **not** engineering-derivable. They are
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
| C03 blocker B1 (Apartment ↔ Unit identity) | **CLOSED** by `ADR-0039` — identity equivalence adopted |
| C03 blocker B2 (Unit ↔ Inventory ownership) | **CLOSED** by `ADR-0040` — no separate Inventory entity; Unit owns availability |
| C03 blocker B3 (commercial status ↔ availability) | **DISSOLVED** by `ADR-0040` — availability *is* the Unit commercial dimension; there was no second concept to map |
| C03 blocker B4 (hold/reservation concurrency) | SEMANTIC CLOSED — HELD waypoint, deposit trigger, conditional hold expiry and state-dependent cancellation decided (`ADR-0038`, hold contract). Mechanism selection and race evidence still OPEN |
| C03 blocker B5 (pricing commitment) | SEMANTIC CLOSED — snapshot/commit semantics unchanged (`ADR-0032`); approval/key gaps remain |
| C03 status | remains **OPEN / BLOCKED** — brownfield evidence, permission ratification, founder policy values and independent review remain |
| Independent review prerequisite | **not satisfied** by this artifact |

**No schema, ORM, migration, RLS or production API is authorized by this
artifact.**

## 16. Next work unit after this artifact

1. **Register delta ratification** (F-08) — the exact permission deltas and the
   system-principal authority gap, per
   `reconciliation/ASAS-REGISTER-DELTA-2026-10-14.md`.
2. **Founder policy values** — hold duration (G-14), price protection during hold
   (G-15), deposit semantics and approval authority (G-3), exceptional-hold
   approval (G-16).
3. **Brownfield evidence** — runtime identity and existing Unit/Reservation/Hold
   representation (G-7), the last hard blocker for the mechanism decision.
4. **Then** select the concrete transaction/isolation/constraint mechanism and
   execute RACE-01…16 plus HOLD-01…12 under GATE-03.
5. **Independent review** — the C03 closure prerequisite that this authoring
   stream cannot satisfy.


