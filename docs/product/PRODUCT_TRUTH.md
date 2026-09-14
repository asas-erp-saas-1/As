# ASAS Product Truth — Founder Decisions v0.1

**Date:** 2026-09-14
**Status:** Founder-confirmed direction; architecture proposal remains challengeable.

## 1. Product identity

ASAS is not being designed as a narrow CRM or a narrow ERP. The target is a coherent **Real Estate Operating System** combining the public digital sales surface, Studio/CMS, real-estate inventory, CRM, sales, finance/ERP, marketing, analytics, communications, governance, workflows and future AI intelligence.

The platform must serve the full operating chain:

**Public discovery → project/unit evaluation → conversion → lead capture → qualification → visit → offer → reservation → contract → payment/collection → accounting/financial intelligence → post-sale operations**, while keeping the public website and internal operating system driven by the same canonical data.

## 2. Website + Studio

The public product must provide a professional, real-estate-specific website experience with:

- project pages
- apartment/unit landing pages
- rich property details
- media, floor plans and renders
- strong conversion CTAs
- contextual WhatsApp/contact actions tied to the viewed project/unit
- lead forms
- social-channel connectivity
- SEO and structured public content
- analytics and conversion tracking
- an internal publishing/editorial Studio capable of managing the public website without code for normal operations
- an extensible integration/plugin model where external capabilities are genuinely useful

The target experience is comparable to or better than the strongest modern website/CMS commerce-style management experiences, while remaining specialized for real estate rather than copying another product literally.

## 3. ERP + CRM

The internal operating system should ultimately cover the complete real-estate commercial and enterprise lifecycle, including:

- CRM and lead management
- sales pipeline
- project and inventory management
- developers/promoters and their portfolios
- buildings and units/apartments
- reservations and contracts
- installment schedules and collections
- accounting/finance controls
- commissions and payouts
- documents and audit
- marketing, attribution and campaign management
- scheduling/calendar
- workflow and approvals
- analytics and executive intelligence
- user, role, permission and scope administration

The system should be designed as a coherent product, not a collection of disconnected modules.

## 4. Developer / promoter operating model

A developer/promoter can be represented as a business entity whose projects and inventory are managed in ASAS. This supports both:

- own-project / developer track
- third-party brokerage / resale track

The platform should allow a promoter relationship to be configured and then its portfolio populated with projects → buildings → units. The exact commercial/legal representation must follow the validated domain model and contracts rather than being invented in UI code.

## 5. Users and roles

The founder selected the future product direction **B + E** from the prior questionnaire: the architecture is a proposal that may be challenged, while the product is intended to support the full set of users rather than a single narrow persona.

UX must therefore be role/task oriented: each user should see the operational workspace appropriate to their responsibilities, while the platform remains one integrated system.

## 6. Data ownership and tenancy

Operational data belongs to the agency/tenant that owns it. The architecture must therefore separate tenant data from platform-level capabilities and support future ASAS Group / multi-company growth without forcing a rebuild.

The future hierarchy should be determined by the domain model and authorization architecture, with agency/workspace/branch/company/project scopes where justified.

## 7. Non-goal philosophy

The founder does not want artificial feature exclusions merely for simplicity. Engineering should still prioritize delivery and avoid speculative complexity, but the long-term target is broad coverage of the real-estate operating model.

Features must earn their place through a clear business problem, workflow, control, or measurable advantage.

## 8. Strategic success targets

Founder-stated long-term targets:

- 10 companies
- 1,000 users
- 100,000 leads
- 10,000 reservations
- 1B DZD GMV
- 10M DZD ARR

These are strategic targets, not claims of current scale.

## 9. Product principle

The central product principle is **one system of truth**: property, inventory, pricing, lead, campaign, reservation, contract and financial state should not be manually duplicated between the website, CRM and ERP.

The existing handoff already specifies this principle for the public site: a single apartment record should drive its page, inventory, cards, search, filters, SEO, admin and structured data. This repository will extend that principle across the complete operating system.
