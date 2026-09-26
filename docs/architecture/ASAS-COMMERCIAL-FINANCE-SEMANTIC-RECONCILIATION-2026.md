# ASAS — COMMERCIAL / FINANCE SEMANTIC RECONCILIATION 2026

**Artifact ID:** ASAS-ARCH-SEMANTIC-RECON-2026-001  
**Status:** DERIVED ARCHITECTURAL CONTRACT — OPEN / IMPLEMENTATION BLOCKED  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Owner:** Domain Architecture / Sales & Finance Engineering  
**Authority:** Source reconciliation only. This artifact does not override approved ADRs, founder decisions, canonical registers, live runtime or live database.

## 1. Purpose

Resolve semantic ambiguity discovered between the V3 commercial vocabulary and the v1.6.1 source schema contract before any schema promotion or application implementation.

The key rule is:

**A domain term, event name or workflow label does not automatically imply a database aggregate.**

## 2. Offer

The source schema contract explicitly defines `Offer` under the CRM & Sales section. It has:

- organization scope;
- opportunity ownership;
- apartment/unit reference;
- list-price snapshot;
- discount percentage;
- server-computed effective price;
- status;
- validity deadline;
- optional document reference.

This is stronger evidence than the earlier Enterprise Domain Model alone provides.

### Architectural classification

`Offer = SUPPORTED AGGREGATE CANDIDATE`

`Domain grouping = Sales`

`Relationship = Offer belongs to an Opportunity and targets an Apartment/Unit`

### Still OPEN

The source establishes persistence semantics but does not, by itself, close:

- final aggregate command vocabulary;
- discount approval authority matrix;
- complete state-transition contract;
- concurrency semantics for competing offers;
- event mapping;
- exact permission keys.

Therefore Offer is not implementation-authorized merely because the schema contract contains a model.

## 3. Payment terminology reconciliation

The source schema contract does **not** define a standalone `Payment` model in the inspected finance section. It defines:

`PaymentPlan`
→ reusable schedule template

`PaymentScheduleItem`
→ contract-bound payment obligation/installment

`Receipt`
→ recorded received-money fact at launch

`ReceiptAllocation`
→ allocation of received money to schedule items

The source ADR for launch payment posture explicitly selects manual collection with receipt recording and reconciliation, with online SATIM/CIB deferred until evidence-based revisit triggers are met.

### Architectural interpretation

For the current launch posture:

```text
Contract
  ↓
PaymentPlan / instantiated schedule
  ↓
PaymentScheduleItem
  ↓
Receipt
  ↓
ReceiptAllocation
  ↓
Finance / Ledger posting where authorized
```

This resolves the earlier naming ambiguity sufficiently for architecture purposes:

**Do not create a standalone Payment aggregate/table merely because V3 uses the word `Payment`.**

`Payment` should remain a domain vocabulary term until a distinct authoritative business fact requires an independent aggregate.

## 4. Receipt classification

The source schema gives Receipt its own identity and audit-relevant attributes, but that alone does not prove it must be a classic DDD aggregate.

Current classification:

`Receipt = SUPPORTED BUSINESS RECORD / AGGREGATE CANDIDATE`

The final aggregate classification depends on whether receipt lifecycle transitions and invariants require an independent consistency boundary.

What is already supported:

- receipt belongs to an organization;
- receipt references a contract;
- amount and currency are explicit;
- received timestamp and receiver are recorded;
- reconciliation status/evidence exists;
- allocations connect received money to schedule obligations.

## 5. Financial invariants already supported by source

### FIN-001
Schedule item amounts must reconcile to the contract price according to the source rule.

### FIN-002
Receipt allocations must reconcile received money to schedule items without creating unsupported collection.

### FIN-003
Financial posting uses integer minor-unit monetary representation with explicit currency.

### FIN-004
Posted ledger facts are append-only; corrections use new facts/reversals.

### FIN-005
Double-entry postings balance within defined currency/rounding semantics.

### FIN-006
Launch payment collection is manual; the platform records/reconciles receipts rather than pretending to execute online payment processing.

## 6. Reservation → Contract → Finance dependency

The supported commercial dependency is:

```text
Lead / Opportunity
      ↓
Offer
      ↓
Reservation
      ↓
Contract
      ↓
Payment Plan / Schedule Items
      ↓
Receipt
      ↓
Receipt Allocation
      ↓
Ledger / Reporting
```

Each arrow represents a business prerequisite or relationship, not necessarily a synchronous database transaction.

## 7. Architecture consequence

The previous OPEN item:

`Payment vs PaymentSchedule vs Receipt semantics`

is now reclassified as:

**PARTIALLY CLOSED — source semantics reconciled; executable finance contract remains OPEN.**

Remaining finance closure requires:

1. ledger aggregate/posting boundary;
2. receipt lifecycle/state semantics;
3. allocation invariants;
4. permission/approval mapping;
5. event mapping;
6. idempotency strategy;
7. reconciliation failure semantics;
8. test/evidence plan.

## 8. Non-goals

This document does not:

- authorize Prisma schema changes;
- authorize production migrations;
- invent a Payment table;
- choose payment gateway integrations;
- provide legal interpretation;
- replace ADR-0005 or ADR-0013.

## 9. Next dependency

Continue H1.4 with:

1. Offer command/state/permission/event contract;
2. Building ownership/invariants;
3. receipt/allocation/ledger contract;
4. Scheduling ADR reconciliation;
5. query/read-model contracts.
