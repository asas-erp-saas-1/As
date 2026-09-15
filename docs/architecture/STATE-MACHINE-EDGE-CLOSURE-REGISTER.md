# ASAS — State-Machine Edge Closure Register

**Status:** DESIGN / HANDOFF — canonical edge closure audit.
**Date:** 2026-09-15
**Authority:** Blueprint Appendix B / `registers/state-machines.json`. Where the currently available canonical material does not expose an exhaustive edge, the edge is marked `OPEN` rather than inferred.

## 1. Purpose

This register closes the gap between having named state machines and having implementation-safe transition contracts. It distinguishes:

- `CLOSED` — exact edge is explicitly supported by the authoritative material available to the project;
- `OPEN` — the state machine or exception semantics are named, but the exact legal edge/trigger/precondition is not sufficiently authoritative yet;
- `DERIVED` — a relationship is structurally implied but must not be treated as canonical until the register is confirmed.

Only `CLOSED` edges may be implemented as canonical business transitions without further contract closure.

## 2. Universal transition envelope

Every edge must execute:

`authorize → validate preconditions → execute legal edge → persist state → append audit → append required outbox event → commit`

The aggregate state is an outcome of the legal edge. No generic `setStatus()` operation is allowed.

## 3. B.1 — Apartment commercial status

States:
`DRAFT, AVAILABLE, HELD, RESERVED, CONTRACTED, SOLD, BLOCKED, OFF_MARKET, CANCELLED`

| From | To | Trigger | Status |
|---|---|---|---|
| DRAFT | AVAILABLE | `apartment.published` | CLOSED |
| AVAILABLE | HELD | `apartment.held` | CLOSED |
| HELD | RESERVED | `deposit.recorded` | CLOSED |
| HELD | AVAILABLE | `hold.expired` / `hold.released` | CLOSED |
| RESERVED | CONTRACTED | `contract.signed` | CLOSED |
| RESERVED | CANCELLED | `reservation.cancelled` | CLOSED |
| CONTRACTED | SOLD | `apartment.sold` | CLOSED |
| CONTRACTED | CANCELLED | `contract.terminated` | CLOSED |
| CANCELLED | AVAILABLE | `apartment.released` | CLOSED |
| AVAILABLE | BLOCKED | `apartment.blocked` | CLOSED |
| BLOCKED | AVAILABLE | `apartment.unblocked` | CLOSED |
| AVAILABLE | OFF_MARKET | `apartment.off_marketed` | CLOSED |
| OFF_MARKET | AVAILABLE | `apartment.back_on_market` | CLOSED |

Implementation note: B.1 and B.2 are orthogonal. A commercial transition must not alter construction status.

## 4. B.2 — Apartment construction status

States:
`NOT_STARTED, IN_CONSTRUCTION, STRUCTURE_COMPLETE, FINISHING, DELIVERY_READY, DELIVERED`

Authoritative material confirms a forward chain and milestone certification semantics, but the exact registered edge/trigger graph is not exposed in the current project contract with sufficient precision for safe canonical implementation.

| From | To | Trigger | Status |
|---|---|---|---|
| NOT_STARTED | IN_CONSTRUCTION | `milestone.certified` family / exact trigger OPEN | OPEN |
| IN_CONSTRUCTION | STRUCTURE_COMPLETE | `milestone.certified` family / exact trigger OPEN | OPEN |
| STRUCTURE_COMPLETE | FINISHING | `milestone.certified` family / exact trigger OPEN | OPEN |
| FINISHING | DELIVERY_READY | `milestone.certified` family / exact trigger OPEN | OPEN |
| DELIVERY_READY | DELIVERED | `milestone.certified` family / exact trigger OPEN | OPEN |
| any | prior state | director-approved change-order semantics | OPEN |

Do not implement these rows as canonical until the exact register entry is verified. Regression is explicitly not a normal API transition.

## 5. B.3 — Lead lifecycle

States:
`NEW, CONTACTED, QUALIFIED, OPPORTUNITY, CUSTOMER, UNQUALIFIED, BAD_TIMING`

The authoritative contract confirms a forward lifecycle and terminal outcomes, but the exact edge list is not sufficiently exposed here.

| From | To | Trigger | Status |
|---|---|---|---|
| NEW | CONTACTED | contact action / exact command OPEN | OPEN |
| CONTACTED | QUALIFIED | qualification / exact command OPEN | OPEN |
| QUALIFIED | OPPORTUNITY | promotion / exact command OPEN | OPEN |
| OPPORTUNITY | CUSTOMER | conversion / exact command OPEN | OPEN |
| any eligible open state | UNQUALIFIED | disqualification / exact command OPEN | OPEN |
| any eligible open state | BAD_TIMING | timing classification / exact command OPEN | OPEN |
| terminal state | prior state | — | NOT AUTHORIZED |

