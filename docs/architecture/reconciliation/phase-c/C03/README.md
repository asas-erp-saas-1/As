# C03 — Real Estate

**Status:** OPEN — DEEP CLOSURE REQUIRED

Canonical C03 workspace. Existing C03 contracts, ADRs, research, persistence trace and deep-closure review remain authoritative where their ownership is established. Do not recreate them; index and reconcile them here.

## Current stage

`C03.13 persistence provenance` established current repository/runtime persistence reality. Historical/deleted persistence absence remains an explicitly bounded open question.

The Project semantic sequence has now advanced through:

`Project → Building → Floor → Unit → Inventory/Availability/Pricing → Construction/Commercial Readiness → Studio/Publication → Documents/Media → Cross-Domain Red-Team → Source Reconciliation`

Canonical records for the active sequence:

- `17-PROJECT-BUILDING-RELATIONSHIP-ANALYSIS-2026-10-02.md`
- `18-BUILDING-LIFECYCLE-INDEPENDENCE-AND-COMMAND-BOUNDARY-2026-10-02.md`
- `19-BUILDING-FLOOR-UNIT-OWNERSHIP-SEMANTICS-2026-10-02.md`
- `20-INVENTORY-AVAILABILITY-PRICING-RECONCILIATION-2026-10-02.md`
- `21-CONSTRUCTION-INVENTORY-COMMERCIAL-READINESS-RECONCILIATION-2026-10-02.md`
- `22-STUDIO-PUBLICATION-UNIT-INVENTORY-RECONCILIATION-2026-10-02.md`
- `23-DOCUMENTS-MEDIA-REAL-ESTATE-STUDIO-RECONCILIATION-2026-10-02.md`
- `24-C03-CROSS-DOMAIN-RED-TEAM-2026-10-02.md`
- `25-C03-INDEPENDENT-CLOSURE-REVIEW-PACKET-2026-10-02.md`
- `26-SOURCE-RECONCILIATION-STATE-MACHINE-COMMERCIAL-STATUS-2026-10-02.md`

## Current architectural position

- Project→Building→Floor→Unit is canonical real-estate ontology.
- Building has independent identity.
- Building lifecycle is not inferred from construction milestones.
- Floor lifecycle/aggregate semantics remain open.
- Unit structural identity and aggregate ownership remain open at this stage.
- The normative state-machine register establishes an `apartment.commercial_status` lifecycle; exact mapping of `apartment` to canonical Unit terminology remains an explicit reconciliation question.
- Inventory availability is owned by the Real Estate capability boundary and PostgreSQL is authoritative.
- Reservations are owned by Sales and cross the Inventory boundary.
- Pricing belongs conceptually to Real Estate; price commitment/versioning remains open.
- Construction progress does not automatically equal commercial availability.
- Studio/public website is a projection, not inventory authority.
- Documents/media have lifecycle and authorization distinctions from structural entities and ordinary publication content.
- No destructive cascade, lifecycle inheritance or cross-context mutation is authorized from `contains` alone.
- The red-team found no blocking contradiction across the current C03 semantic sequence.

## Remaining load-bearing OPEN contracts

1. Floor identity/lifecycle and exact ownership semantics.
2. Unit identity and structural mutation semantics.
3. Exact mapping of normative `apartment` terminology to canonical Unit terminology.
4. Inventory entity/state ownership and availability state machine.
5. Relationship between `apartment.commercial_status` and authoritative inventory availability.
6. Reservation/hold concurrency and idempotency contract.
7. Pricing version/snapshot/approval semantics.
8. Construction-to-commercial-readiness policy.
9. Studio publication eligibility and projection repair semantics.
10. Document taxonomy, retention and authorization.
11. Final Unit/Inventory aggregate boundary.
12. Persistence constraints after semantic closure.

## Closure state

C03 is **not closed**.

Semantic reconciliation and cross-domain red-team work are materially complete for the current dependency sequence, but source reconciliation identified a normative commercial state-machine contract that must be explicitly considered by the independent reviewer. Governance still requires:

1. independent closure review;
2. stale/contradictory artifact verification;
3. explicit classification of any founder-class architectural decisions;
4. final aggregate-boundary decision;
5. only then, authorization of persistence/API implementation through the appropriate implementation task.

No schema, ORM, migration, API or production implementation is authorized by C03 documentation alone.

See `../README.md` for the common Phase C protocol.
