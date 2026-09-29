# C02-03 — Inventory Competition Founder Decision

**Date:** 2026-09-25
**Status:** CLOSED — FOUNDER APPROVED
**Decision:** Hybrid E

## Founder inputs

The founder selected:

- Allocation: `C + D` — hard allocation where needed, configurable per project/inventory batch.
- Hold/Reservation: `C + A` — separate Hold plus configurable workflow.
- Reservation authority: `E` — configurable by relationship/project.
- Attribution conflict: `F + manual` — rule-based dispute handling with manual adjudication.
- Multiple commercial credit: `C + D` — different attribution dimensions and configurable project rules.
- Commission cancellation: `D` — governed by commission contract/rule.
- Override: `C` — reason-coded and audited.

The founder additionally clarified that:

1. a Developer may have an internal sales team;
2. an Agency may have its own inventory;
3. an Agency may represent inventory belonging to Developers or other organizations;
4. there may be multiple actors with legitimate authority over commercial operations;
5. ASAS must not assume that a Developer is always the final commercial decision-maker.

## Final competition decision

ASAS adopts:

`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`

Rules:

1. Organization type does not automatically establish priority.
2. Active allocation determines eligibility/priority where applicable.
3. Hard allocation can restrict eligibility during its effective period.
4. Same-tier competition is resolved by the first valid reservation transaction to commit successfully against the Unit's single-winner consistency boundary.
5. If no priority/allocation applies, first valid committed reservation is the fallback.
6. Client timestamps and UI ordering are never authoritative.
7. Manual adjudication is available for attribution disputes and audited overrides; it does not silently rewrite historical facts.
8. Reservation is the inventory winner boundary; allocation and attribution remain separate concerns.

## Architectural consequence

ASAS is not Developer-centric at the core. It is **actor/capability/resource/authority-centric**.

The same Project may expose inventory to:

- Developer internal sales;
- Agency A;
- Agency B;
- Brokerage;
- other authorized actors.

An Agency may also be the controlling/owning commercial actor for its own Project/Inventory.

## Implementation boundary

This decision closes product semantics. It does not authorize implementation until the relevant reservation, security, state-machine, schema, concurrency, and architecture gates are verified.
