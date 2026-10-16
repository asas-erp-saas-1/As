# ASAS — AGGREGATE & INVARIANT BOUNDARY REGISTER 2026

**Artifact ID:** ASAS-ARCH-AGGREGATE-INVARIANT-2026-001  
**Status:** DERIVED ARCHITECTURAL CONTRACT — OPEN / EVIDENCE-BACKED  
**Version:** 1.0.2  
**Effective date:** 2026-09-20  
**Owner:** Lead Architecture / Domain Engineering  
**Branch:** `platform-architecture-2026`  
**Authority:** Derived from the current Blueprint, Enterprise Domain Model, V3, registers and forensic evidence. It does not override an approved ADR, founder decision, canonical register, live runtime or live database.

> Purpose: establish explicit consistency and ownership boundaries before schema programming. This register is deliberately conservative. A row marked `CANDIDATE`, `OPEN`, `CONFLICT`, or `UNVERIFIED` is not implementation authorization.

## 1. OPERATING MODEL

An aggregate is a consistency boundary, not a table and not automatically a bounded context.

For every candidate aggregate, the implementation contract must eventually define:

`identity → owner → invariants → commands → legal transitions → authorization → tenant scope → concurrency → persistence boundary → audit → events → tests → evidence`

Mandatory distinctions:

`Bounded Context ≠ Module ≠ Aggregate ≠ Entity ≠ Table ≠ Read Model ≠ Worker ≠ Event Consumer`

Cross-aggregate and cross-context coordination must use explicit application/domain contracts. Direct convenience writes across ownership boundaries are prohibited.

## 2. EVIDENCE STATUS

Allowed statuses:

- `VERIFIED` — supported by executed evidence or an authoritative approved source.
- `SUPPORTED` — strongly supported by current source material but not yet runtime/implementation verified.
- `CANDIDATE` — proposed engineering model requiring further validation.
- `OPEN` — insufficient evidence to close.
- `CONFLICT` — authoritative sources materially disagree.
- `BLOCKED` — work cannot proceed safely because an authority or prerequisite is unresolved.
- `FOUNDER DECISION REQUIRED` — business/product authority is required.
- `ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT` — future-only.

## 3. SOURCE PROVENANCE

Primary source evidence currently supports the following aggregate candidates:

- Lead & CRM: `Lead`, `Client`.
- Property & Inventory: `Project`, `Unit`, `Listing`.
- Visit Management: `Visit`.
- Reservation & Contract: `Reservation`, `Contract`.
- Payment & Finance: `PaymentSchedule` with `Installment` children.
- Commission & Payout: `CommissionRule`, `CommissionRecord`.
- Identity & Access: `Agency`, `Branch`, `User`.
- Notification: `NotificationPreference`.
- Communication: `CommunicationLog` is described as an entity, not a classic aggregate.
- Document & Attachment: `Attachment` is described as a reusable entity/reference model.
- Activity/Timeline/Audit: described as an append-only projection of the domain event stream, not a classic aggregate.
- Search: described as a read model, not a source of business rules.
- Reporting & Analytics: described as a read model/event subscriber, not a source of new business rules.

These statements are source-derived. They are not claims that the current repository implementation or live database matches them.

## 4. COMMERCIAL CORE OWNERSHIP MATRIX

