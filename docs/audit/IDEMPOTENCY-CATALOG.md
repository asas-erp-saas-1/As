# ASAS — Idempotency Contract & Key Catalog

**Status:** PARTIAL / P0 CONTRACT — storage, retention and exact derivation remain source-open where not specified by the authoritative package.
**Branch:** `feat/foundation-command-registry`

## 1. Purpose

Idempotency is a correctness boundary for retryable business mutations. It is not a UI convenience and must not be implemented as a client-only deduplication flag.

The contract is derived from the foundation requirement that critical mutations survive retries without duplicating business effect. Exact storage/retention details are deliberately marked `OPEN` until an authoritative decision closes them.

## 2. Semantic contract

For an idempotent operation, a request is identified by:

`tenant/workspace + actor/principal + operation identity + idempotency key + request fingerprint`

Required behavior:

1. First valid request executes the canonical command path and records the idempotency outcome atomically with the protected mutation when the operation is authoritative.
2. A retry with the same identity and materially equivalent request returns the original semantic result; it does not repeat the business effect.
3. A retry using the same identity but a materially different request is a typed idempotency conflict; it must not execute.
4. A request with a different key is a new operation unless another domain invariant rejects it.
5. A failed command must not leave a successful idempotency result claiming a mutation that did not commit.
6. External side effects must not be duplicated merely because a command or event delivery is retried.

## 3. Idempotency classes

### I0 — No externally retryable mutation

Read-only operations or operations whose semantics are intrinsically non-mutating.

**Examples:** ordinary reads/reports, subject to authorization and cache semantics.

### I1 — Command transaction idempotency

The idempotency record and authoritative domain mutation share one transaction boundary.

**P0 examples:**
- reservation creation
- receipt/payment recording
- public lead creation/ingestion
- approval decisions where repeated transport can otherwise repeat the effect

Exact command membership remains tied to the final command registry.

### I2 — Event consumer idempotency / inbox

A consumer may receive the same registered event more than once. Semantic processing must be idempotent using a durable consumer identity, with the foundation baseline:

`(eventId, handler)`

The event must not apply its business effect twice.

### I3 — Integration/webhook idempotency

Incoming or outgoing integration traffic can retry or replay.

The receiver must persist a stable delivery identity/replay identifier and bind processing to tenant/integration context.

The exact provider-specific identity field is OPEN until each integration contract is closed.

### I4 — Scheduled/background execution idempotency

Timer jobs, expiry processors, release jobs, due-date processors and workflow retries must tolerate repeated execution.

A job execution must test/claim its work under the same authoritative concurrency boundary that protects the underlying business invariant.

## 4. P0 mutation inventory

| Flow | Class | Critical invariant | Key scope | Exact retention |
|---|---|---|---|---|
| Reservation creation | I1 | one winner for one reservable unit | tenant + actor + operation + request | OPEN |
| Receipt/payment recording | I1 | no duplicate financial effect | tenant + actor + operation + request | OPEN |
| Public lead ingestion | I1 | no duplicate lead/business effect from retry | tenant/public-source + operation + request/source identity | OPEN |
| Webhook processing | I3 | replay-safe semantic processing | tenant + integration + delivery identity | OPEN |
| Event consumption | I2 | no duplicate consumer effect | tenant + event ID + handler | OPEN |
| Hold expiry/release job | I4 | stale job cannot release newer reservation | tenant + aggregate + current version/claim | OPEN |
| Pending-deposit auto-cancel | I4/I1 | repeated expiry cannot duplicate cancellation/approval | tenant + reservation + command/work item | OPEN |
| Refund request/approval/payment | I1 | one financial effect per authorized operation | tenant + operation + request | OPEN |
| Campaign/message sends | I1/I3 as applicable | repeated transport cannot duplicate governed send | tenant + campaign/message + provider identity | OPEN |
| External integration callbacks | I3 | provider retry/replay cannot duplicate domain mutation | tenant + integration + provider event identity | OPEN |

