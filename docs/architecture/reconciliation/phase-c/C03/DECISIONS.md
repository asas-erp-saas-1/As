# C03 — Decisions Register

**Status:** ACTIVE — C03 OPEN / BLOCKED
**Branch:** `platform-architecture-2026`

## Locked decisions

| ID | Decision | Evidence / rationale |
|---|---|---|
| C03-D01 | Project → Building → Floor → Unit is the canonical structural topology currently supported. | C03 artifact 19 |
| C03-D02 | Structural `contains` relationships do not, by themselves, define DDD aggregate containment. | C03 artifacts 18–19 |
| C03-D03 | `apartment.commercial_status` is a normative v1.6.1 state machine and must not be duplicated/renamed without superseding authority. | State-machine register; C03 artifacts 26–27 |
| C03-D04 | Reservation remains a separate Sales consistency concern from Real Estate inventory authority. | C03 artifact 20; capability/architecture evidence |
| C03-D05 | PostgreSQL is authoritative for inventory availability; cache/search/analytics/AI surfaces are derived. | Phase 11 Scalability Blueprint |
| C03-D06 | Construction state is not automatically commercial availability. | C03 artifacts 19–21 |
| C03-D07 | Structural archive/detach does not imply inventory release, reservation cancellation, contract cancellation or financial reversal. | C03 artifacts 19–24 |
| C03-D08 | The full Project → Building → Floor → Unit → Inventory → Reservation → Finance chain is not accepted as one aggregate by inference. | C03 closure evidence + adversarial review |

## Governance correction

The artifact previously named `30-INDEPENDENT-CLOSURE-REVIEW-2026-10-04.md` is explicitly **not independent evidence** because it was authored within the same engineering stream. It is retained as an adversarial review and its BLOCK conclusion stands. A genuine independent review remains required for C03 closure.

## Independent-review decisions

| ID | Decision | Status |
|---|---|---|
| C03-R01 | C03 cannot be evidence-locked because Unit/Inventory ownership is unresolved. | BLOCK |
| C03-R02 | Commercial status ↔ availability mapping remains unresolved. | BLOCK |
| C03-R03 | Reservation hold/expiry/concurrency/idempotency contract remains unresolved. | BLOCK |
| C03-R04 | Pricing snapshot/commit semantics remain unresolved. | BLOCK |
| C03-R05 | Real Estate / Sales / Finance boundaries are directionally supported, but cross-context command/event contracts are incomplete. | BLOCK |
| C03-R06 | Independent review itself has not yet been independently evidenced. | BLOCK |

## Open decisions

| ID | Decision required | Status |
|---|---|---|
| C03-O01 | Exact `apartment` ↔ canonical `Unit` identity mapping | BLOCKING |
| C03-O02 | Unit ↔ Inventory ownership/cardinality model | BLOCKING |
| C03-O03 | Exact relationship between `commercial_status` and Inventory availability | BLOCKING |
| C03-O04 | Hold/reservation concurrency, expiry and idempotency contract | BLOCKING |
| C03-O05 | Pricing version/snapshot/commit semantics | BLOCKING |
| C03-O06 | Cross-context command/event contracts | BLOCKING |
| C03-O07 | Floor identity/lifecycle and structural command semantics | OPEN |
| C03-O08 | Brownfield runtime identity and persistence evidence | BLOCKING |
| C03-O09 | Commercial state enum and release path: register `apartment.commercial_status` (9 states, two-hop release) vs. contract set (6 states, direct release) | BLOCKING — CONFLICT (F-06) |
| C03-O10 | Hold expiry policy/duration and deposit↔reservation semantics | FOUNDER-DECISION-REQUIRED |
| C03-O11 | Missing register keys: reservation release/expiry, `apartment.release/unblock/off_market`, contract execution; missing structural-amendment event | BLOCKING — register gap |

## Status of the commercial edge contract matrix — 2026-10-14

`docs/architecture/contracts/ASAS-INVENTORY-UNIT-RESERVATION-COMMERCIAL-EDGE-CONTRACT-MATRIX-2026-10-14.md`
now expresses all six required commercial edges in the required field set. It is
`PROPOSED / ENGINEERING-DERIVATION` and is **not** a locked decision.

It narrows blockers B4 (hold/reservation concurrency) and B5 (pricing
commitment) to named gaps, but it does not close them. C03 remains
**OPEN / BLOCKED**, and the independent-review prerequisite remains unsatisfied.

## Governance rule

No implementation decision may silently promote an OPEN item to a contract. A new authoritative decision must supersede the relevant OPEN item explicitly.

**C03 remains OPEN / BLOCKED.**
