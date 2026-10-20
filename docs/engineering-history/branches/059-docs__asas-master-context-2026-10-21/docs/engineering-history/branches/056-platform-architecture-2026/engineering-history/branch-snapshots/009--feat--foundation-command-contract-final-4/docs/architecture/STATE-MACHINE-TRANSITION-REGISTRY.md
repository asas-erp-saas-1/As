# ASAS — State-Machine Transition Registry

**Status:** PARTIAL — normalized from Blueprint v1.6.1 Appendix B / `state-machines.json`; no missing business semantics invented.
**Branch:** `feat/foundation-closure-pass-2`
**Source:** ASAS Real Estate OS — State Machine Register v1.6.1.

## Purpose

This registry converts the machine-readable state-machine descriptions into an implementation-facing transition table while preserving the distinction between:

- **SOURCE-CLOSED:** the authoritative register explicitly determines the edge;
- **NORMALIZED:** the register gives an unambiguous ordered chain and the registry expands that chain without adding new behavior;
- **OPEN:** the register does not specify enough semantics to define an implementation contract safely.

No implementation should infer missing authorization, reason codes, event IDs, timers, legal exceptions, or rollback behavior from this document.

## Universal transition contract

Per the authoritative register:

`authorize → validate preconditions → execute legal edge → persist state → append audit(actor, reason) → fire corresponding domain event`

Additional repository rules remain binding:

- no generic status setter;
- illegal transitions return a typed domain error;
- transitions are the only legal route to lifecycle-state mutation;
- registered dotted event IDs are canonical;
- where an event is not explicitly registered as the transition trigger, the trigger remains **OPEN** rather than being invented.

---

## B.1 — Apartment commercial status

**Aggregate:** `apartment.commercial_status`

| From | To | Trigger | Status |
|---|---|---|---|
| DRAFT | AVAILABLE | `apartment.published` | SOURCE-CLOSED |
| AVAILABLE | HELD | `apartment.held` | SOURCE-CLOSED |
| HELD | RESERVED | `deposit.recorded` | SOURCE-CLOSED |
| HELD | AVAILABLE | `hold.expired` OR `hold.released` | SOURCE-CLOSED |
| RESERVED | CONTRACTED | `contract.signed` | SOURCE-CLOSED |
| RESERVED | CANCELLED | `reservation.cancelled` | SOURCE-CLOSED; approved cancellation |
| CONTRACTED | SOLD | `apartment.sold` | SOURCE-CLOSED; final payment + handover confirmed |
| CONTRACTED | CANCELLED | `contract.terminated` | SOURCE-CLOSED; approved |
| CANCELLED | AVAILABLE | `apartment.released` | SOURCE-CLOSED; release timer after cooling period |
| AVAILABLE | BLOCKED | `apartment.blocked` | SOURCE-CLOSED; manual/audited |
| BLOCKED | AVAILABLE | `apartment.unblocked` | SOURCE-CLOSED; manual/audited |
| AVAILABLE | OFF_MARKET | `apartment.off_marketed` | SOURCE-CLOSED; manual/audited |
| OFF_MARKET | AVAILABLE | `apartment.back_on_market` | SOURCE-CLOSED; manual/audited |

**Normalization:** `apartment.sold` and `apartment.released` are the canonical registered event IDs. Descriptive phrases such as “final payment + handover confirmed” and “release timer” are conditions, not alternate event names.

---

## B.2 — Apartment construction status

**Aggregate:** `apartment.construction_status`

The source specifies a **linear forward chain**, driven by `milestone.certified` events per building, with regressions forbidden except by a director-approved change order.

| From | To | Trigger | Status |
|---|---|---|---|
| NOT_STARTED | IN_CONSTRUCTION | `milestone.certified` | NORMALIZED |
| IN_CONSTRUCTION | STRUCTURE_COMPLETE | `milestone.certified` | NORMALIZED |
| STRUCTURE_COMPLETE | FINISHING | `milestone.certified` | NORMALIZED |
| FINISHING | DELIVERY_READY | `milestone.certified` | NORMALIZED |
| DELIVERY_READY | DELIVERED | `milestone.certified` | NORMALIZED |

