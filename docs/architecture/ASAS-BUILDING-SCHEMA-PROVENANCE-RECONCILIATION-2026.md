# ASAS — BUILDING SCHEMA PROVENANCE RECONCILIATION 2026

**Artifact ID:** ASAS-ARCH-BUILDING-SCHEMA-PROVENANCE-2026-001  
**Status:** EVIDENCE RECORD — OPEN / NOT IMPLEMENTATION AUTHORITY  
**Version:** 1.0.0  
**Effective date:** 2026-09-22  
**Canonical branch:** `platform-architecture-2026`  
**Repository:** `asas-erp-saas-1/As`

## 1. Purpose

Reconcile the newly confirmed historical/source-package evidence for `Building` with the current ASAS architecture control plane without promoting historical schema into executable implementation authority.

## 2. Evidence discovered

An uploaded historical source artifact contains a `Building` model with a Project relationship and an Apartment/Unit collection, including fields resembling:

- `id`
- `slug`
- `projectId`
- `name`
- `nameAr`
- `code`
- `floors`
- `hasElevator`
- `order`
- timestamps
- Project relationship
- Apartment relationship

This evidence confirms that `Building` has existed as a concrete schema concept in historical ASAS material.

## 3. Authority classification

This artifact is **historical/source evidence**.

It does NOT prove:

- that the model exists in the current executable repository schema;
- that the same fields are current;
- that the same names are canonical;
- that the live database contains the model;
- that Building is an aggregate;
- that Building owns Unit lifecycle;
- that the historical relation/cardinality is still correct.

The current repository contract therefore remains authoritative for desired architecture, while live runtime/database evidence remains authoritative for brownfield reality when verified.

## 4. Reconciled conclusion

The correct state is:

```text
Building concept                    = SUPPORTED
Historical schema representation    = SOURCE-VERIFIED
Current canonical executable model  = OPEN
Live database representation        = UNVERIFIED
Aggregate ownership                 = OPEN
Command ownership                   = OPEN
Permission ownership                = OPEN
Event ownership                     = OPEN
Persistence/cardinality             = OPEN
Migration                           = BLOCKED
```

## 5. Required engineering action

The historical schema must be used to challenge and enrich the current Building contract, not copied into Prisma or migrations.

Before executable schema promotion:

1. reconcile Project → Building → Unit cardinality;
2. identify whether `floors` is a Building property or derived representation;
3. determine whether `code`/`slug` are identity fields and their uniqueness scope;
4. determine publication/operational fields from product requirements rather than historical presence;
5. determine archival/deletion semantics;
6. map structural mutations to canonical commands and permissions;
7. determine concurrency semantics for child reassignment;
8. reconcile against any current repository schema contract;
9. introspect the actual live database only after platform identity is verified;
10. update the Building domain contract and aggregate/invariant register with evidence.

## 6. Explicit non-actions

Do not:

- create a Building table solely because the historical artifact contains one;
- delete Building from the target architecture;
- create a Building status enum by inference;
- assume historical field names are canonical;
- authorize production migration;
- treat the source package as Claude Code/Codex implementation authority.

## 7. Relationship to the Building domain contract

This record supplements:

`docs/architecture/ASAS-BUILDING-DOMAIN-CONTRACT-2026.md`

The Building contract remains `OPEN / IMPLEMENTATION BLOCKED` until the listed semantic and runtime evidence is reconciled.

## 8. Closure evidence

Closure requires:

`source provenance + current schema reconciliation + runtime identity + relationship semantics + ownership + commands + permissions + concurrency + tests + checkpoint update`
