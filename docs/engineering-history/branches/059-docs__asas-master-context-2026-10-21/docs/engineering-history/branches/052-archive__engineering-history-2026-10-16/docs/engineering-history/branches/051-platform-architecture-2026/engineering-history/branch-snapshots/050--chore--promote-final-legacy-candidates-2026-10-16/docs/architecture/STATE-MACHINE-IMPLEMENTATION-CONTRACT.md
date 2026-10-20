# ASAS — State Machine Implementation Contract

> **WORKING ARTIFACT NOTICE (2026-10-16):** Preserved from `foundation/repository-file-organization-v1`. Classified as `PROPOSED IMPLEMENTATION CONTRACT`; it is not a source of approved architecture decisions and cannot close C2-001, GATE-00/GATE-03, or authorize schema, migration, RLS, application or production changes. Reconcile its references and statuses against current canonical artifacts before treating it as operationally binding.


**Status:** FOUNDATION WORKING CONTRACT
**Repository:** `asas-erp-saas-1/As`
**Date:** 2026-09-20

## Purpose

Define the non-negotiable implementation contract for lifecycle state machines before application implementation begins.

## Contract

```text
Command
  ↓
Authorization
  ↓
Load aggregate
  ↓
Validate legal transition
  ↓
Evaluate domain invariants
  ↓
Apply state change
  ↓
Append audit record
  ↓
Create domain event
  ↓
Persist aggregate + audit + outbox atomically
  ↓
Commit
  ↓
Idempotent consumers
```

## Rules

1. Generic CRUD endpoints must not mutate controlled lifecycle status.
2. Every controlled transition must exist in the state-machine register.
3. Illegal transitions must return typed/domain errors and leave state unchanged.
4. Authorization is evaluated before the mutation and within the tenant/workspace scope.
5. The aggregate invariant is evaluated by its owning domain boundary.
6. Audit and outbox records are part of the same database transaction as the source mutation.
7. Event names must use the registered past-tense event catalog.
8. Consumers are asynchronous unless a documented immediate response is required.
9. Consumers must be idempotent and retry-safe.
10. Expiry, cancellation, rollback and termination are explicit transitions, not direct status assignments.
11. A UI badge, API payload, ORM setter or database column is not itself a state-machine authority.
12. Tests must cover legal transitions, illegal transitions, authorization failure, tenant isolation, retry/idempotency, and event emission.

## Correctness-critical lifecycles

At minimum the implementation gate must explicitly cover:

- apartment availability/reservation/sale;
- lead lifecycle;
- opportunity pipeline;
- reservation lifecycle;
- contract lifecycle;
- payment-plan/installment lifecycle;
- approval lifecycle;
- appointment lifecycle;
- studio publication lifecycle;
- all additional registered state machines before their implementation task is authorized.

## Evidence standard

A lifecycle is `VERIFIED` only when its state-machine definition, ownership, command path, authorization, persistence transaction, event emission, audit behavior and tests are evidenced. Documentation alone is insufficient for runtime verification.

## Freeze rule

Until the foundation gate closes, this document is a design contract only. It does not authorize schema changes, migrations, or application implementation.
