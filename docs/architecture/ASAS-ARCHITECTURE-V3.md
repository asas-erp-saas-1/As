# ASAS — MASTER ENTERPRISE ARCHITECTURE V3

## Real Estate Operating System → Platform OS → Multi-Tenant SaaS → Multi-Country Enterprise Platform

**Version:** 3.0  
**Date:** 20 September 2026  
**Status:** Architecture consolidation / implementation master  
**Authority:** Literal repository installation of the supplied ASAS Architecture V3.0 source.  

> **Provenance:** This file is installed as the V3.0 architectural source artifact supplied in the ASAS project materials. It does not claim that the repository, live database, or production environment already implements V3.

---

# 0. EXECUTIVE DECISION

ASAS V3 is **not** an attempt to reproduce Oracle, Shopify, HubSpot, Zoho, ServiceNow and Palantir feature-for-feature.

It is a **vertical Enterprise Operating System for real estate** with a platform kernel strong enough to evolve into a general business platform.

```text
                         ASAS EXPERIENCE PLANE
       Web / Admin / Mobile / Customer / Partner / AI / API
                                │
                                ▼
                    APPLICATION + WORKFLOW PLANE
      Commands / Queries / Approvals / Automations / Jobs / Policies
                                │
                                ▼
                     ASAS ONTOLOGY / OBJECT PLANE
       Objects / Links / Actions / State / Logic / Security / Lineage
                                │
                                ▼
                    9 CANONICAL BOUNDED CONTEXTS
 Core | CRM | Sales | Inventory | Finance | Studio | Marketing | Analytics | Documents
                                │
                                ▼
                       PLATFORM KERNEL
 Identity | Tenancy | Authorization | Audit | Events | Search
 Files | Notifications | Scheduling | Integrations | Configuration
                                │
                                ▼
                         DATA PLANE
 PostgreSQL | Object Storage | Read Models | Event/Outbox | Search
 Analytics/Warehouse | Knowledge/Vector | Cache
                                │
                                ▼
                  INFRASTRUCTURE + OPERATIONS
 CI/CD | Observability | Backups | DR | Security | Secrets | Cost
```

The critical V3 change is the introduction of a **Decision-Centric Ontology Layer** above the bounded contexts. It does not replace the domain model; it exposes the domain model consistently to humans, workflows, analytics, integrations, AI agents, and future third-party applications.

---

# 1. SOURCE SYNTHESIS

## 1.1 Existing ASAS material retained

- Modular monolith first; no premature microservices.
- Nine canonical bounded contexts.
- Transactional outbox.
- Idempotent event consumers.
- Tenant isolation + RLS.
- Server-side authorization.
- State machines rather than direct status mutation.
- Integer centimes for DZD money.
- Immutable double-entry ledger once posted.
- Hash-chained audit trail.
- Arabic-first / RTL, French second, English third.
- Mobile field operation.
- WhatsApp-first commercial workflow.
- Contract-first engineering.
- L1–L7 AI engineering loop.
- Evidence before claims.
- Red-team verification.
- Design-token and component contracts.
- CI enforcement.
- Production database is reality; documentation never overrides introspection.
- Extend the brownfield database; never blindly rewrite it.

## 1.2 Existing material requiring correction or consolidation

The V3 source records operational defects around stale canonical-artifact registration, deprecated session-state references, unresolved production database/project identity, branch hygiene, repository visibility, the nine-context vs. fifteen-module conflict, multiple readiness documents, missing `.gitignore`, missing LICENSE, and the v1.6.1 Blueprint source not being stored in the repository.

V3 therefore treats the specification layer as strong but the **governance/control plane as requiring closure before production schema work**.

---

# 2. CANONICAL ARCHITECTURE DECISION

## ADR-V3-001 — Nine Bounded Contexts + Platform Planes

**Nine bounded contexts remain canonical:**

1. Core
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

Scheduling, Integrations, Workflow, AI, Search/Media/Notifications and SaaS Control are platform capabilities / subdomains / planes, not additional DDD bounded contexts unless a future ADR proves independent ownership and transactional boundaries are required.

A bounded context is a semantic and ownership boundary, not a feature list.

