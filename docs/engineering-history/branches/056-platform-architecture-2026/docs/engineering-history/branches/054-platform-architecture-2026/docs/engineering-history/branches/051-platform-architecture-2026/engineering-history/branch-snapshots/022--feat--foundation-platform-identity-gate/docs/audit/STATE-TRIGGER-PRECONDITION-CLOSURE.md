# ASAS — State Trigger & Preconditions Closure Pass

**Status:** PARTIAL / SOURCE-OPEN
**Branch:** `feat/foundation-command-registry`
**Authority:** Blueprint v1.6.1 Appendix B/C and Chapters 13–21 as available through the authoritative package; registers remain normative where they enumerate exact values.

## Purpose

This pass closes the maximum trigger/precondition semantics supported by the authoritative material without manufacturing business law. It complements `STATE-EDGE-CLOSURE.md` and does not replace unresolved founder/product decisions.

The rule is:

`registered state edge + supported business fact → admissible trigger/precondition contract`

A candidate event is not automatically the legal trigger for an edge merely because its name appears plausible.

## 1. B.1 Apartment commercial status

B.1 is sufficiently closed for the registered edges already captured in `STATE-EDGE-CLOSURE.md`.

| Edge | Supported trigger | Minimum supported precondition | Closure |
|---|---|---|---|
| DRAFT → AVAILABLE | `apartment.published` | apartment is published through the governed publishing path | GREEN |
| AVAILABLE → HELD | `apartment.held` | unit is currently AVAILABLE; hold has expiry semantics | GREEN |
| HELD → RESERVED | `deposit.recorded` | unit is HELD; deposit is valid/recorded | GREEN at state level; cross-aggregate transaction OPEN |
| HELD → AVAILABLE | `hold.expired` / `hold.released` | active hold exists and expiry/release is authorized | GREEN at state level |
| RESERVED → CONTRACTED | `contract.signed` | reservation is RESERVED and contract is signed | GREEN at state level; contract transaction OPEN |
| RESERVED → CANCELLED | `reservation.cancelled` | approved cancellation | GREEN at state level |
| CONTRACTED → SOLD | `apartment.sold` | final payment + handover confirmed | GREEN at state level; Finance/Handover consistency OPEN |
| CONTRACTED → CANCELLED | `contract.terminated` | approved termination | GREEN at state level |
| CANCELLED → AVAILABLE | `apartment.released` | release timer/job condition | GREEN at state level |

No other B.1 edge may be inferred.

## 2. B.2 Apartment construction status

Registered legal order:

`NOT_STARTED → IN_CONSTRUCTION → STRUCTURE_COMPLETE → FINISHING → DELIVERY_READY → DELIVERED`

The authoritative source says the forward chain is driven by `milestone.certified` events per building.

Therefore:

- `milestone.certified` is an authoritative business fact relevant to B.2 progression.
- The source does **not** identify the exact milestone identity/payload that selects each edge.
- The source does **not** define the command/approval predicate for each milestone edge.
- Regression is forbidden in the normal API contract.
- `change_order.approved` is associated with the exceptional regression path, but no legal regression edge is enumerated.

**Closure:** AMBER.

**Do not implement:** `milestone.certified(type=X) → state=Y` until the exact milestone taxonomy and predicate are authoritative.

## 3. B.3 Lead lifecycle

Registered forward path:

`NEW → CONTACTED → QUALIFIED → OPPORTUNITY → CUSTOMER`

Terminal states in the register: `UNQUALIFIED`, `BAD_TIMING`.

The register describes the machine as system-controlled and forward-only. Candidate registered CRM events include:

- `lead.created`
- `lead.contacted`
- `lead.qualified`
- `lead.disqualified`
- `lead.promoted`
- `lead.status_changed`

These events are facts available to the CRM domain, but the authoritative material does not provide a complete one-to-one mapping from event to each B.3 edge.

Safe conclusions:

1. A lifecycle transition must be produced by the canonical command/domain path, not by a UI status setter.
2. B.4 working status must not directly write B.3 lifecycle stage.
3. The system may use registered CRM events as evidence, but must not select an edge solely from event naming.
4. Exact qualification criteria and promotion preconditions remain OPEN.

**Closure:** AMBER.

## 4. B.4 Lead working status

B.4 remains RED. The authoritative source explicitly closes only:

- ownership: rep-controlled;
- inbound engagement auto-promotes to `CONNECTED`.

The exact legal graph, disposition rules, recycling rules, appointment coupling and automation authority remain in `B4-LEAD-WORKING-STATUS-DECISION-GATE.md`.

**Closure:** RED.

## 5. B.5 Opportunity pipeline

Registered forward order:

`QUALIFIED → VISIT_SCHEDULED → VISIT_DONE → OFFER_SENT → NEGOTIATION → RESERVATION → CONTRACT → WON_PAID`

Registered probabilities:

`10, 20, 30, 50, 60, 80, 90, 100`; `LOST` and `WITHDRAWN` are `0`.

Safe trigger/precondition conclusions:

- `LOST` and `WITHDRAWN` require a reason.
- They may be reached from any open stage.
- The sanctioned regression is `OFFER_SENT → NEGOTIATION` or `QUALIFIED` on offer expiry.
- Offer expiry is therefore a legal business fact for that regression, but the source does not specify how the target is selected.
- Entry/exit criteria for each forward stage remain OPEN.
- `opportunity.stage_changed` is a registered event but cannot be assumed to be the causal trigger for every edge; it may represent the resulting domain fact.

