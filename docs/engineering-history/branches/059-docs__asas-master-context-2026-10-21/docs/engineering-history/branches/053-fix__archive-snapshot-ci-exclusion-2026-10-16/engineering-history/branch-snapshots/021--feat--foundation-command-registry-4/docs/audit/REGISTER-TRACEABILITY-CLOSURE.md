# ASAS Register Traceability Closure

**Status:** OPEN — authoritative-register extraction completed; semantic implementation contracts remain to be closed.
**Date:** 2026-09-14
**Repository:** `asas-erp-saas-1/As`
**Branch:** `feat/phase-1-iam-foundation`

## Purpose

This document is the forensic bridge between the machine-readable v1.6.1 registers and the normalized foundation contracts. It intentionally distinguishes **what the registers state** from **what still requires a normative engineering decision**. Missing semantics are not invented.

## Source authority

For this pass the package registers are treated as source artifacts under the existing authority hierarchy. The measured v1.6.1 package contains:

- 119 tasks
- 103 registered events
- 50 permissions
- 11 state machines
- 59 Prisma models
- 17 Prisma enums

The package's prose discrepancies remain tracked separately in `docs/audit/PACKAGE-CONSISTENCY-REPORT.md`.

## 1. State-machine register coverage

| Machine | Aggregate | States | Register form | Closure status |
|---|---|---:|---|---|
| B.1 | `apartment.commercial_status` | 9 | explicit edges | PARTIAL — compound event naming must use canonical registered event IDs |
| B.2 | `apartment.construction_status` | 6 | prose chain | OPEN — exact edge set and exception semantics must be normalized |
| B.3 | `lead.lifecycle_stage` | 7 | prose chain | OPEN — terminal/forward edge set needs exact machine form |
| B.4 | `lead.working_status` | 9 | prose semantics | OPEN — exact edge set is not enumerated |
| B.5 | `opportunity.stage` | 10 | prose chain + one regression | OPEN — exact edge graph/reason codes required |
| B.6 | `reservation.status` | 7 | prose chain | OPEN — exact cancellation/expiry/cooling edges required |
| B.7 | `contract.status` | 8 | prose chain | OPEN — exact legal/exception edges required |
| B.8 | `payment_schedule_item.status` | 8 | prose chain | OPEN — exact waiver/cancellation edges required |
| B.9 | `approval_request.status` | 6 | prose chain | OPEN — delegation/escalation/expiry edges require exact semantics |
| B.10 | `studio_page_version.status` | 4 | prose chain | PARTIAL — rollback semantics must remain create-new-version |
| B.11 | `appointment.status` | 9 | prose chain | OPEN — exact cancellation/reschedule graph and successor constraints required |

### B.1 exact registered edges

The register explicitly enumerates:

- `DRAFT → AVAILABLE` on `apartment.published`
- `AVAILABLE → HELD` on `apartment.held`
- `HELD → RESERVED` on `deposit.recorded`
- `HELD → AVAILABLE` on `hold.expired` or `hold.released`
- `RESERVED → CONTRACTED` on `contract.signed`
- `RESERVED → CANCELLED` on `reservation.cancelled`
- `CONTRACTED → SOLD` on the canonical `apartment.sold` event; the register explains the business condition as final payment + handover confirmed
- `CONTRACTED → CANCELLED` on `contract.terminated`
- `CANCELLED → AVAILABLE` on the canonical `apartment.released` event; the register explains this as the expiry timer job after the cooling period
- `AVAILABLE → BLOCKED` on `apartment.blocked`
- `BLOCKED → AVAILABLE` on `apartment.unblocked`
- `AVAILABLE → OFF_MARKET` on `apartment.off_marketed`
- `OFF_MARKET → AVAILABLE` on `apartment.back_on_market`

**Important normalization:** the explanatory text must not become a second event vocabulary. `apartment.sold` and `apartment.released` are the canonical registered event IDs where the register explicitly corrects the older descriptive wording.

