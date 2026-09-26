# ASAS — PRODUCT REQUIREMENTS BASELINE 2026

**Artifact ID:** ASAS-PRD-2026-001  
**Status:** PROPOSED — FOUNDER REVIEW REQUIRED  
**Version:** 0.3.0  
**Effective date:** 2026-09-24  
**Owner:** Product / Founder authority  
**Architecture branch:** `platform-architecture-2026`  
**Authority:** This document does not override an approved product decision.

> This is a requirements consolidation artifact. It is deliberately broader than the initial implementation slice because the founder-confirmed product direction is a full Real Estate Operating System. Requirements are separated into product target, initial implementation scope, future reservations and unresolved decisions. This document must not turn architectural analysis into product authority by inference.

## 1. Product identity and target

ASAS is intended as a coherent **Real Estate Operating System**, not merely a narrow CRM or ERP. The target combines:

- public digital sales surface;
- Studio/CMS and publishing;
- real-estate project and inventory management;
- CRM and sales;
- finance/ERP;
- marketing and attribution;
- analytics and executive intelligence;
- communications;
- governance, permissions and workflows;
- future AI intelligence.

The public website and internal operating system are intended to operate from the same canonical property/inventory and commercial data rather than maintaining manually duplicated records.

**Founder-source evidence:** `foundation/reconcile-context-map-v2/docs/product/PRODUCT_TRUTH.md`, dated 2026-09-14, states this product identity and one-system-of-truth principle. The source is founder-confirmed product direction, while the architecture remains challengeable.

## 2. Multi-organization product model

ASAS is intended to support a broad real-estate ecosystem rather than one fixed company type. The platform must be able to represent and evolve around organizations such as:

- Developer / Promoter;
- Agency;
- Brokerage;
- Property Manager;
- Investor;
- Construction Company;
- Real Estate Marketing Company;
- future real-estate organization types.

The initial commercial wedge is Developer + Agency, with Agency + Developer + Brokerage workflows prioritized ahead of the broader ecosystem.

Organizations are not modeled as nested child accounts of one another. A Developer and an Agency may collaborate through an explicit relationship while remaining independent business organizations.

### Product principle

`Organization owns/controls authoritative business resources → Collaboration relationship grants scoped access → Authorized views expose only relevant data/actions.`

The Developer remains the authoritative owner/controller of its projects and inventory. Partner Agencies receive controlled commercial access rather than copied project/inventory records. The same authoritative data may produce different views for Developer, Agency manager, Agency sales agent and other authorized personas.

## 3. Visibility principle

**Visibility follows responsibility.**

A user should see only what is relevant to their task and authorized scope, not every resource available inside the organization or platform.

Examples:

- Agency sales agent: assigned leads, relevant clients, visits/follow-ups, authorized inventory, own offers/reservations and own performance;
- Agency manager: agency/team operations and authorized partner/project performance;
- Developer manager: authorized projects, inventory, partner agencies and permitted commercial performance;
- unrelated organization data, internal finance/costs, private CRM records and unrelated projects remain unavailable unless explicitly authorized.

This is a product requirement; the exact permission catalogue and enforcement mechanism belong to security/domain contracts.

## 4. Developer ↔ Agency collaboration value

The platform should let a Developer collaborate with Agencies while retaining control over projects and inventory.

For an authorized project, a Developer may receive an operational performance view containing, subject to configured visibility:

- inventory state and counts;
- participating agencies;
- attributed leads;
- visits;
- offers;
- reservations;
- sales;
- conversion metrics;
- sales velocity;
- agency-level performance;
- attribution/accountability;
- authorized commission/fee information;
- audit history.

The intended visibility policy is **Hybrid / configurable**: ASAS should provide useful default project-level performance views while allowing authorized Developer administrators to control sensitive partner-performance detail and fields.

This is a product requirement direction, not an implementation authorization.

## 5. Full operating lifecycle

Target lifecycle:

