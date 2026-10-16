# ADR-0037 — Finance Canonical Semantics

**Status:** ACCEPTED / SEMANTIC / IMPLEMENTATION BLOCKED
**Date:** 2026-09-27
**Branch:** `platform-architecture-2026`

## Context

Finance must preserve monetary truth independently from CRM/Sales projections. The platform must support the Developer track and Brokerage track without conflating sale price, payment settlement, commission entitlement, and payout.

## Decisions

### 1. Commercial-to-Finance boundary

A financial obligation is created only by an authoritative commercial milestone defined by the governing Sales/Contract policy. Reservation may carry commercial terms and eligibility facts, but it is not by itself proof of payment or ledger settlement.

Contract/payment-plan activation is the normal boundary for contractual receivables. Any jurisdiction-specific exception remains governed by the applicable country/legal pack.

### 2. PaymentPlan / Installment / Payment / Receipt

- **PaymentPlan:** ordered schedule of contractual payment obligations.
- **Installment:** one obligation within a PaymentPlan, with due date, amount, currency and status.
- **Payment:** settlement fact received/recognized against one or more obligations.
- **Receipt:** controlled evidence/document of an accepted payment fact; it is not the accounting obligation itself.

A Payment does not rewrite the Installment. It settles or partially settles an obligation.

### 3. Amount representation

DZD internal monetary amounts use integer centimes as the canonical exact representation. Future currencies use an explicit currency code plus the currency's supported minor-unit precision; floating-point monetary storage is prohibited for authoritative financial facts.

### 4. Price revision

A later price version never rewrites a contracted/reserved historical economic fact. Repricing after contract requires an explicit authorized adjustment, amendment, credit/debit fact, or other policy-defined financial event.

### 5. Ledger integrity

Posted double-entry accounting facts are immutable. Corrections are represented by new entries (reversal/adjustment) rather than mutation of posted history.

Posting invariant:

`SUM(debits) = SUM(credits)`

A journal cannot become posted unless all required lines, period, currency and authorization invariants pass.

### 6. Accounting periods

Posted entries belong to an explicit accounting period. Closed periods cannot be silently edited. A correction affecting a closed period uses the governed correction/reversal mechanism and required authorization.

### 7. Developer economics

Developer-track receivables derive from the authoritative Contract/PaymentPlan and its approved amendments. Construction-progress milestones may drive payment eligibility where the applicable contract/legal policy requires it, but construction state itself is not a ledger posting.

### 8. Brokerage commission

Commission is Finance-owned. Sales supplies the authorized attribution and commercial milestone facts; Finance derives entitlement under a policy version. Entitlement, payable and paid are distinct states/facts.

A later attribution correction does not rewrite posted historical commission facts; it produces an authorized correction/reconciliation fact.

### 9. Payment idempotency

Recording a payment must have a deterministic idempotency boundary. A repeated notification for the same provider/reference/payment command cannot create a duplicate financial settlement.

Same idempotency key + same semantic command returns the committed result; same key + conflicting command is rejected deterministically.

### 10. Reconciliation

Bank, cash and payment-provider statements are external evidence sources. Reconciliation creates controlled matching/reconciliation facts; it does not mutate the underlying commercial or posted ledger history.

### 11. Reporting

Authoritative financial reports derive from posted ledger truth or explicitly identified Finance-owned projections. Commercial dashboards may show operational projections but must not masquerade as accounting truth.

### 12. Human-only controls

Financial correction, manual journal adjustment, period reopening, and other high-impact accounting controls remain human-authorized operations unless a later governance decision explicitly delegates a narrower action.

AI may explain, reconcile, classify, or draft within caller authority but cannot bypass approval or directly rewrite posted financial truth.

## Explicit deferrals

The following are intentionally deferred to named authorities rather than guessed:

- Algeria-specific accounting/legal treatment of particular transaction types;
- exact statutory invoice/receipt requirements;
- VAT/tax treatment;
- country-specific payment milestone rules;
- chart-of-accounts template;
- approval thresholds and delegation matrix.

These require current primary/authoritative evidence and/or Founder/accounting/legal policy before implementation.

## Consequences

Finance becomes an integrity boundary with a clean handoff from Sales and a controlled bridge to reporting. The model supports Developer and Brokerage economics without turning every commercial state change into an accounting entry.

No database schema is implied by this ADR. Concrete tables, constraints, locking, posting functions and RLS remain implementation-gated by Foundation Gates and live brownfield reconciliation.