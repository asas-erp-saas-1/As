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

The active Gate Model establishes `C01–C22` as Engineering Conference domain/platform tracks. As of 2026-10-14 the **complete** mapping is recovered from repository provenance: C03–C06 had explicit canonical provenance already, and C01, C02, C07–C22 were recovered by content-based search (see the provenance basis below). Track scope is recovered; closure state varies and is recorded per track.

| Track | Canonical routing established from repository evidence | Current semantic state | Gate route / dependency |
|---|---|---|---|
| C01 | **Platform Constitution** — identity, source hierarchy, one canonical artifact rule, one engineering route, C-track subordination | CLOSED (baseline / architecture) | GATE-01 |
| C02 | **Organization / Membership / Relationship** — business principal, membership, workspace, branch, organization relationship, collaboration boundary (Hybrid D), partner performance visibility (Hybrid E); extended by the closed attribution, commission, offer-bridge, competition and scheduling-ownership decisions | SEMANTICALLY CLOSED; one refinement OPEN | GATE-02 → GATE-03 → GATE-04 → GATE-07 |
| C03 | Real Estate domain semantics / resource model | SEMANTIC BASELINE; C03.13 OPEN | GATE-02 → GATE-03 → GATE-04 → GATE-07 |
| C04 | CRM | SEMANTIC BASELINE; registry/evidence convergence OPEN | GATE-02 → GATE-03 → GATE-04 → GATE-07 |
| C05 | Sales | SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED | GATE-03/04/07 dependencies remain; no implementation authorization |
| C06 | Finance | SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED; statutory/accounting convergence OPEN | GATE-03/04/07 dependencies remain; country/accounting authority required |
| C07 | **Marketing** — campaigns, sources, attribution, ad spend, conversion, data lineage | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-03 |
| C08 | **Studio / Website / CMS** — project/unit publishing, content ownership, media, SEO, forms, lead capture, one-system-of-truth sync | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-03 → GATE-05 |
| C09 | **Analytics** — metric definitions, ownership, source facts, transformations, refresh, authorization, lineage, performance views | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-03 → GATE-05 |
| C10 | **Documents** — templates, versions, access policy, generated documents, signatures/integrations, retention, legal validation | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-03 → GATE-04 |
| C11 | **Scheduling / Activities** — Core-hosted platform capability; provider sync is Integrations-owned | OWNERSHIP CLOSED; implementation contract OPEN | GATE-03 |
| C12 | **Workflow / Automation** — triggers, conditions, actions, approvals, retries, idempotency, compensation, audit | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-03 → GATE-06 |
| C13 | **Integrations** — WhatsApp, ad providers, calendars, webhooks, external APIs, provider accounts, retries, signatures, rate limits, reconciliation | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-03 → GATE-05 |
| C14 | **Search / Media / Notifications** — permission-aware search, multilingual indexing, phone normalization, sensitive-search audit, media access, notifications | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-03 → GATE-04 |
| C15 | **Security / Tenancy** — tenant boundary, resource authorization, RLS, storage, jobs, cache, analytics, events, service roles, support access | SCOPE RECOVERED; NO DECISION PACKAGE | GATE-02 → GATE-04 |
| C16 | **Data Architecture** — domain model → target schema → contract → migrations → live database reconciliation | SCOPE RECOVERED; CLOSURE NOT ASSESSED | GATE-01 → GATE-03 |
| C17 | **Events / Outbox** — event ownership, envelope, versioning, idempotency, delivery, replay, DLQ, reconciliation | SCOPE RECOVERED; CLOSURE NOT ASSESSED | GATE-03 → GATE-06 |
| C18 | **AI** — read-only intelligence first; tool authority inherits caller authority; no direct DB authority; human approval for sensitive actions | SCOPE RECOVERED; CLOSURE NOT ASSESSED | GATE-04 → GATE-05 |
| C19 | **Design / Experience** — tokens → primitives → components → patterns → templates → surfaces; Arabic/RTL, French, English, responsive, accessibility, failure states | SCOPE RECOVERED; CLOSURE NOT ASSESSED | GATE-05 |
| C20 | **Codex Engineering** — task packet, skills, implementation, tests, evidence, review, convergence | ACTIVE OPERATING WORKSTREAM | GATE-06 |
| C21 | **Runtime / Operations** — CI, observability, backup/restore, deployment, staging, runtime identity, production gates | SCOPE RECOVERED; CLOSURE NOT ASSESSED | GATE-00 → GATE-06 |
| C22 | **SaaS Evolution** — provisioning, billing/metering, enterprise isolation, API platform, extensions, marketplace, country packs (future) | FUTURE SCOPE — ARCHITECTURAL RESERVATION | not scheduled |