---

# 3. ASAS PLATFORM MODEL

V3 uses five architectural planes:

### Plane A — Experience
Public Web, Operations Desktop, Mobile Field OS, Customer Portal, Partner Portal, Executive Command Center, AI Workspace, Public API, Webhooks.

### Plane B — Decision / Application
Commands, Queries, Policies, Approvals, Workflows, Jobs, Rules, Calculations, Simulations.

### Plane C — Ontology
Objects, Properties, Links, Actions, States, Rules, Security, Lineage.

### Plane D — Domain
The nine bounded contexts.

### Plane E — Platform / Data / Infrastructure
The technical foundation.

---

# 4. ASAS ONTOLOGY — V3 CENTER OF GRAVITY

The ontology is **not a second database**. It is a governed representation over authoritative domain records.

### Core object examples

Organization, Company, Branch, Team, User, Project, Building, Floor, Unit, Listing, Person, Lead, Customer, Opportunity, Visit, Appointment, Offer, Hold, Reservation, Contract, PaymentPlan, Installment, Receipt, LedgerEntry, Commission, Campaign, Ad, Conversation, Activity, Document, MediaAsset, Workflow, Task, Approval, Integration, Notification.

### Example links

- Project → contains → Building
- Building → contains → Floor
- Floor → contains → Unit
- Lead → assigned_to → User
- Lead → interested_in → Unit
- Lead → generated_by → Campaign
- Customer → has_contract → Contract
- Contract → concerns → Unit
- Contract → has_payment_plan → PaymentPlan
- PaymentPlan → has_installment → Installment
- Installment → produces → Receipt
- Campaign → generates → Lead
- Campaign → produces → Conversion

### Controlled actions

`assign_lead`, `qualify_lead`, `schedule_visit`, `complete_visit`, `submit_offer`, `approve_discount`, `place_hold`, `create_reservation`, `release_reservation`, `prepare_contract`, `record_payment`, `issue_receipt`, `post_ledger_entry`, `assign_unit`, `publish_project`, `publish_unit`, `send_message`, `create_task`, `approve_workflow`, `run_report`, `run_simulation`.

Security attaches to objects, properties, relationships, actions, workflows, integrations, AI tools, documents, tenants, and purpose.

---

# 5. MASTER DATA ARCHITECTURE

V3 separates master data, reference data, transactional data, immutable event data, analytical data, and document data.

**Master data:** Organization, Company, Branch, Team, User, Project, Building, Unit, Person, Customer, Vendor, Developer, ChartOfAccounts.

**Reference data:** Countries, Wilayas, Communes, PropertyTypes, UnitTypes, LeadSources, PipelineStages, PaymentMethods, Currencies, Languages, DocumentTypes, ActivityTypes, LossReasons, Amenities, ConstructionStatuses.

**Transactional data:** Lead, Visit, Offer, Reservation, Contract, Payment, Receipt, Commission, CampaignTouch, Appointment, WorkflowRun.

**Event data:** immutable business facts.

**Analytical data:** derived models such as Sales Funnel, Cohorts, Campaign Performance, Inventory Velocity, Collections, Cashflow, Agent Performance, Forecasts.

---

# 6. CORE ENGINEERING INVARIANTS

- Contract-first engineering.
- Explicit state machines.
- Tenant isolation.
- Server-side authorization.
- Transactional outbox.
- Idempotent consumers.
- Immutable financial postings.
- Hash-chained audit.
- Evidence before claims.
- Brownfield extension rather than blind rewrite.
- Architecture-as-code and CI enforcement.

---

# 7. AI CONTROL PLANE

AI is a governed platform capability, not an unrestricted actor.

V3 includes model gateway, tool registry, memory governance, evaluation registry, simulation/dry-run, approvals, audit, data classification propagation and agent authority controls.

The AI engineering loop is:

```text
L0 Reality Lock
L1 Locate
L2 Load
L3 Plan
L4 Verify
L5 Implement
L6 Prove
L6.5 Converge
L7 Report
```

---

# 8. PLATFORM / SAAS CONTROL PLANE

