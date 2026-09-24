# ASAS — PRODUCT REQUIREMENTS BASELINE 2026

**Artifact ID:** ASAS-PRD-2026-001  
**Status:** PROPOSED — FOUNDER REVIEW REQUIRED  
**Version:** 0.1.0  
**Effective date:** 2026-09-24  
**Owner:** Product / Founder authority  
**Architecture branch:** `platform-architecture-2026`  
**Authority:** This document does not override an approved product decision.

> This is a requirements consolidation artifact derived from the current ASAS architecture control plane. It is intentionally not treated as an approved product specification. Any requirement that cannot be traced to existing ASAS intent is marked as a proposal or remains open.

## 1. Product intent

ASAS is being engineered as a professional real-estate sales and marketing platform with an enterprise-grade operating core. Its initial business purpose is to support the controlled commercial lifecycle around real-estate projects, inventory, leads, visits, offers, reservations, contracts, payment-plan visibility, financial recording where authorized, audit and reporting.

The long-term ambition may extend into a broader real-estate enterprise platform, but future breadth is not an MVP implementation requirement.

## 2. Core commercial traceability spine

`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment/Receipt → Audit → Reporting`

This is a traceability spine, not a single bounded context, aggregate or database transaction.

## 3. Initial product capability set

The following capabilities are supported by the current architecture baseline as the controlled initial product direction:

- project/property presentation;
- inventory visibility;
- lead capture and qualification;
- lead assignment and commercial activity tracking;
- visit management;
- offer and reservation workflows with correctness controls;
- contract lifecycle foundations;
- payment-plan visibility;
- controlled financial recording where explicitly authorized;
- audit trail;
- commercial reporting;
- Arabic/RTL, French and English support;
- mobile-first operational experience.

These capabilities still require domain contracts before implementation authorization.

## 4. Product quality requirements

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
- explicit about loading, empty, error and recovery states.

These are engineering requirements already present in the architecture baseline, not additional commercial commitments.

## 5. Explicit non-goals for initial implementation

The following remain architectural reservations unless promoted through product authority:

- global multi-country packs;
- active-active multi-region infrastructure;
- marketplace;
- autonomous finance;
- autonomous high-impact AI actions;
- construction ERP;
- full property-management suite;
- developer platform;
- global ontology/data lake;
- premature microservice decomposition;
- independent deployables for every module/context.

## 6. Product actors

Current architecture evidence establishes the need for differentiated authority for at least:

- founder/product authority;
- platform/organization administration;
- workspace/branch operations;
- commercial users;
- system/background workers;
- AI acting under caller authority.

The exact product persona catalogue and commercial entitlement model remain subject to canonical permission and product decisions.

## 7. Business-critical correctness requirements

The product must prevent, or deterministically resolve:

- double sale / competing active reservation winners;
- unauthorized tenant access;
- unauthorized financial mutation;
- illegal lifecycle transitions;
- untraceable commercial actions;
- duplicate financial/event processing;
- AI authority escalation.

Exact enforcement mechanisms belong to architecture/domain contracts and must not be invented here.

## 8. Product metrics — not yet approved targets

The following are candidate measurement categories, not numeric targets:

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
- tenant/security incident rate.

Numeric targets require explicit product/business approval.

## 9. Scope model

### MVP / initial implementation

Only capabilities required to operate the controlled commercial lifecycle and its supporting security, tenancy, audit, reporting and design requirements.

### V1+

Incremental expansion after the first verified vertical slice and operational evidence.

### Future / architectural reservation

Capabilities listed as non-goals or future platform ambitions remain outside implementation until separately authorized.

## 10. Requirements traceability rule

Every implementation requirement must trace to:

`Product requirement → Architecture decision/contract → Context/module → Command/query → Permission → Invariant/state → Event/schema impact → Task → Test → Evidence`

An implementation task without this chain is not implementation-ready.

## 11. Open product decisions

The following require explicit product/founder authority rather than architectural inference:

- final MVP commercial scope;
- exact product personas and entitlements;
- pricing/billing model for a future SaaS offering;
- final Scheduling ownership/product behavior;
- legal/commercial policy where jurisdiction-specific interpretation is required;
- AI actions requiring human approval;
- future marketplace/construction/property-management scope.

## 12. Evidence and provenance

Primary architecture basis:

`docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md`

Control/routing basis:

`docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`

Engineering route:

`docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`

Research-first method:

`docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md`

Source package v1.6.1 is research/provenance input only and is not itself product authority.

## 13. Acceptance gate

This PRD remains `PROPOSED — FOUNDER REVIEW REQUIRED` until the founder/product authority explicitly accepts, rejects, or revises the requirements.

No engineering agent may treat this draft as authorization to expand implementation scope.
