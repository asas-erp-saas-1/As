# ASAS — ROADMAP AMENDMENT 008

**Date:** 2026-09-24  
**Branch:** `platform-architecture-2026`  
**Status:** ACTIVE AMENDMENT  
**Parent:** `ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`

## Purpose

Record the founder-confirmed product direction and architecture decision for a broad multi-organization real-estate platform, with Developer + Agency as the initial commercial wedge.

## Added roadmap track — Organization Collaboration

Before schema or runtime implementation of multi-organization access:

1. Define Organization as the business principal, independent of organization type.
2. Define Developer/Agency/Brokerage/etc. as organization types rather than nested account architectures.
3. Define authoritative resource ownership.
4. Define Organization-to-Organization collaboration relationships.
5. Define relationship scopes at organization/project/building/inventory levels where justified.
6. Define Membership versus collaboration access.
7. Define the user visibility principle: `Visibility follows responsibility`.
8. Define resource-based and role/attribute-based authorization requirements.
9. Define Developer partner-performance views.
10. Implement founder-selected visibility policy: **Hybrid / configurable**.
11. Define sensitive fields and default visibility.
12. Reconcile the design with tenant isolation and RLS.
13. Define cross-organization audit semantics.
14. Close the contract before schema promotion.
15. Verify with authorization and tenant-isolation tests before runtime release.

## Non-goal

Do not create a nested `Agency → Developer account` architecture and do not copy authoritative project/inventory data into partner organizations merely to provide collaboration.

## Dependencies

This track depends on Q1 domain authority and persistence reconciliation and must precede organization/collaboration schema promotion. It does not authorize implementation by itself.

## Canonical contract

`docs/architecture/contracts/ASAS-ORGANIZATION-COLLABORATION-AUTHORIZATION-CONTRACT-2026.md`
