# ASAS — BUILDING DOMAIN CONTRACT 2026

**Artifact ID:** ASAS-ARCH-BUILDING-2026-001  
**Status:** DERIVED DOMAIN CONTRACT — OPEN / NOT IMPLEMENTATION AUTHORITY  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Owner:** Real Estate / Inventory — ownership confirmation required  
**Branch:** `platform-architecture-2026`  
**Authority:** Derived from the Core Lifecycle Canonical Map, Aggregate/Invariant Boundary Register, state-machine register, product truth and current architecture control plane. It does not override an approved ADR, founder decision, canonical register, live runtime or live database.

## 1. Purpose

Define the minimum semantic boundary for `Building` before schema or application implementation.

`Building` is a real-estate hierarchy object between `Project` and `Unit`. Its existence in the product hierarchy is supported; its aggregate ownership and consistency contract are not yet fully established.

This contract therefore records what is supported, what is inferred, and what remains open. It does not authorize a Prisma model, table, API or migration.

## 2. Source-derived facts

Current repository evidence supports:

- Project / building / unit inventory is a Real Estate / Inventory capability.
- The commercial spine uses `Project → Building → Unit` as the property hierarchy.
- Product truth explicitly describes projects populated with buildings and units.
- The state-machine register defines apartment commercial and construction status at the apartment/unit level, not a dedicated Building lifecycle state machine.
- Construction progress is described as milestone-driven per building and drives apartment construction status.

Therefore:

`Building ≠ Unit`

and

`Building state ≠ Apartment/Unit commercial status`.

## 3. Candidate ownership

**Candidate owner:** Real Estate / Inventory.

**Status:** `CANDIDATE — OWNERSHIP NOT YET ACCEPTED AS AGGREGATE BOUNDARY`.

The current source does not provide enough evidence to create a separate bounded context or a standalone Building-specific state machine.

## 4. Hierarchy contract

```text
Organization / Promoter
        ↓
Project
        ↓
Building
        ↓
Unit / Apartment
```

The Building-to-Project relationship and Building-to-Unit relationship are structural integrity relationships. Exact cardinality and deletion semantics remain schema-contract questions and must be derived from source schema/runtime evidence before implementation.

## 5. Baseline invariants

### BLD-INV-001 — Tenant boundary
A Building must belong to the correct organization/tenant scope before access or mutation. Runtime enforcement is unverified.

### BLD-INV-002 — Project parent integrity
A Building must reference a valid Project according to the authoritative property hierarchy. Orphan Buildings are not permitted in the target model.

### BLD-INV-003 — Unit parent integrity
Every Unit assigned to a Building must reference the correct Building/project hierarchy. A Unit must not silently move between Buildings through a convenience UI mutation.

### BLD-INV-004 — Identity uniqueness
Building identity must be unique within the authoritative scope defined by the eventual schema contract. The exact natural-key policy is OPEN; do not invent a uniqueness key here.

### BLD-INV-005 — No inventory authority leakage
Building metadata must not become an alternate source of truth for Unit commercial availability. Unit availability remains governed by the Unit/Reservation consistency contract and registered Unit state machine.

### BLD-INV-006 — Construction/commercial separation
Building construction progress and Unit commercial status are separate concepts. Building-level milestones may drive Unit construction-status updates according to the registered construction protocol, but they do not directly imply commercial reservation/sale state.

### BLD-INV-007 — Tenant-safe hierarchy traversal
Queries traversing Project → Building → Unit must preserve tenant and authorization scope at every sensitive access boundary. A child identifier must never bypass parent authorization.

### BLD-INV-008 — Auditability of structural changes
Material changes to Building identity, parent Project, publication/operational metadata, or structural associations require auditable evidence when implemented.

## 6. State-machine position

No dedicated `building.status` state machine is currently canonical.

The canonical register instead defines:

- `apartment.commercial_status`;
- `apartment.construction_status`.

`apartment.construction_status` is a linear progression driven by `milestone.certified` events per building.

Therefore implementation must not invent a Building status enum merely because a Building object exists.

If future requirements need Building lifecycle states, the lifecycle must be introduced through the state-machine register/ADR process first.

## 7. Commands / actions

The current command/action register does not establish a dedicated Building command set.

Potential actions such as creating/editing a Building are not implementation-ready until ownership, authorization, parent integrity, audit and failure semantics are reconciled with the canonical command/action register.

No new command identifiers are created by this document.

## 8. Events

No Building-specific domain event is invented by this contract.

The existing construction protocol references `milestone.certified` events per building. That event must remain governed by the canonical event register; this contract does not redefine its payload or ownership.

## 9. Concurrency and transaction boundaries

Building structural edits may affect Unit hierarchy and construction projections. Before implementation, determine whether the operation requires:

- a Building-local transaction;
- coordinated Project/Building/Unit validation;
- optimistic concurrency/version checks;
- explicit child reassignment protocol;
- audit/outbox publication.

No locking primitive is selected here.

## 10. Deletion / archival semantics

Destructive deletion is NOT defined.

Before any implementation decision, establish whether Buildings are immutable after Units or construction records exist, or whether archival/deactivation semantics are required. Do not infer soft-delete behavior from the existence of timestamps or generic repository conventions.

## 11. Security requirements

At minimum, implementation must prove:

- server-side authorization;
- tenant scope before child access;
- no IDOR through Project/Building/Unit identifiers;
- no mass assignment of tenant/project ownership;
- privileged structural changes are auditable;
- AI tools inherit caller authority and cannot bypass the same domain/application policy.

OWASP guidance supports deny-by-default and server-side authorization as baseline controls; these external engineering principles do not override ASAS-specific authority. citeturn0search0turn0search2

## 12. Closure gate

**Status:** `OPEN`

Blocking conditions:

1. aggregate ownership not formally accepted;
2. exact Project/Building/Unit relationship semantics not fully reconciled with source schema;
3. no canonical Building command mapping;
4. no Building-specific permission mapping;
5. no Building-specific event ownership established;
6. structural-change concurrency semantics open;
7. archival/deletion semantics open;
8. no executable tests/evidence.

**Implementation authorization:** `BLOCKED`.

## 13. Required next evidence

Before schema promotion:

1. reconcile Building with source schema contract;
2. inspect historical branch implementations without treating them as authority;
3. determine aggregate vs entity/module status;
4. map required actions to existing permission keys only;
5. map required events to existing canonical events only;
6. define parent/child mutation policy;
7. define concurrency and audit behavior;
8. add acceptance tests;
9. update aggregate/invariant register and checkpoint.

## 14. External engineering evidence

PostgreSQL documents row-level locking as a mechanism for coordinating concurrent writers when the invariant requires explicit blocking; this is evidence for later implementation design, not a command to select `SELECT FOR UPDATE` for Building. citeturn0search4

The transactional-outbox pattern is a recognized approach for atomically recording a business change and its durable event before asynchronous publication; ASAS already has this pattern in its architecture doctrine, but runtime implementation remains unverified. citeturn0search1

## 15. Non-goals

This contract does not:

- create a database table;
- define Prisma fields;
- define REST/GraphQL endpoints;
- create permissions or events;
- create a Building state machine;
- authorize production changes;
- settle unresolved founder decisions.