`Public discovery → project/unit evaluation → conversion → lead capture → qualification → visit → offer → reservation → contract → payment/collection → accounting/financial intelligence → post-sale operations`

Core traceability spine for engineering:

`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment/Receipt → Audit → Reporting`

These are lifecycle/traceability views, not a single bounded context, aggregate or database transaction.

## 6. Website + Studio/CMS target

The target product includes a real-estate-specific public digital surface and an internal Studio/CMS capable of normal publishing operations without code.

Target capabilities include:

- project pages;
- apartment/unit landing pages;
- rich property details;
- media, floor plans and renders;
- conversion CTAs;
- contextual WhatsApp/contact actions tied to viewed property context;
- lead forms;
- social-channel connectivity;
- SEO and structured public content;
- analytics and conversion tracking;
- internal editorial/publishing Studio;
- extensible integrations/plugins where they solve a real requirement.

The target experience may use mature CMS/commerce interaction patterns as references, but ASAS remains real-estate-specific.

## 7. ERP + CRM target

The long-term product target covers:

- CRM and lead management;
- sales pipeline;
- project and inventory management;
- developers/promoters and portfolios;
- buildings and units/apartments;
- reservations and contracts;
- installment schedules and collections;
- accounting/finance controls;
- commissions and payouts;
- documents and audit;
- marketing and campaign attribution;
- scheduling/calendar;
- workflow and approvals;
- analytics/executive intelligence;
- users, roles, permissions and scope administration;
- organization-to-organization collaboration and scoped partner access.

The platform must remain one coherent product rather than disconnected modules.

## 8. Developer / promoter operating model

A developer/promoter may be represented as a business entity whose projects and inventory are managed in ASAS. The product direction supports both:

- own-project / developer track;
- third-party brokerage / resale track.

The intended portfolio hierarchy is:

`Promoter/portfolio → Project → Building → Unit`

The exact legal/commercial representation, ownership and persistence model must follow validated domain contracts and product decisions rather than UI invention.

## 9. Initial implementation scope

The first implementation slice should establish the controlled commercial operating core and the foundations required for the product target:

- project/property presentation;
- inventory visibility;
- lead capture and qualification;
- lead assignment and activity tracking;
- visit management;
- offer and reservation workflows with correctness controls;
- contract lifecycle foundations;
- payment-plan visibility;
- controlled financial recording where explicitly authorized;
- audit trail;
- commercial reporting;
- identity, tenancy, organization membership, collaboration and permissions required by those workflows;
- Studio/public-surface foundations only where needed to prove the canonical-data path.

These capabilities remain implementation-blocked until their domain contracts and engineering gates are closed.

## 10. Product quality requirements

The platform must be:

- tenant-aware;
- server-authoritative for business actions;
- auditable;
- concurrency-safe for inventory/reservation operations;
- secure by design;
- locally reproducible for engineering;
- testable before remote deployment;
- usable in Arabic/RTL, French and English;
- responsive across operational device classes;
- explicit about loading, empty, error and recovery states;
- designed so public surfaces, Studio and internal operations can consume canonical data without manual duplication;
- designed for scoped cross-organization collaboration without weakening tenant isolation.

## 11. Users and authority

The product is intended to support multiple role/task-oriented users rather than one narrow persona. Candidate authority classes include:

- founder/product authority;
- platform/organization administration;
- workspace/branch operations;
- commercial users;
- finance/enterprise users;
- partner/collaboration users;
- system/background workers;
- AI acting strictly under caller authority.

The final persona, entitlement and permission catalogue remains a canonical product/security decision.

## 12. Business-critical correctness requirements

The product must prevent, or deterministically resolve:

- double sale / competing active reservation winners;
- unauthorized tenant access;
- unauthorized cross-organization resource access;
- unauthorized financial mutation;
- illegal lifecycle transitions;
- untraceable commercial actions;
- duplicate financial/event processing;
- AI authority escalation;
- divergence between public property data and internal inventory data;
- accidental disclosure of private organization/partner data.

