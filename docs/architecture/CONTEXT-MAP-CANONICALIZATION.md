# ASAS Canonical Bounded-Context Classification

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Authority:** Blueprint v1.6.1 / AGENTS operating protocol / registers; this document classifies terminology and does not rewrite the source registers.

## 1. Canonical decision

For implementation vocabulary, ASAS has **nine bounded contexts**:

1. Core / Identity & Access
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

The Blueprint operating protocol explicitly states that Scheduling is a CRM-hosted submodule (`src/modules/crm/scheduling/`) and that the context map remains at nine. fileciteturn99file0L2-L2

The public website is a **product surface**, not a tenth bounded context. Integrations, notifications, workflow/approval mechanics, audit/timeline infrastructure and search are **platform capabilities or projections** unless the authoritative register explicitly assigns them to a bounded context.

## 2. Why this classification is safer

The previous repository contract accidentally collapsed Reservation/Contracts with Integrations/Scheduling and omitted Analytics/Documents as explicit contexts. That created a dangerous implementation ambiguity.

The canonical rule is now:

`bounded context ≠ runtime service ≠ UI surface ≠ platform engine ≠ projection`

ASAS remains a modular monolith. A bounded context is a logical ownership boundary, not a microservice deployment boundary.

## 3. Context ownership

| Context | Owns | Does not own |
|---|---|---|
| Core / IAM | tenant/org hierarchy, users, roles, permissions, grants, sessions, impersonation, authorization decisions | CRM, inventory, finance business rules |
| CRM | leads, customer/workflow history, lead lifecycle/working state, opportunities and commercial activity | canonical inventory mutation, ledger posting |
| Sales | offers, reservation/contract commercial workflow and approvals that belong to the sales lifecycle | accounting ledger, public rendering |
| Inventory | projects, buildings, units, floor plans, media associations, commercial/construction status, holds, milestones, availability truth | CRM ownership, ledger truth |
| Finance | payment plans, schedule items, receipts, allocations, accounts, ledger, periods, commissions/payouts | lead lifecycle, inventory availability |
| Website Studio | public pages, page versions, composition, SEO/content/CTA configuration and publishing lifecycle | canonical inventory/finance truth |
| Marketing | campaigns, sources, attribution, ad leads, spend and conversion attribution | canonical CRM/inventory mutation |
| Analytics | derived analytical models, KPIs, reporting and executive read models | transactional business truth |
| Documents | document metadata, templates/attachments/versioning and document lifecycle capabilities | domain-specific authorization decisions owned by consuming context |

## 4. Hosted submodules and platform capabilities

### Scheduling
Scheduling is hosted under CRM as the canonical appointment/scheduling submodule. The platform may integrate external calendars, but ASAS owns appointment truth. External calendars are providers, not sources of canonical appointment state.

### Integrations
Integration adapters, webhook verification, provider delivery state and credentials are infrastructure/platform capabilities. They may have dedicated infrastructure/application modules, but they must not become an uncontrolled tenth bounded context.

### Workflow / approvals / notifications
These are reusable platform capabilities. A workflow engine may execute policies for multiple contexts; an approval request can be attached to a context-owned business operation. Neither changes aggregate ownership.

### Audit / timeline
Audit is a cross-cutting append-only evidence mechanism. Timeline views are projections of governed events. They do not own the underlying business state.

### Search
Search is a derived read model. Search results never become the authority for mutation decisions.

### Public Experience
Public website, project pages, unit pages, forms and contextual WhatsApp are a product surface powered by approved Studio content and canonical Inventory/Marketing/CRM data.

## 5. Cross-context rules

1. An aggregate has one owning context.
2. Another context never mutates an aggregate through its persistence model.
3. Collaboration uses application ports, commands, domain/integration events or projections.
4. Shared kernel contains only genuinely cross-domain primitives.
5. A new bounded context is Tier-C and requires founder approval.
6. A new runtime service is not justified merely because a logical context exists.

## 6. Canonical lifecycle chain

`Core/IAM → Inventory → Website Studio → CRM → Sales → Finance → Analytics`

Documents may attach to records across contexts through governed references. Marketing and integrations feed contextual events/data into the relevant owner; they do not become alternate sources of truth.

## 7. Implementation naming rule

The source register remains authoritative for exact identifiers. Repository documentation must use these nine context names consistently. If a source artifact uses a different historical grouping, it must be documented as a mapping/legacy vocabulary rather than silently changing the register.

## 8. Stop condition

If implementation requires creating a tenth bounded context, moving Scheduling out of CRM, or transferring ownership of Inventory, Sales, Finance, Studio, Marketing, Analytics or Documents, Claude must stop and escalate as a Tier-C architectural decision.
