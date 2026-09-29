# ASAS — Brownfield Forensic Scope

**Date:** 2026-09-26  
**Branch:** `platform-architecture-2026`  
**Status:** ACTIVE / EVIDENCE-GATED

## Objective

Establish the smallest defensible evidence set for the existing persistence/runtime layer before any executable schema, RLS, reservation implementation, or production migration is authorized.

## Repository evidence currently established

- The current branch is a control-plane / architecture-governance repository.
- `AGENTS.md` is present and defines reality-first, contract-first, evidence-gated execution.
- `.agents/skills/asas-repository-forensics/SKILL.md` and `.agents/skills/asas-database-engineering/SKILL.md` are present.
- `schema/asas-contracts.index.json` is present.
- `schema/asas-contracts.prisma` is not currently promoted in the branch tree.
- The schema index is explicitly reconciliation-controlled; source-package model counts are not live-database evidence.
- Foundation CI exists.
- The branch does not currently expose a root `src/` application tree in the inspected repository tree.

## Required forensic questions

### Persistence identity

- Which Supabase/PostgreSQL project/database is the authoritative runtime for this ASAS environment?
- Which environment is being inspected: local, staging, production, or another controlled target?
- What migration history belongs to that exact database?

### Inventory

Locate and reconcile every representation of:

- Project
- Building
- Floor
- Unit / Apartment
- Property
- Listing
- Inventory Batch
- Pricing / Price Version
- Offer
- Hold
- Reservation
- Contract
- Payment / Receivable
- Outbox / Event
- Audit
- Organization / Tenant / Relationship

### Structural evidence

For each observed relation/table:

- columns and types;
- primary keys;
- foreign keys;
- unique constraints/indexes;
- partial indexes;
- check constraints;
- triggers;
- generated/default expressions;
- RLS enablement and policies;
- ownership/privilege evidence;
- migration provenance.

### Semantic reconciliation

Classify each observation as:

`TARGET | EXISTING | LEGACY | CONFLICT | MISSING | UNKNOWN`

Do not infer `EXISTING` from a migration file alone.

## Reservation-specific forensic questions

Before selecting a concurrency mechanism, establish:

1. actual Unit/Apartment persistence identity;
2. actual reservation persistence identity;
3. whether an active-reservation uniqueness invariant already exists;
4. whether Unit commercial state is persisted separately;
5. whether reservation and Unit consequence can be committed atomically;
6. existing idempotency fields/constraints;
7. expiration/release representation;
8. outbox/event representation;
9. existing RLS and tenant predicates;
10. existing transaction boundaries in application code.

## Pricing-specific forensic questions

Establish:

- current-price representation;
- historical price representation;
- effective-from/effective-to semantics;
- overlap protection;
- currency representation;
- amount precision/minor-unit representation;
- snapshot fields on Offer/Hold/Reservation/Contract;
- discount/override representation and approval evidence.

## Safety rules

This forensic scope is read-only by default.

It authorizes no:

- DROP;
- TRUNCATE;
- RESET;
- destructive migration;
- RLS change;
- data rewrite;
- production seed;
- schema promotion.

## Closure condition

This scope closes only when runtime identity and the required persistence evidence are captured and reconciled into a reviewed drift matrix. Until then, C03.13 remains `OPEN / EVIDENCE-GATED`.

## Provenance

Repository evidence is governed by the current branch. Historical source-package material is research/provenance input only until explicitly promoted. External engineering facts must be corroborated with authoritative documentation where consequential.
