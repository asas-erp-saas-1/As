# ASAS Engineering Conference Path — 2026

**Artifact ID:** ASAS-ENGINEERING-CONFERENCE-2026-001
**Status:** ACTIVE / CANONICAL DECISION WORKSTREAM
**Version:** 1.0.0
**Date:** 2026-09-25
**Branch:** `platform-architecture-2026`
**Authority:** Founder decisions for product/business choices; architecture authority for engineering derivations; runtime/repository evidence for implemented reality.

## 0. Purpose

This is the controlled conference path for closing the ASAS platform architecture before implementation authorization. It is not a replacement for the Source of Truth, Roadmap, Architecture Baseline, contracts, registers, or runtime evidence. It orchestrates them and records the decisions that must remain synchronized across them.

The conference is deliberately **research-first**:

`Question → independent research → alternatives → failure modes → ASAS source review → provenance/authority → decision → contract/ADR/register → verification → checkpoint`

A source may inform a decision without becoming authority. v1.6.1 is a research/provenance package for the lead architect; it is not an implementation authority for Codex, Claude, or any coding agent.

## 1. Platform vision established so far

ASAS is being designed as a broad real-estate operating system and future SaaS platform. The product direction combines the strongest capabilities of:

- Real Estate Operating System;
- website/public property experience;
- Studio/CMS;
- CRM;
- sales and inventory;
- finance/ERP;
- marketing and attribution;
- analytics;
- collaboration/governance;
- future AI intelligence;
- future SaaS extensibility.

The architecture must be broad enough to accept future real-estate company types without forcing a redesign of the core.

Initial commercial focus:

`Developer + Agency + Brokerage`

Future organization types must be able to participate without changing the core identity model, including:

`Developer | Agency | Brokerage | Property Manager | Investor | Construction Company | Real Estate Marketing Company | future types`

## 2. Core organizational model

### 2.1 Organization

`Organization = business principal`

Organizations are independent. A Developer is not a child account of an Agency, and an Agency is not a child account of a Developer.

Organization type is extensible metadata/capability, not a reason to fork the core architecture.

### 2.2 Membership

`User ↔ Membership ↔ Organization`

A user may belong to multiple organizations. Membership alone does not grant access to all resources in the organization.

### 2.3 Workspace

`Workspace = operational / UX container`

Workspace is not automatically an ownership or security boundary. Ownership and authorization remain resource- and policy-driven.

### 2.4 Branch

`Branch = optional organizational subdivision`

Branch may support teams, targets, operational scope and reporting, but it is not automatically a tenant or database-isolation boundary.

### 2.5 Organization Relationship

A relationship is a first-class commercial collaboration concept:

`Agency A ↔ Developer X`

It may be scoped to:

`Organization | Project | Building | Inventory | Leads | Sales | Reporting`

The relationship creates eligibility for collaboration; it does not automatically expose every resource to every employee.

## 3. Collaboration boundary decision

**Founder-approved direction:** Hybrid.

The model is:

`Organization Relationship + Project context + Resource Scope`

A separate Collaboration Space is not required as a core entity at this stage. It may be introduced later only when real collaboration semantics prove that the abstraction is necessary.

Therefore:

- the Project is the primary commercial collaboration context;
- Resource Scope provides fine-grained access;
- the Organization Relationship establishes the commercial relationship;
- a future Collaboration Space is an architectural reservation, not an implementation requirement.

## 4. Employee authorization decision

**Founder-approved direction:** Hybrid D.

```text
Organization relationship
        +
Team / Role scope
        +
Project assignment
        +
Individual exception
        ↓
Resource authorization
        ↓
Authorized view / command
```

Example:

```text
Agency A
 ├── Team 1 → Project X
 └── Team 2 → Project Y

Ahmed → Team 1
Karim → Team 2

Ahmed: Project X ✓ / Project Y ✕
Karim: Project X ✕ / Project Y ✓
Director: broader performance visibility according to policy
```

**Primary UX/security rule:** `Visibility follows responsibility.`

Users should not see unrelated modules, records, organizations, projects, private notes, financial data, or partner data merely because the platform stores them.

## 5. Developer value proposition

The Developer should receive a controlled operating surface over its projects and commercial partners.

For an authorized project, Developer users may receive configurable visibility into:

- project and inventory state;
- partner agencies;
- lead volume;
- visits;
- offers;
- reservations;
- sales;
- attribution;
- conversion;
- inventory velocity;
- commercial performance.

The default is configurable/hybrid: the Developer receives useful performance transparency while Agency-internal data remains private unless explicitly shared.

This produces:

`ONE AUTHORITATIVE BUSINESS TRUTH → DIFFERENT AUTHORIZED VIEWS`

