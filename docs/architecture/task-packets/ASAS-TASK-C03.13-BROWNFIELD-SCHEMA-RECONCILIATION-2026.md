# ASAS TASK PACKET — C03.13 BROWNFIELD SCHEMA RECONCILIATION

**Task ID:** ASAS-C03.13-BROWNFIELD-001  
**Status:** AUTHORIZED FOR FORENSIC / RECONCILIATION WORK ONLY  
**Branch:** `platform-architecture-2026`  
**Scope:** Repository and local evidence; no production mutation

## Objective

Establish the verified brownfield persistence reality required before an executable ASAS schema contract can be authored for the Real Estate core.

## Non-goals

- no production migration;
- no destructive database operation;
- no schema reset;
- no deletion;
- no arbitrary Prisma/ORM redesign;
- no RLS rollout;
- no production deployment;
- no claim that a live database exists or is verified until its identity is independently proven.

## Authority

Follow `AGENTS.md`, the current checkpoint, the Engineering Conference Path, the Platform Engineering Track and the Schema Contract Promotion Protocol.

## Required inputs

- current repository HEAD;
- ORM/schema files;
- migration directories;
- database configuration without exposing secrets;
- existing Unit/Apartment/Property/Listing/Reservation references;
- Project/Building/Floor references;
- indexes, constraints and foreign keys;
- RLS policies/functions if present;
- event/outbox persistence;
- state/permission/event registers;
- relevant tests and CI workflows.

## Investigation method

### Phase A — Inventory

Produce an exhaustive inventory of files and symbols related to:

`Project | Building | Floor | Unit | Apartment | Property | Listing | Mandate | Reservation | Hold | Offer | Price | InventoryBatch | Outbox`

### Phase B — Structural extraction

Record observed:

- tables/models;
- fields/types/nullability;
- primary keys;
- foreign keys;
- unique constraints;
- partial indexes;
- check constraints;
- enums;
- triggers/functions;
- RLS policies;
- migrations;
- repository services/repositories/actions.

### Phase C — Semantic mapping

Map each observed structure to:

`canonical concept | owner | invariant | state | authorization | tenant scope | lifecycle | event | evidence`

Classify each mapping:

`SOURCE-VERIFIED | RUNTIME-VERIFIED | PARTIAL | CONFLICT | UNVERIFIED | PROPOSED`

### Phase D — Drift inventory

Explicitly identify:

- canonical concept with no persistence representation;
- persistence structure with no canonical owner;
- duplicated representations;
- obsolete names;
- status fields that violate state separation;
- mutable prices without version history;
- reservation writes without single-winner enforcement;
- missing tenant scope;
- missing audit/outbox path;
- stale permissions/events/state references.

### Phase E — Reservation safety

Do not select the final PostgreSQL mechanism until the actual persistence representation is known.

Evaluate candidate mechanisms against:

- one active winner;
- concurrent inserts/updates;
- expiry race;
- retry/idempotency;
- transaction failure;
- stale worker;
- duplicate requests;
- index/constraint feasibility;
- migration safety.

### Phase F — Deliverables

Produce or update:

1. `ASAS-REAL-ESTATE-PERSISTENCE-TRACE-2026.md`;
2. `ASAS-C03.13-SCHEMA-RECONCILIATION-REPORT-2026.md`;
3. applicable ADRs for material contradictions;
4. schema contract only where promotion gate permits;
5. test specification for critical invariants;
6. current checkpoint evidence.

## Files allowed to change

Primary scope:

- `docs/architecture/reconciliation/**`;
- `docs/architecture/research/**`;
- `docs/architecture/decisions/**` where a contradiction requires an ADR;
- `docs/architecture/contracts/**` only after authority and promotion conditions are satisfied;
- `docs/handoff/CURRENT-SESSION-STATE.md` for checkpoint evidence.

Application source, migrations and executable schema remain out of scope until this task produces an explicit implementation authorization.

## Security

Never print, commit or expose database credentials, tokens, service-role keys or personal secrets.

## Definition of Done

- repository persistence inventory complete for C03 concepts;
- runtime identity either verified or explicitly BLOCKED;
- observed schema facts separated from target architecture;
- conflicts recorded with provenance;
- reservation enforcement candidates compared;
- price/version and Inventory Batch persistence gaps identified;
- tenant/RLS gaps identified;
- no destructive operation executed;
- report committed to the current branch;
- checkpoint updated with exact evidence and next gate.

## Stop conditions

Stop and mark `BLOCKED` if:

- live runtime identity cannot be independently verified;
- production access would be required to continue safely;
- data interpretation requires founder/product/legal authority;
- a destructive migration would be needed to prove a concept;
- canonical sources materially conflict without an authority decision.

## Evidence required

The final report must distinguish:

`SOURCE-VERIFIED | RUNTIME-VERIFIED | TEST-VERIFIED | EXTERNALLY-VERIFIED | ENGINEERING-DERIVATION | PROPOSED | UNVERIFIED | BLOCKED`

No "verified" claim is permitted from documentation presence alone.
