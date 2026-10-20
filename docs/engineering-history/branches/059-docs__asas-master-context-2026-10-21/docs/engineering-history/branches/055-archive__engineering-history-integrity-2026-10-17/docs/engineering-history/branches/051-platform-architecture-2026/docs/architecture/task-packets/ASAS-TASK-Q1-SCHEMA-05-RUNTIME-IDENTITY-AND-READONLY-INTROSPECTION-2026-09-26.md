# ASAS — Q1-SCHEMA-05 Runtime Identity & Read-Only Introspection

**Branch:** `platform-architecture-2026`  
**Status:** READY / EVIDENCE-GATED  
**Depends on:** C03.13 Brownfield Persistence Reconciliation  

## Objective

Establish runtime truth for the pre-existing database without changing production state.

## Mandatory sequence

```text
REALITY LOCK
→ identify Supabase/project/environment
→ verify connection target
→ read-only metadata introspection
→ capture evidence
→ reconcile repository observations
→ update drift matrix
```

## Evidence to capture

### Identity

- Supabase project identity
- environment
- database host/target identity without exposing secrets
- current schema/search path
- database version

### Structure

- tables
- columns
- data types
- nullability
- PKs
- FKs
- unique constraints
- indexes
- partial indexes
- checks
- triggers
- views
- materialized views
- functions involved in mutation/state enforcement

### Security

- RLS enabled/disabled per relevant table
- policies
- roles/grants relevant to application access

### Operational history

- migration tables
- migration ordering
- drift indicators
- orphaned/legacy structures

### Domain focus

Explicitly map observed structures to:

`projects → buildings → apartments/units → listings/properties → offers → holds → reservations → prices → outbox → audit`

## Prohibited actions

- `DROP`
- `TRUNCATE`
- `ALTER ... DROP`
- rename operations
- destructive data cleanup
- production migration
- reset commands
- seeding into production
- changing RLS policies

## Required outputs

1. `ASAS-RUNTIME-IDENTITY-EVIDENCE-2026-09-26.md`
2. updated `ASAS-BROWNFIELD-DRIFT-MATRIX-2026-09-26.md`
3. `ASAS-SCHEMA-RECONCILIATION-REPORT-2026-09-26.md`
4. explicit list of unresolved runtime blockers

## Completion rule

Do not mark runtime reality verified from documentation alone. A live introspection result must exist and be attributable to the target environment.

## Engineering note

This task is intentionally read-only. It converts the current uncertainty from an architectural blocker into an evidence set. Schema design and migration remain subsequent tasks.