| ID | Candidate aggregate/object | Domain owner | Consistency boundary | Key invariants currently supported by source | Concurrency concern | Status | Evidence |
|---|---|---|---|---|---|---|---|
| AGG-001 | Lead | Lead & CRM | Lead lifecycle | exactly one owner; source + acquisition date set once; legal pipeline transitions; one AgencyId | assignment/stage updates | SUPPORTED | Enterprise Domain Model |
| AGG-002 | Client | Lead & CRM | Client identity/profile | consent and identity data must remain coherent; may link to multiple Leads | identity deduplication | CANDIDATE | Enterprise Domain Model |
| AGG-003 | Project | Property & Inventory | Project metadata | project identity and controlled lifecycle | concurrent project edits | SUPPORTED | Enterprise Domain Model |
| AGG-004 | Building | Inventory / ownership TBD | Building metadata | parent Project relationship | structural edits | OPEN | V3 hierarchy + commercial spine; aggregate ownership not fully specified |
| AGG-005 | Unit | Property & Inventory | Unit availability/pricing/construction facts | availability transitions; project ownership; commercial/construction state separation | **critical reservation race** | SUPPORTED | Enterprise Domain Model + V3 reservation safety |
| AGG-006 | Listing | Property & Inventory | Brokerage listing | mandate/ownership, price, availability | concurrent listing edits | SUPPORTED | Enterprise Domain Model |
| AGG-007 | Visit | Visit/Scheduling ownership TBD | Visit lifecycle | scheduled time, lead/property relationship, outcome | double booking / reschedule race | OPEN | Enterprise Domain Model; Scheduling ownership unresolved |
| AGG-008 | Offer | Sales / ownership TBD | Offer terms | authorization and discount/approval semantics | concurrent competing offers | **OPEN — CONTRACT IN PROGRESS** | V3 commercial spine + ASAS-OFFER-DOMAIN-CONTRACT-2026 |
| AGG-009 | Reservation | Reservation & Contract / Sales boundary TBD | Reservation lifecycle | approved ownership of a unit/property; expiration; one active winner per unit | **critical concurrency** | SUPPORTED | Enterprise Domain Model + V3 reservation safety |
| AGG-010 | Contract | Reservation & Contract | Contract lifecycle | cannot exist without approved Reservation; signature/status governed | concurrent approval/signature state | SUPPORTED | Enterprise Domain Model |
| AGG-011 | PaymentSchedule | Payment & Finance | payment obligations | installments owned by schedule; collection gated by contract milestone where applicable | payment posting/reconciliation race | SUPPORTED | Enterprise Domain Model |
| AGG-012 | Installment | PaymentSchedule child | schedule-local consistency | no collection before applicable contract milestone | concurrent allocation/collection | SUPPORTED | Enterprise Domain Model |
| AGG-013 | Payment | Finance / source of truth TBD | payment fact | idempotent recording; immutable financial fact after posting | duplicate payment/retry | OPEN | V3 finance rules; source aggregate model uses PaymentSchedule rather than explicit Payment aggregate |
| AGG-014 | Receipt | Finance | receipt issuance | traceability to accepted payment | duplicate issuance | OPEN | V3 commercial spine; detailed aggregate contract not fully sourced |
| AGG-015 | CommissionRule | Commission & Payout | commission configuration | rule type/scope; approval for sensitive changes | rule changes during deal lifecycle | SUPPORTED | Enterprise Domain Model |
| AGG-016 | CommissionRecord | Commission & Payout | calculated commission instance | calculation traceability; approved manual adjustment | concurrent adjustment/approval | SUPPORTED | Enterprise Domain Model |

## 5. PLATFORM / GENERIC OWNERSHIP MATRIX

| ID | Object/capability | Proposed ownership | Aggregate? | Rule | Status |
|---|---|---|---|---|---|
| PLAT-001 | Agency | Identity & Access / Tenancy | Yes in source model | tenant root | SUPPORTED |
| PLAT-002 | Branch | Identity & Access | Yes in source model | belongs to Agency | SUPPORTED |
| PLAT-003 | User | Identity & Access | Yes in source model | belongs to Agency/Branch; role-bound | SUPPORTED |
| PLAT-004 | NotificationPreference | Notification | Source describes aggregate | user channel preferences | SUPPORTED |
| PLAT-005 | CommunicationLog | Communication | No — source describes entity | append-only operational log | SUPPORTED |
| PLAT-006 | Attachment | Document & Attachment | No — source describes entity/reference | reusable attachment reference | SUPPORTED |
| PLAT-007 | Activity/Timeline | Event-derived projection | No | derived from domain events | SUPPORTED |
| PLAT-008 | Audit | Audit projection/evidence | No classic aggregate established | immutable evidence, not a mutable business object | SUPPORTED |
| PLAT-009 | Search index | Search | No | read model only | SUPPORTED |
| PLAT-010 | Reporting model | Analytics/Reporting | No | derived analytical model | SUPPORTED |
| PLAT-011 | Scheduling | Ownership unresolved | OPEN | do not assign implementation owner silently | FOUNDER DECISION REQUIRED |

