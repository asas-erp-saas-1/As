---
name: asas-database-engineering
description: Engineer ASAS PostgreSQL schemas, constraints, migrations, RLS, idempotency and concurrency safely in a local-first workflow.
---

# Database Engineering

## Authority separation

`Domain Model ≠ Target Schema ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`.

## Sequence

```text
Domain contract
→ schema contract
→ local PostgreSQL
→ forward migration
→ clean replay
→ constraint tests
→ RLS tests
→ concurrency tests
→ backup/restore rehearsal where applicable
→ evidence
```

## Safety

Never run destructive production `DROP`, `TRUNCATE`, `RESET`, blind recreate or destructive rename. Never use a remote database as an undocumented design sandbox.

## Data correctness

Use explicit ownership, tenant scope, timestamps, foreign keys, unique constraints, indexes and deletion semantics. Financial facts require integer minor units, explicit currency/rounding, balanced postings, immutability and reversal/new-fact correction.

## Concurrency

Model races explicitly for inventory reservations, payment allocation, idempotent commands and any uniqueness-sensitive mutation. Prefer database-enforced constraints where appropriate; application checks alone are insufficient for critical races.

## RLS

RLS is defense-in-depth. Server authorization and tenant scoping remain mandatory. Test positive and negative access paths, cross-tenant access, worker/service identities and privileged support paths.

## Migration closure

`introspect → capture → drift inventory → compare → ADR → plan → backup verification → rehearsal → forward migration → verification → evidence`.
