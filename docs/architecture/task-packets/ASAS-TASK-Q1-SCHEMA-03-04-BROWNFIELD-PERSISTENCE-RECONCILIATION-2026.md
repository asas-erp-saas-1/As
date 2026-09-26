# ASAS TASK — Q1-SCHEMA-03/04 BROWNFIELD PERSISTENCE RECONCILIATION

**Status:** AUTHORIZED / NON-DESTRUCTIVE / IMPLEMENTATION-GATED  
**Branch:** `platform-architecture-2026`

## Objective
Establish the smallest defensible mapping between closed C03 semantics and actual persistence reality before executable schema promotion.

## Inspect

1. Project
2. Building
3. Floor
4. Unit / Apartment
5. Property
6. Listing
7. Owner / Mandate
8. Offer
9. Hold
10. Reservation
11. Price / price versions
12. Inventory Batch
13. Outbox
14. Audit
15. Tenant / organization ownership
16. RLS and security functions
17. migrations and migration history
18. indexes, uniqueness and foreign keys

## Method

`LOCATE → READ → INVENTORY → MAP → CLASSIFY → TEST → REPORT`

For each persistence concept record:

`bounded context → domain concept → invariant → tenant scope → lifecycle → persistence object`

Classify drift only as:

`INTENTIONAL | LEGACY | MISSING | DANGEROUS | UNDOCUMENTED | CONFLICT | UNKNOWN`

Evidence status:

`SOURCE-VERIFIED | RUNTIME-VERIFIED | TEST-VERIFIED | PARTIAL | BLOCKED | OPEN`

## Prohibitions

- no production migration;
- no reset/drop/truncate;
- no destructive rename;
- no blind schema generation;
- no fabricated live-database claims;
- no RLS changes merely to make a report pass;
- no new domain table solely to satisfy a diagram;
- no promotion of `schema/asas-contracts.index.json` into an executable contract.

## Exit criteria

Repository persistence locations inventoried; C03 mappings classified; constraints/security implications recorded; conflicts named; safe schema-promotion recommendation produced; no destructive operation performed.

## Next gate

`PROMOTE CONTRACT | REVISE CONTRACT | REMAIN BLOCKED`

Production migration remains a separate authorization boundary.