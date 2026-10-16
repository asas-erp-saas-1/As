# ASAS Canonical Task Graph Specification

**Status:** Foundation contract — pre-implementation
**Repository:** `asas-erp-saas-1/As`

## Purpose

This document defines how ASAS foundation work becomes an executable dependency graph for Claude. It is a control contract, not an application implementation and not a replacement for the authoritative registers.

## Graph model

Every implementation task must be represented as a directed acyclic dependency unit unless a genuine runtime cycle is explicitly documented as a domain dependency. A task has:

- stable task identifier;
- bounded context;
- objective and non-goals;
- authority references;
- prerequisite tasks/contracts;
- commands/events/state edges touched;
- permission and tenant boundary;
- data/schema impact;
- external side effects;
- risk/autonomy class;
- verification obligations;
- evidence required for closure;
- rollback/recovery expectation.

## Dependency rules

1. A task cannot be marked executable while an authoritative prerequisite is OPEN or BLOCKED.
2. Research may inform a task but cannot silently become product authority.
3. A task may depend on a contract without duplicating that contract.
4. A task must not introduce a new canonical event, permission, bounded context, financial rule or legal semantic without the required authority gate.
5. Independent tasks may execute in parallel only when their dependency and write surfaces are proven non-conflicting.
6. Database-affecting tasks require schema authority, tenant/security analysis and migration safety evidence before implementation.
7. Production-affecting tasks require explicit environment identity and the applicable A3 gate.

## Task states

`DRAFT → READY → IN_PROGRESS → VERIFYING → CLOSED`

Exceptional states:

`BLOCKED`, `REJECTED`, `SUPERSEDED`.

A task is not CLOSED because code exists. It is CLOSED only when every mandatory acceptance criterion and evidence item is satisfied.

## Closure gate

A task can close only if:

- authority is identified;
- scope is satisfied;
- dependencies are satisfied;
- tenant isolation is proven where applicable;
- authorization is proven where applicable;
- invariants are tested;
- idempotency/concurrency requirements are addressed where applicable;
- external side effects are reconciled where applicable;
- migrations are validated where applicable;
- automated tests pass;
- adversarial checks are recorded;
- evidence is linked;
- residual risks are recorded;
- checkpoint is updated.

## Claude scheduling rule

Claude should select the highest-priority task that is `READY`, respects dependency order, and fits its authorized autonomy level. It should not skip a blocked prerequisite merely because a downstream task appears easier.

## Foundation boundary

This specification does not authorize application code, database schema, migrations or deployment. Those become executable only when the relevant platform and implementation gates are GREEN.
