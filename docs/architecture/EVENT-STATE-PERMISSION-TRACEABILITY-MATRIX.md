# ASAS — Event / State / Permission Traceability Matrix

**Status:** FOUNDATION WORKING ARTIFACT — TRACEABILITY WAVE 1
**Repository:** `asas-erp-saas-1/As`
**Date:** 2026-09-20
**Authority:** Derived from current repository registers plus architecture working contracts. Not a replacement for the registers.

## 1. Purpose

This artifact connects three machine-readable control planes that must agree before lifecycle implementation:

```text
State Machine
    ↓
Legal Transition
    ↓
Domain Event
    ↓
Permission / Scope
    ↓
Canonical Task
    ↓
Verification Evidence
```

The register remains authoritative for the exact event catalog, permission values, and state-machine definitions. This matrix is a traceability layer. It must never be edited to make implementation appear compliant.

## 2. Source evidence

Current repository evidence:

- `registers/events.json` — 103 events across 11 emission modules; event envelope requires transactional outbox and idempotent consumers.
- `registers/state-machines.json` — 11 lifecycle machines; illegal transitions return typed errors, every transition appends audit and fires its corresponding domain event, and direct status setters are prohibited.
- `registers/permissions.csv` — 50 permission keys across eight personas/scopes.
- `docs/architecture/CONTEXT-MODULE-OWNERSHIP-RECONCILIATION.md` — working context/module ownership model.
- `docs/architecture/DOMAIN-OWNERSHIP-AND-TRACEABILITY-CONTRACT.md` — ownership and evidence rules.
- `AGENTS.md` / N1–N12 — operational constraints, especially N3, N4, N6, N7, N11 and N12.

## 3. Non-negotiable traceability rules

1. A status cannot change through a generic update endpoint.
2. A legal transition must be represented by the state-machine contract.
3. The transition emits the registered past-tense business event.
4. The mutation is authorized against the owning resource and tenant/workspace scope.
5. The business mutation and outbox record commit atomically.
6. Consumers are idempotent and deduplicated by `(eventId, handler)`.
7. Read-model consumers do not become owners of source business facts.
8. A permission is not inferred from UI visibility.
9. A task cannot be marked complete without named verification evidence.
10. Missing ownership remains `OPEN` or `UNRESOLVED`; it is never silently inferred from a table or folder name.

## 4. Wave-1 verified/derived lifecycle chains

The following chains are directly supported by the current state-machine and event/permission registers. `DERIVED` means the relationship is mechanically derived from the registers; it is not a new business decision.

| Lifecycle | State owner | Transition/event evidence | Permission evidence | Current status |
|---|---|---|---|---|
| Apartment commercial availability | Inventory | `DRAFT→AVAILABLE` via `apartment.published`; `AVAILABLE→HELD` via `apartment.held`; `HELD→RESERVED` via `deposit.recorded`; `RESERVED→CONTRACTED` via `contract.signed`; `CONTRACTED→SOLD` via `apartment.sold`; release/block/off-market transitions have registered events | `apartment.read`, `apartment.hold.create`, `apartment.update`, `apartment.price.override`, `apartment.marketing.publish` | DERIVED — ownership chain supported |
| Lead lifecycle | CRM | `lead.created`, `lead.contacted`, `lead.qualified`, `lead.promoted`, plus status/merge/assignment events | `lead.read`, `lead.create`, `lead.update`, `lead.transfer`, `lead.pii.read`, `lead.export` | DERIVED — ownership chain supported |
| Opportunity pipeline | Sales | `opportunity.created`, `opportunity.stage_changed`; state machine defines probability and exit criteria | `opportunity.read`, `offer.create`, `offer.discount.request` | DERIVED — ownership chain supported |
| Reservation | Sales | `reservation.created`, `reservation.cancelled`; reservation machine defines deposit, active, converted, refund and closure states | `reservation.create`, `reservation.cancel`, `approval.decide` where applicable | DERIVED — ownership chain supported |
| Contract | Sales | `contract.generated`, `contract.signed`, `contract.notarized`, `contract.terminated`; state machine gates legal lifecycle | `contract.read`, `contract.generate`, `approval.decide` where applicable | DERIVED — ownership chain supported |
| Payment schedule item | Finance | `paymentplan.installed`, `installment.due`, `installment.overdue`, plus receipt/payment events; state machine governs item lifecycle | `paymentplan.read`, `paymentplan.manage`, `receipt.record`, `refund.*`, `ledger.read` | DERIVED — ownership chain supported |
| Approval | Core / cross-context policy | `approval.requested`, `approval.granted`, `approval.rejected`, `approval.escalated`, `approval.delegated`; append-only decision model | `approval.decide` plus resource-specific permission | DERIVED — policy chain supported |
| Appointment | CRM | `appointment.requested`, `appointment.confirmed`, `appointment.rescheduled`, `appointment.cancelled`, `appointment.no_show`, `appointment.completed`; reschedule creates successor | `appointment.create`, `calendar.connect`, `media.manage` where applicable | DERIVED — ownership chain supported |
| Studio page version | Website Studio | `page.drafted`, `page.submitted`, `page.published`, `page.rolled_back`; state machine defines publication lifecycle | `studio.draft`, `studio.publish` | DERIVED — context/module implementation boundary still OPEN |

