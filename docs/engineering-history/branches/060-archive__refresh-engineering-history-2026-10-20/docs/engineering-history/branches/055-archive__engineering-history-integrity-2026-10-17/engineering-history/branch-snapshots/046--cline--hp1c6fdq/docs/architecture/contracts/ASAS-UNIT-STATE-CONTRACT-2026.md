# ASAS Unit State Contract — 2026

**Status:** Semantic contract closed / implementation gated; state lists superseded by ADR-0038

> **Superseded in part (2026-10-14):** the state value lists below are superseded
> by `docs/architecture/adr/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md`,
> which adopts the nine canonical commercial states and six construction states
> from the normative register. The cross-dimensional invariant, mutation doctrine
> and separation rules remain in force.  
**ADR:** ADR-0031  
**Branch:** `platform-architecture-2026`

## State dimensions

```text
Unit
├── commercial_state
└── construction_state
```

### Commercial
`AVAILABLE → HELD → RESERVED → CONTRACTED → SOLD`

`OFF_MARKET` is a controlled commercial terminal/side state and may be entered according to policy without implying construction completion.

### Construction
`NOT_STARTED → FOUNDATION → STRUCTURE → MASONRY → MEP → FINISHING → READY → DELIVERED`

The exact transition graph, guards and exceptions must be reconciled with the canonical state-machine register before implementation.

## Cross-dimensional invariant
No transition in one dimension may implicitly mutate the other dimension.

Examples:
- `RESERVED` does not imply `READY`.
- `READY` does not imply `AVAILABLE`.
- `SOLD` does not imply `DELIVERED`.
- `DELIVERED` does not imply `SOLD`.

## Mutation doctrine
All state changes occur through authorized domain actions/state transitions. UI writes to a raw status field are forbidden. Each transition must be auditable and produce the registered domain event where applicable.

## Separation
Offer, Hold, Reservation, Contract, Payment, Commission and Listing/publication each retain their own lifecycle. Unit state is a resulting/authoritative inventory fact, not a container for those lifecycles.

## Implementation gate
No schema migration or state-machine rewrite is authorized by this contract alone. Current database identity and brownfield representation must be independently verified first.
