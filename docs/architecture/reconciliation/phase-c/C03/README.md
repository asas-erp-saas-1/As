# C03 — Real Estate

**Status:** OPEN — DEEP CLOSURE REQUIRED

Canonical C03 workspace. Existing C03 contracts, ADRs, research, persistence trace and deep-closure review remain authoritative where their ownership is established. Do not recreate them; index and reconcile them here.

## Current stage

`C03.13 persistence provenance` established current repository/runtime persistence reality. Historical/deleted persistence absence remains an explicitly bounded open question.

The Project semantic sequence has now advanced through the Project→Building boundary, Building command/lifecycle analysis and Building→Floor→Unit ownership semantics to:

`Inventory / Availability / Pricing reconciliation`

Canonical records:

- `17-PROJECT-BUILDING-RELATIONSHIP-ANALYSIS-2026-10-02.md`
- `18-BUILDING-LIFECYCLE-INDEPENDENCE-AND-COMMAND-BOUNDARY-2026-10-02.md`
- `19-BUILDING-FLOOR-UNIT-OWNERSHIP-SEMANTICS-2026-10-02.md`
- `20-INVENTORY-AVAILABILITY-PRICING-RECONCILIATION-2026-10-02.md`

Current position:

- Project→Building is a canonical ontology relationship.
- Building→Floor and Floor→Unit are canonical structural relationships.
- Building has independent identity.
- A Project+Building aggregate has **not** been established.
- Floor identity/lifecycle/aggregate semantics remain **OPEN**.
- Unit aggregate ownership remains **OPEN** and must not be inferred from structural hierarchy.
- Inventory availability is owned by the Real Estate capability boundary.
- PostgreSQL is authoritative for inventory availability.
- Reservations are owned by Sales and cross the Inventory boundary.
- Inventory/Reservation require concurrency and idempotency verification.
- Pricing belongs conceptually to Real Estate, but its exact behavioral contract remains **OPEN**.
- No destructive cascade or lifecycle inheritance is authorized from `contains` alone.
- Unit commercial, inventory, reservation and finance concerns remain separate consistency boundaries.

Next dependency sequence:

`Inventory/Availability/Pricing → Construction/Commercial readiness → Studio/Publication → Documents/Media → cross-domain red-team → aggregate boundary decision`

C03 remains OPEN until the deep-closure protocol, evidence requirements and independent review are satisfied. A semantic baseline or implementation block is not final closure.

See `../README.md` for the common Phase C protocol.
