# ASAS C02 — Reservation Concurrency & Authorization Research

**Date:** 2026-09-25
**Status:** Research input — not implementation authority

## Research findings

### Authorization

OWASP recommends least privilege and deny-by-default authorization. ASAS therefore treats absence of an applicable allow rule as deny and does not use UI visibility as a security mechanism.

AWS SaaS guidance distinguishes tenant isolation from general authentication/authorization. ASAS therefore requires explicit tenant/resource isolation in addition to application authorization.

AWS guidance also supports centralized/reusable authorization approaches and combinations of RBAC and ABAC when access conditions depend on tenant, role and resource context.

### Reservation concurrency

PostgreSQL documents row-level locking such as `FOR UPDATE` as a mechanism that can block conflicting concurrent updates/locks on the same row until transaction end. PostgreSQL also notes that locking alone does not define all application-level consistency requirements.

Therefore ASAS should define a business-level reservation invariant first:

> At most one valid reservation outcome may claim the same sellable inventory unit for overlapping effective time/state windows, subject to explicitly defined cancellation/expiry rules.

The implementation strategy (row lock, conditional update, serializable transaction, database constraint, or combination) must be selected after the invariant and schema contract are finalized and then proven with concurrency tests.

## Implications for ASAS

1. Inventory authorization must be checked before reservation mutation.
2. Relationship scope and project/inventory assignment must be evaluated server-side.
3. The reservation command must atomically validate preconditions and establish the new state.
4. Attribution snapshots must be created within the same authoritative commercial transaction or through an explicitly consistent mechanism.
5. Duplicate/competing reservation attempts must produce deterministic outcomes and auditable rejection reasons.
6. Performance projections must consume canonical facts, not become competing sources of truth.
7. Commission calculation must use approved milestone facts and versioned commercial rules.

## Sources

- OWASP Authorization Cheat Sheet: least privilege and deny-by-default.
- AWS SaaS Architecture Fundamentals: tenant isolation is separate from authentication/authorization.
- AWS Prescriptive Guidance: multi-tenant authorization can combine RBAC/ABAC and should be consistently enforced.
- PostgreSQL 17 documentation: explicit and row-level locking and application-level consistency checks.

This document informs architecture; it does not override ASAS product decisions or repository evidence.
