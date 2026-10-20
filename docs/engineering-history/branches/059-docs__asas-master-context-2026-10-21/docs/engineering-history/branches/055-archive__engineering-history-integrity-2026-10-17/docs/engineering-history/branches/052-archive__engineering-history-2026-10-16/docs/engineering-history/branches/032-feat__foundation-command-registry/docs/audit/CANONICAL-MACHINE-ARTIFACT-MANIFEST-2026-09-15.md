# ASAS — Canonical Machine Artifact Manifest

**Date:** 2026-09-15  
**Repository:** `asas-erp-saas-1/As`  
**Source package:** `ASAS-AI-PACKAGE-v1.6.1`  
**Purpose:** deterministic bridge between the authoritative v1.6.1 handoff package and the canonical GitHub repository.

## Rule

The artifacts below are copied byte-for-byte from `02-HANDOFF/` of the v1.6.1 source package. Their SHA-256 values are recorded here before repository restoration. Until the exact bytes are restored to `As`, these entries are **SOURCE-VERIFIED / REPOSITORY-MISSING**. Do not regenerate, normalize, prettify, reorder, or semantically edit them during restoration.

| Artifact | Source package path | Bytes | SHA-256 | Repository status |
|---|---|---:|---|---|
| Tasks | `02-HANDOFF/registers/tasks.json` | 62866 | `59972b54f6ac5f9d498c13857aaa6d493bccf54e66e622899021e2b3757080a4` | MISSING |
| Events | `02-HANDOFF/registers/events.json` | 4636 | `7f25a34dec1769c4c0dfc076da4bb337a3bc3194fb9c3bb13911bc0667f56580` | MISSING |
| Permissions | `02-HANDOFF/registers/permissions.csv` | 2885 | `1a9ca150f77bb091c8e462c2d018503c5dd4ab5f3d963a17bf42a0d41d116a1b` | MISSING |
| State machines | `02-HANDOFF/registers/state-machines.json` | 8589 | `12652e591d864168b80fe8662a87ec7ca7ba5de627befb84162515adc40fa019` | MISSING |
| Prisma contract | `02-HANDOFF/schema/asas-contracts.prisma` | 52127 | `65fee768efa8338f3d7ed953d3f3f5f9c6d076fc9c477a822c81433860394a2d` | MISSING |
| Design tokens | `02-HANDOFF/design/design-tokens.json` | 11303 | `41cee85f0c330d57c2f23d99c716c18a1630101c4affad8801e7721504a5cf52` | MISSING |
| Component inventory | `02-HANDOFF/design/component-inventory.md` | 5165 | `e0715281dc282a295b7dc1aeeed59f3ec07a7169c181a04c815ff875b188cb5c` | MISSING |

## Required restoration order

1. Registers: tasks, events, permissions, state-machines.
2. Schema contract: `asas-contracts.prisma`.
3. Design contracts: tokens and component inventory.
4. Skills and runbooks.
5. Recompute repository hashes and compare to this manifest.
6. Reconcile AGENTS/handoff prose counts only after byte-level restoration succeeds.

## Integrity rule

A restored artifact is accepted only if its repository bytes produce the exact SHA-256 recorded above. A different hash is a failed restoration, even if the file is semantically equivalent.

## Non-goals

This manifest does not authorize application code, database creation, migration, deployment, or production changes. It only establishes deterministic provenance and restoration criteria.

## Current checkpoint

**G-04/G-05: SOURCE ARTIFACTS VERIFIED; REPOSITORY RESTORATION PENDING.**
