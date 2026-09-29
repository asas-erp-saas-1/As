# ASAS Roadmap Amendment 012 — C02 Inventory / Reservation / Commission

**Date:** 2026-09-25
**Status:** ACTIVE DESIGN GATE

## Decision progression

C02 now advances from organization/assignment semantics into the commercial inventory boundary.

### Closed

- Organization relationship
- Project + Resource Scope collaboration boundary
- Hybrid employee authorization
- Lead ownership vs assignment vs source attribution vs commercial attribution
- Attribution snapshot principle
- Developer/Agency authorized performance visibility direction

### Closed as architectural direction

- One authoritative Unit/inventory record
- Agency access does not duplicate ownership
- Commercial allocation is distinct from reservation
- Reservation is a canonical sales state transition
- Historical reservation attribution is snapshotted at milestone
- Commission entitlement is a downstream Finance-owned fact

### Still open

- Exact inventory allocation policy
- reservation state machine and cancellation/expiry semantics
- reservation approval requirements
- concurrency implementation contract
- commission rule taxonomy and accounting treatment
- partner performance metric dictionary

## Required next sequence

`Inventory Access Matrix → Reservation State Machine → Concurrency Contract → Attribution Snapshot Contract → Commission Rule Model → Performance Metric Dictionary → Authorization/RLS Tests → Schema Contract`

## Research evidence

OWASP recommends least privilege and deny-by-default authorization, with authorization enforced server-side. AWS distinguishes tenant isolation from general authorization. PostgreSQL documents row-level locking and explicit consistency controls for concurrent updates. These sources inform the design; ASAS contracts remain the product/architecture authority.

## Implementation gate

No schema or production code is authorized by this amendment alone. The applicable contract and verification gates must reach GREEN first.
