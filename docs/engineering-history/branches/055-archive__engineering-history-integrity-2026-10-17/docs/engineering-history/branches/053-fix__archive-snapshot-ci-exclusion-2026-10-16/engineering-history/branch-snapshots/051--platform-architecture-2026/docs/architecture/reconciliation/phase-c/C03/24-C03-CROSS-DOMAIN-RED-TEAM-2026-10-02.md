# C03 — Cross-Domain Red-Team Review

**Date:** 2026-10-02  
**Status:** RED-TEAM COMPLETE — CLOSURE CANDIDATE / INDEPENDENT REVIEW REQUIRED  
**Scope:** Attack the reconciled Project → Building → Floor → Unit model across identity, tenancy, lifecycle, inventory, construction, publication, documents/media, concurrency, authorization, auditability and historical data.

## 1. Review rule

The red-team does not create new implementation contracts. It attempts to falsify the current reconciliation by constructing realistic failure scenarios and checking whether the current locked/open/not-authorized classifications survive.

A scenario is marked:

- **SURVIVES:** current architecture has a defensible boundary or explicit OPEN state.
- **BLOCKED:** implementation would be unsafe without a founder/domain decision.
- **OPEN:** behavior requires a future contract but does not contradict current architecture.
- **CONTRADICTION:** current artifacts make mutually incompatible claims.

## 2. Identity attacks

### R1 — Duplicate Building identity inside one tenant

**Result: OPEN.** Building identity is established, but exact uniqueness scope and persistence constraint are not yet closed.

### R2 — Same Building code reused across Projects

**Result: OPEN.** Human-facing code uniqueness is not proven to be global or project-scoped. Do not invent a database constraint.

### R3 — Public slug treated as Building/Unit identity

**Result: SURVIVES.** Publication identity is distinct from domain identity.

### R4 — Structural reparenting creates a second Unit identity

**Result: BLOCKED.** Transfer/detach semantics are not authorized; no implementation should create replacement transactional identities as a workaround.

## 3. Tenancy attacks

### R5 — Building attached to Project in another organization

**Result: BLOCKED.** Tenant/organization scope is a mandatory boundary. Cross-tenant association is not authorized.

### R6 — Attachment references asset from another tenant

**Result: BLOCKED.** Attachment/evidence references must respect tenant isolation.

### R7 — Public page leaks restricted document metadata across tenants

**Result: BLOCKED.** Public publication does not imply document authorization.

## 4. Lifecycle attacks

### R8 — Archive Project with active Buildings

**Result: OPEN / NOT AUTHORIZED.** No inferred cascade. Eligibility and downstream policy remain unresolved.

### R9 — Archive Building with active Units

**Result: SURVIVES.** Structural archive cannot silently cancel inventory, reservation, contract or finance state.

### R10 — Delete Floor with Units

**Result: BLOCKED.** Destructive cascade is not authorized.

### R11 — Building construction milestone treated as Building lifecycle transition

**Result: SURVIVES.** No Building lifecycle state machine has been established.

## 5. Inventory attacks

### R12 — Website says AVAILABLE while PostgreSQL says RESERVED

**Result: SURVIVES.** PostgreSQL authoritative inventory state wins; website is a projection.

### R13 — Cached availability authorizes reservation

**Result: BLOCKED.** Cache/search/analytics/AI indexes cannot be booking authority.

### R14 — Structural Unit detach automatically releases inventory

**Result: BLOCKED.** No automatic inventory release is authorized.

### R15 — Construction complete automatically makes every Unit AVAILABLE

**Result: BLOCKED.** Construction readiness and commercial availability remain separate policies.

## 6. Pricing attacks

### R16 — Public displayed price becomes reservation price by implication

**Result: BLOCKED.** Displayed price and transactional price commitment are distinct until the pricing contract closes.

### R17 — Building metadata update mutates Unit price

**Result: BLOCKED.** No automatic price inheritance is established.

### R18 — Price changes during reservation attempt

**Result: OPEN.** Requires explicit snapshot/version/commit semantics.

## 7. Construction attacks

### R19 — Duplicate `milestone.certified` event

**Result: OPEN / engineering requirement.** Future consumers must be idempotent; exact consumer contracts remain open.

### R20 — Construction regression after Contract

**Result: BLOCKED.** No automatic contract/finance reversal is authorized.

### R21 — Building-level milestone masks Unit-level exception

**Result: SURVIVES.** Building milestone is not proof that every Unit has identical readiness.

## 8. Publication attacks

### R22 — Unpublish deletes Unit media

