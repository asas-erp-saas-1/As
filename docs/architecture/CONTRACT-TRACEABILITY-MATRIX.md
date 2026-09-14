# ASAS Contract Traceability Matrix

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14

## Purpose

This is the canonical structure Claude must complete before implementing business workflows. It prevents domain, authorization, event, API and UX contracts from drifting apart.

The matrix is deliberately defined before implementation. Empty cells are **BLOCKED / TO NORMALIZE**, not invitations to invent behavior.

## 1. Required traceability chain

Every state-changing capability must resolve through:

`Task → Aggregate → State Machine → Command → Permission → Scope/ABAC → Preconditions → Transaction → Audit → Domain Event → Outbox → API/Application Contract → UX Action → Figma Action/Screen → Evidence`

## 2. Command traceability template

| Field | Required |
|---|---|
| Task ID | Yes |
| Bounded context | Yes |
| Aggregate | Yes |
| State machine | If stateful |
| Command | Yes |
| Permission | Yes for protected mutation |
| Minimum scope | Yes |
| ABAC predicates | If applicable |
| Preconditions | Yes |
| Idempotency | Yes when externally retryable |
| DB invariant/constraint | When required |
| Audit event | Yes for governed mutation |
| Domain event | Yes when business fact occurs |
| Outbox behavior | Yes when event emitted |
| Error codes | Yes |
| API/Server Action | Yes |
| UX action ID | Yes for UI mutation |
| Figma node/action ID | Yes for Figma-derived UI |
| Tests | Yes |
| Evidence | Yes before acceptance |

## 3. Canonical workflow examples

### Reservation

`T-? → Reservation aggregate → B.6 Reservation + B.1 Apartment Commercial Status → CreateReservation/ApproveReservation/ConfirmReservation → reservation.create / approval.decide (exact mapping to be normalized) → scope/ABAC → eligibility + single-winner preconditions → transaction → audit → canonical reservation event → outbox → /api/v1 or Server Action → J5 reservation action → Figma reservation flow → race + authorization + UI evidence`

**Important:** the exact permission/event identities are intentionally not guessed here; F-03 and F-05 must be resolved first.

### Receipt / collection

`Finance task → Receipt aggregate → payment/receipt state contract → RecordReceipt/AllocateReceipt → receipt.record → scope/ABAC → amount/allocation/period invariants → transaction → audit → receipt event → outbox → finance application/API contract → J6 action → Figma finance flow → ledger/invariant/accessibility evidence`

### Studio publishing

`Studio task → Page/PageVersion aggregate → B.10 Studio Page Version → PublishPage/RollbackPage → studio.publish → scope/ABAC → version/approval/publication preconditions → transaction → audit → publication event → outbox → publishing application contract → J7 action → Figma publish flow → visual/version/security evidence`

### IAM permission administration

`T-1.x → User/Grant aggregate → IAM authorization contract → AssignRole/RevokeGrant → role.assign → scope/ABAC → SoD/hierarchy/tenant preconditions → transaction → audit → role event → outbox → authenticated application contract → J10 action → Figma admin flow → matrix/negative/access evidence`

## 4. Golden Journey traceability requirements

| Journey | Minimum traceability requirement |
|---|---|
| J1 Executive overview | query/projection → permission/scope → freshness/stale state → drill-down action |
| J2 Lead qualification | lead command → permission → lifecycle + working state → event → next activity |
| J3 Visit scheduling | appointment command → calendar policy → conflict behavior → appointment event → recovery state |
| J4 Inventory search | projection → permission/scope → commercial + construction state → allowed actions |
| J5 Reservation race | reservation command → authorization → DB winner → conflict error → audit/event → explicit UI recovery |
| J6 Contract to collection | schedule → receipt → allocation → ledger → immutable state → provenance UI |
| J7 Studio publish | draft/version → approval → publish → immutable published version → rollback semantics |
| J8 Public conversion | published projection → contextual lead capture → tenant binding → consent → attribution |
| J9 Marketing attribution | campaign/source/UTM → lead → attribution touch → conversion → spend/ROI |
| J10 Permission administration | user → role/grant → scope → effective permission explanation → deny override → audit |
| J11 Integration recovery | provider event → verification → delivery state → retry/dead-letter → audit |
| J12 Post-sale/SAV | customer/unit/contract context → issue/task/SLA → permission/scope → history |

## 5. Figma contract linkage

Every Figma-derived screen/action must carry or be derivable from:

- stable screen identifier;
- stable action identifier;
- journey identifier;
- persona/job;
- permission requirement;
- command identifier;
- state-machine reference when relevant;
- success/error/no-permission states;
- responsive class;
- direction/locale coverage;
- token/component references.

The implementation operator must not infer business behavior from a screenshot alone. The Figma contract explicitly places product/domain contracts above Figma and requires runtime visual comparison after implementation.

## 6. API linkage

For every mutation the API/application contract must preserve:

`identity → tenant → permission → scope/ABAC → idempotency → validation → domain command → transaction → audit/outbox → response`

This order is mandatory and must remain consistent across Server Actions, `/api/v1`, and `/api/public/v1` according to the surface's trust model.

## 7. Evidence linkage

A completed row is accepted only when evidence can answer:

1. Which contract authorized the behavior?
2. Which tenant/permission rule was tested?
3. Which state transitions were tested?
4. Which event was emitted and versioned?
5. Was audit/outbox atomic?
6. Which UI state was validated?
7. Was RTL/LTR and responsive behavior validated where relevant?
8. What happens on retry, race, timeout or dependency failure?
9. What is the rollback/recovery path?

## 8. Normalization rule

Until the Foundation Consistency Audit is closed, Claude must not create a new domain event, bounded context, lifecycle state, permission family, or cross-context data dependency merely to make an implementation convenient.

If an implementation appears to require one, stop and escalate under the founder authority model.
