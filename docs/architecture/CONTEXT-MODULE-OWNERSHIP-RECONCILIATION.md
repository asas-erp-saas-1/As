# ASAS — Context → Module Ownership Reconciliation

**Status:** PROPOSED — depends on acceptance of ADR-0021
**Date:** 2026-09-19
**Repository:** `asas-erp-saas-1/As`

## Purpose

This document is the controlled mapping contract between the canonical bounded-context direction and the existing implementation-module specification.

It intentionally does **not** declare implementation ownership as closed. It establishes the method and the currently evidence-backed classifications so that implementation cannot infer ownership from filenames or schema names.

## Canonical context frame

Subject to ADR-0021 acceptance, the domain ownership frame is:

1. Core / Platform
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

## Reconciliation rule

`Bounded Context ≠ Implementation Module ≠ PostgreSQL Schema ≠ Aggregate ≠ Read Model ≠ Worker ≠ Event Consumer`

Every implementation module must receive one of these classifications before schema or application implementation:

- BUSINESS_CONTEXT
- CROSS_CONTEXT_MODULE
- READ_MODEL
- WORKER / EVENT_CONSUMER
- INFRASTRUCTURE
- SHARED_KERNEL
- UNRESOLVED

`UNRESOLVED` is a valid temporary state. It is not permission to guess.

## Current 15-module evidence set

The existing implementation specification identifies 15 modules/schemas. The names below are retained as implementation evidence, not promoted to bounded contexts:

| Module / schema | Preliminary classification | Canonical context owner | State |
|---|---|---|---|
| Lead & CRM | BUSINESS_CONTEXT | CRM | PROPOSED |
| Property & Inventory | BUSINESS_CONTEXT | Inventory | PROPOSED |
| Visit Management | BUSINESS_CONTEXT / submodule | CRM | PROPOSED |
| Reservation & Contract | BUSINESS_CONTEXT | Sales | PROPOSED |
| Payment & Finance | BUSINESS_CONTEXT | Finance | PROPOSED |
| Commission & Payout | BUSINESS_CONTEXT | Finance | PROPOSED |
| Communication | CROSS_CONTEXT_MODULE | UNRESOLVED | OPEN |
| Identity / Access / Workspace | CROSS_CONTEXT_MODULE | Core / Platform | PROPOSED |
| Notification | WORKER / CROSS_CONTEXT_MODULE | UNRESOLVED | OPEN |
| Collaboration | CROSS_CONTEXT_MODULE | UNRESOLVED | OPEN |
| Calendar / Scheduling | BUSINESS_CONTEXT / submodule | CRM | PROPOSED |
| Activity / Audit | CROSS_CONTEXT / infrastructure | Core / Platform | PROPOSED |
| Search | READ_MODEL | UNRESOLVED | OPEN |
| Reporting | READ_MODEL | Analytics | PROPOSED |
| Workflow Engine | CROSS_CONTEXT_MODULE | Core / Platform | PROPOSED |

These classifications are deliberately provisional where the recovered source package does not provide sufficient ownership evidence.

## Explicit non-inferences

- Visit Management does not become a tenth bounded context merely because it has a module name.
- Calendar / Scheduling does not become a tenth bounded context merely because scheduling exists as a named capability; the accepted source architecture places scheduling under CRM unless a later ADR proves otherwise.
- Search and Reporting are not automatically business-rule owners.
- Activity / Audit is not automatically a business context; audit infrastructure must remain cross-cutting and authoritative.
- Notification is not automatically a business context.
- Workflow Engine is not automatically a business context.

## Required next evidence

Before this mapping can become canonical:

1. Accept ADR-0021.
2. Retrieve/verify the complete accepted source-package context definitions and module decomposition.
3. For each module, identify responsibilities and explicit non-responsibilities.
4. Assign aggregate ownership.
5. Assign event producer/consumer ownership.
6. Assign permission authority.
7. Map module to target schema ownership.
8. Map canonical task IDs to each ownership decision.
9. Record unresolved cross-context dependencies.
10. Run repository-wide reference audit before changing any architecture claims.

## Gate rule

No Prisma model, migration, database mutation, or application implementation may rely on a row marked `OPEN` or `UNRESOLVED`.

## Closure criteria

This document becomes `VERIFIED` only when:

- ADR-0021 is accepted;
- every module has an evidence-backed classification;
- every business module has a canonical context owner;
- read models/workers/infrastructure are separately identified;
- aggregate/event/permission/schema/task mappings exist;
- conflicting active references are classified and reconciled;
- verification evidence is recorded in the canonical checkpoint.
