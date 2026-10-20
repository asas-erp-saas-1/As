---
name: asas-domain-contracts
description: Design and verify ASAS bounded contexts, aggregates, invariants, commands, state machines, permissions and events before implementation.
---

# Domain Contract Engineering

## Core rule

Never infer ownership from names or table structure.

Distinguish:
`Bounded Context ≠ Module ≠ Aggregate ≠ Entity ≠ Value Object ≠ Schema ≠ Read Model ≠ Worker ≠ Event Consumer`.

## Contract closure

For each material behavior define:

`owner → aggregate role → invariant → consistency boundary → command → authentication → authorization → tenant scope → preconditions → state transition → audit → event → outbox → failure → idempotency → concurrency → test → evidence`.

## State mutation

Use:
`Command → AuthN → AuthZ → Tenant Scope → Load → Preconditions → Legal Transition → Invariants → Mutation → Audit → Event → Outbox → Commit`.

Direct governed status setters are prohibited.

## Cross-context

Write ownership belongs to one context. Reads may cross contexts through explicit contracts/read models. Never create a cross-context write path merely for convenience.

## Scheduling

Scheduling ownership is currently founder-decision-required. Do not silently assign it to Core, CRM or another context.

## Reservation

Treat reservation correctness as a concurrency problem, not merely a status field. Require lock/re-verification, uniqueness strategy and race tests before implementation authorization.