Important: B.3 must not be implemented from UI labels alone.

## 6. B.4 — Lead working state

States:
`NEW, ATTEMPTED_TO_CONTACT, CONNECTED, WORKING, VISIT_SCHEDULED, UNREACHABLE, UNQUALIFIED, BAD_TIMING, RECYCLED`

Inbound engagement is documented as an automatic promotion to `CONNECTED`. The complete legal graph remains open.

| From | To | Trigger | Status |
|---|---|---|---|
| NEW | ATTEMPTED_TO_CONTACT | contact attempt / exact command OPEN | OPEN |
| ATTEMPTED_TO_CONTACT | CONNECTED | successful connection / exact command OPEN | OPEN |
| inbound lead engagement | CONNECTED | inbound engagement | CLOSED (behavioral rule) |
| CONNECTED | WORKING | work accepted / exact command OPEN | OPEN |
| WORKING | VISIT_SCHEDULED | appointment linkage / exact command OPEN | OPEN |
| eligible open state | UNREACHABLE | unreachable classification | OPEN |
| eligible open state | UNQUALIFIED | disqualification | OPEN |
| eligible open state | BAD_TIMING | timing classification | OPEN |
| eligible inactive state | RECYCLED | recycle action | OPEN |

B.4 must remain distinct from B.3; working-state transitions must not fabricate lifecycle transitions.

## 7. B.5 — Opportunity pipeline

States/probabilities:
`QUALIFIED 10, VISIT_SCHEDULED 20, VISIT_DONE 30, OFFER_SENT 50, NEGOTIATION 60, RESERVATION 80, CONTRACT 90, WON_PAID 100, LOST 0, WITHDRAWN 0`

Forward progression is canonical. `LOST` and `WITHDRAWN` require a reason. A sanctioned `OFFER_SENT → NEGOTIATION` or `QUALIFIED` regression is documented for offer expiry, audited and frees the hold.

| From | To | Trigger | Status |
|---|---|---|---|
| QUALIFIED | VISIT_SCHEDULED | visit scheduled | OPEN |
| VISIT_SCHEDULED | VISIT_DONE | visit completed | OPEN |
| VISIT_DONE | OFFER_SENT | offer submitted/sent | OPEN |
| OFFER_SENT | NEGOTIATION | negotiation / offer expiry recovery | CLOSED (sanctioned path exists) |
| OFFER_SENT | QUALIFIED | offer expiry recovery | CLOSED (sanctioned path exists) |
| NEGOTIATION | RESERVATION | reservation initiation | OPEN |
| RESERVATION | CONTRACT | contract progression | OPEN |
| CONTRACT | WON_PAID | paid/won condition | OPEN |
| eligible open stage | LOST | loss with mandatory reason | OPEN |
| eligible open stage | WITHDRAWN | withdrawal with mandatory reason | OPEN |

The exact complete edge graph and trigger command IDs require authoritative register closure before implementation.

## 8. B.6 — Reservation

States:
`DRAFT, PENDING_DEPOSIT, ACTIVE, CONVERTED, CANCELLED, REFUND_PROCESSING, CLOSED`

| From | To | Trigger / condition | Status |
|---|---|---|---|
| DRAFT | PENDING_DEPOSIT | unit is `HELD` | CLOSED |
| PENDING_DEPOSIT | ACTIVE | deposit recorded; unit becomes `RESERVED` | CLOSED |
| ACTIVE | CONVERTED | conversion | OPEN |
| ACTIVE | CANCELLED | cancellation | CLOSED |
| CANCELLED | REFUND_PROCESSING | refund required/requested | CLOSED |
| REFUND_PROCESSING | CLOSED | refund completed/closed | OPEN |
| PENDING_DEPOSIT | CANCELLED | expiry/auto-cancel approval flow | CLOSED |
| CANCELLED | AVAILABLE (unit) | 7-day cooling/release rule | CLOSED (cross-aggregate effect) |

Critical: reservation single-winner concurrency is a P0 database invariant. A legal state transition is insufficient if two transactions can win the same unit.

## 9. B.7 — Contract

States:
`DRAFT, GENERATED, SIGNED, NOTARIZED, ACTIVE, COMPLETED, TERMINATED, RESCINDED`

The canonical lifecycle is linear through preparation/signing/notarization/activation, followed by completion or terminal exception. Exact command/precondition edge definitions remain open.

| From | To | Trigger | Status |
|---|---|---|---|
| DRAFT | GENERATED | contract generation | CLOSED (sequence) |
| GENERATED | SIGNED | contract signed | CLOSED (sequence) |
| SIGNED | NOTARIZED | notarization | CLOSED (sequence) |
| NOTARIZED | ACTIVE | activation | CLOSED (sequence) |
| ACTIVE | COMPLETED | completion | CLOSED (sequence) |
| ACTIVE | TERMINATED | termination | CLOSED (sequence) |
| ACTIVE | RESCINDED | rescission | CLOSED (sequence) |