## 2. Registered event inventory

All 103 event IDs were extracted from the machine-readable event register. They are grouped as follows:

### Inventory — 17

`apartment.published`, `apartment.held`, `hold.expired`, `hold.released`, `apartment.reserved`, `apartment.released`, `apartment.contracted`, `apartment.sold`, `apartment.blocked`, `apartment.unblocked`, `apartment.off_marketed`, `apartment.back_on_market`, `apartment.price_changed`, `milestone.certified`, `change_order.approved`, `project.published`, `project.unpublished`

### CRM — 18

`lead.created`, `lead.merged`, `lead.assigned`, `lead.contact_attempted`, `lead.contacted`, `lead.qualified`, `lead.disqualified`, `lead.status_changed`, `lead.promoted`, `lead.score_changed`, `activity.logged`, `appointment.requested`, `appointment.confirmed`, `appointment.rescheduled`, `appointment.cancelled`, `appointment.no_show`, `appointment.completed`, `conversation.message_received`

### Sales — 13

`opportunity.created`, `opportunity.stage_changed`, `offer.created`, `offer.submitted`, `offer.approved`, `offer.rejected`, `offer.expired`, `reservation.created`, `reservation.cancelled`, `contract.generated`, `contract.signed`, `contract.notarized`, `contract.terminated`

### Finance — 14

`paymentplan.installed`, `installment.due`, `installment.overdue`, `deposit.recorded`, `payment.recorded`, `receipt.allocated`, `refund.requested`, `refund.approved`, `refund.paid`, `ledger.posted`, `period.closed`, `commission.accrued`, `commission.clawed_back`, `commission.paid_out`

### Approvals — 5

`approval.requested`, `approval.granted`, `approval.rejected`, `approval.escalated`, `approval.delegated`

### Core — 7

`user.created`, `user.suspended`, `role.granted`, `role.revoked`, `session.started`, `session.revoked`, `audit.chain_verified`

### Workflow — 3

`workflow.run_started`, `workflow.step_completed`, `workflow.failed`

### Studio / Marketing — 13

`page.drafted`, `page.submitted`, `page.published`, `page.rolled_back`, `theme.updated`, `media.uploaded`, `campaign.launched`, `campaign.completed`, `campaign.message_sent`, `utm.captured`, `webevent.recorded`, `adlead.ingested`, `consent.changed`

### Notifications — 3

`notification.created`, `notification.delivered`, `notification.failed`

### Documents — 3

`document.generated`, `document.version_uploaded`, `document.expired`

### Integrations — 7

`integration.connected`, `integration.disconnected`, `integration.credential_used`, `integration.credential_refreshed`, `webhook.delivered`, `webhook.dead_lettered`, `conversion.uploaded`

## 3. Event closure matrix requirements

The current register gives the canonical event identity and module grouping. It does **not**, by itself, provide a sufficiently explicit implementation matrix for every event. Before implementation, every event must receive these fields:

| Field | Required contract |
|---|---|
| Registered ID | Exact dotted ID from register |
| Schema version | Explicit integer/version policy |
| Event class | Domain / integration / platform / notification / projection / telemetry / deprecated |
| Producer context | Exactly one authoritative producer context |
| Aggregate | Aggregate/type that owns the fact |
| Trigger command | Canonical domain/application command, if applicable |
| State edge | State-machine edge, if applicable |
| Consumers | Explicit consumers/projections/workflows |
| Transaction boundary | Whether emitted in same transaction as mutation |
| Outbox rule | Required/optional and ordering semantics |
| Idempotency key | Required derivation and uniqueness boundary |
| Retry semantics | Retryable/non-retryable + backoff/dead-letter policy |
| Causation/correlation | Required propagation semantics |
| Tenant context | Tenant/workspace isolation requirements |
| Payload classification | Public/internal/PII/financial/secret sensitivity |
| Compatibility | Additive/evolution/deprecation rules |
| Audit relation | Whether event is accompanied by immutable audit record |

