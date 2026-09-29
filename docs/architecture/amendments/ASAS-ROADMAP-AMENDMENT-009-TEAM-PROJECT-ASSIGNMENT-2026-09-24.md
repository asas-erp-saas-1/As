# ASAS Roadmap Amendment 009 — Team / Project Assignment

**Date:** 2026-09-24
**Status:** ACTIVE DESIGN GATE

## Decision

Adopt the hybrid access model:

`Organization relationship + Team/Role scope + Project assignment + Individual exception`

## Why

An organization-level commercial partnership is necessary but insufficient to determine what every employee may access. Employees must see only resources required for their responsibilities.

## Required sequence

1. Reconcile existing identity and membership evidence.
2. Trace current team/branch/project assignment concepts in the brownfield repository.
3. Define domain semantics and invariants.
4. Define authorization/resource-scope contracts.
5. Define persistence model.
6. Design database isolation/RLS.
7. Implement application authorization.
8. Test cross-organization and cross-project denial paths.
9. Verify auditability.
10. Only then promote the contract to implementation-ready.

## Explicit block

Do **not** create or alter production organization/team/project/RLS schema solely from this amendment. This is a design decision pending repository reconciliation.
