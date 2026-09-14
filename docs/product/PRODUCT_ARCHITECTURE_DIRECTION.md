# ASAS Product Architecture Direction

## Founder-confirmed target

ASAS should become one coherent Real Estate Operating System, not separate website, CRM and ERP products glued together.

### The three connected surfaces

1. **Public Experience** — discovery, project pages, apartment/unit pages, search, media, floor plans, pricing, availability, SEO, CTAs, forms, WhatsApp/call/contact and conversion analytics.
2. **Studio / Publishing OS** — a professional real-estate website builder and content operating layer for projects, units, landing pages, navigation, media, SEO, publishing, previews, versions, rollback and integrations.
3. **Operations OS** — CRM, inventory, sales, reservations, contracts, payments/collections, finance, marketing, scheduling, documents, workflows, audit, reporting and executive intelligence.

All three surfaces consume the same canonical domain data.

## Core real-estate model

A promoter/developer is a managed business relationship. Its portfolio can contain projects, buildings and sellable units. A project may be owned by the tenant or represented for a third-party developer under a commercial mandate. The commercial track is a property/deal attribute rather than a second disconnected pipeline.

The operating chain is:

**Agency/Workspace → Developer relationship → Project → Building → Unit → Public presentation → Lead → Qualification → Visit → Offer → Reservation → Contract → Payment schedule → Collection → Accounting/Finance → Post-sale**

## Website-to-CRM conversion contract

A visitor interacting with a specific unit should carry context into conversion:

- project
- unit/apartment
- source
- campaign/UTM
- landing page/session
- requested action

Primary conversion actions include WhatsApp, phone, lead form, brochure request and visit request. The existing handoff explicitly calls for contextual WhatsApp/contact CTAs and short mobile-first forms.

## CRM operating logic

The CRM must preserve one customer history across multiple leads/deals. Phone normalization and duplicate detection are foundational. Ownership is explicit, assignments are auditable, stalled stages create follow-up obligations, and management sees team performance without taking ownership away from agents.

The canonical handoff contains a 17-stage business journey and a more formal Opportunity state machine. The implementation must use the registered state machines rather than inventing a second lifecycle.

## Inventory truth

The inventory is not static website content. A unit is a transactional business object with availability, construction state, price and payment-plan information. One record must drive website cards/pages, inventory views, search/filtering, SEO and admin.

Reservation must be single-winner and race-safe. Commercial and construction status are separate axes.

## Finance and ERP logic

The finance layer is not merely a payment list. It must support an auditable progression from contractual obligations to scheduled installments, receipts, allocations, commissions and immutable double-entry accounting where the applicable phase enables it.

Posted financial facts are append-only. Corrections are represented by new accounting events/entries, never by rewriting history.

## Administration

Administration is a control plane, not a generic settings page. It should eventually manage:

- users
- roles
- permission keys
- scopes
- organizational hierarchy
- project assignments
- approvals
- integrations
- publishing
- templates
- audit visibility
- security controls

Every operational UI should be adapted to the user's responsibility while respecting the same authorization kernel.

## Integration philosophy

External services should be integrations, not alternate sources of truth. WhatsApp, calendars, portals, email/SMS, analytics and future financial/notary providers connect through explicit integration boundaries and event/webhook contracts.

The product should minimize mandatory external dependencies for core operations, while remaining extensible through a controlled plugin/integration model.

## AI direction

AI is an intelligence layer over governed operational data and domain events. It should assist with lead scoring, sales probability, cashflow forecasting, collection risk, construction risk, search and executive decision support. AI must not bypass authorization or directly mutate the database outside normal application services.

## Product quality bar

The target is not feature-count parity with Oracle, HubSpot, Odoo or Zoho. The target is a better fit for the real-estate operating model: fewer disconnected tools, stronger property-to-sale continuity, stronger inventory truth, stronger auditability, and a premium public conversion surface connected directly to the operating system.

## Scope evolution

The founder explicitly wants the architecture proposal challenged where necessary. New capabilities should therefore be added when research and domain analysis demonstrate a real requirement, but implementation must remain dependency-ordered and evidence-driven.
