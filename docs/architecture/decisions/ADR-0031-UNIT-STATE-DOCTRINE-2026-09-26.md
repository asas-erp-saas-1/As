# ADR-0031 — Unit State Doctrine

**Date:** 2026-09-26  
**Status:** Accepted — semantic slice closed / implementation gated  
**Branch:** `platform-architecture-2026`

## Decision
ASAS treats a development Unit's commercial lifecycle and construction lifecycle as two independent state dimensions.

### Commercial state
`AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

### Construction state
`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

These dimensions MUST NOT be collapsed into a single `status` field.

## Semantic rules
1. Commercial state answers whether and how the Unit is commercially controlled/available.
2. Construction state answers the physical/project delivery progress of the Unit.
3. A Unit may legitimately be commercially `RESERVED` while construction is `STRUCTURE` or another non-terminal phase.
4. A Unit may be construction `READY` while commercially `OFF_MARKET`.
5. Construction progress cannot by itself create, release or transfer a reservation.
6. Commercial transitions cannot silently rewrite construction progress.
7. Direct status mutation is prohibited by the platform doctrine; transitions must be expressed through governed state-machine actions/events.
8. Historical transitions are auditable.
9. Configuration may add policy around transitions but cannot weaken core invariants.
10. Reservation safety remains a separate consistency boundary: one active winner per Unit under concurrency.

## Relationship to other lifecycles
Unit state does not absorb:
- Offer lifecycle;
- Hold lifecycle;
- Reservation lifecycle;
- Contract lifecycle;
- Payment/receipt lifecycle;
- Commission lifecycle;
- Listing/publication lifecycle.

These are related business processes and may cause permitted Unit-state transitions, but remain separate domain facts.

## Brownfield note
Historical implementation material contains combined lifecycle examples and status-oriented models. Those artifacts are treated as implementation/provenance evidence, not authority over the V3 semantic doctrine. Existing runtime state representation must be introspected before any migration or refactor.

## Required evidence before implementation
- reconcile the canonical state-machine register against this doctrine;
- map all legal transitions and guards;
- map events to transitions;
- prove authorization for each transition;
- prove audit coverage;
- prove reservation race behavior;
- reconcile current production columns/tables without destructive rewrite.
