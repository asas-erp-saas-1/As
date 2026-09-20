# ASAS Source Register Reconciliation Report

Status: FOUNDATION RECONCILIATION BASELINE
Source: ASAS-Complete-Package / blueprint package v1.6.1
Original verification date: 2026-09-17
Updated forensic date: 2026-09-20

## Purpose

Record the objectively verified shape of the approved source package and the current promotion state of derived repository artifacts. This is a reconciliation record, not an implementation artifact and not a copy of the source package.

## Verified source artifacts

| Artifact | Source SHA-256 | Bytes | Verified |
|---|---|---:|---|
| `blueprint/registers/tasks.json` | `59972b54f6ac5f9d498c13857aaa6d493bccf54e66e622899021e2b3757080a4` | 62866 | YES |
| `blueprint/registers/events.json` | `7f25a34dec1769c4c0dfc076da4bb337a3bc3194fb9c3bb13911bc0667f56580` | 4636 | YES |
| `blueprint/registers/permissions.csv` | `1a9ca150f77bb091c8e462c2d018503c5dd4ab5f3d963a17bf42a0d41d116a1b` | 2885 | YES |
| `blueprint/registers/state-machines.json` | `12652e591d864168b80fe8662a87ec7ca7ba5de627befb84162515adc40fa019` | 8589 | YES |
| `blueprint/schema/asas-contracts.prisma` | `65fee768efa8338f3d7ed953d3f3f5f9c6d076fc9c477a822c81433860394a2d` | 52127 | YES |
| `blueprint/design/design-tokens.json` | `41cee85f0c330d57c2f23d99c716c18a1630101c4affad8801e7721504a5cf52` | 11303 | YES |
| `blueprint/design/component-inventory.md` | `e0715281dc282a295b7dc1aeeed59f3ec07a7169c181a04c815ff875b188cb5c` | 5165 | YES |

## Structural counts

- Task register: 14 phases; 119 top-level phase tasks; 121 task IDs including nested task records; IDs are unique in the source traversal.
- Event register: 11 modules; 103 event names.
- Permission register: 50 permission rows; 50 unique permission keys.
- State-machine register: 11 machines.
- Design token source: 14 top-level sections.

## Important corrections

1. Earlier planning references described the task register as containing 114 tasks. The current verified v1.6.1 source contains 119 top-level phase tasks and 121 task IDs when nested records are included. The verified source artifact is authoritative for this count; no older count should be treated as current.
2. The repository now contains selected derived shadows (`events.json`, `permissions.csv`, `state-machines.json`, task index/shard, design artifacts and schema index). Their presence does not mean the full source package has been promoted or that executable implementation exists.
3. `schema/asas-contracts.prisma` remains intentionally absent because the source contract has not yet passed complete extraction and cross-register reconciliation in the repository.

## Promotion policy

The source artifacts are not automatically canonical merely because they are approved source material. Before promotion into `registers/`, `schema/`, or `design/` on `main`, the following must pass:

1. Provenance recorded.
2. JSON/CSV/Prisma syntax validation performed.
3. IDs and names checked for uniqueness within their authority scope.
4. Cross-register references reconciled.
5. State transitions checked for legal source/target states.
6. Permission keys checked against actors/scopes.
7. Task contract/evidence references checked for resolvability.
8. Schema model names checked against the domain vocabulary.
9. Design tokens checked for source consistency and component references.
10. Promotion recorded as a deliberate canonicalization event.

## Current repository promotion state

| Artifact | Repository state | Promotion status |
|---|---|---|
| Events | `registers/events.json` | DERIVED SHADOW PRESENT |
| Permissions | `registers/permissions.csv` | DERIVED SHADOW PRESENT |
| State machines | `registers/state-machines.json` | DERIVED SHADOW PRESENT |
| Tasks | `registers/tasks.index.json` + `registers/tasks/phase-P.json` | PARTIAL / RECONCILIATION REQUIRED |
| Schema | `schema/asas-contracts.index.json` | INDEX ONLY / RECONCILIATION REQUIRED |
| Design tokens | `design/design-tokens.json` | DERIVED SHADOW PRESENT |
| Components | `design/component-inventory.md` | DERIVED SHADOW PRESENT |

## Non-goals

This report does not authorize application code, database migrations, production database changes, provider provisioning, or external integration activation.