**Closure rule:** an event is not implementation-ready merely because its dotted ID exists.

## 4. Permission register closure

The register contains 50 permission keys. The role matrix is retained as source truth for the current grants/scopes, but permission names are not sufficient to define complete authorization.

Every permission must be mapped to:

1. one or more canonical commands;
2. object/resource type;
3. action;
4. property-level restrictions where applicable;
5. tenant/workspace boundary;
6. scope semantics (`OWN`, `TEAM`, `BRANCH`, `COMPANY`, `ORG`, `ALL`, etc.);
7. ABAC predicates;
8. deny overrides;
9. approval requirements;
10. audit requirement;
11. public/private exposure boundary;
12. corresponding negative authorization tests.

### Explicit high-risk permission observations

- `apartment.price.override` is threshold-sensitive (`2–5%`, `>5%`, `ANY`) and therefore requires a typed authorization/approval contract, not a boolean permission check.
- `approval.decide` contains role/value-specific thresholds and refund limits; this is an ABAC/approval policy, not merely RBAC.
- `refund.approve` is amount-sensitive and must be bound to accounting/approval invariants.
- `user.invite` and `role.assign` distinguish `REQUEST` from `YES`; request/approval semantics must be explicit.
- `calendar.connect` is self-scoped across personas and therefore needs ownership checks on the connected identity.
- `copilot.use` grants AI access but must never imply authorization to execute the underlying business mutation.
- `lead.pii.read` is distinct from ordinary lead access and must remain a separate property/data-classification boundary.
- `lead.delete` is denied to all listed personas; this must be reconciled with retention/anonymization/merge semantics rather than implemented as physical deletion by convenience.

## 5. Cross-register invariants discovered in this pass

### Inventory × Sales × Finance

A reservation may affect apartment status, deposit/receipt records and later contract state. The implementation must guarantee a single legal winner for the unit and prevent partial cross-context commits.

### Reservation × concurrency

The register names `HELD`, `RESERVED`, deposit recording and expiry but does not by itself specify the database-level single-winner mechanism. This remains a P0 contract: transactional locking/constraint strategy, retry behavior and idempotency must be explicit.

### Contract × Finance

`contract.signed`, payment-plan installation, receipts, allocations and ledger posting must have explicit causal and accounting relationships. No financial state may be inferred from UI state alone.

### Permission × approval

Threshold permissions such as price override, discount and refund approval require a typed policy evaluation path and cannot be reduced to role membership.

### Event × state machine

Every event used as a transition trigger must have one canonical interpretation. Descriptive prose must not introduce alternative event IDs.

### Public × private

`apartment.marketing.publish`, Studio publishing, public lead capture, UTM capture, consent and PII access require an explicit public/private projection contract. Public publication must never expose internal CRM/finance fields.

### AI × authorization

`copilot.use` authorizes access to the copilot capability, not the authority to perform arbitrary domain actions. AI tools must resolve the same tenant, scope, permission, ABAC and approval checks as human-originated commands.

## 6. Non-invented open questions

These items are intentionally left unresolved until an authoritative source or founder-level decision closes them:

- Exact B.2–B.11 transition edges.
- Canonical command names and command catalog.
- Exact event schema versions/payload contracts.
- Exact producer/consumer ownership for all 103 events.
- Exact ABAC predicates behind threshold/scoped permissions.
- Exact idempotency-key derivation and retention windows.
- Exact outbox/inbox storage and delivery semantics.
- Exact concurrency strategy for reservations/holds.
- Exact accounting equation/chart-of-accounts contract.
- Exact PII classification and retention periods.
- Exact public projection schema.
- Exact AI tool registry and data-egress rules.

## 7. Closure criterion

This document is GREEN only when every register item resolves to an authoritative contract and every contract has:

**owner → invariant → failure behavior → authorization → transaction boundary → event behavior → test/evidence method.**

Until then, foundation status remains **OPEN**.