## 6. INVARIANT CATALOG — CURRENT BASELINE

### INV-001 — Lead single-owner invariant
Rule: a Lead has exactly one current owner at a time. Owner: Lead & CRM. Enforcement: domain/application service + database constraint where applicable. Test: assignment concurrency + reassignment authorization. Status: SUPPORTED.

### INV-002 — Lead source immutability
Rule: Lead source and acquisition date are established once according to the source model. Owner: Lead & CRM. Test: mutation rejection + audit evidence. Status: SUPPORTED.

### INV-003 — Lead stage legality
Rule: pipeline stage changes follow the registered state machine; illegal transitions are rejected and legal transitions emit the required event. Owner: Lead & CRM. Test: complete transition matrix. Status: SUPPORTED / runtime enforcement UNVERIFIED.

### INV-004 — Agency tenancy
Rule: every tenant-owned aggregate belongs to exactly one tenant boundary; tenant scope is established before sensitive access. Owner: Identity/Tenancy platform + each domain owner. Status: SUPPORTED target rule / runtime UNVERIFIED.

### INV-005 — Unit state separation
Rule: commercial availability and construction progress are separate state dimensions. They must not be collapsed into one status. Owner: Property & Inventory. Status: SUPPORTED.

### INV-006 — Single active reservation winner
Rule: the system must guarantee one active reservation winner for a unit under concurrency. Owner: Inventory/Reservation boundary. Required controls: database constraint/conditional write, transaction/concurrency policy, idempotency, expiry handling, audit, outbox, race tests. Status: SUPPORTED requirement / enforcement UNVERIFIED.

### INV-006A — Unit/Reservation consistency contract
The required consistency outcome, failure classes, retry semantics and race-test catalogue are governed by `docs/architecture/ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md`. This does not select a locking primitive or authorize schema implementation. Status: OPEN / IMPLEMENTATION BLOCKED.

### INV-007 — Contract prerequisite
Rule: a Contract cannot exist without an approved Reservation. Owner: Reservation & Contract. Status: SUPPORTED.

### INV-008 — Milestone-gated collection
Rule: an installment cannot be marked collected before its applicable contract milestone is reached on governed Track A deals. Owner: Payment & Finance. Status: SUPPORTED source rule / legal applicability must be separately verified by qualified counsel before being represented as legal advice.

### INV-009 — Money representation
Rule: monetary values use integer minor units where applicable and explicit currency; floating-point arithmetic is not an authoritative monetary representation. Owner: Finance platform contract. Status: SUPPORTED target rule.

### INV-010 — Ledger immutability
Rule: posted financial entries are immutable; correction occurs through controlled reversal/new entries. Owner: Finance. Status: SUPPORTED target rule / executable ledger implementation UNVERIFIED.

### INV-011 — Double-entry balance
Rule: a posted balanced journal must satisfy total debits = total credits within the defined currency/rounding semantics. Owner: Finance. Status: SUPPORTED target rule / ledger schema not yet authorized.

### INV-012 — Commission adjustment approval
Rule: manual commission adjustment follows an approval-controlled workflow. Owner: Commission & Payout. Status: SUPPORTED.

### INV-013 — Event durability
Rule: authoritative domain changes requiring durable integration events must use a transactionally reliable publication mechanism; the default ASAS pattern is transactional outbox. Owner: platform event infrastructure + producer context. Status: SUPPORTED architecture / runtime UNVERIFIED.

### INV-014 — Event idempotency
Rule: consumers must tolerate duplicate delivery without creating duplicate business effects. Owner: each consumer + event platform contract. Status: SUPPORTED target rule.

### INV-015 — AI authority inheritance
Rule: AI tools cannot widen the authority of the human/service principal invoking them. Owner: Security/Authorization platform. Status: SUPPORTED target rule / runtime UNVERIFIED.

### INV-016 — Offer tenant boundary
Rule: Offer access and mutation require organization/tenant scope before the Offer is read or changed. Owner: Sales/Commercial + Identity/Tenancy. Status: SUPPORTED target rule / runtime UNVERIFIED.

