# ASAS — State-Edge Closure Register

**Status:** PARTIAL / SOURCE-OPEN where the v1.6.1 machine register is descriptive rather than edge-enumerated.
**Branch:** `feat/foundation-command-registry`
**Authority:** Blueprint v1.6.1 Appendix B / `02-HANDOFF/registers/state-machines.json`, with registered event IDs from Appendix C / `events.json`.

## Purpose

Freeze only state-transition semantics that the authoritative v1.6.1 register actually supports. No transition, command, event, threshold, SLA, or approval rule is invented here.

## Universal transition contract

Every lifecycle mutation must execute:

`authorize → validate preconditions → execute legal edge → persist state → append audit → append required outbox event → commit`

There is no generic status setter. Illegal transitions return typed domain errors.

## B.1 Apartment commercial status — CLOSED

| From | To | Trigger/event | Authority note |
|---|---|---|---|
| DRAFT | AVAILABLE | `apartment.published` | Normative |
| AVAILABLE | HELD | `apartment.held` | Hold/reservation pending deposit; expiry uses `hold_expires_at` |
| HELD | RESERVED | `deposit.recorded` | Deposit may accompany reservation creation or arrive within 48h |
| HELD | AVAILABLE | `hold.expired` / `hold.released` | Normative |
| RESERVED | CONTRACTED | `contract.signed` | Normative |
| RESERVED | CANCELLED | `reservation.cancelled` | Approved cancellation only |
| CONTRACTED | SOLD | `apartment.sold` | Final payment + handover confirmed; event is emitted by Finance/Handover |
| CONTRACTED | CANCELLED | `contract.terminated` | Approved |
| CANCELLED | AVAILABLE | `apartment.released` | Release timer job |
| AVAILABLE | BLOCKED | `apartment.blocked` | Manual, audited |
| BLOCKED | AVAILABLE | `apartment.unblocked` | Manual, audited |
| AVAILABLE | OFF_MARKET | `apartment.off_marketed` | Manual, audited |
| OFF_MARKET | AVAILABLE | `apartment.back_on_market` | Manual, audited |

## B.2 Apartment construction status — EDGE ORDER CLOSED; TRIGGER SEMANTICS SOURCE-OPEN

States: `NOT_STARTED → IN_CONSTRUCTION → STRUCTURE_COMPLETE → FINISHING → DELIVERY_READY → DELIVERED`.

The register explicitly defines a linear forward chain driven by `milestone.certified` events per building. Therefore the legal order is closed. The source does **not** enumerate which milestone instance maps to each individual edge, nor its exact command/authorization payload.

- No backward transition by normal API contract.
- Regression is forbidden except by director-approved change order.
- `change_order.approved` is the registered event associated with the exception path, but the source does not define a concrete regression edge. Do not invent one.

**OPEN:** exact milestone-to-edge mapping; change-order regression mechanics; director approval predicate.

## B.3 Lead lifecycle — EDGE ORDER CLOSED; EVENT/ERROR DETAILS SOURCE-OPEN

States: `NEW, CONTACTED, QUALIFIED, OPPORTUNITY, CUSTOMER, UNQUALIFIED, BAD_TIMING`.

Authoritative path:

`NEW → CONTACTED → QUALIFIED → OPPORTUNITY → CUSTOMER`

`UNQUALIFIED` and `BAD_TIMING` are terminal states.

The register says system-controlled and forward-only. Registered CRM events provide candidate business facts (`lead.contacted`, `lead.qualified`, `lead.promoted`, `lead.disqualified`, `lead.status_changed`), but the register does not specify a one-to-one event mapping for every edge.

**OPEN:** exact trigger/event per edge; preconditions for each promotion; typed error taxonomy.

## B.4 Lead working status — GRAPH SOURCE-OPEN

States: `NEW, ATTEMPTED_TO_CONTACT, CONNECTED, WORKING, VISIT_SCHEDULED, UNREACHABLE, UNQUALIFIED, BAD_TIMING, RECYCLED`.

The register specifies only that this track is rep-controlled and that inbound engagement auto-promotes to `CONNECTED`.

**OPEN — BLOCKING FOR COMMAND IMPLEMENTATION:** complete legal graph, terminal/re-entry rules, event mapping, reasons, and relationship with lifecycle track A. No graph is invented here.

## B.5 Opportunity pipeline — ORDER CLOSED; ENTRY/REGRESSION DETAILS SOURCE-OPEN

Forward order:

`QUALIFIED → VISIT_SCHEDULED → VISIT_DONE → OFFER_SENT → NEGOTIATION → RESERVATION → CONTRACT → WON_PAID`

Probabilities are normative register values: 10%, 20%, 30%, 50%, 60%, 80%, 90%, 100%; `LOST` and `WITHDRAWN` are 0%.

`LOST` / `WITHDRAWN` are reachable from any open stage and require a reason.

The one sanctioned regression is:

`OFFER_SENT → NEGOTIATION` or `QUALIFIED`

on offer expiry; it is audited and frees any hold.

**OPEN:** exact exit criteria/preconditions per stage, exact offer-expiry branch selection, trigger/event mapping per edge.

## B.6 Reservation — ORDER CLOSED; EXACT EDGE/EVENT PAIRING SOURCE-OPEN

Authoritative lifecycle order:

`DRAFT → PENDING_DEPOSIT → ACTIVE → CONVERTED`

