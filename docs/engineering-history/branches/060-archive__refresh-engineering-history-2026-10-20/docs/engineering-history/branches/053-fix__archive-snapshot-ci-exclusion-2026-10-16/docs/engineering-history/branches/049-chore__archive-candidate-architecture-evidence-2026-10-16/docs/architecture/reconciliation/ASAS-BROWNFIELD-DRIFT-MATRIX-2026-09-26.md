# ASAS — Brownfield Drift Matrix

**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  
**Status:** ACTIVE / EVIDENCE-GATED  

## Purpose

This document is the controlled comparison surface between ASAS target architecture, repository/source observations, migration history, and runtime database reality.

It does not invent runtime facts. A cell marked `UNVERIFIED` requires evidence before implementation authorization.

## Authority order

1. Live database introspection for pre-existing brownfield structure.
2. Blueprint contracts / appendices.
3. Canonical V3 architecture and ADRs.
4. Registers.
5. Existing repository implementation.
6. General engineering practice, explicitly labeled.

## Current evidence state

| Area | Target semantic | Repository/source evidence | Live DB evidence | Status | Required action |
|---|---|---|---|---|---|
| Project | First-class development object | Contract/ADR | UNVERIFIED | OPEN | Introspect tables, columns, FKs, indexes |
| Building | Structural object under Project when applicable | Contract/ADR | UNVERIFIED | OPEN | Introspect existing `buildings` representation |
| Floor | Optional structural level entity | Contract/ADR | UNVERIFIED | OPEN | Search runtime/source for floor representation |
| Unit / Apartment | Canonical development inventory resource | Domain contract + historical implementation evidence | UNVERIFIED | OPEN | Reconcile `apartments`/`units` semantics |
| Listing | Brokerage representation, not Unit | Contract/ADR | UNVERIFIED | OPEN | Locate listing/property/mandate persistence |
| Offer | Commercial transaction precursor | V3 / registers | UNVERIFIED | OPEN | Locate offer persistence and state handling |
| Hold | Temporary inventory claim | V3 / reservation doctrine | UNVERIFIED | OPEN | Locate hold persistence / expiry semantics |
| Reservation | Single-winner transactional boundary | ADR-0034 | UNVERIFIED | BLOCKED | Verify actual reservation persistence before choosing enforcement |
| Pricing | Versioned commercial fact | ADR-0032 | UNVERIFIED | BLOCKED | Locate current price + historical/version structures |
| Inventory lifecycle | Event/state controlled | ADR-0033 | UNVERIFIED | BLOCKED | Reconcile state columns/events/register |
| Outbox | Transactional publication | V3 | UNVERIFIED | BLOCKED | Locate outbox table and transaction boundary |
| Audit | Immutable/auditable security history | V3 / Blueprint | UNVERIFIED | BLOCKED | Locate audit schema and mutation path |
| Tenant / RLS | Tenant isolation and server-side authorization | V3 / AGENTS | UNVERIFIED | BLOCKED | Verify live policies, roles, predicates |

## Repository facts currently established

- The active branch is `platform-architecture-2026`.
- The current repository tree is a control-plane / architecture repository; a root `src/` application tree was not observed in the inspected tree.
- `schema/asas-contracts.index.json` exists and explicitly requires reconciliation before executable schema promotion.
- An executable `schema/asas-contracts.prisma` was not observed in the inspected branch tree.
- Historical model/count observations are not treated as live database proof.
- No production schema/RLS migration is authorized by this matrix.

## Required evidence packet

The brownfield investigation must collect, without destructive changes:

1. database identity and environment identity;
2. exact table inventory;
3. columns and data types;
4. primary keys;
5. foreign keys;
6. unique constraints/indexes;
7. partial indexes;
8. check constraints;
9. triggers/functions relevant to state mutation;
10. RLS enabled state and policies;
11. views/materialized views;
12. migration history;
13. representative row counts and nullability anomalies;
14. existing application/ORM references;
15. existing event/outbox/audit structures.

## Safety rules

- Read-only inspection first.
- No DROP/TRUNCATE/RENAME.
- No production migration.
- No schema reset.
- No generated ORM schema promoted as truth without reconciliation.
- No claim of live verification without an actual runtime evidence artifact.

## Exit criteria

C03.13 may close only when every critical row above has either:

- verified runtime evidence;
- an explicit `NOT APPLICABLE` determination with rationale; or
- an approved ADR describing the unavoidable gap and implementation boundary.

Only then may an executable schema contract and migration plan be authorized.