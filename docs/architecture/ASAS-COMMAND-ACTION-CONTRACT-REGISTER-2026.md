# ASAS — COMMAND / ACTION CONTRACT REGISTER 2026

**Artifact ID:** ASAS-ARCH-COMMAND-ACTION-2026-001  
**Status:** DERIVED CONTRACT BASELINE — OPEN / NOT IMPLEMENTATION AUTHORITY  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Branch:** `platform-architecture-2026`  
**Companion:** `ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md`

> This register extracts action vocabulary already present in ASAS V3 and related source material. It deliberately does not invent payloads, APIs, permissions, schemas or implementation ownership where the sources do not establish them.

---

## 1. CONTRACT RULE

An action becomes implementation-ready only when all of the following are known:

`Action ID → owner → target aggregate/object → actor → permission → tenant scope → preconditions → invariant → state transition → transaction boundary → concurrency → event → audit → idempotency → failure semantics → test → evidence`

Until then, status remains `OPEN`, `SUPPORTED`, or `BLOCKED`.

An ontology action name is not automatically an API endpoint or domain command.

---

## 2. SOURCE-DERIVED ACTION INVENTORY

The following action vocabulary is explicitly present in V3:

| ID | Action | Current source implication | Likely target | Status |
|---|---|---|---|---|
| ACT-001 | `assign_lead` | controlled lead ownership action | Lead | SUPPORTED |
| ACT-002 | `qualify_lead` | lead qualification action | Lead | SUPPORTED |
| ACT-003 | `schedule_visit` | visit scheduling action | Visit | OPEN — Scheduling ownership |
| ACT-004 | `complete_visit` | visit completion action | Visit | SUPPORTED |
| ACT-005 | `submit_offer` | commercial offer action | Offer | OPEN — Offer ownership |
| ACT-006 | `approve_discount` | approval-controlled commercial action | Offer/Policy | OPEN |
| ACT-007 | `place_hold` | inventory hold action | Unit/Hold | OPEN — atomic boundary |
| ACT-008 | `create_reservation` | reservation creation | Reservation + Unit availability | OPEN — atomic boundary |
| ACT-009 | `release_reservation` | reservation release | Reservation + Unit availability | OPEN — atomic boundary |
| ACT-010 | `prepare_contract` | contract preparation | Contract | SUPPORTED |
| ACT-011 | `record_payment` | financial payment recording | Payment / PaymentSchedule semantics unresolved | OPEN |
| ACT-012 | `issue_receipt` | receipt issuance | Receipt | OPEN |
| ACT-013 | `post_ledger_entry` | ledger mutation | Ledger | OPEN — finance schema/authorization |
| ACT-014 | `assign_unit` | unit assignment/matching | Unit / Lead | OPEN |
| ACT-015 | `publish_project` | public publication action | Project/Studio projection | OPEN |
| ACT-016 | `publish_unit` | public publication action | Unit/Studio projection | OPEN |
| ACT-017 | `send_message` | communication action | Communication | OPEN — provider/permission contract |
| ACT-018 | `create_task` | workflow/task action | Task | OPEN — workflow ownership |
| ACT-019 | `approve_workflow` | approval action | Workflow/Approval | OPEN |
| ACT-020 | `run_report` | reporting action | Reporting read model | SUPPORTED — read operation |
| ACT-021 | `run_simulation` | simulation action | Decision/Application plane | OPEN |

These names are source-derived. They do not authorize creation of one endpoint per action.

---

## 3. STATE / INVARIANT TRACEABILITY

### Lead

`assign_lead`, `qualify_lead` must respect Lead ownership and pipeline invariants. Source material explicitly requires one current owner and legal pipeline transitions, with stage-change events.

### Visit

`schedule_visit`, `complete_visit` depend on Scheduling ownership and the Visit state machine. Do not finalize implementation ownership while C2-002 remains open.

### Offer

`submit_offer`, `approve_discount` require an Offer contract. Offer is present in V3's ontology and commercial spine but lacks a complete aggregate specification in the earlier Enterprise Domain Model.

### Unit / Reservation

`place_hold`, `create_reservation`, `release_reservation` participate in the highest-risk concurrency boundary currently identified. They must not be implemented as independent writes that can violate the one-active-winner invariant.

### Contract

`prepare_contract` must preserve the source invariant that a Contract cannot exist without an approved Reservation.

### Finance

`record_payment`, `issue_receipt`, `post_ledger_entry` must not be finalized until Payment/PaymentSchedule/Receipt semantics and financial authority are reconciled.

---

## 4. COMMAND PIPELINE

All mutating actions eventually follow:

```text
Actor / AI Tool
      ↓
Authentication
      ↓
Authorization
      ↓
Tenant Scope
      ↓
Command Validation
      ↓
Aggregate Load
      ↓
Preconditions
      ↓
Invariant Check
      ↓
Legal State Transition
      ↓
Mutation
      ↓
Audit
      ↓
Domain Event
      ↓
Transactional Outbox
      ↓
Commit
```

Queries and projections must not acquire mutation authority merely because they expose action metadata.

---

## 5. AI ACTION RULE

AI may request an action only through the same authorization path as a human actor.

```text
AI intent
 → proposed action
 → tool contract
 → caller authority
 → policy
 → domain/application command
 → transaction
 → audit
 → event
```

AI cannot create a hidden alternate command path.

---

## 6. IDEMPOTENCY CANDIDATES

Idempotency is mandatory for actions whose retry can create duplicate business effects, especially:

- `create_reservation`;
- `release_reservation` where repeated execution has side effects;
- `record_payment`;
- `issue_receipt`;
- webhook-driven `send_message`/integration actions;
- workflow execution;
- external event processing.

Exact key shape remains an implementation contract to be defined after aggregate/schema closure.

---

## 7. OPEN CONTRACTS

The following must be resolved before implementation authorization:

1. Offer aggregate and ownership.
2. Unit/Hold/Reservation atomic boundary.
3. Payment fact vs PaymentSchedule semantics.
4. Receipt as financial projection/document vs independently governed object.
5. Building ownership.
6. Scheduling ownership.
7. Permission mapping for every mutating action.
8. Event mapping for every successful state transition.
9. Error/failure semantics for each critical action.
10. Concurrency strategy and race tests for critical actions.

---

## 8. NON-GOALS

This register does not:

- define REST/GraphQL URLs;
- define database tables;
- create Prisma models;
- choose locking primitives;
- create permissions that do not exist in the canonical permission register;
- create events that do not exist in the event register;
- authorize implementation.

---

## 9. NEXT CHECKPOINT

`ARCH-2026-H1.4-COMMAND-QUERY-CONTRACT-CLOSURE`

Entry requires H1.3 aggregate/invariant boundaries to be sufficiently stable for command ownership mapping. No schema promotion is implied.
