# ASAS Engineering Conference — C06 Finance

**Status:** SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Branch:** `platform-architecture-2026`
**Depends on:** C02 attribution/commission semantics; C03 pricing/inventory semantics; C05 Sales semantics

## Closure decision

C06 is semantically closed by `ADR-0037-FINANCE-CANONICAL-SEMANTICS-2026-09-27.md` and `ASAS-FINANCE-CONTRACT-CANDIDATE-2026-09-27.md`.

The closure is semantic only. Foundation Gates 00–06 remain prerequisites for implementation.

## Accepted decisions

1. Authoritative financial obligations arise from governed commercial milestones; Reservation carries commercial facts but is not payment settlement.
2. `PaymentPlan` is the ordered schedule; `Installment` is an individual obligation; `Payment` is settlement; `Receipt` is controlled payment evidence.
3. DZD uses integer centimes; future currencies use explicit currency + minor-unit precision. Floating point is prohibited for authoritative money.
4. Later price versions never rewrite contracted historical economics.
5. Posted double-entry facts are immutable; corrections are new reversal/adjustment facts.
6. Posted journals must balance debits and credits.
7. Accounting periods are explicit and closed periods cannot be silently edited.
8. Developer-track receivables derive from Contract/PaymentPlan and approved amendments; construction progress is not itself a ledger posting.
9. Finance owns commission entitlement, payable and paid facts; Sales supplies authorized attribution/milestone facts.
10. Payment recording is idempotent and duplicate external notifications cannot create duplicate settlement facts.
11. Reconciliation is a controlled matching layer over external evidence and does not rewrite source facts.
12. Financial reporting derives from posted ledger truth or explicitly labeled Finance projections.
13. High-impact financial corrections and period controls remain human-authorized.
14. AI may explain/reconcile/draft within caller authority but cannot bypass financial approval or rewrite posted truth.

## Explicit deferrals

The following remain intentionally deferred to current primary/authoritative evidence and/or Founder/accounting/legal policy:

- Algeria-specific statutory accounting treatment;
- invoice/receipt statutory requirements;
- VAT/tax treatment;
- jurisdiction-specific payment milestones;
- chart of accounts;
- approval thresholds and delegation matrix.

## Required implementation evidence later

- ledger posting invariants;
- immutable-entry enforcement;
- idempotency tests;
- payment reconciliation tests;
- commission entitlement tests;
- period-close controls;
- authorization/RLS evidence;
- audit evidence;
- race/concurrency tests where financial and commercial boundaries interact.

## Non-goals

- No live financial migration.
- No ledger implementation.
- No production financial correction.
- No legal/accounting interpretation without primary/authoritative evidence.
