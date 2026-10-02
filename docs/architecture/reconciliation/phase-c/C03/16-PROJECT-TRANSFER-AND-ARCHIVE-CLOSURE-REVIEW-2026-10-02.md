# C03 — Project Transfer and Archive Closure Review

**Date:** 2026-10-02
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION
**Scope:** Project transfer and archive semantics only.

## 1. Evidence rule

This review distinguishes three classes:

- **SOURCE-LOCKED:** explicitly supported by ASAS source material.
- **ENGINEERING CONSEQUENCE:** directly derived from a locked source rule or established DDD consistency principle.
- **UNSPECIFIED:** the sources do not define the behavior; no implementation contract is invented.

## 2. Transfer — current truth

ASAS V3 establishes Organization as the current enterprise hierarchy root for tenant-scoped data and requires tenant isolation across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations.

The historical Enterprise Domain Model instead names `Agency` as the tenant root and places `AgencyId` on aggregates. That terminology is historical and has already been reconciled against V3; it is not evidence for a V3 transfer command.

### Decision

**Project transfer between Organizations/Tenants is NOT a currently specified Project capability.**

Therefore:

- no `TransferProject` command is authorized;
- no ordinary `organization_id`/tenant foreign-key update may be treated as a transfer workflow;
- no automatic reassignment of Buildings, Units, Reservations, Contracts, Finance, Documents, CRM records, projections or events is specified;
- no transfer event contract is invented.

### Engineering consequence

If future requirements introduce transfer, it must be designed as a governed cross-boundary workflow. It will require an explicit business/legal policy, source and target authorization, dependent-record policy, audit/evidence, event/outbox semantics, failure/compensation behavior, and tenant-isolation verification before implementation.

This follows the V3 security model: security is attached to object, relationship, action, workflow, integration, document and tenant, not merely to a role.

## 3. Archive — current truth

The ASAS implementation/governance material supports archival/soft-delete semantics rather than hard deletion. The source also distinguishes archival from legal erasure/anonymization.

V3 separately establishes:

- Project is master data;
- Unit has its own commercial and construction state machines;
- public data is a published projection;
- Studio publishing is versioned and auditable;
- important domain events are immutable, versioned, traceable and processed through the governed outbox lifecycle;
- data governance includes retention and deletion/anonymization policy.

### Decision

**Project Archive is a governed Project-domain mutation, but the exact eligibility policy is not currently specified by the source corpus.**

Therefore the following are explicitly NOT authorized as current architecture:

- automatic cascade archive of all Buildings;
- automatic cascade archive of all Units;
- automatic cancellation of Reservations;
- automatic cancellation of Contracts;
- automatic reversal/cancellation of Finance records;
- automatic deletion of Documents;
- automatic erasure of CRM history;
- automatic publication removal as an undocumented side effect;
- automatic restore semantics.

## 4. Archive dependency matrix

| Dependency | Does source prove it blocks Project archive? | Current decision |
|---|---:|---|
| Active Building | No | OPEN |
| Active Unit | No | OPEN |
| Active Reservation | No | OPEN |
| Signed Contract | No | OPEN |
| Outstanding Payment | No | OPEN |
| Finance history | No | MUST PRESERVE; exact blocking policy OPEN |
| Documents | No | PRESERVE; exact blocking policy OPEN |
| Public publication | No | Publication policy OPEN; do not infer cascade |
| CRM history | No | PRESERVE; exact policy OPEN |
| Analytics projections | No | Rebuild/invalidation behavior OPEN |

## 5. Restore

No authoritative source currently defines Project restore/unarchive semantics.

Therefore `RestoreProject` remains **OPEN**. We must not infer that archive is reversible merely because an `archivedAt` field exists.

## 6. Aggregate-boundary consequence

Transfer and archive analysis does **not** prove that Project + Building + Unit + Reservation + Contract + Finance belong to one aggregate.

This is consistent with established DDD guidance: aggregates are consistency boundaries and should contain only data that must remain consistent within one transaction; relationships spanning aggregates can be coordinated through application/domain workflows and events rather than by expanding the aggregate indiscriminately. See Martin Fowler's DDD aggregate explanation and Microsoft Azure DDD guidance.

The ASAS Enterprise Domain Model independently identifies Unit as an aggregate and explicitly separates Reservation, Contract and PaymentSchedule. Therefore cross-domain archive checks are not evidence for a single Project aggregate.

## 7. C03 decisions after this review

### LOCKED

- Project is master data.
- Project is tenant-scoped under the V3 Organization model.
- Unit remains an independent consistency boundary.
- Project publication is distinct from Project domain lifecycle.
- Archive is distinct from hard delete/erasure.
- Cross-domain records must not be silently mutated as a side effect of Project archive.
- Transfer is not an authorized current capability.

### OPEN

- Project lifecycle state model, if one is actually required.
- Archive eligibility rules.
- Archive authorization/approval policy.
- Restore policy.
- Publication behavior on archive.
- Building add/remove semantics.
- Final Project aggregate-root decision.
- Project command/event contract.

## 8. Closure gate

C03 Project remains **BLOCKED for closure**.

Closure requires an explicit evidence-backed decision for every OPEN item above. No schema, ORM model, migration, API contract or event contract is authorized solely from this reconciliation document.

## 9. Next work item

Next: **C03 → Building relationship semantics**.

The next analysis will determine whether `Project → Building` is:

1. a simple domain association,
2. a Project-owned child relationship,
3. an independent Building aggregate referenced by Project,
4. or a governed relationship requiring a separate domain service/workflow.

The decision will be made from business commands, invariants, lifecycle independence, concurrency and source evidence—not from the database hierarchy alone.