**OPEN:** exact milestone-to-edge mapping, aggregate/building propagation rules, and the complete exception/change-order semantics are not specified by the register. Do not invent them.

**Regression rule:** regressions are forbidden except by director-approved change order. The exact command, approval edge, resulting event, audit reason, and permitted target state remain **OPEN**.

---

## B.3 — Lead lifecycle

**Aggregate:** `lead.lifecycle_stage`

The source specifies a forward chain and two terminal states.

| From | To | Trigger | Status |
|---|---|---|---|
| NEW | CONTACTED | OPEN | NORMALIZED edge; trigger OPEN |
| CONTACTED | QUALIFIED | OPEN | NORMALIZED edge; trigger OPEN |
| QUALIFIED | OPPORTUNITY | OPEN | NORMALIZED edge; trigger OPEN |
| OPPORTUNITY | CUSTOMER | OPEN | NORMALIZED edge; trigger OPEN |
| NEW | UNQUALIFIED | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |
| CONTACTED | UNQUALIFIED | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |
| QUALIFIED | UNQUALIFIED | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |
| OPPORTUNITY | UNQUALIFIED | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |
| NEW | BAD_TIMING | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |
| CONTACTED | BAD_TIMING | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |
| QUALIFIED | BAD_TIMING | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |
| OPPORTUNITY | BAD_TIMING | OPEN | NORMALIZED terminal path; exact eligibility/trigger OPEN |

**Important:** “terminal UNQUALIFIED, BAD_TIMING” means these states have no forward lifecycle continuation in the source contract. It does not define whether a separate recycle/new-lead process may create a new lifecycle record.

**OPEN:** exact transition graph for terminal outcomes and canonical command/event triggers are not explicitly enumerated by the register.

---

## B.4 — Lead working status

**Aggregate:** `lead.working_status`

The source states only that the machine is **rep-controlled** and that **any inbound engagement auto-promotes to `CONNECTED`**.

States:
`NEW, ATTEMPTED_TO_CONTACT, CONNECTED, WORKING, VISIT_SCHEDULED, UNREACHABLE, UNQUALIFIED, BAD_TIMING, RECYCLED`

**OPEN — DO NOT INVENT:** the source does not enumerate the exact edge graph, terminal semantics, recycle semantics, reason requirements, or event/command mapping.

Required closure before implementation:

1. exact from/to edge set;
2. canonical commands;
3. event triggers;
4. inbound-engagement precedence when another transition is concurrently attempted;
5. terminal/recycle behavior;
6. authorization scope;
7. audit reason requirements;
8. concurrency/idempotency behavior.

---

## B.5 — Opportunity pipeline

**Aggregate:** `opportunity.stage`

The source gives the ordered forward chain:

`QUALIFIED → VISIT_SCHEDULED → VISIT_DONE → OFFER_SENT → NEGOTIATION → RESERVATION → CONTRACT → WON_PAID`

It also explicitly allows `LOST` / `WITHDRAWN` from any open stage and one sanctioned regression on offer expiry.

| From | To | Trigger | Status |
|---|---|---|---|
| QUALIFIED | VISIT_SCHEDULED | OPEN | NORMALIZED forward edge |
| VISIT_SCHEDULED | VISIT_DONE | OPEN | NORMALIZED forward edge |
| VISIT_DONE | OFFER_SENT | OPEN | NORMALIZED forward edge |
| OFFER_SENT | NEGOTIATION | OPEN | NORMALIZED forward edge |
| NEGOTIATION | RESERVATION | OPEN | NORMALIZED forward edge |
| RESERVATION | CONTRACT | OPEN | NORMALIZED forward edge |
| CONTRACT | WON_PAID | OPEN | NORMALIZED forward edge |
| OFFER_SENT | NEGOTIATION | `offer.expired` | SOURCE-CLOSED sanctioned regression |
| OFFER_SENT | QUALIFIED | `offer.expired` | SOURCE-CLOSED sanctioned regression |
| any open stage | LOST | OPEN | SOURCE-CLOSED reachability; reason mandatory |
| any open stage | WITHDRAWN | OPEN | SOURCE-CLOSED reachability; reason mandatory |

