# ASAS — Q1 Building Persistence Forensic Trace Plan 2026

**Artifact ID:** ASAS-Q1-BLD-PERSISTENCE-TRACE-2026-001  
**Status:** ACTIVE / FORENSIC / IMPLEMENTATION BLOCKED  
**Date:** 2026-09-24  
**Owner:** Principal Architecture  
**Parent:** `ASAS-SCHEMA-CONTRACT-PROMOTION-PROTOCOL-2026.md`  
**Related decision:** `ASAS-BUILDING-PERSISTENCE-IDENTITY-DECISION-2026.md`

## Objective

Determine the actual brownfield representation of Project, Building, Floor and Unit before any target-schema promotion or implementation authorization.

## Trace surface

Search and reconcile all occurrences of:

- `building_id`
- `project_id`
- `floor_number`
- `floor_id`
- `buildingId`
- `projectId`
- `floorId`
- `building`
- `floor`
- project/building/floor-like legacy names
- foreign keys and relation names
- migration SQL
- repository queries
- seed/fixture data
- API contracts
- tests
- reporting/read-model references

## Required classification

Every occurrence is classified as exactly one of:

`AUTHORITATIVE DOMAIN REFERENCE | PERSISTED FK | REPORTING DIMENSION | DERIVED VALUE | LEGACY | TEST FIXTURE | DOCUMENTATION | UNKNOWN`

## Evidence chain

```text
Repository search
→ file/path/line evidence
→ migration chronology
→ model/relation semantics
→ task/contract references
→ branch/history provenance
→ live DB identity verification
→ read-only introspection
→ drift classification
```

## Questions that must be answered

1. Does a first-class Project persistence representation exist?
2. Does a first-class Building persistence representation exist?
3. Does a first-class Floor persistence representation exist?
4. Is `Apartment` the current Unit persistence representation or only a legacy name?
5. Is `building_id` a real FK, a scalar reporting dimension, or an unresolved identifier?
6. Which object owns `building_id`?
7. What is the tenant ownership path?
8. What uniqueness constraints exist in reality?
9. What happens when a Building is renamed?
10. Can a Building move between Projects?
11. Can a Floor move between Buildings?
12. Can Units move between Floors/Buildings after commercial activity exists?
13. Which historical records must retain the original hierarchy?
14. Which references are required for finance/reporting/audit reconstruction?
15. Does live data contain values that cannot be mapped to a proposed Building entity?

## Safety constraints

No code or schema modification is authorized by this plan.

No destructive command is permitted.

No migration may be generated from the results until the target contract is promoted.

## Exit criteria

The trace is complete only when:

- repository references are exhausted;
- migration history is classified;
- historical alternatives are reconciled;
- live schema identity is verified or explicitly blocked;
- all unresolved ownership/identity conflicts are recorded;
- a target persistence recommendation has evidence;
- implementation authorization is separately granted.

## External engineering basis

Prisma's current documentation supports read-oriented database introspection for capturing an existing relational schema, schema comparison through `migrate diff`, and brownfield baselining when existing data must be preserved. PostgreSQL RLS provides row-level defense-in-depth but does not establish domain identity or replace application authorization.

These external facts inform the procedure only; ASAS authority remains governed by the repository control plane.

## Current status

`ACTIVE / BLOCKED FOR IMPLEMENTATION`

## Next checkpoint

After completing this trace, update the canonical session checkpoint and classify Building persistence as one of:

`FIRST-CLASS ENTITY | EXISTING LEGACY ENTITY | DERIVED STRUCTURAL CONCEPT | REPORTING DIMENSION | CONFLICT | UNKNOWN`