or

`ACTIVE → CANCELLED → REFUND_PROCESSING → CLOSED`.

Additional invariant: expiry of `PENDING_DEPOSIT` triggers the auto-cancel approval flow. The unit returns to `AVAILABLE` through the apartment machine's `CANCELLED → AVAILABLE` path after the 7-day cooling period.

The register states that `PENDING_DEPOSIT` requires unit `HELD`, and `ACTIVE` follows deposit recording with unit `RESERVED`.

**OPEN:** exact reservation-status transition event mapping, auto-cancel command/approval edge, refund completion trigger, exact cross-aggregate transaction boundaries.

## B.7 Contract — ORDER CLOSED; LEGAL GATE DETAILS SOURCE-OPEN

`DRAFT → GENERATED → SIGNED → NOTARIZED → ACTIVE → COMPLETED`

or from `ACTIVE`:

`ACTIVE → TERMINATED | RESCINDED`.

`Law 11-04` field validation gates `GENERATED`.

Registered events include `contract.generated`, `contract.signed`, `contract.notarized`, `contract.terminated`.

**OPEN:** exact validation field set, command/event mapping for every edge, completion/rescission triggers and approval semantics.

## B.8 Payment schedule item — ORDER CLOSED; TIMING/INVOICE SEMANTICS SOURCE-OPEN

`PENDING → DUE → INVOICED → PARTIALLY_PAID → PAID`

`DUE | PARTIALLY_PAID → OVERDUE` after grace via job.

Any state may move to `WAIVED` when approved.

Contract termination drives terminal `CANCELLED`.

Registered finance events include `installment.due`, `installment.overdue`, and payment/receipt events, but the source does not define exact command/event mapping for every edge.

**OPEN:** due trigger, grace duration, invoice semantics, waiver authority, cancellation timing, event mapping.

## B.9 Approval request — ORDER CLOSED; POLICY DETAILS SOURCE-OPEN

`PENDING → APPROVED | REJECTED | ESCALATED | EXPIRED | CANCELLED`.

Decisions are append-only. `APPROVED` / `REJECTED` resume the requesting flow.

Registered events: `approval.requested`, `approval.granted`, `approval.rejected`, `approval.escalated`, `approval.delegated`.

Important: `approval.delegated` is an event, **not** a registered state. Do not add `DELEGATED` to the state enum.

**OPEN:** delegation semantics, SLA, expiry timing, escalation authority, cancellation rules, exact resume mechanism.

## B.10 Studio page version — CLOSED

`DRAFT → IN_REVIEW → PUBLISHED → ARCHIVED`.

Rollback is not an in-place reverse transition: publishing a prior version creates a new version.

The source additionally states the statuses are enum-backed in `asas-contracts.prisma`.

Registered Studio/Marketing events include `page.drafted`, `page.submitted`, `page.published`, `page.rolled_back`.

**OPEN:** exact command/event mapping and review authorization predicates.

## B.11 Appointment — ORDER CLOSED; GRAPH DETAILS SOURCE-OPEN

Core forward path:

`REQUESTED → CONFIRMED → IN_PROGRESS → COMPLETED`

or

`IN_PROGRESS → NO_SHOW` (15 minutes past start without check-in).

Cancellation from `CONFIRMED` or `IN_PROGRESS` may produce:
`CANCELLED_BY_BUYER | CANCELLED_BY_AGENT | CANCELLED_BY_SYSTEM`, with reason mandatory.

Reschedule closes the current appointment as `RESCHEDULED` and creates a linked successor through `rescheduled_from_id`. The chain is retained for the no-show story.

`CONFIRMED` occurs by agent acceptance or 15-minute auto-confirm.

Registered events: `appointment.requested`, `appointment.confirmed`, `appointment.rescheduled`, `appointment.cancelled`, `appointment.no_show`, `appointment.completed`.

**OPEN:** complete legal graph around reschedule/cancellation, exact auto-confirm timing implementation, check-in authority, cancellation actor policy, exact Google Calendar projection transaction/consistency semantics.

## Closure classification

| Machine | Status |
|---|---|
| B.1 | GREEN — exact registered edges closed |
| B.2 | AMBER — order closed, milestone edge payload open |
| B.3 | AMBER — order closed, event/precondition mapping open |
| B.4 | RED — legal graph not enumerated by source |
| B.5 | AMBER — order + sanctioned regression closed; entry criteria open |
| B.6 | AMBER — lifecycle order closed; cross-aggregate/event semantics open |
| B.7 | AMBER — lifecycle order closed; legal gate details open |
| B.8 | AMBER — lifecycle order closed; timing/policy details open |
| B.9 | AMBER — lifecycle order closed; approval policy details open |
| B.10 | GREEN — state semantics closed |
| B.11 | AMBER — principal lifecycle closed; complete graph/policy details open |

## Implementation gate

No executable command kernel should claim complete lifecycle coverage while any RED machine or any OPEN policy that materially changes authorization, money, legal effect, or cross-aggregate consistency remains unresolved.

The next closure pass must therefore focus on:

1. B.4 exact graph.
2. B.2/B.3/B.5/B.6/B.7/B.8/B.9/B.11 trigger and precondition closure.
3. Cross-aggregate transaction definitions for reservation, contract, finance, and appointment.
4. Only then: canonical command IDs and executable command registry.
