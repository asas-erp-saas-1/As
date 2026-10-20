# ASAS — ORGANIZATION COLLABORATION & AUTHORIZATION CONTRACT 2026

**Artifact ID:** ASAS-ORG-COLLAB-2026-001  
**Status:** PROPOSED / PRODUCT-ARCHITECTURE DECISION RECORDED / IMPLEMENTATION BLOCKED  
**Version:** 0.1.0  
**Effective date:** 2026-09-24  
**Branch:** `platform-architecture-2026`  
**Authority:** Founder-confirmed product interview + engineering reconciliation; this contract does not authorize schema/runtime implementation until promoted through the normal gates.

## 1. Decision

ASAS shall support multiple real-estate business organizations in one coherent platform. The architecture must not model an Agency as a child account of a Developer, or a Developer as a child account of an Agency.

An `Organization` is the business principal. Organization type is extensible and may include, without making the list exhaustive:

- Developer / Promoter
- Agency
- Brokerage
- Property Manager
- Investor
- Construction Company
- Real Estate Marketing Company
- future real-estate organization types

The relationship between organizations is a first-class business concept. A Developer and an Agency may collaborate through an explicit commercial relationship without either organization becoming a child account of the other.

## 2. Ownership rule

The organization that is authoritative for a business resource owns that resource in the domain sense.

For the current developer/agency operating model:

`Developer → owns/controls → Project → Building → Unit / Inventory`

An Agency receives controlled access to the developer's authorized project/inventory through a collaboration relationship. The Agency does not receive ownership merely because it sells the inventory.

This preserves one authoritative property/inventory truth while allowing multiple agencies to operate against the same project.

## 3. Collaboration rule

A collaboration relationship must be explicit and scoped. Conceptually:

`Organization A ↔ Organization B → Relationship → Scope → Permissions → Resources`

The relationship may be scoped to:

- organization;
- project;
- building;
- inventory subset;
- other resource scopes introduced by validated contracts.

The contract must support relationship lifecycle states such as pending, active, suspended and terminated when these are required by the product contract.

The exact persistence model remains open until the domain and brownfield schema reconciliation gates close.

## 4. Visibility principle

**Visibility follows responsibility.**

A user must not see all data merely because the data exists in the same platform. The default experience should expose only the resources, actions and metrics relevant to the user's current responsibilities and authorized scope.

This is a product/architecture principle, not merely a navigation preference.

Examples:

### Agency sales agent

May receive access to:

- assigned leads;
- relevant clients;
- visits and follow-ups;
- authorized project/inventory availability;
- own offers/reservations;
- own operational performance.

Must not automatically receive:

- developer internal finance;
- developer internal costs/margins;
- unrelated projects;
- another agency's private CRM data;
- another organization's unrelated resources.

### Agency manager

May receive broader agency/team performance and authorized developer/project collaboration data according to granted scope.

### Developer manager

May receive authorized project inventory, partner-agency performance, attributed leads, visits, offers, reservations and sales for the projects they control, subject to configured visibility and commercial policy.

The above are capability examples, not the final permission catalogue.

## 5. Shared truth / authorized views

ASAS should maintain one authoritative commercial/property data model and derive different authorized views from it.

Conceptual rule:

`ONE AUTHORITATIVE DATASET → MULTIPLE AUTHORIZED VIEWS`

The platform must not solve cross-organization collaboration by creating manually duplicated project/inventory copies that become competing sources of truth.

## 6. Developer value proposition

For a Developer, collaboration with an Agency should provide controlled visibility and operational control rather than a blind hand-off of inventory.

A Developer's authorized project view may include, according to policy:

- project/building/unit inventory state;
- available / option / reserved / sold counts;
- partner agencies;
- attributed leads;
- visits;
- offers;
- reservations;
- sales;
- conversion metrics;
- sales velocity;
- agency-level performance;
- attribution and accountability;
- authorized commissions/fees;
- audit history.

A Developer must not automatically gain access to an Agency's unrelated business data merely because the Agency is a commercial partner.

## 7. Performance visibility decision

The preferred product behavior is **Hybrid / configurable visibility**.

Default behavior should expose an appropriate project-level performance view, while the Developer can configure permitted partner-performance detail and sensitive fields according to the product's authorization model.

Example project view:

`Project → Partners → Agency A / Agency B / Agency C → Leads / Visits / Offers / Reservations / Sales`

The exact default metric set and sensitive-field policy require later product/security contract closure.

## 8. Authorization model direction

The target authorization chain is:

`User Identity → Membership → Organization Context → Relationship → Resource Scope → Permission → Command/Query → Domain Invariants`

RBAC alone is insufficient as the conceptual model for ASAS because the same user may work for one organization while receiving scoped collaboration access to resources controlled by another organization.

Resource-based and/or attribute-based policy may complement role-based permissions where needed. The final implementation mechanism is intentionally not prescribed by this contract.

## 9. Tenant isolation

Organization collaboration must not weaken tenant/data isolation.

Authentication, authorization and tenant isolation are distinct concerns. Shared infrastructure does not imply shared visibility. Cross-organization collaboration must be explicitly authorized and scoped.

The eventual persistence strategy may use pooled, bridge or siloed isolation for different resources or tiers if justified later. The domain contract must not hard-code one infrastructure partitioning strategy prematurely.

## 10. Non-goals / explicit protections

This contract does not authorize:

- a specific database schema;
- Prisma models;
- RLS policies;
- a specific policy engine;
- production migrations;
- nested organization accounts;
- copying authoritative projects/inventory into partner organizations;
- global visibility by default;
- a microservice per organization or relationship.

## 11. Research basis

External engineering research supports the separation of authentication, authorization and tenant isolation; granular resource-based authorization; least privilege; deny-by-default; and the use of pooled/bridge/silo isolation as architectural choices rather than assumptions. See:

- Microsoft Azure Well-Architected — Identity and Access Management for SaaS Workloads;
- AWS SaaS Architecture Fundamentals — Tenant Isolation;
- AWS Prescriptive Guidance — Multi-tenant SaaS Authorization and API Access Control;
- OWASP Authorization Cheat Sheet.

These sources support engineering technique. They do not prove ASAS runtime state.

## 12. Open decisions

- exact Organization/Workspace/Branch hierarchy;
- exact meaning of tenant boundary in the SaaS model;
- commercial relationship lifecycle and legal semantics;
- exact project/resource sharing scopes;
- default versus configurable Developer partner-performance visibility;
- sensitive metric/financial field classification;
- final permission/role catalogue;
- database representation and RLS policy;
- cross-organization audit semantics;
- billing/commission ownership.

## 13. Gate

Status remains `PROPOSED / IMPLEMENTATION BLOCKED` until the product/security/domain authority gates close. The contract is now the canonical location for this collaboration decision and must be referenced by future Organization, authorization, CRM, Inventory and analytics work.
