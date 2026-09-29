# ASAS Domain Engineering Track Register — 2026

**Canonical parent:** `docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md`  
**Architecture authority:** Architecture V3  
**Active Engineering Conference line:** `platform-architecture-2026`  
**Status:** ACTIVE DOMAIN-ENGINEERING REGISTER

## 1. Operating model

The Engineering Conference has two inseparable planes:

- **Control plane:** GATE-00 → GATE-07.
- **Domain/platform conference plane:** C01–C22.

Architecture V3 provides the canonical domain topology used to organize the resulting engineering work packages:

- D01 Core / Real Estate
- D02 CRM
- D03 Sales
- D04 Inventory
- D05 Finance
- D06 Website Studio
- D07 Marketing
- D08 Analytics
- D09 Documents

**D01–D09 are not replacements for C01–C22.** They are V3 topology work packages used to organize domain ownership. C01–C22 remain the conference-track IDs defined by the canonical Gate Model.

A C-track can contribute to one or more D packages and/or shared platform capabilities. A C-track can also be cross-domain. The exact C-label mapping must be reconstructed from repository provenance and canonical conference artifacts; it must not be guessed.

Domain/platform work is design/reconciliation work until the applicable implementation authorization exists. Completing a conference track never authorizes schema/code implementation by itself.

## 2. Canonical domain work packages

### D01 — Core / Real Estate

Owns the real-estate operational model and core vocabulary:

- Organization / Company / Branch / Team
- Project / Building / Floor / Unit
- Person / Customer / Vendor / Developer
- property/unit commercial and construction dimensions
- core reference data
- ownership and data lineage

Critical invariant: commercial unit state and construction state are separate state dimensions.

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

Must define states, commands, events, permissions, tenant boundaries, idempotency, duplicate handling, and cross-domain transitions.

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

Commercial and construction states must never be collapsed into one status.

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

Money invariants and immutability rules are domain constraints, not implementation details.

### D06 — Website Studio

Minimum scope:

- site/page/content model
- project/unit publication
- preview/publish lifecycle
- published projection
- SEO/content metadata
- media linkage
- cache invalidation semantics

Operational transactional data must not become an uncontrolled direct public read model.

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

## 3. Shared platform capabilities

These are cross-cutting capabilities rather than additional V3 bounded contexts:

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

## 4. C01–C22 reconciliation register

The active Gate Model explicitly establishes `C01–C22` as Engineering Conference domain/platform tracks. The current repository snapshot does not provide a single canonical machine-readable mapping of every C label to D01–D09 or a platform capability.

Therefore the authoritative interim register is:

| Track | Canonical state | Mapping | Rule |
|---|---|---|---|
| C01 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C02 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C03 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C04 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C05 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C06 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C07 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C08 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C09 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C10 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C11 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C12 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C13 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C14 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C15 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C16 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C17 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C18 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C19 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C20 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C21 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |
| C22 | ACTIVE / MAPPING OPEN | UNRESOLVED | recover from canonical provenance; do not guess |

The explicit example in the canonical Gate Model routes C-track findings through GATE-02 topology, GATE-03 contracts, GATE-04 security/data governance and GATE-07 slice authorization, with GATE-05/GATE-06 where applicable.

## 5. Cross-domain engineering sequence

1. Core / Real Estate ↔ Inventory
2. CRM ↔ Sales
3. Sales ↔ Inventory
4. Sales ↔ Finance
5. Finance ↔ Documents
6. All transactional domains ↔ Identity/Tenancy/Authorization/Audit
7. All transactional domains ↔ Events/Workflow
8. Operational domains ↔ Analytics

## 6. Closure checklist per domain/track

Before a domain work package or C-track finding can be marked CLOSED, verify where applicable:

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
- AI authority boundaries;
- ADRs;
- canonical artifact locations;
- cross-domain review;
- evidence package;
- known deferrals and reopening triggers.

## 7. Founder-decision boundary

The conference may derive technical consequences, but founder/product semantics remain founder authority. The existing `C02-03-RESERVATION-COMMISSION-FOUNDER-DECISION-GATE-2026-09-25.md` is an example: engineering has derived technical conclusions while seven commercial questions remain explicitly reserved for founder decisions. No schema/RLS implementation is authorized by that decision gate alone.

## 8. Reconciliation method

For each C label:

`Locate provenance → load historical artifact → identify scope → map to V3 topology/capability → identify gate outputs → resolve contradictions → record canonical mapping → verify → checkpoint`

No new C numbering hierarchy may be invented.
