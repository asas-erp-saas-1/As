# ASAS Source Register Structural Reconciliation — 2026-09-20

Status: VERIFIED STRUCTURAL OBSERVATION / SEMANTIC PROMOTION PENDING
Authority source: `ASAS-AI-PACKAGE-v1.6.1/02-HANDOFF/registers/tasks.json` and `02-HANDOFF/schema/asas-contracts.prisma`
Repository: `asas-erp-saas-1/As`

## 1. Task register

Direct parse of the authoritative v1.6.1 source file produced:

- 14 phases: P, 0, 1, 1.5, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
- 119 unique phase task records
- 3 recurring ritual records: T-R.1, T-R.2, T-R.3
- 122 unique `T-*` identifiers when rituals are included
- 0 duplicate task IDs
- 0 nested task IDs
- phase counts: P=9, 0=11, 1=9, 1.5=2, 2=14, 3=12, 4=9, 5=8, 6=12, 7=10, 8=5, 9=7, 10=5, 11=6

The historical declaration of 114 phase tasks is therefore a real +5 discrepancy, but the current source file itself is structurally unambiguous: 119 phase tasks. The earlier repository statement of 121 task IDs including nested records was incorrect; no nested task IDs were found in the direct source parse.

### Task schema limitation

The source task records contain only four fields:

- `id`
- `title`
- `contracts`
- `evidence`

They do not contain explicit machine-readable fields for capability, bounded context, dependencies, actor, permission, data boundary, state transitions, invariants, transaction boundary, idempotency, concurrency, migration impact, UX impact, acceptance criteria, or definition of done.

Therefore the source task register is a **source task list**, not a complete implementation task-packet system. A task-packet layer must be derived later without altering the source task semantics.

## 2. Schema contract

Direct parse of the authoritative v1.6.1 Prisma contract produced:

- 59 unique models
- 17 unique enums
- 56 `@@index` declarations
- 22 `@@unique` declarations
- 19 `@relation(...)` annotations
- 0 duplicate model names
- 0 duplicate enum names

The historical repository summary of 59 models / 16 enums / 15 indexes is therefore stale relative to the inspected v1.6.1 source contract.

### Promotion constraint

The source contract is authoritative for this reconciliation, but the repository must not treat the contract as an executable production schema. The repository currently has only `schema/asas-contracts.index.json`; `schema/asas-contracts.prisma` is not present in the audited foundation tree.

Before any schema implementation is authorized, the complete source contract must be promoted as a provenance-preserving derived artifact and then separately reconciled against the verified live database, if and when the canonical runtime identity is established.

## 3. Important non-equivalence

The following are intentionally kept separate:

`source task register != implementation task packets`

`source Prisma contract != live database`

`source Prisma contract != migration history`

`derived register != runtime enforcement`

`documented architecture != implemented application`

## 4. Closure state

- Task structural count: **VERIFIED**
- Task semantic task-packet completeness: **OPEN**
- Schema structural counts: **VERIFIED**
- Schema executable repository promotion: **OPEN**
- Live database reconciliation: **BLOCKED** until canonical runtime identity is proven
- Application implementation authorization: **BLOCKED**

## 5. Evidence

The observations were independently parsed from the supplied v1.6.1 package on 2026-09-20. No production database was queried or modified during this reconciliation.
