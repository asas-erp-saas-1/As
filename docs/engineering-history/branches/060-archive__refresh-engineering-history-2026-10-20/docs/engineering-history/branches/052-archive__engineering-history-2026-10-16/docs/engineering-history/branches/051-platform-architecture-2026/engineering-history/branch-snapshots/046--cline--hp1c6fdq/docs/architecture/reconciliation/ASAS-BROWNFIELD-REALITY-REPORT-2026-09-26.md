# ASAS — Brownfield Reality Report

**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  
**Purpose:** establish repository-observed facts before schema promotion or implementation.

## 1. Authority rule

The architecture source-of-truth chain is:

`Founder/Product Constitution → Architecture → Contracts → Registers → Repository → Runtime → Evidence`

For brownfield reality, runtime/database evidence wins only after runtime identity is independently established. Documentation must never be edited merely to make it agree with an unverified implementation.

## 2. Repository observations — verified on current branch

| Surface | Observation | Status |
|---|---|---|
| Repository | `asas-erp-saas-1/As` | VERIFIED |
| Architecture branch | `platform-architecture-2026` | VERIFIED |
| Current branch HEAD at inspection | `2d371b8b49c80dda70d1912e1d60e6a4af8ee225` | VERIFIED at inspection; refresh before mutation |
| Root application `src/` | Not present in the inspected branch tree | VERIFIED |
| Root schema contract | `schema/asas-contracts.index.json` present | VERIFIED |
| Executable `schema/asas-contracts.prisma` | Not present in inspected branch tree | VERIFIED |
| `.agents/skills` | ASAS engineering/repository/database/security/testing/etc. skills present | VERIFIED |
| Foundation CI | `.github/workflows/foundation-verify.yml` present and targets `platform-architecture-2026` pushes | VERIFIED |
| Canonical session state | `docs/handoff/CURRENT-SESSION-STATE.md` present | VERIFIED |

## 3. Schema-contract reality

`schema/asas-contracts.index.json` declares:

- historical planning shape: 59 models / 16 enums / 15 indexes;
- verified source observation: 59 models / 17 enums / 56 indexes;
- the 59/17/56 observation is **not promoted as an executable contract**;
- promotion is blocked until complete source extraction, internal consistency validation, and reconciliation against the historical declaration.

Therefore:

> **59/17/56 is provenance evidence, not executable database truth.**

## 4. Existing implementation claims versus repository evidence

The historical/architectural source material describes an existing production database with 15 live tables and known Prisma/Supabase drift. That statement is retained as source evidence, but this branch inspection did not establish a live connection or independently verify the current database identity/schema.

Accordingly, the following remain **UNVERIFIED RUNTIME FACTS** until live introspection is performed against an independently identified environment:

- current production Supabase project identity;
- current database server identity/version;
- current schemas/tables/columns;
- primary and unique constraints;
- foreign keys;
- indexes;
- RLS policies;
- triggers/functions;
- current row counts/data-quality conditions;
- current Unit/Apartment/Reservation persistence;
- actual reservation uniqueness enforcement;
- actual outbox implementation.

## 5. Domain-to-persistence evidence matrix

| Domain concept | Target semantic status | Repository executable evidence | Runtime evidence | Action |
|---|---|---|---|---|
| Project | Semantically closed | No executable model verified in this branch | Unverified | Inspect runtime before schema decision |
| Building | Semantically closed | No executable model verified in this branch | Unverified | Inspect runtime before schema decision |
| Floor | Semantically closed | No executable model verified in this branch | Unverified | Inspect runtime before schema decision |
| Unit / Apartment | Semantically closed | No executable model verified in this branch | Unverified | Inspect runtime + map legacy apartment representation |
| Listing | Semantically closed | No executable model verified in this branch | Unverified | Reconcile target Listing with existing property/inventory representation |
| Offer | Semantically closed | No executable model verified in this branch | Unverified | Locate runtime representation |
| Hold | Semantically closed | No executable model verified in this branch | Unverified | Locate runtime representation |
| Reservation | Semantically closed | No executable model verified in this branch | Unverified | Locate runtime representation and constraints |
| Price version | Semantically closed | No executable model verified in this branch | Unverified | Locate price/history representation |
| Inventory Batch | Not yet implementation-closed | No executable model verified | Unverified | Continue C03.11/C03.13 reconciliation |
| Outbox | Architectural requirement | No executable model verified in this branch | Unverified | Verify actual publisher/storage path |
| RLS / tenant isolation | Architectural requirement | No executable model verified in this branch | Unverified | Runtime security gate required |

## 6. Critical brownfield rule

Do **not** create new `projects`, `buildings`, `floors`, `units`, `reservations`, or `outbox_events` tables merely because the target architecture names those concepts.

The next implementation step must first identify whether the legacy `projects`, `buildings`, `apartments`, or related structures exist in the live database and determine their actual constraints, relationships, data quality, and application consumers.

## 7. Prisma/introspection discipline

Prisma introspection is appropriate for an existing relational database, but `prisma db pull` rewrites the Prisma schema from database reality and therefore requires the existing contract to be backed up/committed before use. The ASAS repository rule is stronger: introspection must occur only after the correct database identity is established and must not be used to silently replace the canonical target contract.

## 8. No authorization to migrate

This report does **not** authorize:

- schema creation;
- destructive migration;
- table rename/drop;
- RLS rollout;
- reservation locking changes;
- production data correction;
- contract promotion.

Those actions require their respective gates, ADRs, evidence, and where applicable human authority.

## 9. Next evidence packet

The next task is **Q1-SCHEMA-03/04 — Brownfield Persistence Reconciliation**:

1. independently establish the target database identity;
2. introspect the live/dev database read-only;
3. export tables, columns, types, PK/FK, unique constraints, indexes, RLS, triggers and functions;
4. inspect relevant row counts and null/orphan conditions;
5. map legacy `apartments` and related entities to the closed Unit semantics;
6. locate Reservation/Offer/Hold/Listing/Price persistence if present;
7. compare runtime reality against the 59/17/56 source observation;
8. produce a drift matrix;
9. only then propose an executable schema contract.

## 10. Evidence standard

A claim is marked `VERIFIED` only when the evidence source is explicit and reproducible. Architectural intent is not runtime proof. A missing artifact is not evidence that the corresponding runtime object does not exist.