## 5. Critical transition invariants

### 5.1 Apartment availability

The apartment lifecycle is a double-sell prevention boundary. The implementation must enforce:

```text
AVAILABLE
  ↓ hold
HELD
  ↓ deposit
RESERVED
  ↓ contract signed
CONTRACTED
  ↓ final payment + handover confirmation
SOLD
```

Expiry/release must return a held unit to `AVAILABLE` through the registered transition path. Direct writes to the commercial-status field are forbidden.

### 5.2 Reservation → Contract → Finance

Reservation and contract ownership remain in Sales; payment schedule and financial posting remain in Finance. Finance may validate contract milestones but must not silently become the owner of Sales contract state.

### 5.3 Finance

Money events and ledger operations remain Finance-owned. Posted ledger lines are immutable; correction is a compensating entry. Client-side calculations cannot establish financial truth.

### 5.4 Approval

Approval is a control mechanism, not a substitute for resource ownership. A grant permits the requesting flow to continue; it does not transfer the underlying business invariant to the approval subsystem.

### 5.5 Read models

Activity/Audit, Search, Notification, Reporting and similar consumers may react to events but cannot mutate the source aggregate merely because they consume its event.

## 6. Permission interpretation

The permission register uses explicit scope values such as `OWN`, `TEAM`, `BRANCH`, `ORG`, `YES`, `REQUEST`, and `—`. These are authorization inputs, not UI hints.

Working authorization pipeline:

```text
Authenticated identity
      ↓
Tenant / workspace context
      ↓
Resource ownership + scope
      ↓
Permission key
      ↓
Approval threshold (if required)
      ↓
Command
      ↓
State transition
```

`—` means denied/unavailable in the register; it must not be converted into a default allow.

## 7. Event-emission lanes are not bounded contexts

`registers/events.json` contains 11 emission modules, including `Approvals`, `Notifications`, `Integrations`, and `Studio / Marketing`. These are routing/implementation groupings. They must not be mechanically promoted into additional bounded contexts.

This is especially important for the current nine-context reconciliation.

## 8. Gaps deliberately left open

The following cannot be marked VERIFIED from the current registers alone:

- Communication context/module ownership.
- Collaboration & Extensibility ownership.
- Exact Documents implementation boundary under the current nine-context model.
- Exact Website Studio implementation module/persistence/task mapping.
- Exact Marketing implementation module/persistence/task mapping.
- Canonical task ID for every lifecycle row.
- Complete event → consumer matrix.
- Complete permission → aggregate/resource matrix.
- Live database enforcement of any of the above.

These are implementation-readiness dependencies, not reasons to invent data.

## 9. Required next traceability wave

### Wave 2 — Event ownership

For all 103 events:

`event → producer context → producer module → aggregate → invariant → transaction boundary → consumers`

### Wave 3 — Permission ownership

For all 50 permission keys:

`permission → resource → owning context → aggregate/command → scope rule → approval threshold → task`

### Wave 4 — State coverage

For all 11 state machines:

`state → legal transition → triggering event → authorization → audit → outbox → tests`

### Wave 5 — Task linkage

For every implementation-bearing row:

`traceability row → canonical task ID → files_allowed → files_forbidden → DoD → evidence`

## 10. Closure rule

This matrix does not close the architecture gate. Closure requires every implementation-bearing lifecycle to have a supported chain from architecture through task and verification evidence, plus acceptance of the relevant architecture ADRs.

Until then, status remains explicit and implementation remains frozen.
