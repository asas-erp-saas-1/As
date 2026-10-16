# ASAS — TASK PACKET SPECIFICATION 2026

**Artifact ID:** ASAS-ARCH-TASK-PACKET-2026-001
**Status:** PROPOSED — DERIVED IMPLEMENTATION CONTRACT
**Version:** 1.0.0
**Owner:** Technical Program Lead / Architecture
**Source rule:** This specification derives implementation metadata without rewriting source task semantics.

## 1. Purpose

The source task register identifies intended work but does not, by itself, provide enough engineering information for safe autonomous implementation. A Task Packet is therefore required before a source task becomes implementation-authorized.

## 2. Required fields

```text
Task ID
Source title
Objective
Scope
Non-goals
Phase / Horizon
Bounded Context
Implementation Module
Capability
Owner
Dependencies
Blocking decisions
Canonical contracts
ADR references
Schema impact
Data ownership
Commands
Queries
Permissions
Personas
Invariants
State machines / transitions
Events
Transaction boundary
Concurrency requirements
Idempotency
Security / tenancy impact
AI impact
UX/design impact
Integration impact
Observability impact
Tests
Definition of Done
Evidence required
Rollback / recovery consideration
Authorization state
```

## 3. Authorization states

Only these states are permitted:

- `NOT_READY`
- `READY_FOR_REVIEW`
- `AUTHORIZED`
- `BLOCKED`
- `CLOSED`
- `SUPERSEDED`

A task cannot become `AUTHORIZED` while any implementation-critical ownership, contract, security, data or founder decision is unresolved.

## 4. Derivation rule

```text
Source Task
  ↓
Source provenance check
  ↓
Architecture ownership
  ↓
Contract references
  ↓
Data/schema impact
  ↓
Security/tenancy
  ↓
State/invariant/event analysis
  ↓
Test and evidence plan
  ↓
Authorization decision
```

## 5. Prohibited behavior

Do not:

- invent missing domain ownership;
- invent database tables to satisfy a task;
- invent events or permissions;
- silently assign Scheduling ownership;
- turn future reservations into MVP requirements;
- mark a task authorized because its source record exists;
- close a task without evidence.

## 6. First derivation batch

The first implementation packets shall cover only architecture-enabling work, not product feature implementation:

1. Context/module ownership reconciliation.
2. Scheduling decision record.
3. Schema contract structural promotion.
4. Architecture gate validation.
5. Local database harness design.

Feature tasks remain blocked until the architecture gates authorize them.

## 7. Traceability

Every packet must link:

`Task → Requirement → ADR → Context → Module → Aggregate → Invariant → Command → Permission → Event → Schema → Test → Evidence`

Unresolved links are explicitly marked `OPEN` or `BLOCKED`.

## 8. Review gate

Task packets are reviewed at architecture gate level before implementation. The packet is an implementation control artifact, not a replacement for the source task register.
