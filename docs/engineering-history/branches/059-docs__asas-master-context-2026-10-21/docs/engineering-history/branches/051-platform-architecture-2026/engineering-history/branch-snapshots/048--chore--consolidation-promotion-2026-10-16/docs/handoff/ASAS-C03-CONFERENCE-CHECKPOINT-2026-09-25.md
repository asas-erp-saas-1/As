# ASAS C03 Conference Checkpoint — 2026-09-25

**Branch:** `platform-architecture-2026`
**Status:** ACTIVE / IMPLEMENTATION BLOCKED

## Completed before C03

- Organization is the business principal.
- Membership is distinct from authorization.
- Organization relationships are first-class.
- Collaboration boundary is Relationship + Project Context + Resource Scope.
- Employee authorization uses relationship + team/role + assignment + individual exception.
- Lead ownership, assignment, source attribution, commercial attribution and commission entitlement are distinct.
- Inventory is not assumed to be Developer-exclusive.
- Developer internal sales and external agencies can coexist.
- Agency-owned/controlled inventory is supported as a domain direction.

## C03 now open

The real-estate domain must define the authoritative identity and lifecycle of:

`Project → Building/Block → Floor/Level → Unit/Property → Inventory/Availability`

without assuming every asset or project uses the same physical hierarchy.

## Current evidence

`PROJECT-CANONICAL-IDENTITY.md` establishes ASAS coverage of projects, buildings, inventory and units.

`CORE-LIFECYCLE-CANONICAL-MAP.md` establishes Project/Building/Unit Inventory as the Real Estate / Inventory domain and connects Options/Reservations to Sales, Inventory, CRM, Finance and Documents.

These are scope/semantic evidence, not proof that an implementation already satisfies the target model.

## Next safe closure action

Research and inspect current repository/domain evidence for Project, Building, Unit, Inventory, pricing, availability and listing assumptions. Identify contradictions before proposing schema changes.

## Do not do yet

- no production schema;
- no migrations;
- no RLS rewrite;
- no inventory implementation;
- no reservation implementation.

Those require green contracts and implementation gates.