### INV-017 — Offer unit integrity
Rule: an Offer must reference a valid commercial Unit/property according to the accepted Inventory contract. Owner: Sales/Commercial + Inventory. Status: SUPPORTED semantic rule / implementation UNVERIFIED.

### INV-018 — Offer opportunity integrity
Rule: an Offer must remain associated with the relevant opportunity/lead according to the accepted CRM contract. Owner: Sales/Commercial + CRM. Status: SUPPORTED semantic rule / implementation UNVERIFIED.

### INV-019 — Offer effective-price authority
Rule: effective price is derived from authoritative pricing inputs and explicit currency/rounding semantics; client- or AI-supplied effective price is not authoritative. Owner: Sales/Commercial + Finance pricing policy. Status: SUPPORTED target rule.

### INV-020 — Offer discount authority
Rule: a discount or commercial deviation becomes effective only after server-side authorization according to the canonical approval policy. Thresholds and permission key remain OPEN. Owner: Sales/Commercial + Authorization. Status: SUPPORTED target rule / policy OPEN.

### INV-021 — Offer validity
Rule: an expired Offer cannot be treated as a current valid commercial proposal without an explicit reissue/new lifecycle action. Owner: Sales/Commercial. Status: SUPPORTED target rule / state model OPEN.

### INV-022 — Offer/reservation separation
Rule: Offer submission/approval does not reserve inventory. Reservation ownership is established only through the authorized Reservation contract and concurrency protocol. Owner: Sales + Inventory/Reservation. Status: SUPPORTED.

### INV-023 — Offer material-change audit
Rule: material Offer term and approval-status changes produce auditable evidence. Owner: Sales/Commercial + Audit platform. Status: SUPPORTED target rule.

### INV-024 — Offer idempotent mutation
Rule: retryable API/external/AI operations that can create duplicate Offers or duplicate approval effects require idempotency semantics. Key design remains OPEN. Owner: Sales/Commercial + platform idempotency. Status: SUPPORTED target rule / key OPEN.

## 7. TRANSACTION BOUNDARY RULES

The following are architectural candidates, not implementation commands:

1. Lead mutation: one aggregate transaction for a legal Lead state transition plus audit/event/outbox write where required.
2. Unit availability transition: must protect the Unit availability invariant atomically.
3. Reservation creation: must atomically establish reservation ownership and prevent a second winner for the same active Unit.
4. Contract approval/signature state: contract lifecycle mutation must preserve Reservation prerequisite and authorization.
5. Financial posting: authoritative financial mutation must atomically preserve idempotency, ledger invariants and audit/outbox requirements.
6. Commission approval: calculated/adjusted commission state must preserve approval semantics.
7. Offer mutation: Offer creation/submission/approval must atomically preserve Offer invariants, authorization outcome, audit and required durable event publication. It must not acquire reservation ownership as an implicit side effect.

Cross-context side effects should normally be asynchronous and idempotent unless an explicit consistency requirement proves synchronous coupling necessary.

## 8. CONCURRENCY TEST CATALOG

Before implementation authorization, critical race tests must exist for:

- two agents reserving the same Unit;
- reservation expiry racing with conversion;
- duplicate reservation command/retry;
- two assignment writes for the same Lead;
- duplicate payment recording;
- payment retry after timeout;
- commission adjustment racing with approval;
- duplicate webhook delivery;
- event consumer retry after partial failure;
- duplicate Offer creation/retry with the same idempotency key;
- concurrent Offer approval/rejection or material-term mutation where policy permits both requests to race.

Exact database locking/isolation mechanisms remain implementation decisions until workload and schema contracts are validated.

## 9. OFFER CLOSURE GATE — H1.4.2

This gate advances the Offer contract without inventing persistence or permission identifiers.