**Closure:** AMBER.

## 6. B.6 Reservation

Registered order:

`DRAFT → PENDING_DEPOSIT → ACTIVE → CONVERTED`

or cancellation branch:

`ACTIVE → CANCELLED → REFUND_PROCESSING → CLOSED`.

Supported preconditions:

- `PENDING_DEPOSIT` requires apartment B.1 state `HELD`.
- `ACTIVE` follows deposit recording and apartment B.1 state `RESERVED`.
- expiry of `PENDING_DEPOSIT` initiates auto-cancel approval flow.
- apartment availability returns through the B.1 cancellation/release path and its 7-day cooling rule.

The exact atomic command boundary between reservation and apartment state remains OPEN. No distributed two-step mutation may be inferred as acceptable.

**Closure:** AMBER.

## 7. B.7 Contract

Registered order:

`DRAFT → GENERATED → SIGNED → NOTARIZED → ACTIVE → COMPLETED`

or:

`ACTIVE → TERMINATED | RESCINDED`.

Supported legal gate:

- Law 11-04 validation gates generation.

Registered contract events include:

`contract.generated`, `contract.signed`, `contract.notarized`, `contract.terminated`.

The authoritative material available to this pass does not enumerate the complete Law 11-04 field-level predicate nor all command/event pairings.

**Closure:** AMBER.

## 8. B.8 Payment schedule item

Registered order:

`PENDING → DUE → INVOICED → PARTIALLY_PAID → PAID`

with:

`DUE | PARTIALLY_PAID → OVERDUE`

and approved waiver to `WAIVED`; contract termination can produce `CANCELLED`.

Safe finance correctness constraint carried into this layer:

- financial state must not be mutated by arbitrary balance setters;
- posted financial records are immutable and corrected by compensating entries;
- payment/receipt duplication must be rejected or idempotently absorbed;
- allocation cannot exceed the applicable amount;
- exact grace/invoice/waiver policy remains OPEN.

The package contains a stronger Law 11-04 implementation specification in a historical/implementation document, but it is not promoted here to production truth without reconciliation against the v1.6.1 authoritative contract.

**Closure:** AMBER.

## 9. B.9 Approval request

Registered order:

`PENDING → APPROVED | REJECTED | ESCALATED | EXPIRED | CANCELLED`.

Safe facts:

- decisions are append-only;
- `APPROVED` / `REJECTED` resume the requesting flow;
- `approval.delegated` is an event, not a state;
- exact SLA, delegation, expiry and escalation authority remain OPEN.

**Closure:** AMBER.

## 10. B.10 Studio page version

Registered order:

`DRAFT → IN_REVIEW → PUBLISHED → ARCHIVED`.

Rollback publishes a prior version as a new version rather than reversing the current version in place.

**Closure:** GREEN at state semantics; command authorization/review predicates remain an implementation obligation.

## 11. B.11 Appointment

Supported facts:

- `REQUESTED → CONFIRMED → IN_PROGRESS → COMPLETED`;
- `IN_PROGRESS → NO_SHOW` after 15 minutes past start without check-in;
- cancellation from `CONFIRMED` or `IN_PROGRESS` can use buyer/agent/system cancellation states and requires a reason;
- reschedule closes the current appointment as `RESCHEDULED` and creates a linked successor through `rescheduled_from_id`;
- confirmation may occur by agent acceptance or 15-minute auto-confirm;
- Google Calendar is a projection/integration concern, not a replacement for canonical appointment state.

OPEN:

- complete cancellation/reschedule graph;
- exact check-in authority;
- exact auto-confirm job semantics;
- exact coupling to B.4;
- calendar projection consistency and retry contract.

**Closure:** AMBER.

## 12. Cross-machine invariants discovered during closure

These are architectural constraints, not invented state edges:

1. A legal event must correspond to a committed business mutation; failed transactions cannot emit durable success events.
2. A state mutation and required outbox record share one transaction boundary.
3. Cross-aggregate flows require explicit transaction/concurrency contracts before implementation.
4. B.4 tactical status must not silently promote B.3 lifecycle stage.
5. Public lead intake can enter the governed lead command path but cannot inherit internal CRM/finance/HR authority.
6. AI/copilot can request a governed command but cannot bypass its authorization, approval, invariant, transaction, audit or outbox path.
7. Financial corrections cannot rewrite posted history.
8. Search, analytics, notification and calendar projections cannot become alternate sources of domain truth.

## 13. Closure result

| Machine | Trigger/precondition closure |
|---|---|
| B.1 | GREEN at registered state level |
| B.2 | AMBER |
| B.3 | AMBER |
| B.4 | RED / blocking |
| B.5 | AMBER |
| B.6 | AMBER |
| B.7 | AMBER |
| B.8 | AMBER |
| B.9 | AMBER |
| B.10 | GREEN at state semantics |
| B.11 | AMBER |

## 14. Next gate

Do not proceed to executable lifecycle command implementation.

Next work is:

1. close the B.4 founder decision packet;
2. close B.2 milestone taxonomy/predicate;
3. close B.3 lifecycle trigger/precondition matrix;
4. close B.5 stage exit criteria;
5. close B.6 reservation/hold cross-aggregate transaction semantics;
6. close B.7 legal-generation predicate;
7. close B.8 finance timing/waiver/invoice policy;
8. close B.9 approval policy;
9. close B.11 appointment policy;
10. then resolve canonical command IDs against the closed edge matrix.