### Provenance basis for the recovered C01–C22 mapping (updated 2026-10-14)

The earlier statement that C01 and C07–C22 were "not yet recovered" was the result
of a **filename-based** search. A **content-based** search recovers the full
mapping from two independent enumerations:

- `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md` §9 — enumerates all
  twenty-two tracks with scope statements (C01 line 223 … C22 line 327), and
  §8.1–8.3 records the C02-closed attribution, commission and offer decisions.
- `docs/architecture/amendments/ASAS-ROADMAP-AMENDMENT-010-ENGINEERING-CONFERENCE-PATH-2026-09-25.md`
  line 33 — states the full sequence and the governing qualifier "These are
  workstreams, not bounded contexts."

Corroborating artifacts: `docs/architecture/reconciliation/ASAS-ENGINEERING-CONFERENCE-RECOVERY-AND-COMPLETION-MAP-2026-09-26.md`
§3 (C01 CLOSED; C02 SEMANTICALLY CLOSED with one refinement; C11 ownership closed),
`docs/governance/FOUNDER-DECISIONS.md` FD-002 (Scheduling is Core-hosted) and
`decisions/ADR-0021-SCHEDULING-OWNERSHIP-2026-09-26.md`.

Full recovery record and the list of corrected register rows:
`docs/architecture/reconciliation/ASAS-C-TRACK-PROVENANCE-RECOVERY-2026-10-14.md`.

**Corrections applied to this register:** C01 was `MAPPING OPEN` → **CLOSED**;
C02 was described only by its inventory/attribution extension → **Organization /
Membership / Relationship** is its primary scope; C11 was `MAPPING OPEN` →
**OWNERSHIP CLOSED**; C07–C14 and C16–C22 were `MAPPING OPEN` → **scope
recovered** with per-track closure states as recorded above.

**Still unresolved:** eight tracks (C07–C10, C12–C15) have scope but **no decision
package**; C16–C22 have **no closure assessment** at all and require an explicit
CLOSED / DEFERRED / REJECTED / BLOCKED disposition under the Recovery Map §9
definition of done.

### Provenance basis for the recovered C03–C06 mapping

- `docs/architecture/reconciliation/ASAS-C03-C06-DEEP-CLOSURE-DECISIONS-2026-09-27.md` explicitly scopes C03 = Real Estate, C04 = CRM, C05 = Sales and C06 = Finance and records their second-pass semantic review.
- `docs/architecture/task-packets/ASAS-TASK-C04-CRM-ENGINEERING-CONFERENCE-2026-09-26.md` explicitly identifies C04 as the CRM engineering conference track.
- `docs/architecture/task-packets/ASAS-TASK-C05-SALES-ENGINEERING-CONFERENCE-2026-09-26.md` explicitly identifies C05 as Sales and records semantic closure with implementation blocked.
- `docs/architecture/task-packets/ASAS-TASK-C06-FINANCE-ENGINEERING-CONFERENCE-2026-09-26.md` explicitly identifies C06 as Finance and records semantic closure with implementation blocked.
- `docs/architecture/contracts/ASAS-C03-REAL-ESTATE-RESOURCE-MODEL-CONTRACT-2026.md` and the C03 research records provide additional C03 provenance.

### Important status rule

`SEMANTICALLY CLOSED` means the conference semantic questions are sufficiently decided for that track's current scope. It does **not** mean the domain is implementation-ready. The Gate Model requires downstream contract, security/data-governance, verification and slice-authorization controls before implementation.

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

The conference may derive technical consequences, but founder/product semantics remain founder authority. The existing `C02-03-RESERVATION-COMMISSION-FOUNDER-DECISION-GATE-2026-09-25.md` is an example: engineering has derived technical conclusions while commercial questions remain explicitly reserved for founder decisions. No schema/RLS implementation is authorized by that decision gate alone.

## 8. Reconciliation method

For each C label:

`Locate provenance → load historical artifact → identify scope → map to V3 topology/capability → identify gate outputs → resolve contradictions → record canonical mapping → verify → checkpoint`

No new C numbering hierarchy may be invented.