Exact enforcement mechanisms belong to architecture/domain contracts and must not be invented here.

## 13. Strategic success targets

Founder-confirmed strategic targets recorded in the historical product-truth artifact are:

- 10 companies;
- 1,000 users;
- 100,000 leads;
- 10,000 reservations;
- 1B DZD GMV;
- 10M DZD ARR.

These are strategic targets, not current-scale claims and not engineering capacity guarantees.

## 14. Product metrics — not yet approved operational targets

Candidate measurement categories:

- lead-to-contact conversion;
- contact-to-visit conversion;
- visit-to-offer conversion;
- offer-to-reservation conversion;
- reservation-to-contract conversion;
- inventory availability accuracy;
- reservation conflict rate;
- payment-plan reconciliation accuracy;
- task/activity completion;
- operational response time;
- critical workflow failure rate;
- tenant/security incident rate;
- public-to-CRM attribution integrity;
- Studio publishing reliability;
- partner-agency performance attribution;
- project-level inventory velocity;
- cross-organization collaboration activity.

Numeric operational targets require explicit product/business approval.

## 15. Scope and sequencing

### Product target

Broad Real Estate Operating System described above.

### Initial implementation

Controlled commercial lifecycle + security/tenancy/audit/reporting foundations + organization/collaboration foundations + the minimum canonical public/Studio path needed to validate the system-of-truth principle.

### V1+

Expand capability after verified vertical slices and operational evidence.

### Future reservations unless separately authorized

- global multi-country packs;
- active-active multi-region infrastructure;
- marketplace;
- autonomous finance;
- autonomous high-impact AI actions;
- full construction ERP;
- full property-management suite;
- developer platform as a separate product surface;
- global ontology/data lake;
- premature microservice decomposition;
- independent deployables for every context/module.

The future reservations are not rejections of the product ambition; they are sequencing controls.

## 16. Requirements traceability rule

Every implementation requirement must trace to:

`Product requirement → Architecture decision/contract → Context/module → Command/query → Permission → Invariant/state → Event/schema impact → Task → Test → Evidence`

An implementation task without this chain is not implementation-ready.

## 17. Open product decisions

The following require explicit product/founder authority rather than architectural inference:

- final MVP/initial vertical-slice scope;
- exact product personas and entitlements;
- pricing/billing model for the future SaaS offering;
- final Scheduling ownership/product behavior;
- legal/commercial policy where jurisdiction-specific interpretation is required;
- AI actions requiring human approval;
- final Studio extensibility/plugin policy;
- marketplace/construction/property-management scope;
- exact multi-company/group hierarchy and commercial tenancy semantics;
- exact default versus configurable partner-performance visibility;
- sensitive partner-performance and financial field policy;
- commercial relationship lifecycle/legal semantics.

## 18. Evidence and provenance

Primary architecture basis:

`docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md`

Control/routing basis:

`docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`

Engineering route:

`docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`

Research-first method:

`docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md`

Founder product evidence:

`foundation/reconcile-context-map-v2/docs/product/PRODUCT_TRUTH.md`

Organization collaboration contract:

`docs/architecture/contracts/ASAS-ORGANIZATION-COLLABORATION-AUTHORIZATION-CONTRACT-2026.md`

External engineering evidence for least privilege, resource-based authorization and tenant isolation includes OWASP Authorization guidance, Microsoft Azure Well-Architected SaaS identity/access guidance and AWS SaaS tenant-isolation/authorization guidance. These sources support engineering technique and do not prove ASAS runtime state.

Source package v1.6.1 is research/provenance input only and is not itself product authority.

## 19. Acceptance gate

This PRD remains `PROPOSED — FOUNDER REVIEW REQUIRED` until the founder/product authority explicitly accepts, rejects, or revises the consolidated baseline.

No engineering agent may treat this draft as authorization to expand implementation scope.
