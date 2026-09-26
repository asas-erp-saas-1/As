# ASAS Engineering Conference — C06 Finance

**Status:** OPEN / RESEARCH-FIRST / SEMANTIC DECISION WORK
**Branch:** `platform-architecture-2026`
**Depends on:** C02 attribution/commission semantics; C03 pricing/inventory semantics; C05 Sales semantics
**Implementation:** BLOCKED by Foundation Gates

## Objective

Close Finance semantics as an integrity boundary without implementing the ledger yet.

V3 defines Finance as a separate integrity domain: monetary values use integer centimes; posted double-entry entries are immutable; corrections are new entries; and the commercial transaction flows into payment obligations, payments, receipts, subledger, general ledger and reporting.

## Questions to close

### Commercial → Finance boundary
1. What exact Sales milestones create financial obligations?
2. What is the authoritative handoff from Reservation/Contract to Finance?
3. Which commercial terms are snapshots versus recalculable values?
4. What changes after Contract must create a new financial fact rather than rewrite history?

### Payment obligations
5. What is a PaymentPlan versus Installment versus Payment versus Receipt?
6. Which object is the legal/commercial obligation and which is settlement evidence?
7. Can an installment be rescheduled, waived, replaced or split?
8. What authorization is required for corrections?

### Ledger
9. What is the chart-of-accounts ownership boundary?
10. What creates a Journal/JournalEntry/JournalLine?
11. What posting invariants must be enforced?
12. What is the accounting period boundary?
13. What is the reversal/correction model?
14. What prevents mutation of posted entries?

### Developer-track economics
15. How are staged payments tied to contract/payment-plan milestones?
16. How do price revisions interact with already-contracted amounts?
17. How are late payments, penalties and adjustments represented?
18. What is the boundary between commercial penalty calculation and ledger posting?

### Brokerage economics
19. How is commission entitlement derived from Sales attribution?
20. When is commission earned versus payable versus paid?
21. How do mandate/project/agency agreements affect commission policy?
22. What happens when a transaction is cancelled after entitlement?

### Money and currency
23. Is AmountCentimes the canonical internal representation for DZD?
24. How are non-DZD currencies represented for future SaaS expansion?
25. What rounding rules apply to allocations, installments and commission calculations?

### Receipts and reconciliation
26. What makes a Receipt authoritative?
27. How are bank/cash/payment-provider reconciliation facts represented?
28. What is the idempotency boundary for recording a payment?
29. How are duplicate payment notifications handled?

### Audit / controls
30. Which financial actions require approval?
31. Which financial corrections are human-only?
32. Which events must be emitted transactionally with posting/payment recording?
33. What minimum audit evidence is required for a correction/reversal?

### Reporting
34. Which read models are Finance-owned?
35. Which reports derive from ledger truth versus commercial projections?
36. What consistency guarantees apply to dashboards and exports?

## Required outputs

- C06 ADR(s);
- Finance domain contract candidates;
- payment obligation/payment/receipt semantics;
- ledger invariants and posting policy;
- commission entitlement-to-payout boundary;
- correction/reversal model;
- finance event/permission/state deltas;
- reconciliation and idempotency test plan;
- traceability updates.

## Non-goals

- No live financial migration.
- No ledger implementation.
- No financial correction in production.
- No legal/accounting interpretation without primary/authoritative evidence.

## Closure gate

C06 can become SEMANTICALLY CLOSED only when every question is decided, explicitly deferred to a named policy/authority, rejected with rationale, or blocked by concrete evidence dependency. Implementation remains blocked until Foundation Gates 00–06 pass.