**Result: BLOCKED.** Publication lifecycle and source media lifecycle are separate.

### R23 — Publication rollback reverses inventory

**Result: BLOCKED.** Publication rollback is presentation-only.

### R24 — Stale public page becomes reservation authority

**Result: BLOCKED.** Reservation must revalidate authoritative transactional state.

## 9. Documents/media attacks

### R25 — Replace legal document through ordinary Studio editor

**Result: BLOCKED.** Evidence-bearing documents require a distinct authorization/lifecycle contract.

### R26 — Delete Building cascades to construction evidence

**Result: BLOCKED.** Retention cannot be inferred from structural hierarchy.

### R27 — Public media path exposes restricted document

**Result: BLOCKED.** Public-read media and restricted evidence require separate authorization.

## 10. Concurrency attacks

### R28 — Two agents reserve one Unit concurrently

**Result: OPEN but critical invariant direction is established.** The authoritative transactional boundary must enforce one compatible winner; exact implementation belongs to Sales/Inventory contract engineering.

### R29 — Reservation commits while availability projection is stale

**Result: SURVIVES.** Projection staleness cannot override authoritative state.

### R30 — Building update locks every Unit unnecessarily

**Result: SURVIVES.** No invariant currently justifies enlarging the aggregate/lock scope to the entire hierarchy.

### R31 — Duplicate reservation command

**Result: OPEN / required idempotency contract.** Capability evidence requires idempotency; exact key and replay semantics remain to be closed.

## 11. Authorization attacks

### R32 — User with Unit edit permission changes reservation state

**Result: BLOCKED.** Structural permissions and Sales permissions are distinct capabilities.

### R33 — Studio editor changes inventory state directly

**Result: BLOCKED.** Studio is not inventory owner.

### R34 — Technical database access bypasses application tenant boundary

**Result: BLOCKED.** Persistence/RLS/security engineering must enforce tenant isolation; exact policy implementation remains outside C03 semantic closure.

## 12. Auditability attacks

### R35 — Structural correction silently changes commercial state

**Result: BLOCKED.** Cross-context side effects require explicit governed commands/events.

### R36 — Document replacement leaves no provenance

**Result: OPEN.** Evidence provenance requirements are established directionally; exact document audit contract remains open.

### R37 — Historical migration silently rewrites legacy meaning

**Result: BLOCKED.** Historical implementation is evidence, not authority; migration/repair must be separately reconciled.

## 13. Contradiction search

The red-team found no blocking contradiction between the current C03 semantic artifacts:

```text
17 Project ↔ Building
18 Building lifecycle / command boundary
19 Building ↔ Floor ↔ Unit semantics
20 Inventory / Availability / Pricing
21 Construction / Commercial readiness
22 Studio / Publication
23 Documents / Media
```

The artifacts consistently reject the same unsafe inference:

> hierarchy does not automatically define aggregate containment, lifecycle inheritance or destructive cascade.

## 14. Remaining open contract set

The red-team narrows the unresolved questions to the following load-bearing contracts:

1. Floor identity/lifecycle and exact ownership semantics.
2. Unit identity and structural mutation semantics.
3. Inventory entity/state ownership and availability state machine.
4. Reservation/hold concurrency and idempotency contract.
5. Pricing version/snapshot/approval semantics.
6. Construction-to-commercial-readiness policy.
7. Studio publication eligibility and projection repair semantics.
8. Document taxonomy, retention and authorization.
9. Final Unit/Inventory aggregate boundary.
10. Persistence constraints after semantic closure.

These are **OPEN contracts**, not evidence that the current semantic model is wrong.

## 15. Aggregate-boundary position after red-team

The red-team provides sufficient evidence to reject the following model as an architectural default:

```text
Project Aggregate
  └── Building
       └── Floor
            └── Unit
                 └── Inventory
                      └── Reservation
                           └── Finance
```

The reconciled evidence instead supports separate consistency boundaries connected by explicit domain/application contracts and derived projections.

The exact final aggregate topology remains OPEN until the Unit/Inventory/Reservation contracts are closed in their authoritative contexts.

## 16. Closure recommendation

**C03 is NOT CLOSED.**

The semantic reconciliation and red-team work is materially complete for the current Project/Building/Floor/Unit dependency sequence, but governance still requires:

1. an independent closure review;
2. verification that the authoritative source artifacts are indexed and no stale contradictory C03 artifact remains active;
3. final classification of unresolved founder-class architectural decisions;
4. explicit recording of the final aggregate-boundary decision;
5. only then, persistence/API implementation authorization through the proper implementation task.

No implementation is authorized by this red-team report.
