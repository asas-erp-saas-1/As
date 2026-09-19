# ASAS Vision Authority & Arbitration Contract

Status: CANONICAL GOVERNANCE CONTRACT
Repository: `asas-erp-saas-1/As`
Date: 2026-09-19

## 1. Purpose

This document governs how the broader ASAS Enterprise Real Estate OS vision is used without allowing enterprise ambition, historical artifacts, or implementation assumptions to corrupt the current build scope.

The strategic vision is adopted as the **target-state north star**, not as permission to implement every capability immediately.

## 2. Source hierarchy

For future reconciliation, use this order:

1. Explicitly approved product/domain decision recorded in the repository.
2. Current governance and operating contracts.
3. Approved roadmap and canonical architecture decisions.
4. Blueprint-derived registers and source-observation evidence.
5. Existing implementation.
6. Historical/reference material.
7. Inference, clearly labeled and never promoted silently.

The uploaded `asas.docx` / Enterprise Real Estate OS material is treated as **strategic source material**: high-value for vision, capabilities, future evolution, AI direction, security principles, scalability concerns, and product roadmap; it does not by itself override a newer repository decision or prove live infrastructure reality.

## 3. Strategic vision adopted

ASAS is developed toward a **Real Estate Operating System** capable of serving:

- real-estate development and sales operations;
- agency/workspace operations;
- finance and collections;
- project/construction operations where approved;
- executive intelligence and analytics;
- AI-assisted decision support;
- eventual multi-company and multi-country operation;
- eventual SaaS productization;
- eventual holding-company operating model.

The enterprise material explicitly describes the progression from MVP to V1 operational ERP, V2 AI-assisted ERP, V3 multi-company, V4 multi-country, Enterprise SaaS, and Holding OS. This progression is retained as strategic roadmap intent, not as concurrent MVP scope.

## 4. Architecture correction rules

The following statements are mandatory:

- Bounded Context != Implementation Module.
- Bounded Context != PostgreSQL Schema.
- Module != Aggregate.
- Read Model/Worker/Event Consumer != Bounded Context unless ownership evidence proves it.
- Enterprise capability != MVP feature.
- Future architecture != current implementation permission.
- Documentation != live runtime evidence.

The enterprise source's 15-context declaration and its 15-module/schema descriptions must be reconciled against the repository's current authority chain before either cardinality is promoted as canonical implementation architecture.

## 5. Product horizons

### MVP
Operate the core sales loop in a controlled initial company/workspace context.

Required business value:
- leads/CRM;
- inventory/units;
- reservations;
- contracts;
- installments;
- payment tracking;
- basic operational dashboard.

Advanced AI, multi-country, complex workflow automation, advanced accounting, and construction automation remain excluded unless an approved scope decision promotes them.

### V1
Operational ERP expansion: finance/collections, stronger permissions, controlled workflow/automation, and broader operational visibility.

### V2
AI-assisted decision support: lead scoring, sales probability, cash-flow forecasting, collections risk and other approved predictive capabilities.

### V3
Multi-company / group operation.

### V4
Multi-country/localization expansion.

### Enterprise Edition
SaaS productization, API/platform capabilities, modular commercial packaging and controlled extensibility.

### Holding OS
Long-term group-level capital, portfolio, risk, financial intelligence and executive operating capabilities.

## 6. AI governance principle

AI is a decision-support and controlled automation layer, not an autonomous legal/financial authority by default.

AI must not silently:
- approve contracts;
- move money;
- alter legal documents;
- override authorization/workflows;
- bypass tenant/security controls.

AI outputs must be attributable to input evidence, model/version context, applicable policy and audit records where the capability is implemented.

## 7. Scalability arbitration

The enterprise scalability material is retained as a target evolution model. It does **not** authorize premature microservices, Kafka, Kubernetes, sharding, multi-region deployment, or distributed complexity.

Architecture must scale by evidence:

`modular monolith → measured bottleneck → isolated capability → justified infrastructure evolution`

A future scale target is not evidence that the corresponding infrastructure is required today.

## 8. Arbitration protocol

When documents disagree:

`Detect → classify → identify authority → preserve provenance → collect evidence → assess impact → propose options → record decision → update canonical artifact → update references/registers → verify → close`

Allowed states:

`OPEN | INVESTIGATING | BLOCKED | RESOLVED | VERIFIED | CLOSED`

No silent reconciliation.

## 9. Current C2-001 decision boundary

The enterprise vision is now accepted as the strategic north star, but **C2-001 remains OPEN**.

The next required artifact is an evidence-backed reconciliation package and then an authorized ADR establishing the canonical Context Map and Context → Module ownership model.

No context cardinality is declared canonical by this document.

## 10. Operator command contract

When the operator says:

`أكمل عملك`

the implementation agent must:

1. read `docs/handoff/CURRENT-SESSION-STATE.md`;
2. read `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`;
3. read this contract;
4. inspect current GitHub state;
5. select the highest-priority unfinished gate;
6. perform only evidence-supported, non-destructive work;
7. update the owning artifact;
8. verify the result;
9. update the checkpoint;
10. report `DONE / IN PROGRESS / BLOCKED / NOT STARTED` with evidence.

If a product, legal, architecture, financial, tenant, or irreversible infrastructure decision is required and not recorded, stop the affected slice and prepare the decision package rather than inventing the answer.

## 11. Definition of success

The vision is considered operationally governed when every strategic capability has an explicit horizon, authority, owner, dependency, implementation boundary, and verification path.
