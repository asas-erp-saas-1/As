# ASAS — BROWNFIELD REPOSITORY REALITY 2026-09-26

**Status:** ACTIVE / EVIDENCE REGISTER  
**Branch:** `platform-architecture-2026`

The current branch is repository-verifiable, but live database identity is not established by repository evidence. Therefore this document does not make runtime claims.

## Verified repository facts

- Repository: `asas-erp-saas-1/As`.
- Active architecture branch: `platform-architecture-2026`.
- Current inspected HEAD before this change: `02b9e0f270a7a2256890a24074106f7a32899f0e`.
- `AGENTS.md` is present and requires database reality to outrank documentation for pre-existing persistence.
- `schema/asas-contracts.index.json` is present and explicitly states that it is reconciliation evidence, not an executable schema contract.
- The index records historical `59 models / 16 enums / 15 indexes` versus observed source `59 models / 17 enums / 56 indexes`; this discrepancy remains unresolved.
- No executable `schema/asas-contracts.prisma` is promoted by the current control plane.
- No live database introspection evidence is present in the inspected repository state.

## C03 persistence questions

Before schema promotion, reconcile Project, Building, Floor, Unit/Apartment, Property, Listing, Owner/Mandate, Offer, Hold, Reservation, price versions, Inventory Batch, outbox, audit, tenant ownership, RLS and migration history against actual repository/runtime evidence.

## Historical-source warning

The schema-promotion protocol records that the measured v1.6.1 candidate source has no standalone Prisma models named `Developer`, `Project`, `Building`, or `Floor`, while other candidate structures reference `building_id`. This is a reconciliation question, not permission to create tables.

## Status

`PARTIAL / BLOCKED` for runtime persistence truth.

Next authorized work: `Q1-SCHEMA-03/04 — Brownfield Persistence Reconciliation`.

No production migration, reset, drop, truncate, blind schema generation, or destructive rename is authorized by this artifact.