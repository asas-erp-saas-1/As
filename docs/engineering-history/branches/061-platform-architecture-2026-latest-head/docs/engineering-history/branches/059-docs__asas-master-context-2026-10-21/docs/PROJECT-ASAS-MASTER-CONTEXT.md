# ASAS — Project Master Context
**Document type:** Project context and architecture memory register  
**Created:** 2026-10-21  
**Status:** Consolidated working reference; not a production implementation claim  
**Repository:** `asas-erp-saas-1/As`  
**Base architecture branch:** `platform-architecture-2026`  
**Context branch:** `docs/asas-master-context-2026-10-21`

## 1. Purpose and authority

This document consolidates the project information currently available in the ASAS Platform project context and the architecture reference `ASAS-ARCHITECTURE-V3.md` (dated 2026-09-20). It is intended to reduce context loss and prevent confusion between projects, architecture proposals, approved decisions, and verified implementation.

This is a working master context. It does **not** claim that all historical project conversations have been exhaustively recovered, that all statements have been revalidated against live services, or that the described target architecture is implemented.

When sources conflict, use this order:
1. Verified current repository / environment evidence for actual implementation state.
2. Approved ADRs and canonical architecture documents for intended design.
3. Other specifications and historical conversations as supporting context.
4. Proposed ideas remain proposals until explicitly approved.

## 2. Project separation — mandatory

### Project ASAS Platform
A standalone project currently focused on **architecture, requirements consolidation, technical auditing, and implementation readiness**. The current phase is not declared to be product construction or production database implementation.

### Project ASAS CRM
A separate project with its own scope, architecture, requirements, decisions, and future implementation lifecycle. Do not automatically treat it as a module inside ASAS Platform. Integration may be considered later through explicit architecture decisions and contracts, but the projects remain separate unless an approved decision changes that boundary.

**Rule:** Shared branding does not mean shared project identity. Keep repositories, architecture decisions, backlogs, database assumptions, and implementation status distinct.

## 3. Current known technical links

- GitHub repository identified by the project: https://github.com/asas-erp-saas-1/As
- Repository default branch verified on 2026-10-21: `platform-architecture-2026`
- Vercel: reported by the project owner as linked to the work; live project and deployment mapping still needs verification.
- Supabase: reported by the project owner as linked/intended backend; actual project identity, schema state, migrations, and environment mapping still need verification.
- A branch named `docs/asas-master-context-2026-10-21` is used to record this context without directly modifying the base architecture branch.

**Important distinction:** A connected repository, Vercel project, or Supabase project does not by itself prove that the platform is implemented, that the architecture is complete, or that a production database schema has been approved.

## 4. Product vision

ASAS is envisioned as a real-estate-focused Enterprise Operating System that can grow into a multi-tenant SaaS platform and, over time, a broader enterprise platform. The strategy is not to copy every feature of Oracle, Shopify, HubSpot, Zoho, ServiceNow, or Palantir. Build a coherent real-estate business operating loop first; add general platform capabilities when justified.

The MVP must prove the end-to-end business process, not merely the existence of an extensive architecture diagram.

## 5. Canonical architecture target

The architecture reference `ASAS-ARCHITECTURE-V3.md` defines these experience and platform layers:

1. **Experience plane:** public website, operations/admin interface, mobile field operations, customer/partner portals, executive workspace, AI workspace, API and webhooks.
2. **Application and workflow plane:** commands, queries, policies, approvals, workflows, jobs, rules, calculations, and simulations.
3. **Ontology/object plane:** governed representation of objects, properties, links, actions, states, rules, security, and lineage. This is not a second database; authoritative records remain in their domain stores.
4. **Domain plane:** nine canonical bounded contexts.
5. **Platform, data, and infrastructure planes:** shared kernel, storage, read models, event/outbox, search, analytics, knowledge/vector capabilities, cache, CI/CD, observability, backup/DR, security, secrets, and cost controls.

### Nine canonical bounded contexts

1. Core
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

Scheduling, integrations, workflow, AI, search/media/notifications, and SaaS control are shared platform capabilities or subdomains—not automatically additional bounded contexts. This resolves the nine-context versus fifteen-module conflict at the conceptual level; repository artifacts must still be checked and reconciled.

## 6. Functional scope by domain

