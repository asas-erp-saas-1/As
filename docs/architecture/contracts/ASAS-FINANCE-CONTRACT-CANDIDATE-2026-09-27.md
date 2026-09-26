# ASAS Finance Contract Candidate — 2026-09-27

**Status:** CANDIDATE / SEMANTICALLY CLOSED / NOT IMPLEMENTATION AUTHORITY
**Branch:** `platform-architecture-2026`

## Canonical ownership

Finance owns:

- payment obligations;
- payment settlement facts;
- receipt evidence;
- posted ledger facts;
- commission entitlement/payable/paid facts;
- financial reconciliation facts;
- Finance-owned financial projections.

Sales owns the commercial facts that trigger or qualify the Finance handoff. Documents owns document lifecycle. Construction owns construction facts. Platform owns identity, authorization, audit and transactional infrastructure primitives.

## Core relationships

```text
Contract / approved commercial milestone
            ↓
      PaymentPlan
            ↓
        Installment
            ↓
Payment ─────────→ Receipt
            ↓
      Settlement / Reconciliation
            ↓
      Accounting posting
            ↓
     Journal / JournalEntry
            ↓
      Finance reporting
```

Commission:

```text
Sales attribution + commercial milestone
            ↓
      Finance policy version
            ↓
      Commission entitlement
            ↓
        Payable
            ↓
          Paid
```

## Invariants

1. Authoritative monetary values are exact integer minor units plus currency.
2. Posted entries are immutable.
3. Every posted journal balances debits and credits.
4. Corrections create new financial facts.
5. Closed accounting periods cannot be silently rewritten.
6. A payment cannot settle an unknown obligation without an explicit authorized treatment.
7. Duplicate payment notifications cannot create duplicate settlement facts.
8. Commission entitlement is distinct from commission payout.
9. Historical contracted economics are not rewritten by later price versions.
10. Financial projections cannot mutate financial authority.

## Implementation boundary

This contract does not authorize schema creation, ledger implementation, payment-provider integration, tax configuration, or production financial correction. Those require Foundation Gates, current authoritative country/accounting evidence, and the applicable approval controls.