Probabilities are normative source data:

`QUALIFIED 10, VISIT_SCHEDULED 20, VISIT_DONE 30, OFFER_SENT 50, NEGOTIATION 60, RESERVATION 80, CONTRACT 90, WON_PAID 100, LOST 0, WITHDRAWN 0`.

**OPEN:** exact stage-entry exit criteria, canonical command/event trigger for each forward edge, and the precise behavior of `offer.expired` when no hold exists remain to be closed.

---

## B.6 — Reservation

**Aggregate:** `reservation.status`

The source specifies:

`DRAFT → PENDING_DEPOSIT → ACTIVE → CONVERTED | CANCELLED → REFUND_PROCESSING → CLOSED`

| From | To | Trigger | Status |
|---|---|---|---|
| DRAFT | PENDING_DEPOSIT | OPEN | NORMALIZED; unit must be HELD |
| PENDING_DEPOSIT | ACTIVE | `deposit.recorded` | NORMALIZED; unit becomes RESERVED |
| ACTIVE | CONVERTED | OPEN | NORMALIZED; to contract |
| ACTIVE | CANCELLED | OPEN | NORMALIZED; approved |
| CANCELLED | REFUND_PROCESSING | OPEN | NORMALIZED |
| REFUND_PROCESSING | CLOSED | OPEN | NORMALIZED |

Expiry rule:

- `PENDING_DEPOSIT` expiry triggers the auto-cancel approval flow.
- Unit returns to `AVAILABLE` through the apartment commercial-status machine after the **7-day cooling period**.

**OPEN:** exact command/event mapping for `DRAFT→PENDING_DEPOSIT`, `ACTIVE→CONVERTED`, cancellation, refund progression, and expiry approval is not specified in the state-machine register. Do not invent event IDs merely to complete the table.

**P0 concurrency:** reservation creation must guarantee one legal winner for a reservable unit.

---

## B.7 — Contract

**Aggregate:** `contract.status`

The source specifies:

`DRAFT → GENERATED → SIGNED → NOTARIZED → ACTIVE → COMPLETED | TERMINATED | RESCINDED`

| From | To | Trigger | Status |
|---|---|---|---|
| DRAFT | GENERATED | OPEN | NORMALIZED |
| GENERATED | SIGNED | OPEN | NORMALIZED |
| SIGNED | NOTARIZED | `contract.notarized` | NORMALIZED; registered event exists |
| NOTARIZED | ACTIVE | OPEN | NORMALIZED |
| ACTIVE | COMPLETED | OPEN | NORMALIZED |
| ACTIVE | TERMINATED | `contract.terminated` | NORMALIZED; registered event exists |
| ACTIVE | RESCINDED | OPEN | NORMALIZED |

**Legal gate:** Law 11-04 field validation gates `GENERATED`.

**OPEN:** exact command/trigger semantics for each edge, legal requirements beyond the generation gate, and whether `RESCINDED` is permitted from any other state are not specified.

---

## B.8 — Payment schedule item

**Aggregate:** `payment_schedule_item.status`

| From | To | Trigger | Status |
|---|---|---|---|
| PENDING | DUE | trigger fired | SOURCE-CLOSED edge; exact trigger OPEN |
| DUE | INVOICED | OPEN | NORMALIZED |
| INVOICED | PARTIALLY_PAID | OPEN | NORMALIZED |
| PARTIALLY_PAID | PAID | OPEN | NORMALIZED |
| DUE | OVERDUE | job after grace | SOURCE-CLOSED |
| PARTIALLY_PAID | OVERDUE | job after grace | SOURCE-CLOSED |
| any non-terminal applicable state | WAIVED | approved | SOURCE-CLOSED reachability; exact allowed source states OPEN |
| contract termination | CANCELLED | contract termination | SOURCE-CLOSED terminal condition; exact transition trigger OPEN |

**OPEN:** precise invoice/payment/allocation preconditions, grace-period value, waiver authority, and exact `CANCELLED` source-state set are not specified here.

