# ASAS Domain Engineering Track Register — 2026

**Canonical parent:** `docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md`
**Architecture authority:** Architecture V3
**Active engineering line:** `platform-architecture-2026`
**Status:** ACTIVE DOMAIN-ENGINEERING REGISTER

## Operating model

The Engineering Conference has two inseparable planes:

- **Control plane:** G0–G7 foundation gates.
- **Domain plane:** domain engineering work packages for the nine canonical bounded contexts.

A domain work package is design/reconciliation work until the applicable implementation authorization exists. Domain work therefore continues during the foundation conference without authorizing database or feature implementation.

## Canonical domain work packages

### D01 — Core / Real Estate

Owns the real-estate operational model and its core vocabulary. Minimum scope:

- Organization / Company / Branch / Team
- Project / Building / Floor / Unit
- Person / Customer / Vendor / Developer
- property/unit commercial and construction dimensions
- core reference data
- ownership and data lineage

Critical invariants include the separation of **commercial unit state** from **construction state**.

### D02 — CRM

Minimum scope:

- Lead / Prospect / Customer identity continuity
- assignment
- activities
- calls / meetings / appointments / visits
- opportunity and pipeline lifecycle
- communication linkage
- attribution
- CRM quality and SLA controls

The CRM domain must define its states, commands, events, permissions, tenant boundaries, idempotency, duplicate handling, and cross-domain transitions.

### D03 — Sales

Minimum scope:

- commercial opportunity progression
- offer
- pricing and discount approvals
- hold
- reservation
- contract preparation
- sales authority and approval workflows

Reservation is a critical consistency boundary and must preserve one active winner per unit under concurrency.

### D04 — Inventory

Minimum scope:

- project/building/floor/unit inventory
- availability
- unit assignment
- pricing dimensions
- commercial state
- construction state
- publication state where applicable
- reservation/hold consistency

Commercial and construction states must never be collapsed into a single status.

### D05 — Finance

Minimum scope:

- obligations
- installment plans
- payments
- receipts
- commissions
- subledger
- general ledger boundary
- reconciliation
- financial approvals

Money invariants and immutability rules are mandatory domain constraints, not implementation details.

### D06 — Website Studio

Minimum scope:

- site/page/content model
- project/unit publication
- preview/publish lifecycle
- published projection
- SEO/content metadata
- media linkage
- cache invalidation semantics

Operational transactional data must not be exposed as an uncontrolled direct public read model.

### D07 — Marketing

Minimum scope:

- campaigns
- creatives
- channels
- attribution/touchpoints
- lead-source lineage
- budget and performance analysis
- consent/suppression boundaries

### D08 — Analytics

Minimum scope:

- operational read models
- historical/event analytics
- KPI definitions
- funnel/inventory/collections/cashflow metrics
- predictive model evidence
- lineage and snapshot requirements

Predictions require model/version/timestamp/input snapshot/confidence and applicable explanation metadata.

### D09 — Documents

Minimum scope:

- document metadata
- contracts/reservations/invoices/receipts
- identity/compliance documents
- plans/floorplans/brochures
- access control
- retention/legal hold/redaction
- signature integration boundary

Electronic-signature behavior remains a legal-validation item where the source specification marks it unresolved.

## Shared platform capabilities

The following are cross-cutting capabilities rather than additional V3 bounded contexts:

- Identity
- Tenancy
- Authorization
- Audit
- Events
- Workflow
- Scheduling
- Search
- Media
- Notifications
- Integrations
- Configuration
- AI
- SaaS Control
- Developer Platform

They require their own contracts and verification but do not create additional bounded-context ownership unless a future ADR changes the architecture.

## Cross-domain engineering sequence

1. Core / Real Estate ↔ Inventory
2. CRM ↔ Sales
3. Sales ↔ Inventory
4. Sales ↔ Finance
5. Finance ↔ Documents
6. All transactional domains ↔ Identity/Tenancy/Authorization/Audit
7. All transactional domains ↔ Events/Workflow
8. Operational domains ↔ Analytics

## Closure checklist per domain

Before a domain can be marked CLOSED, verify:

- scope and ownership;
- ubiquitous language;
- aggregates/entities;
- workflows;
- commands/actions;
- state machines;
- events;
- permissions;
- tenant boundaries;
- invariants;
- approvals;
- contracts;
- data ownership;
- integration boundaries;
- analytics/KPIs;
- failure modes;
- concurrency/idempotency;
- AI authority boundaries where applicable;
- ADRs;
- canonical artifact locations;
- cross-domain review;
- evidence package.

## C-label rule

Historical `C01/C02/C03/...` labels are not currently represented by a canonical register in the repository. They must be reconciled to these D01–D09 domain work packages before being treated as authoritative. Until then, do not create a second numbering hierarchy by guesswork.