- **Core:** organizations, companies, branches, teams, users, configuration, reference data.
- **CRM:** leads, people/customers, sources, assignment, qualification, activities, follow-up.
- **Sales:** opportunities, visits, appointments, offers, holds/reservations, contract preparation, sales lifecycle.
- **Inventory:** projects, buildings, floors, units, availability, pricing and inventory lifecycle.
- **Finance:** payment plans, installments, payments, receipts, collections, commissions, and accounting/ledger boundaries.
- **Website Studio:** creation and management of real-estate websites, pages, listings and publishing workflows.
- **Marketing:** campaigns, advertising, content, attribution, spend, conversion and lead generation.
- **Analytics:** governed metrics, reports, dashboards, forecasts and business performance.
- **Documents:** contracts, templates, versions, relationships, access policies, retention and signatures/integrations.

Shared capabilities include identity/authentication, tenant isolation, authorization, audit, events, workflow and approvals, scheduling, notifications, search, media/files, integrations, configuration, API/developer platform, AI governance, observability, backups and recovery.

## 7. Foundational engineering principles from V3

- Start with a **modular monolith**; avoid premature microservices.
- Keep clear domain ownership and contract-first interfaces.
- Enforce authorization server-side; use tenant-aware access controls and PostgreSQL RLS where appropriate.
- Inspect the actual database before making schema claims or changes. Extend a verified brownfield schema where one exists; never blindly replace it.
- Use state machines for important lifecycle transitions rather than unrestricted status mutation.
- Use a transactional outbox and idempotent consumers for reliable event processing.
- Version, trace, govern, and reconcile events; delivery alone does not prove projection consistency.
- Treat posted accounting entries as immutable; define correction/reversal processes.
- Represent DZD monetary values using integer minor units (centimes) where appropriate; avoid floating-point money calculations.
- Maintain auditable evidence for sensitive business and security actions; evaluate hash-chaining as a tamper-evidence control rather than assuming it replaces access controls and backups.
- Support Arabic-first RTL, French second, and English third; prioritize mobile field operations and WhatsApp-oriented commercial workflows where appropriate for the Algerian market.
- Treat configuration as subordinate to code invariants, domain rules, and security policy.
- AI tools must obey tenant boundaries, permissions, approval requirements, and auditability. AI must not bypass approvals for financially or legally consequential actions.
- Design metrics with definitions, owners, source lineage, transformations, refresh cadence, filters, and versioning.
- Use CI and architecture checks to enforce contracts.
- Evidence before claims; perform adversarial/red-team verification before declaring readiness.

## 8. Data classes and lineage

Keep these classes conceptually distinct:
- **Master data:** organizations, branches, teams, users, projects, buildings, units, people, vendors and chart of accounts.
- **Reference data:** countries, Algerian wilayas/communes, property/unit types, lead sources, pipeline stages, payment methods, currencies, languages and document/activity types.
- **Transactional data:** leads, visits, offers, reservations, contracts, payments, receipts, commissions and workflow runs.
- **Event data:** immutable/versioned business facts.
- **Analytical data:** funnels, cohorts, campaign performance, inventory velocity, collections, cash flow, agent performance and forecasts.
- **Document data:** contracts, reservations, invoices, receipts, brochures, plans, identity and compliance files.
- **Audit data:** security/business evidence.
- **Knowledge data:** policies, SOPs, product/project knowledge, FAQs, legal guidance and training material.

Important metrics must have a traceable path to source records/events. Avoid unexplained dashboard numbers.

## 9. Platform capabilities to design deliberately

### Workflow and approval
Workflow triggers may include object creation/update, state change, event, schedule, webhook, threshold, approval result or external event. Workflows require versioning, ownership, permissions, timeout/retry/idempotency, execution limits, failure and compensation policies, and audit records.

Approval requests should model the request, steps, approver, decision, reason, evidence and timestamp. Examples include discounts, refunds, price overrides, reservation extensions, contract amendments, ledger corrections, exports, bulk deletion/anonymization and AI actions with financial impact.

### Events and integrations
Event envelopes should include event ID/type/version, source, aggregate type/ID, tenant, actor, correlation/causation IDs, timestamps, schema version, classification and payload. Integration connectors need credential management/rotation, authentication, rate limits, retries/backoff, idempotency, pagination/cursors, webhook verification, dead-letter handling, reconciliation and health checks.

### API and extensibility
Govern API versions, authentication/OAuth/OIDC as appropriate, scopes, rate limits, quotas, idempotency, pagination/filtering, webhooks, OpenAPI documentation, usage metering and deprecation. External consumers must not receive direct database access. Third-party extensions should not execute inside the trusted core without appropriate isolation and permissions.