There must not be separate copied project/inventory databases merely to create different partner views.

## 6. Ownership and data truth

Authoritative ownership follows the business principal.

Example:

```text
Developer X
  owns/controls
    Project Y
      Building(s)
        Unit / Inventory
```

Agency A receives controlled commercial access through its relationship with Developer X.

Agency A does not receive a duplicated authoritative Project or Inventory record.

## 7. Authorization doctrine

The platform must not reduce authorization to `role → visible screens`.

Target evaluation chain:

`Identity → Membership → Organization Context → Relationship → Team/Branch/Role Scope → Resource Assignment → Individual Exception → Permission → Action → Invariant`

Security is enforced server-side. UI hiding is not a security control. Database/RLS controls are defense-in-depth and do not replace application authorization.

Ambiguous authorization fails closed.

Cross-organization access is auditable.

## 8. Performance and attribution semantics

For a project with multiple agencies, the Developer may receive authorized partner performance views such as:

```text
Project
  Inventory
  Partner Performance
    Agency A
      Leads
      Visits
      Offers
      Reservations
      Sales
    Agency B
      Leads
      Visits
      Offers
      Reservations
      Sales
```

The platform must distinguish:

- ownership of the Project/Unit;
- lead ownership;
- assignment;
- visit attribution;
- offer origin;
- reservation attribution;
- sale attribution;
- commission attribution;
- reporting attribution.

These are not assumed to be the same field or concept.

## 9. Domain conference sequence

The conference must close the following semantic areas in order of dependency:

### C01 — Platform Constitution

Product scope, customer model, organization model, authority boundaries.

### C02 — Organization / Membership / Relationship

Organization identity, membership, workspace, branch, team, relationship, assignment and support access.

### C03 — Real Estate Domain

Portfolio/Project/Building/Floor/Unit/Listing ownership, identity, hierarchy, lifecycle and inventory semantics.

### C04 — CRM

Person/Lead/Customer, ownership, assignment, activities, qualification, duplicate handling, communications and attribution.

### C05 — Sales

Opportunity, Offer, Hold, Reservation, Contract preparation, approvals, discounts, concurrency and attribution.

### C06 — Finance

Payment plan, installments, receipts, allocations, commissions, ledger, reversals, reconciliation and legal boundaries.

### C07 — Marketing

Campaigns, sources, attribution, ad spend, conversion and data lineage.

### C08 — Studio / Website / CMS

Project/unit publishing, content ownership, media, SEO, forms, lead capture and one-system-of-truth synchronization.

### C09 — Analytics

Metric definitions, ownership, source facts, transformations, refresh, authorization, lineage and performance views.

### C10 — Documents

Templates, versions, access policy, generated documents, signatures/integrations, retention and legal validation.

### C11 — Scheduling / Activities

Appointment ownership and the unresolved Scheduling context placement must be explicitly resolved before persistence ownership is changed.

### C12 — Workflow / Automation

Triggers, conditions, actions, approvals, retries, idempotency, compensation and audit.

### C13 — Integrations

WhatsApp, advertising providers, calendars, webhooks, external APIs, provider accounts, retries, signatures, rate limits and reconciliation.

### C14 — Search / Media / Notifications

Permission-aware search, multilingual indexing, phone normalization, sensitive-search audit, media access and notifications.

### C15 — Security / Tenancy

Tenant boundary, resource authorization, RLS, storage, jobs, cache, analytics, events, service roles and support access.

### C16 — Data Architecture

Domain model → target schema → contract → migrations → live database reconciliation.

### C17 — Events / Outbox

Event ownership, envelope, versioning, idempotency, delivery, replay, DLQ and reconciliation.

### C18 — AI

Read-only intelligence first; tool authority inherits caller authority; no direct DB authority; human approval for sensitive actions.

### C19 — Design / Experience

Tokens → primitives → components → patterns → templates → surfaces; Arabic/RTL, French, English, responsive, accessibility, failure states.

### C20 — Codex Engineering

Task packet, skills, implementation, tests, evidence, review and convergence.

### C21 — Runtime / Operations

CI, observability, backup/restore, deployment, staging, runtime identity and production gates.

### C22 — SaaS Evolution

Provisioning, billing/metering, enterprise isolation, API platform, extensions, marketplace and country packs as future scope.

## 10. Cross-cutting invariants

Every write-side behavior must answer:

`Owner → Aggregate/Entity → Command → Authorization → Scope → Preconditions → Invariants → State Transition → Audit → Event → Outbox → Verification`

Mandatory cross-cutting invariants include:

