# Proposed crosswalk: legacy closure dimensions to current Engineering Conference gates

**Status: DRAFT / PROPOSED CROSSWALK — NOT APPROVED.** No architecture gate is closed or advanced by this mapping. The purpose is to prevent loss of early-stage coverage while using the current canonical gate model.

## Why a crosswalk is needed

The early `FOUNDATION-MASTER-CLOSURE-PROGRAM.md` defines 14 closure dimensions, named G00–G13. The current `ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md` defines eight serial Engineering Conference gates, GATE-00–GATE-07. These are different abstractions:

- The **legacy G00–G13** are closure dimensions/checklists for types of engineering completeness.
- The **current GATE-00–GATE-07** are serial decision gates governing architecture authority and implementation authorization.

Therefore G00 is not simply the old name for GATE-00, and the matching numeric substrings must not be used as an implicit migration rule. Several closure dimensions correctly map across more than one current gate.

## Proposed many-to-many mapping

| Legacy dimension | Proposed current gate(s) | Why |
|---|---|---|
| `G00` — Source and reality reconciliation | GATE-00 (primary); GATE-01 (secondary) | Repository and platform identity; source package/artifact inventory; production database reality; source hierarchy; explicit provenance for facts. |
| `G01` — Context and ownership closure | GATE-02 (primary); GATE-01 (authority dependency) | One owner per business fact; bounded contexts; aggregate ownership; cross-context references; projections and platform capability boundaries. |
| `G02` — State-machine closure | GATE-03 | Exact states/edges, actors, permissions, triggers, preconditions, forbidden edges, expiry/compensation, audit/outbox and test evidence. |
| `G03` — Command closure | GATE-03 | Canonical command IDs, owner/context, aggregate, permission, scope/ABAC, preconditions, idempotency class, transaction, events and negative tests. |
| `G04` — Authorization closure | GATE-04 (primary); GATE-03 (command contract) | Permission key register, subject/tenant/scope resolution, explicit deny, ABAC, property-level restrictions, impersonation rules, route/command mapping and adversarial tests. |
| `G05` — Transaction and concurrency closure | GATE-03 (business invariant); GATE-04 (data/transaction safety) | Atomic boundaries; conflict/locking strategy; serializable/optimistic/pessimistic choice; uniqueness constraints; idempotency; retries; race tests. |
| `G06` — Event and workflow closure | GATE-03 (domain event semantics); GATE-05 (integration/operations) | Event identity/version, producer/consumer, transaction-outbox, inbox, ordering, replay, DLQ, retries and recovery. |
| `G07` — Financial correctness closure | GATE-03 (financial invariants); GATE-04 (integrity/security) | Immutable posted facts, decimal/currency/rounding semantics, receipt/payment/ledger authority, refund/cancellation policy, audit and reconciliation. |
| `G08` — Data governance and lifecycle closure | GATE-04 | Canonical data ownership, tenant/RLS boundaries, data classification, retention, deletion/tombstone, document/media lifecycle and migration policy. |
| `G09` — Platform security closure | GATE-04 (primary); GATE-06 (verification/agent controls) | Threat model; least privilege; secrets; webhook verification/replay; uploads; SSRF; XSS; RLS; cross-tenant tests and explicit stop conditions. |
| `G10` — UX/Figma/product closure | GATE-05 (experience); GATE-01 (product/architecture authority) | Product truth, role-specific flows, accessibility, Arabic/RTL, design tokens, empty/error states, responsive behavior and accepted prototype traceability. |
| `G11` — AI and integration trust closure | GATE-05 (integration contracts); GATE-06 (AI-agent governance) | Provider contract, signature verification, idempotency/replay, least privilege, tenant boundary, model/tool permissions, approval and irreversible-action controls. |
| `G12` — Observability, reliability and recovery closure | GATE-05 (operations); GATE-06 (verification) | Logs/metrics/traces; correlation and causation IDs; retry policy; DLQ/replay; reconciliation; backup/restore; repair and recovery runbooks. |
| `G13` — Quality and release closure | GATE-06 (engineering verification); GATE-07 (implementation authorization) | CI/static/type/test validation; migration/rollback evidence; release gate; acceptance tests; final implementation authorization. |

The CSV companion records the evidence requirements, open dependencies and explicit non-approved status for each row.

## Critical open issues already known

1. **C2-001 and C2-001-S:** context/module decomposition and Scheduling ownership are still open. The mapping cannot close GATE-02 or resolve domain topology.
2. **Authorization traceability:** `registers/permissions.csv` contains 50 permission rows and eight role/persona columns, but end-to-end command/route/scope/audit/test traceability is not proven.
3. **State-machine closure:** the old register's `CLOSED/OPEN/DERIVED` classifications need revalidation against current registers and contracts. The current reservation consistency contract is accepted semantically but implementation-gated; the detailed state-machine contract remains proposed/blocked.
4. **Transaction/idempotency/outbox:** command order, authoritative concurrency mechanism, retention, retries, DLQ and replay policy still require explicit closure and evidence.
5. **Runtime truth:** production identity/schema/database evidence cannot be inferred from repository architecture or CI.

## Approval conditions

Before this crosswalk is promoted:
- review it against the exact exit criteria in the current gate model and roadmap;
- ensure each legacy dimension has a current owner, evidence artifact, state and reviewer;
- attach canonical decisions for any changed/merged requirement;
- keep unresolved dimensions OPEN/BLOCKED with a named decision path;
- ensure GATE-07 remains the sole implementation-authorization gate.

Until this is approved, treat it as an analysis aid only. The machine-readable companion is `GATE-CROSSWALK-CANDIDATE-2026-10-17.csv`.
