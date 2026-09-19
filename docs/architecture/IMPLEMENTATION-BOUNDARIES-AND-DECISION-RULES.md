# ASAS Implementation Boundaries & Decision Rules

**Status:** FOUNDATION WORKING CONTRACT
**Date:** 2026-09-19

## 1. Objective

Prevent premature implementation and prevent architectural drift when Claude Code enters the repository.

## 2. Boundary model

```text
Enterprise Vision
  → Product Scope
  → Bounded Context
  → Module
  → Aggregate / Domain Service
  → Command / Query
  → Event
  → Persistence Contract
  → Permission
  → Task
  → Verification Evidence
```

No lower layer is allowed to redefine an upper layer silently.

## 3. Decision authority

| Decision | Evidence required | Default authority | Escalate when |
|---|---|---|---|
| Product scope | approved roadmap/spec | approved product source | scope conflict |
| Bounded context | accepted ADR/domain model | architecture ADR | equal-authority conflict |
| Module boundary | context map + implementation architecture | architecture contract | cross-context ambiguity |
| Aggregate ownership | domain invariants | domain model | invariant crosses contexts |
| Schema | approved schema contract + live introspection | schema contract for target, DB for reality | destructive change |
| Permission | permission register + context ownership | security contract | new privilege/scope |
| Task | task register + phase contract | canonical task register | missing/duplicate ID |
| Runtime platform | verified provider identity | live platform evidence | identity mismatch |

## 4. Default engineering choices

- Prefer modular monolith over distributed services until measured evidence proves extraction necessary.
- Prefer PostgreSQL transactions and explicit constraints for correctness-critical invariants.
- Prefer transactional outbox for domain-event publication.
- Prefer synchronous domain invariants over eventually-consistent shortcuts where correctness is financial, contractual, or inventory-critical.
- Prefer explicit application services over generic CRUD for business mutations.
- Prefer additive/forward-only database evolution.
- Prefer repository evidence over memory.

## 5. Forbidden shortcuts

- inferring architecture from folder names;
- treating generated/derived registers as independently authoritative;
- making a schema change because the target Prisma file differs from the live DB;
- using implementation code to justify a task contract;
- adding a new bounded context because a module became large;
- creating microservices to solve an unmeasured concern;
- accepting AI output as business authority;
- declaring a gate closed without evidence.

## 6. Implementation slice contract

Every first implementation slice must identify:

1. canonical context;
2. owning module;
3. aggregate/domain rules;
4. command/query surface;
5. state transitions;
6. emitted/consumed events;
7. permission keys and scope;
8. persistence impact;
9. tenancy/RLS impact;
10. tests;
11. acceptance evidence;
12. rollback/recovery considerations;
13. known deviations and follow-up task IDs.

## 7. Architecture evolution

A later requirement may change any decision. The correct action is a new decision record with provenance and impact analysis, not a silent edit that erases the previous state.