## 5. Required record semantics

An authoritative idempotency record must be able to distinguish at minimum:

- tenant/workspace identity
- principal/actor identity where applicable
- command/operation identity
- caller-provided idempotency key or durable source delivery identity
- canonical request fingerprint
- lifecycle status (`IN_PROGRESS`, `SUCCEEDED`, `FAILED`, or equivalent — exact enum is OPEN)
- resulting semantic outcome/reference where safe
- timestamps
- expiry/retention metadata
- correlation/causation identifiers where applicable

No final enum is claimed here until the canonical command/kernel design closes it.

## 6. Fingerprint rule

The fingerprint must represent the authoritative mutation input, not transport noise.

Excluded by default unless a contract explicitly includes them:
- HTTP ordering artifacts
- headers unrelated to business semantics
- transient trace/request identifiers
- client UI metadata that does not affect the business outcome

Included inputs must cover every business-relevant field capable of changing the resulting domain effect.

Exact canonicalization algorithm is **OPEN**.

## 7. Concurrency interaction

Idempotency does not replace domain concurrency control.

A valid reservation key cannot make two distinct keys both reserve the same unit. A repeated payment key cannot bypass accounting invariants. The command must satisfy both:

`idempotency invariant + domain concurrency invariant`

The concurrency catalog remains a separate required artifact.

## 8. Transaction boundary

For I1 commands, the minimum target is:

`validate key → acquire/check idempotency record → authorize → validate → domain mutation → state transition → audit → required outbox rows → finalize idempotency result → commit`

The precise SQL/ORM locking and retry mechanics remain implementation design work after the architecture contract is approved.

For I2/I3/I4, the transaction boundary depends on whether the durable delivery/work item is the authoritative source of deduplication; this must be closed per adapter/consumer.

## 9. Failure semantics

### Duplicate same request
Return the previously committed semantic result or an equivalent replay-safe response.

### Same key, different request
Return typed conflict; do not mutate domain state.

### Original request still in progress
The system must not start a second authoritative execution. The exact waiting/polling/409-style behavior is OPEN.

### Original transaction rolled back
No successful idempotency result may survive the rollback.

### Side effect failed after domain commit
The domain truth remains committed; retry is handled by the outbox/integration contract, not by replaying the entire business mutation blindly.

## 10. Tenant and security boundary

Idempotency keys must never be globally reusable across tenants merely because the raw key string matches.

The lookup boundary must include tenant context and the operation identity. Principal binding is required where the command's authority is principal-sensitive.

Never place secrets or unnecessary PII inside the idempotency key or fingerprint payload.

## 11. Retention and cleanup — OPEN

The authoritative source does not provide a universal retention period. Therefore do not invent one globally.

Each idempotency class must eventually define:
- minimum replay-protection horizon
- legal/business retention requirement
- cleanup policy
- storage budget
- archival/purge behavior
- impact on late retries

Until closed, implementation must use an explicitly documented temporary policy and keep it isolated from business semantics.

## 12. Required negative tests

At minimum, the executable kernel must prove:

1. same key + same request → one effect
2. same key + altered request → typed conflict + zero second effect
3. concurrent same-key requests → one effect
4. concurrent different keys against one reservation → one winner
5. original transaction rollback → no phantom success result
6. outbox retry → no duplicate domain mutation
7. duplicate webhook → no duplicate domain mutation
8. duplicate receipt/payment request → no duplicate financial posting
9. cross-tenant same raw key → isolated outcomes
10. replay after retention horizon → behavior follows explicit policy, never accidental undefined behavior

## 13. Closure gate

This artifact becomes GREEN only when every idempotent command/consumer/integration flow has:

`identity scope → operation ID → key source → request fingerprint → persistence boundary → concurrency interaction → success replay semantics → conflict semantics → failure semantics → retention → negative tests → evidence`

Until then, idempotency remains a P0 architectural gate and the command kernel must not pretend it is fully closed.
