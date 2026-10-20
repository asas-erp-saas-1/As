# C03 — Project Lifecycle & Archive Decision

**Date:** 2026-10-01
**Status:** RECONCILIATION — PARTIALLY LOCKED / REMAINING OPEN ITEMS
**Scope:** Project only

## 1. Authority

Current V3 is authoritative for the architecture target. Historical implementation/domain-model material is evidence and must be reconciled, not blindly promoted to contract.

V3 explicitly defines a lifecycle/state-machine approach as a foundational engineering rule, but the Real Estate Core section defines explicit lifecycle state machines for Unit, not a canonical Project state machine. Unit has separate Commercial and Construction states and these must never be collapsed. Therefore Project must not inherit Unit states or be assigned a single commercial/construction status merely because it contains Units.

## 2. Decision: no canonical Project state machine yet

**LOCKED:** ASAS does not currently have sufficient authoritative evidence to define a canonical Project domain state machine.

The following must NOT be treated as canonical Project domain states without further evidence:

- AVAILABLE
- HELD
- RESERVED
- CONTRACTED
- SOLD
- OFF_MARKET
- NOT_STARTED
- FOUNDATION
- STRUCTURE
- MASONRY
- MEP
- FINISHING
- READY
- DELIVERED

Those are explicitly Unit lifecycle states in V3.

## 3. Separate lifecycle dimensions

A Project can participate in several concerns that must remain distinct:

1. **Domain/master-data existence** — whether the Project record exists and is governed.
2. **Publication** — whether a public representation is drafted, validated, reviewed, published, rolled back, or unpublished. This belongs to Studio/publication, not automatically to the Project aggregate.
3. **Construction/development progress** — may be represented by Building/Unit/project-control data; V3 does not define a canonical Project state machine for this.
4. **Legal/approval status** — V3 Country Pack DZ requires legal/document rules, but no canonical Project legal state machine is defined here.
5. **Commercial inventory state** — belongs to Unit/Inventory/Sales and must not be collapsed into Project status.
6. **Archive/governance state** — requires an explicit Project governance decision and dependency policy.

## 4. Archive decision

**LOCKED:** Archive is not equivalent to hard deletion.

V3's data governance model requires deletion/anonymization policy, retention, lineage and ownership. The architecture also retains the rule that the database is the production reality and documentation must not invent deletion semantics.

**OPEN:** the exact Project archive eligibility policy.

An archive operation must therefore be treated as a governed Project mutation/capability, but its exact preconditions are not yet final.

Candidate checks that require evidence/approval before implementation include:

- active Units;
- active Reservations;
- Contracts and financial obligations;
- published Studio projections;
- active integrations/workflows;
- legal/document retention or hold;
- dependent Buildings/Floors/Units;
- tenant authorization and audit requirements.

These are dependency checks, not proof that all dependent objects belong to the Project aggregate.

## 5. Publication is separate

V3 defines:

Draft → Validate → Review → Publish → Projection → Cache invalidation → Public site

Every publish is versioned and auditable. Therefore `published` is a Studio/publication concern and must not be used as proof of a Project aggregate lifecycle.

## 6. Cross-domain safety

Project archive must not silently:

- cancel Reservations;
- terminate Contracts;
- mutate Unit commercial/construction state;
- post/reverse Finance entries;
- delete Documents;
- bypass legal retention;
- bypass approval;
- expose stale public projections.

Any such behavior, if required, must be expressed as an explicit governed workflow/domain action with its own authorization, audit, event and failure semantics.

## 7. Current Project lifecycle model

The canonical model is intentionally minimal until further evidence exists:

```text
Project exists as governed master data
        |
        +--> Publication lifecycle (Studio)
        +--> Development/construction evidence (Core/related domains)
        +--> Commercial inventory lifecycle (Unit/Inventory/Sales)
        +--> Legal/document lifecycle (Documents/Country Pack)
        +--> Governance/archive lifecycle (Project policy — OPEN)
```

## 8. What is now locked

- No canonical Project state enum is authorized yet.
- Unit Commercial and Construction states remain Unit states.
- Publication lifecycle remains Studio-owned.
- Archive is not delete.
- Archive cannot silently cascade into transactional domains.
- Project lifecycle cannot be inferred from the public website status.
- Project lifecycle cannot be inferred from Unit availability.

## 9. What remains open

1. Project archive eligibility matrix.
2. Exact Project governance states, if a state machine is ultimately required.
3. Whether Project transfer is a supported business capability.
4. Building add/remove semantics and atomicity.
5. Project command/event contract.
6. Final aggregate-boundary decision.

## 10. Closure rule

C03 Project is **not closed** by this document. Closure requires evidence-backed decisions for the remaining open items and verification against the canonical architecture registers and engineering gates. No schema/API/event/migration implementation is authorized solely from this document.

## Sources

- ASAS-ARCHITECTURE-V3.md — Real Estate Core, Unit lifecycle, Studio Publishing, Data Governance, Workflow/Approval/Event architecture.
- Historical ASAS domain/implementation material — retained as reconciliation evidence only.