---

## B.9 — Approval request

**Aggregate:** `approval_request.status`

| From | To | Trigger | Status |
|---|---|---|---|
| PENDING | APPROVED | decision | SOURCE-CLOSED |
| PENDING | REJECTED | decision | SOURCE-CLOSED |
| PENDING | ESCALATED | SLA | SOURCE-CLOSED |
| PENDING | EXPIRED | expiry | SOURCE-CLOSED |
| PENDING | CANCELLED | cancellation | SOURCE-CLOSED |

Decisions are append-only. `APPROVED` / `REJECTED` resume the requesting flow.

**OPEN:** exact command, decision authority, escalation chain, SLA duration, expiry behavior, cancellation authority, delegation semantics, and resumed-command linkage.

Note: `approval.delegated` is a registered event, but the state-machine register does not define a `DELEGATED` state. It must not be introduced as a state without an authoritative contract.

---

## B.10 — Studio page version

**Aggregate:** `studio_page_version.status`

| From | To | Trigger | Status |
|---|---|---|---|
| DRAFT | IN_REVIEW | OPEN | NORMALIZED |
| IN_REVIEW | PUBLISHED | `page.published` | NORMALIZED; registered event exists |
| PUBLISHED | ARCHIVED | superseded | SOURCE-CLOSED |

Rollback is **not** a status transition back to an older version. It is publication of a prior version as a **new version**.

**OPEN:** exact command/event semantics for draft/review/archive and the new-version linkage contract for rollback.

---

## B.11 — Appointment

**Aggregate:** `appointment.status`

| From | To | Trigger | Status |
|---|---|---|---|
| REQUESTED | CONFIRMED | agent accepts OR 15-minute auto-confirm | SOURCE-CLOSED |
| CONFIRMED | IN_PROGRESS | check-in | SOURCE-CLOSED |
| IN_PROGRESS | COMPLETED | outcome logged | SOURCE-CLOSED |
| IN_PROGRESS | NO_SHOW | 15 min past start without check-in | SOURCE-CLOSED |
| CONFIRMED | CANCELLED_BY_BUYER | cancellation | SOURCE-CLOSED; reason mandatory |
| CONFIRMED | CANCELLED_BY_AGENT | cancellation | SOURCE-CLOSED; reason mandatory |
| CONFIRMED | CANCELLED_BY_SYSTEM | cancellation | SOURCE-CLOSED; reason mandatory |
| IN_PROGRESS | CANCELLED_BY_BUYER | cancellation | SOURCE-CLOSED; reason mandatory |
| IN_PROGRESS | CANCELLED_BY_AGENT | cancellation | SOURCE-CLOSED; reason mandatory |
| IN_PROGRESS | CANCELLED_BY_SYSTEM | cancellation | SOURCE-CLOSED; reason mandatory |
| current appointment | RESCHEDULED | reschedule | SOURCE-CLOSED; successor required |

Rescheduling closes the current appointment as `RESCHEDULED` and creates a linked successor through `rescheduled_from_id`. Calendar behavior is a projection concern driven by registered `appointment.*` events.

**OPEN:** exact event trigger per cancellation actor, check-in command, outcome contract, auto-confirm scheduler semantics, successor uniqueness/concurrency, and exact reschedule event payload.

---

# Closure gates

The normalized edges above are **not** sufficient to mark the foundation GREEN. Before implementation of lifecycle mutations, the following must be closed:

1. exact canonical command registry;
2. command ↔ permission ↔ ABAC/approval mapping;
3. command ↔ state edge mapping;
4. state edge ↔ canonical event mapping;
5. preconditions/invariants per edge;
6. idempotency requirements and key derivation;
7. concurrency/race strategy;
8. transaction boundary;
9. audit reason/taxonomy;
10. outbox emission semantics;
11. failure/rollback behavior;
12. negative authorization tests;
13. timer/job semantics where referenced;
14. legal/compliance gates where referenced;
15. public/private projection implications.

**Rule:** an `OPEN` field blocks only the dependent implementation. Claude may continue unrelated READY work, consistent with the autonomous build contract.