- tenant/resource scope established before sensitive access;
- no direct governed status mutation;
- reservation is a single-winner consistency boundary for a Unit;
- offer approval does not itself create inventory ownership;
- posted financial facts are immutable;
- financial corrections use reversal/new facts;
- double-entry balances where ledger functionality is authoritative;
- durable events use transactional publication semantics;
- consumers are idempotent;
- AI cannot widen caller authority;
- configuration cannot weaken code/domain/security invariants;
- destructive production operations require explicit authorization and recovery evidence.

## 11. Data architecture doctrine

Never conflate:

`Domain Model ≠ Aggregate ≠ Read Model ≠ Target Schema ≠ Prisma Contract ≠ Migration History ≠ Live Database`

Required progression:

`Research → Domain Contract → Schema Contract → Local Migration → Tests → Runtime Reconciliation → Production Migration`

The live database is the authority for existing reality only after its identity is independently verified.

## 12. Design-to-code doctrine

Claude + Figma is the preferred design collaboration path for visual/UX exploration and precise interface contracts.

Codex is the primary engineering executor for repository, code, database, tests, CI and controlled implementation.

Neither agent may invent product authority.

Accepted design contracts—not a screenshot or an AI-generated mock alone—authorize implementation.

## 13. AI-agent governance

Every agent receives:

- role;
- scope;
- skills;
- authority boundary;
- required inputs;
- output artifacts;
- verification obligations;
- stop conditions;
- evidence requirements.

Agents must use research-first reasoning for missing information and must label engineering derivations.

## 14. Required conference output

Every closed conference item must produce or update the appropriate:

- product decision;
- architecture baseline/amendment;
- ADR;
- domain contract;
- research record;
- permission register;
- event register;
- state machine;
- schema contract;
- test specification;
- roadmap/checkpoint.

A decision is not considered closed merely because it was discussed in chat.

## 15. Reopening protocol

A previously closed item must be reopened when:

- new runtime evidence contradicts it;
- a stronger authoritative source contradicts it;
- a domain invariant exposes a flaw;
- security testing exposes a bypass;
- concurrency testing exposes a race;
- legal research changes a required assumption;
- implementation reveals an unmodeled dependency.

Reopening must preserve the old decision as history and create an explicit supersession/amendment trail.

## 16. Implementation authorization rule

No implementation slice begins merely because the conference has discussed it.

The applicable gate must be GREEN for:

`domain ownership + contract + data impact + security + authorization + state machine + events + tests + migration safety + rollback + evidence`

Then Codex may implement the authorized slice.

## 17. Current decision register

| Decision | Status |
|---|---|
| Broad Real Estate OS + future SaaS | Founder-confirmed direction |
| Multi-company organization model | Founder-confirmed direction |
| Developer + Agency + Brokerage initial focus | Founder-confirmed direction |
| Organization as business principal | Accepted architectural direction |
| Developer owns/controls authoritative project/inventory | Accepted architectural direction |
| Organization relationship | Accepted architectural direction |
| Hybrid partner performance visibility | Founder-selected E |
| Project + Resource Scope collaboration boundary | Founder-approved D |
| Hybrid employee authorization | Founder-selected D |
| Visibility follows responsibility | Canonical design/security principle |
| Workspace as operational UX container, not automatic security boundary | Engineering derivation |
| Branch as organizational subdivision, not automatic tenant boundary | Engineering derivation |
| Separate Collaboration Space | Reserved, not required now |
| Codex as primary engineering executor | Founder-confirmed operating direction |
| Claude/Figma as design collaboration path | Founder-confirmed operating direction |
| v1.6.1 as architect research/provenance input | Canonical operating rule |

## 18. Current blockers

The conference does not erase existing blockers:

- Scheduling ownership conflict;
- live runtime/database identity and evidence where unavailable;
- RLS/runtime security evidence;
- Building persistence reconciliation;
- Offer lifecycle closure;
- Finance executable semantics;
- event implementation evidence;
- architecture-as-code enforcement;
- implementation authorization.

## 19. Next conference checkpoint

Proceed from the organization/collaboration decisions into:

`Lead Ownership → Assignment → Attribution → Project Inventory Access → Reservation Attribution → Commission Semantics → Developer/Agency Performance Read Models`

Then return to the broader C03–C22 sequence and continuously synchronize canonical artifacts.

## 20. Final review after conference closure

When all conference items are closed, perform a full convergence review:

`Conference decisions → Product PRD → Architecture Baseline → Source of Truth → Roadmap → Context Prompt → Master Execution Path → Contracts → Registers → Skills → Agent instructions → Schema contract → Repository implementation → CI → Runtime evidence`

Any inconsistency becomes a tracked finding. The main engineering roadmap is then updated to reflect the actual state, reopened gates, newly closed gates, and the next authorized implementation path.
