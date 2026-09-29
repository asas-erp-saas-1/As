# ASAS Inventory Access & Reservation Attribution Contract — 2026

**Status:** PROPOSED — implementation blocked
**Conference:** C02
**Decision:** Inventory ownership remains with the authoritative business principal; commercial access and allocation are scoped separately from ownership; reservation is a controlled state transition on the canonical Unit.

## 1. Core distinctions

`Inventory Ownership ≠ Inventory Visibility ≠ Commercial Allocation ≠ Reservation Control`

A Developer may own/control authoritative Project/Building/Unit inventory while an Agency receives scoped commercial access through an active relationship and project/resource assignment.

## 2. Single source of truth

There is one authoritative Unit/inventory record. Agency, Developer and internal views are projections/views over the same business facts. No duplicated authoritative inventory is created for partner organizations.

## 3. Commercial allocation

Allocation is an optional commercial policy that can scope eligible inventory to an Agency/team/user/relationship for a defined period and purpose.

Allocation does not transfer ownership and does not itself create a reservation.

Required semantics:

- allocation scope;
- effective start/end;
- quantity or unit set;
- eligibility rules;
- release/revocation rules;
- actor and reason;
- audit history.

## 4. Reservation control

A reservation is a canonical sales-domain state transition for a Unit. It must validate authorization, project/resource scope, unit eligibility, current inventory state, commercial rules and required approvals before committing.

The reservation transition is a single-winner concurrency boundary. The implementation must use transactional consistency controls appropriate to PostgreSQL and must prove the no-double-reservation invariant under concurrent requests.

PostgreSQL row-level locking such as `FOR UPDATE` can be part of the implementation strategy, but the exact locking/isolation strategy remains an implementation decision subject to concurrency tests.

## 5. Reservation attribution

At reservation creation, the system snapshots the applicable commercial attribution facts rather than relying on mutable current assignment later.

Potential dimensions:

- lead/source organization;
- commercial agency;
- responsible team;
- responsible agent;
- campaign/source;
- project;
- unit;
- relationship;
- attribution rule/version;
- timestamp;
- actor;
- approval context.

Later reassignment does not rewrite the historical reservation attribution.

## 6. Cancellation / release

Cancellation or expiry changes the reservation state and may release the unit according to policy. It does not erase historical attribution or audit evidence. A subsequent reservation is a new commercial event with its own attribution snapshot.

## 7. Cross-organization visibility

Developer users may see authorized inventory and performance. Agency users see only inventory within their effective relationship/project/team/user scope. One Agency must not infer or access another Agency's private CRM information from shared project data.

## 8. Security invariants

1. Access is denied by default.
2. Relationship scope is checked before resource access.
3. Project/resource assignment cannot exceed relationship scope.
4. UI filtering is never the sole control.
5. Server-side authorization is mandatory.
6. Tenant/resource isolation is independently enforced.
7. Reservation commands fail closed on ambiguous authorization.
8. Reservation commands are idempotent or protected against duplicate execution.
9. Concurrent reservation attempts cannot produce two committed winners for one exclusive Unit state.
10. All attribution changes/corrections are auditable.

## 9. Evidence required before implementation-ready

- domain/state-machine contract;
- authorization matrix;
- schema contract;
- migration plan;
- transaction/concurrency test specification;
- RLS/resource-isolation test specification;
- audit/event contract;
- rollback/recovery plan;
- runtime evidence.