### Search, documents and communications
Search must be tenant- and permission-aware, support Arabic/French/English, normalize phone numbers, handle exact reference matches and offer semantic search for authorized knowledge content. Documents need versions, templates, relationships, access controls, retention, preview/OCR where justified, redaction/watermarks and signature integration. Electronic signature and real-estate contract handling require legal validation for Algeria.

## 10. Phased product roadmap — working proposal

This is a sequencing proposal, not a committed delivery schedule:

- **Phase 0 — Foundation and architecture closure:** verify platform identity, consolidate canonical artifacts, resolve conflicts, inspect database/environment reality, validate security and CI, and close readiness gates.
- **MVP — End-to-end real-estate sales loop:** projects/units, leads and assignment, activities, visits, offers, reservations, contract preparation, payment plans, payments, receipts and core reports.
- **V1 — Real-estate operating platform:** add Studio, marketing, scheduling, documents, automation, communications and broader analytics.
- **V2 — Governed AI capabilities:** sales/marketing/finance assistance, forecasts and risk/collections analysis, with permissions, evaluations and approval controls.
- **V3 — Multi-tenant SaaS:** tenant administration, plans, metering, billing, public/partner APIs, integrations and developer capabilities.
- **V4 — Broader enterprise and multi-country scope:** property management, development/construction, investment, brokerage and holding/group capabilities only when validated by demand and business priorities.

Do not implement all phases at once. Validate the MVP business loop before expanding platform breadth.

## 11. Architecture readiness gates

The V3 reference calls for mandatory gates before implementation authorization. Their current status must be rechecked against repository and live environment evidence.

- **GATE-00 — Platform identity:** verify the exact GitHub repository/branch, Vercel projects/deployments, Supabase project identity, and development/staging/production mappings.
- **GATE-01 — Canonical artifact register:** identify one authoritative location/version for every governing specification, register, ADR and checklist.
- **GATE-02 — Architecture consistency:** reconcile bounded contexts, modules, terminology, ownership, and cross-document conflicts.
- **GATE-03 — Database reality:** inspect current schemas, migrations, RLS policies, functions, extensions and data before proposing changes.
- **GATE-04 — Security:** verify authentication, tenant isolation, server-side authorization, RLS, secrets handling, audit and sensitive-action controls.
- **GATE-05 — Quality/CI:** verify automated tests and architecture/contract checks are enforceable.
- **GATE-06 — Repository hygiene:** inspect branches/protection, ignore rules, license, canonical documents and stale references.
- **GATE-07 — Implementation authorization:** only after GATE-00 through GATE-06 pass with evidence and blockers are closed or explicitly accepted.

The V3 source reports historical audit findings around stale canonical-artifact registration, deprecated `SESSION_STATE.md` references, unresolved production database identity, branch hygiene, public repository visibility, the nine-versus-fifteen conflict, overlapping readiness documents, missing `.gitignore`/LICENSE, and the v1.6.1 Blueprint not being stored in the repository. These are historical findings until rechecked; do not state they remain open without fresh evidence.

The source also records register counts verified during that audit: 103 domain events, 50 permission keys × 8 personas, 11 state machines, and 42 original design primitives. Revalidate against the current repository before treating these counts as current.

## 12. Next actions

1. Inventory the repository and relevant architecture branch; identify all canonical documents and current changes.
2. Locate and inspect the v1.6.1 Blueprint ZIP and extract its contents into an evidence inventory (do not blindly copy generated content into canonical locations).
3. Reconcile V3, MASTER-SPEC, AGENTS.md, ADRs, registers, readiness documents, and prior audit material.
4. Build an evidence-based gate register with status, evidence URL/path, owner, risk, next action, and closure criteria.
5. Verify Vercel project/deployment links and Supabase project/schema identity without exposing secrets.
6. Only after these checks, produce an implementation-ready architecture and migration plan; do not begin production database work based solely on conceptual documentation.

## 13. Source and confidence notes

- Primary architecture reference found in project materials: `ASAS-ARCHITECTURE-V3.md`, version 3.0, dated 2026-09-20. It explicitly says it is a target architecture and not proof of implementation.
- The project owner explicitly clarified that ASAS Platform and ASAS CRM are separate projects, and that ASAS Platform is currently in architecture/design rather than build/implementation/database delivery.
- Repository identity and default branch were verified through the connected GitHub integration on 2026-10-21.
- Vercel and Supabase linkage is user-reported context; exact live project mappings remain unverified in this document.
- This register does not represent a complete verbatim archive of every conversation in the project.