V3 includes tenant lifecycle, plans, entitlements, usage metering, billing architecture, public API, developer platform, webhooks, connectors, sandbox foundations, extension permissions, configuration safety, search, communication, document governance, country packs and SLO/DR models.

These are architectural capabilities. Their implementation remains subject to the Engineering Conference gates and slice-specific authorization.

---

# 9. EVOLUTION MODEL

```text
ASAS Agency OS
      ↓
ASAS Real Estate OS
      ↓
ASAS Multi-Tenant SaaS
      ↓
ASAS Real Estate Platform
      ↓
ASAS Multi-Country Platform
      ↓
ASAS Holding OS
```

Do not prematurely implement the later stages before operational demand exists.

---

# 10. EXPLICITLY DEFERRED INFRASTRUCTURE

V3 does not prematurely require Kubernetes, Kafka, service mesh, global multi-region, full data lake, full MDM product, full BPM suite, full construction ERP, full HR suite, full procurement suite, full investment bank, autonomous financial agents, or third-party marketplace.

The architecture should permit them without requiring their premature implementation.

---

# 11. FINAL ARCHITECTURAL TEST

Before adding any capability ask whether it improves revenue, conversion, operational control, data integrity, customer experience, security, automation, AI readiness, extensibility, or scalability.

If yes, determine whether it belongs in domain, platform, experience, integration, analytics, or AI and assign a canonical owner.

---

# 12. PRODUCTION-READINESS STANDARD

ASAS is production-ready only when architecture, contracts, database, tenant isolation, authorization, state machines, money invariants, reservation race handling, events, reconciliation, backup restore, security, accessibility, performance, AI evaluations, observability, incident runbooks, reproducible deployment, and archived evidence are verified.

No “looks good”. No “probably works”. No “build passed so we're done”.

---

# 13. IMMEDIATE IMPLEMENTATION ORDER

The supplied V3 source establishes:

1. Close GATE-00 platform identity.
2. Correct canonical artifact register.
3. Fix deprecated session-state references.
4. Choose one canonical readiness document.
5. Resolve nine-context / fifteen-module conflict.
6. Lock V3 architecture.
7. Lock contract registry.
8. Lock ontology object/action registry.
9. Verify live DB reality.
10. Generate schema reconciliation report.
11. Establish architecture-as-code CI gates.
12. Establish tenant/RLS gate.
13. Establish event/state/permission register gates.
14. Establish data-quality baseline.
15. Only then continue implementation phases.

The Engineering Conference control plane may refine authorization mechanics, but must not silently alter the substantive V3 architectural decisions without a recorded decision artifact.

---

# 14. ARCHITECTURE STATUS

### Strong and retained

Domain model, event architecture, state machines, permissions, design system, brownfield migration discipline, modular monolith, finance integrity, reservation protocol, AI developer loop, integration architecture, scheduling, marketing attribution, frontend standards.

### V3 additions

Ontology, object/action model, platform control plane, metadata/configuration, data governance, data lineage, data quality, API platform, developer platform, SaaS control plane, entitlements, usage metering, AI control plane, AI memory, AI evaluation registry, simulation/dry-run, reconciliation, Customer 360, communication platform, country packs, SLO/DR model, architecture-as-code contract registry.

### Operational blockers before implementation authorization

Platform identity, canonical artifact correctness, context-loading drift, architectural conflict, repository hygiene, repository visibility decision, and readiness-document consolidation remain blockers until actually closed in repository/environment evidence.

---

# 15. FINAL POSITION

**ASAS V3 is a vertical real-estate Enterprise Operating System whose core is a governed decision-centric ontology, backed by a modular domain architecture, a secure platform kernel, deterministic workflows, event-driven integration, an AI control plane, and an evidence-based AI engineering operating system.**

The objective is not that AI writes perfect code. The objective is that the architecture makes incorrect code difficult to write, easy to detect, impossible to release without evidence, and recoverable when something still goes wrong.

---

## Installation / Provenance

This repository file is the literal **ASAS-ARCHITECTURE-V3.md, Version 3.0, dated 20 September 2026** supplied in the project materials. Later engineering amendments must remain separate so V3.0 is not silently rewritten.
