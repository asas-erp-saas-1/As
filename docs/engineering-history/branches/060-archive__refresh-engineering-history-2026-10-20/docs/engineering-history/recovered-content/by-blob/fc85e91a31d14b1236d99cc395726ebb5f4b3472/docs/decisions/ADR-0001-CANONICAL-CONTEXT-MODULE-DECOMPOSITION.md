# ADR-0001 — Canonical Context / Module Decomposition

Status: PROPOSED — awaiting explicit founder acceptance
Date: 2026-09-17

## Context

The ASAS source set contains two architectural summaries that are not equivalent.

1. `AGENTS.md` contains a condensed nine-context description and places Scheduling under CRM.
2. The approved Phase 1.5 domain-model/roadmap describes **15 bounded contexts**.
3. `ASAS_Master_Implementation_Specification` defines **15 independent modules / 15 PostgreSQL schemas**, with explicit process ownership and module communication rules.

The nine-context text is a condensed operating summary. The later domain-model and implementation documents provide the more granular decomposition required for module ownership, persistence, events, dependencies, and extraction boundaries.

## Decision proposal

Use the **15-context / 15-module decomposition** as the canonical implementation architecture for Phase 2+.

The canonical modules are:

1. Lead & CRM — `lead_crm`
2. Property & Inventory — `property_inventory`
3. Visit Management — `visit_management`
4. Reservation & Contract — `reservation_contract`
5. Payment & Finance — `payment_finance`
6. Commission & Payout — `commission_payout`
7. Communication — `communication`
8. Identity, Access & Workspace — `identity_access`
9. Notification — `notification`
10. Collaboration & Extensibility — `collaboration`
11. Calendar & Scheduling — `calendar_scheduling`
12. Activity, Timeline & Audit — `activity_audit`
13. Search — `search`
14. Reporting & Analytics — `reporting`
15. Workflow & Automation Engine — `workflow_engine`

This is a **modular monolith**, not a microservice deployment. The implementation specification defines one codebase with Web and Worker processes and enforced module boundaries.

## Reconciliation of the nine-context summary

The nine-context statement in `AGENTS.md` should be treated as a legacy condensed grouping, not as permission to collapse the 15 implementation boundaries. It may remain as a high-level product summary only after its wording explicitly points to this ADR and the canonical 15-module map.

Scheduling therefore has a dedicated module/schema in the implementation architecture, while the earlier statement that Scheduling is a CRM submodule is considered a legacy summary that must not override the 15-module implementation contract.

## Consequences

### Positive
- Gives Claude one implementation decomposition.
- Gives each module explicit ownership and persistence boundary.
- Preserves future extraction boundaries without prematurely deploying microservices.
- Makes dependency-cruiser and schema-per-module validation deterministic.
- Prevents contradictory module assumptions from entering task packets.

### Negative / trade-off
- The repository will contain more explicit boundaries than the condensed nine-context summary.
- Some cross-cutting capabilities require event-driven integration rather than direct module calls.
- Existing documentation must be updated to stop presenting the nine-context summary as the implementation map.

## Evidence

Source-derived evidence:
- `ASAS_Enterprise_Domain_Model` / Phase 1.5: 15 bounded contexts.
- `ASAS_Master_Roadmap`: Phase 1.5 approved v2 and Phase 2.1 explicitly states 15 bounded contexts.
- `ASAS_Master_Implementation_Specification`: 15 modules and 15 database schemas, with module communication rules.

## Acceptance requirement

This ADR becomes `ACCEPTED` only after explicit founder acceptance. Until then, implementation tasks whose correctness depends on this decomposition remain blocked.
