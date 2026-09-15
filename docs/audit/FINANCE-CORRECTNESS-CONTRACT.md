# ASAS — Finance Correctness Contract

**Status:** OPEN / P0 CONTRACT
**Branch:** `feat/foundation-command-registry`
**Authority:** ASAS v1.6.1 handoff/registers and existing foundation contracts. Undefined accounting policy remains `OPEN`.

## 1. Purpose

Finance is authoritative for contractual obligations, payment schedules, receipts, allocations, commissions and accounting postings. Finance must not be reconstructed from CRM, analytics, UI state, or external integration state.

The implementation target is correctness under retries, concurrency, partial failure, period closure and audit review.

## 2. Money contract

- Monetary values are integer **DZD centimes**.
- Floating-point arithmetic is prohibited for authoritative monetary persistence/calculation.
- Currency must be explicit at every authoritative monetary boundary; DZD is the current registered operational currency.
- Conversion/FX semantics are `OPEN` unless explicitly introduced by an authoritative product decision.
- Rounding mode, allocation remainder policy, tax/VAT policy, and accounting chart policy are `OPEN` where the source does not define them.

## 3. Double-entry invariant

Every posted accounting transaction must satisfy:

`Σ debit = Σ credit`

within the same posting currency/accounting unit defined by the authoritative accounting model.

A transaction that cannot balance is rejected atomically. A partial posting is never exposed as committed accounting truth.

## 4. Immutability and correction

Posted financial records are immutable.

Correction is performed through an explicit compensating/reversal transaction, never by mutating historical posted values in place.

A closed accounting period cannot receive an ordinary posting. The exact reopening authority and correction-period policy remain `OPEN`.

## 5. Payment lifecycle

The registered payment flow must preserve the distinction between:

`contractual obligation → payment schedule item → due/invoiced state → payment received → receipt → allocation → accounting posting`

A payment receipt does not silently equal an allocation, and an allocation does not silently equal a ledger posting unless the canonical command contract explicitly makes those effects part of one transaction.

## 6. Duplicate payment protection

The same external/payment reference or idempotent command cannot create a second financial effect.

Concurrent attempts must resolve to one authoritative outcome. Conflicting reuse of an idempotency key/reference with a different request fingerprint must fail deterministically.

## 7. Allocation invariants

An allocation must:

- reference an existing authoritative payment/receipt;
- reference an eligible outstanding obligation;
- not allocate more than the available unapplied amount;
- preserve the authoritative currency boundary;
- be atomic with its protected financial mutation where the command contract requires it.

Over-allocation is rejected; it is never silently rounded or clipped.

## 8. Payment schedule invariants

For each schedule item, the authoritative state machine remains:

`PENDING → DUE → INVOICED → PARTIALLY_PAID → PAID`

with `DUE | PARTIALLY_PAID → OVERDUE` after the registered grace semantics, and approved `WAIVED` / contract-driven `CANCELLED` paths.

Exact grace duration, invoice semantics, waiver policy and cancellation timing remain `OPEN` until sourced.

## 9. Period close

A closed period is a correctness boundary:

- ordinary posting into the closed period is rejected;
- already-posted entries are not edited;
- corrections use an approved compensating mechanism;
- close operation is idempotent and concurrency-safe;
- reports for closed periods must remain reproducible from authoritative postings.

Exact close checklist, reopening authority and fiscal-calendar policy remain `OPEN`.

## 10. Commission integrity

Registered lifecycle:

`commission.accrued → commission.clawed_back / commission.paid_out`

Commission eligibility, formula, clawback conditions, payout timing, rounding and approval thresholds must be sourced from an authoritative product/accounting policy before executable implementation. They must not be inferred from UI copy or generic CRM assumptions.

## 11. Cross-context financial boundaries

Reservation, contract, payment, collection and apartment status may participate in one business workflow but retain explicit ownership boundaries.

A cross-context operation must define:

`command → authorization → invariants → transaction boundary → state edges → events → audit → outbox → compensation/recovery`

External systems never become accounting truth merely because a webhook or API call succeeded.

## 12. Failure semantics

For every authoritative financial mutation:

- authorization failure: no financial side effect;
- validation failure: no financial side effect;
- invariant failure: no partial financial side effect;
- duplicate retry: same committed outcome where idempotency applies;
- concurrent conflict: one valid winner or deterministic rejection;
- outbox failure: domain transaction must not commit without its required outbox record;
- downstream integration failure: financial truth remains committed and retryable; it is not rolled back merely because an external projection failed.

## 13. Required adversarial tests

Minimum families:

1. debit/credit imbalance rejection;
2. duplicate payment command;
3. duplicate external reference;
4. concurrent payment recording;
5. concurrent allocation against one outstanding installment;
6. over-allocation;
7. payment retry after worker crash;
8. closed-period posting rejection;
9. concurrent period close;
10. attempted mutation of posted entry;
11. compensating reversal correctness;
12. tenant-crossing financial access denial;
13. unauthorized refund approval;
14. refund retry/idempotency;
15. commission duplicate accrual;
16. commission clawback consistency;
17. outbox atomicity;
18. replayed finance event consumer;
19. currency mismatch rejection;
20. integer-centime arithmetic/rounding edge cases.

## 14. Explicit OPEN decisions

The following are not silently decided by this contract:

- chart of accounts;
- fiscal year/calendar;
- VAT/tax rules and rates;
- rounding/remainder allocation policy;
- FX/multi-currency behavior;
- exact receipt/reference uniqueness scope;
- grace duration;
- invoice semantics;
- refund policy beyond registered permissions/events;
- commission formulas and eligibility;
- period reopening authority;
- accounting posting date policy;
- legal/accounting treatment of cancelled contracts.

## 15. Closure gate

Finance is GREEN only when the above invariants are represented in executable command contracts, authorization rules, database constraints where appropriate, transaction boundaries, audit/outbox semantics, negative tests, recovery tests and evidence.

Documentation alone does not constitute finance closure.
