# ASAS — Transactional Outbox / Inbox Contract

**Status:** PARTIAL / P0 CONTRACT
**Branch:** `feat/foundation-command-registry`
**Authority:** Blueprint v1.6.1, registered event catalog, idempotency/concurrency contracts, and source implementation specification where consistent. Undefined operational policy remains OPEN.

## 1. Purpose

Domain truth and durable event intent must commit atomically. Consumers and integrations must tolerate at-least-once delivery without duplicating business effects.

Required invariant:

`business mutation + state transition + audit + required outbox intent = one transaction`

Delivery is asynchronous. The outbox is not a second source of business truth.

## 2. Outbox contract

For every authoritative mutation that emits a registered event:

1. authorize and validate the command;
2. execute the legal domain mutation;
3. persist the resulting state;
4. append the audit record;
5. append the canonical registered event to the outbox;
6. commit as one transaction.

If the transaction rolls back, neither the state mutation nor its event intent may remain.

A worker publishes committed outbox rows after the transaction. A broker/provider failure must not roll back already committed domain truth.

## 3. Canonical event identity

Only registered dotted event IDs may be emitted. Each event requires its registered schema/version and must preserve tenant/workspace context and correlation/causation information according to the final envelope contract.

No consumer may treat a prose alias or PascalCase code symbol as a separate event identity.

## 4. Ordering

Ordering is required where consumers depend on causal order, especially within one aggregate.

The implementation specification describes an outbox sequence and per-aggregate publishing discipline: same-aggregate events are published in sequence order while different aggregates may process in parallel.

The exact authoritative implementation primitive remains subject to live-schema verification before schema work. Do not assume a sequence column or lock exists in production merely because the target specification describes one.

## 5. Publisher worker

The worker must:

- claim eligible unpublished work safely under concurrency;
- avoid two workers simultaneously publishing the same delivery as authoritative work;
- preserve required same-aggregate ordering;
- release/complete claims safely after success;
- tolerate worker crash and retry;
- expose failed deliveries for operational recovery.

`SELECT ... FOR UPDATE SKIP LOCKED` is an implementation option documented by the source specification, not a production fact until verified against live reality.

## 6. Inbox / consumer contract

Every consumer that can receive duplicate delivery must have a durable deduplication boundary.

Baseline identity:

`(eventId, handler)`

The consumer transaction must ensure that a successfully applied event cannot be applied again merely because the delivery is retried.

Where consumer processing changes authoritative domain state, the inbox claim/record and protected mutation must share the appropriate transaction boundary.

## 7. At-least-once model

The architecture must assume delivery can be duplicated. Exactly-once business effect is achieved through transactional state + idempotent consumers + domain invariants, not by claiming network-level exactly-once delivery.

A worker crash after external publication but before local completion may cause a redelivery; consumers must remain safe.

## 8. Retry and dead-letter

Retryable delivery failures must be distinguishable from permanent contract/schema/authorization failures.

Required lifecycle concepts:

`pending → processing → delivered` or `failed/retryable → retry → delivered`, with a durable dead-letter path for exhausted/non-retryable work.

Exact retry count, backoff schedule, retention, replay authorization and dead-letter state vocabulary are **OPEN** until operational policy is closed.

Manual replay must re-enter the governed consumer path and must never mutate business state directly.

## 9. Failure matrix

| Failure | Required behavior |
|---|---|
| DB transaction rollback | no committed domain event intent |
| Worker crash before publish | outbox remains recoverable |
| Worker crash after publish before completion | duplicate delivery tolerated by consumer |
| Consumer temporary failure | retry without losing event |
| Consumer permanent/schema failure | durable failure/DLQ; alert; no silent discard |
| Duplicate delivery | no duplicate business effect |
| Unknown event ID | reject/quarantine; never invent handling semantics |
| Malformed incompatible version | reject/quarantine according to compatibility policy |
| External provider outage | domain truth remains; delivery retries independently |

## 10. Tenant/security boundary

Outbox, inbox and delivery records are tenant-aware where the event/domain is tenant-scoped. A consumer must not process an event into a different tenant context.

Integration credentials are secrets and are never placed in event payloads or logs unless an explicitly approved redaction-safe reference is used.

Public events expose only fields authorized by the public projection contract.

## 11. Event-to-state traceability

For lifecycle mutations, the outbox event must be traceable to:

`command → aggregate → prior state → legal edge → new state → audit → event → consumer(s)`

The event register is the authority for event identity. The state-machine register is the authority for legal lifecycle edges.

## 12. Side effects

Consumers that send WhatsApp/SMS/email, update calendars, sync ads, publish search projections, or invoke AI must not make those external systems the source of transactional truth.

External side effects are retryable projections/actions. They require their own idempotency/delivery identity and must report durable failure without rewriting the already-committed domain state.

## 13. Required tests

1. state commit + outbox commit succeed atomically;
2. state rollback leaves no successful outbox event;
3. concurrent workers do not double-claim authoritative work;
4. same-aggregate events preserve required order;
5. different aggregates process independently;
6. crash after publish produces safe duplicate delivery;
7. duplicate event reaches consumer exactly once semantically;
8. consumer crash before completion permits safe retry;
9. poison event reaches DLQ without silent loss;
10. manual replay is authorized and idempotent;
11. cross-tenant event cannot mutate another tenant;
12. event version incompatibility is quarantined rather than silently reinterpreted;
13. external provider outage does not alter committed business truth;
14. audit/outbox/correlation identifiers remain consistent across retry.

## 14. OPEN items

- exact envelope schema/version fields beyond the registered catalog;
- exact outbox table placement/count in live production reality;
- claim/publish completion mechanism;
- broker/transport choice;
- retry/backoff/DLQ limits and retention;
- replay authorization and audit policy;
- event compatibility/deprecation policy;
- exact consumer transaction boundaries per bounded context;
- global vs tenant-local ordering where cross-aggregate causal dependencies exist.

## 15. Closure gate

GREEN requires evidence for:

`atomic write → durable outbox → safe claim → ordering → at-least-once delivery → inbox deduplication → retry → DLQ → replay → tenant isolation → version compatibility → observability → concurrent tests`.

Until this gate is closed, event-driven workflows are architectural contracts, not production guarantees.