`Law 11-04` field validation is documented as a gate before GENERATED. Exact legal field set and exception paths remain OPEN.

## 10. B.8 — Payment schedule item

States:
`PENDING, DUE, INVOICED, PARTIALLY_PAID, PAID, OVERDUE, WAIVED, CANCELLED`

| From | To | Trigger | Status |
|---|---|---|---|
| PENDING | DUE | due date | CLOSED (sequence) |
| DUE | INVOICED | invoice action | CLOSED (sequence) |
| INVOICED | PARTIALLY_PAID | partial allocation/payment | CLOSED (sequence) |
| PARTIALLY_PAID | PAID | fully allocated | CLOSED (sequence) |
| DUE | OVERDUE | grace exceeded | CLOSED (sequence) |
| PARTIALLY_PAID | OVERDUE | grace exceeded | CLOSED (sequence) |
| any eligible state | WAIVED | approved waiver | CLOSED (governance rule) |
| any eligible state | CANCELLED | contract termination | CLOSED (governance rule) |

Important: schedule obligation, receipt and allocation are distinct financial facts. Never derive receipt truth by mutating schedule state alone.

## 11. B.9 — Approval request

States:
`PENDING, APPROVED, REJECTED, ESCALATED, EXPIRED, CANCELLED`

| From | To | Trigger | Status |
|---|---|---|---|
| PENDING | APPROVED | approval decision | CLOSED |
| PENDING | REJECTED | rejection decision | CLOSED |
| PENDING | ESCALATED | escalation | CLOSED |
| PENDING | EXPIRED | expiry | CLOSED |
| PENDING | CANCELLED | cancellation | CLOSED |

Approval decisions are append-only evidence. Approval state must not directly mutate an unrelated aggregate; the requesting flow resumes through its owning command.

Delegation, escalation thresholds, expiry duration and authority substitution remain OPEN where not explicitly registered.

## 12. B.10 — Studio page version

States:
`DRAFT, IN_REVIEW, PUBLISHED, ARCHIVED`

| From | To | Trigger | Status |
|---|---|---|---|
| DRAFT | IN_REVIEW | submit/review | CLOSED (sequence) |
| IN_REVIEW | PUBLISHED | publish | CLOSED (sequence) |
| PUBLISHED | ARCHIVED | archive/replacement | CLOSED (sequence) |

Rollback is not an in-place reverse edge: a prior version is published as a new governed version. Exact command/event mapping remains OPEN.

## 13. B.11 — Appointment

States:
`REQUESTED, CONFIRMED, IN_PROGRESS, COMPLETED, NO_SHOW, CANCELLED_BY_BUYER, CANCELLED_BY_AGENT, CANCELLED_BY_SYSTEM, RESCHEDULED`

| From | To | Trigger | Status |
|---|---|---|---|
| REQUESTED | CONFIRMED | agent acceptance or 15-minute auto-confirm | CLOSED |
| CONFIRMED | IN_PROGRESS | check-in | CLOSED |
| IN_PROGRESS | COMPLETED | completion | CLOSED |
| IN_PROGRESS | NO_SHOW | 15 minutes past start without check-in | CLOSED (timing rule) |
| CONFIRMED | CANCELLED_BY_BUYER | buyer cancellation + reason | CLOSED |
| CONFIRMED | CANCELLED_BY_AGENT | agent cancellation + reason | CLOSED |
| CONFIRMED | CANCELLED_BY_SYSTEM | system cancellation + reason | CLOSED |
| IN_PROGRESS | cancellation state | exact legal edge OPEN | OPEN |
| any eligible state | RESCHEDULED | reschedule | CLOSED (behavioral rule) |

Reschedule closes the current appointment as `RESCHEDULED` and creates a linked successor using `rescheduled_from_id`. External calendar state is a projection/integration concern; ASAS remains authoritative.

## 14. Closure rules

Before implementation of any machine, unresolved `OPEN` rows must be resolved from the authoritative register or explicitly approved founder/domain decision. A plausible edge is not a canonical edge.

For each closed edge, the final implementation contract must additionally record:

- command ID;
- actor class;
- permission;
- scope/ABAC;
- preconditions;
- reason requirement;
- idempotency rule;
- concurrency rule;
- transaction boundary;
- audit action;
- event ID/version;
- retry semantics;
- typed conflict/error code;
- terminal/reversible semantics;
- negative tests.

## 15. Stop-the-line conditions

Immediately stop the dependent implementation if:

- an illegal transition is accepted;
- a state mutation bypasses the transition service;
- reservation allows two winners;
- a transition changes a second lifecycle axis without an explicit contract;
- an approval decision mutates unrelated business state directly;
- a retry produces duplicate financial/commercial effects;
- public UX writes directly to state without canonical command authorization.