| Dimension | Current disposition | Closure requirement |
|---|---|---|
| Business meaning | SUPPORTED | preserve Offer as time-bounded commercial proposal; Offer ≠ Reservation |
| Candidate ownership | OPEN | confirm Sales/Commercial ownership through accepted boundary decision/ADR or source authority |
| Tenant scope | SUPPORTED TARGET | map to canonical tenant/authorization contract |
| Unit reference | SUPPORTED | reconcile with Inventory Unit contract |
| Opportunity reference | SUPPORTED | reconcile with CRM/Opportunity contract |
| Pricing derivation | SUPPORTED TARGET | close authoritative pricing/rounding contract before executable schema |
| Discount policy | OPEN | canonical threshold + approval authority required |
| State machine | OPEN | canonical state register must accept exact states/transitions |
| `submit_offer` command | OPEN | command/permission/state/event mapping required |
| `approve_discount` command | OPEN | approval authority + permission + state/event mapping required |
| Permission key | OPEN | must reference existing canonical permission; no invented key |
| Domain events | OPEN | producer/version/tenant/correlation/idempotency contract required |
| Idempotency | OPEN | key scope, uniqueness and replay outcome required |
| Concurrency | OPEN | race catalogue + acceptance behavior required |
| Audit | SUPPORTED TARGET | audit record/evidence contract required |
| Persistence/schema | BLOCKED | not authorized until the above are closed |
| Application implementation | BLOCKED | task packet not yet implementation-ready |

**H1.4.2 status:** `PARTIAL`.

No database model, migration, API endpoint or production change is authorized by this gate.

## 10. OPEN BOUNDARY QUESTIONS

### OI-001 — Lead vs Opportunity/Deal
Source model deliberately keeps one Lead aggregate across the 17-stage pipeline. This is source-supported, but future product requirements may justify separation. No split is authorized without an ADR.

### OI-002 — Unit vs Project
Source model deliberately makes Unit its own aggregate because units are concurrently updated. This is strongly supported by the source model; implementation must still validate the actual write patterns.

### OI-003 — Reservation ownership
The commercial spine and source domain model place Reservation in Reservation & Contract, while inventory availability is owned by Unit. The exact atomic boundary is now governed by `ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md`. Aggregate separation remains; implementation mechanism remains OPEN.

### OI-004 — Offer ownership
V3 includes Offer in the commercial spine, while the supplied Enterprise Domain Model does not provide a detailed Offer aggregate. The derived Offer contract now establishes semantic invariants and candidate Sales/Commercial ownership, but ownership is not yet accepted as an implementation boundary. **Status: OPEN — CONTRACT IN PROGRESS.**

### OI-005 — Payment vs PaymentSchedule
The source model defines PaymentSchedule and PaymentReceived event, while V3 includes Payment as a business object. Do not create a Payment aggregate/table solely to reconcile naming. Define the authoritative payment fact and its relationship to schedules before schema promotion.

### OI-006 — Receipt ownership
Receipt appears in V3 commercial flow but lacks a complete source aggregate contract. Define whether it is an immutable financial document/projection of payment or an independently governed aggregate.

### OI-007 — Building aggregate
Building appears in the real-estate hierarchy and commercial spine, but source aggregate detail is incomplete. Ownership/invariants must be closed before implementation.

### OI-008 — Scheduling
Scheduling ownership remains separately unresolved. Do not move Visit into a new bounded context solely to solve the naming issue.

## 11. NON-GOALS

This register does not:

- create database tables;
- prescribe Prisma models;
- choose PostgreSQL locking primitives prematurely;
- approve production migrations;
- decide founder-level product scope;
- declare live runtime enforcement;
- convert historical architecture into current authority;
- create microservice boundaries.

## 12. NEXT ACTIONS

1. Close Offer ownership/invariants and its command/state/permission/event mapping without inventing persistence structures.
2. Reconcile Payment vs PaymentSchedule vs Receipt semantics.
3. Define Building ownership and invariants.
4. Map critical invariants to the registered state machine/permission/event where available.
5. Add missing invariant IDs to the canonical invariant register when one exists; until then this document is the derived baseline.
6. Update task packets only after ownership is proven.
7. Promote to executable schema only after H1/H2 gates permit it.

**Current checkpoint:** `ARCH-2026-H1.4-COMMAND-QUERY-CONTRACT-CLOSURE`