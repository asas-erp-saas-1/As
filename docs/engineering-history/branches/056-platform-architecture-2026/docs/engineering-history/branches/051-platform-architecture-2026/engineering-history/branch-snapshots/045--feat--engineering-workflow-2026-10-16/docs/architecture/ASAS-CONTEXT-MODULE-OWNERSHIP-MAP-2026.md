# ASAS — CONTEXT / MODULE / CAPABILITY OWNERSHIP MAP 2026

**Artifact ID:** ASAS-ARCH-CONTEXT-MAP-2026-001
**Status:** PROPOSED — RECONCILIATION ARTIFACT
**Version:** 1.0.0
**Owner:** Lead Architecture / Founder authority boundary
**Canonical companion:** `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md`
**Decision rule:** This map records current evidence and explicit open ownership. It does not invent ownership to close a count.

## 1. Classification rule

A **Bounded Context** is a semantic/domain ownership boundary.

A **Module** is an implementation boundary inside the application.

A **Platform Capability** is reusable infrastructure/application capability that may serve multiple contexts.

An **Aggregate** is a consistency boundary.

A **Read Model / Projection** is a query-oriented representation.

A **Worker** is an execution mechanism.

An **Event Consumer** is a reaction boundary.

These categories must never be treated as interchangeable.

## 2. Canonical bounded-context baseline

| Context | Primary responsibility | Initial module boundary | Ownership state | Notes |
|---|---|---|---|---|
| Core | shared business foundations and core organizational/domain primitives | `core` | PROPOSED | Must not become a dumping ground for unrelated domains. |
| CRM | people, organizations, leads, ownership, activities, relationship history | `crm` | PROPOSED | Commercial relationship system of record. |
| Sales | opportunity progression, offers, reservations/contracts boundary | `sales` | PROPOSED | Reservation ownership remains concurrency-sensitive. |
| Inventory | project/building/unit inventory and availability | `inventory` | PROPOSED | Must enforce no-double-sale invariants independently of UI. |
| Finance | controlled money, payment plans, postings, allocations, receipts | `finance` | PROPOSED | High-risk financial semantics require explicit contracts. |
| Studio | public property content and publishing | `studio` | PROPOSED | Naming aligns with nine-context baseline; historical “Website Studio” remains a source term. |
| Marketing | campaigns, attribution, acquisition operations | `marketing` | PROPOSED | Must not own CRM lead truth merely because it generates leads. |
| Analytics | metrics, reporting and analytical projections | `analytics` | PROPOSED | Analytical models must not become transactional authorities. |
| Documents | controlled document metadata, versions, access and lifecycle | `documents` | PROPOSED | Storage infrastructure remains platform capability. |

## 3. Platform capabilities

| Capability | Classification | Current owner | Status | Boundary rule |
|---|---|---|---|---|
| Identity | Platform capability | OPEN | OPEN | Must not be confused with Core domain ownership. |
| Tenancy | Platform capability | OPEN | OPEN | Cross-cutting security boundary. |
| Authorization | Platform capability | OPEN | OPEN | Server-side policy; RLS is defense-in-depth. |
| Audit | Platform capability | OPEN | OPEN | Domain events and audit records remain distinct concepts. |
| Events / Outbox | Platform capability | OPEN | OPEN | Reliability mechanism; event ownership remains with producers. |
| Workflow | Platform capability | OPEN | OPEN | Does not automatically constitute a bounded context. |
| Scheduling | Platform capability | CONFLICT | FOUNDER DECISION REQUIRED | Historical sources conflict between CRM ownership and Core-hosted capability. |
| Search | Platform capability | OPEN | OPEN | Search indexes are projections, not domain authority. |
| Media | Platform capability | OPEN | OPEN | Storage/media service does not own business entities. |
| Notifications | Platform capability | OPEN | OPEN | Delivery mechanism; notification intent may originate in contexts. |
| Integrations | Platform capability | OPEN | OPEN | External systems require explicit adapter ownership. |
| Configuration | Platform capability | OPEN | OPEN | Must not become uncontrolled metadata mutation. |
| AI | Platform capability | OPEN | OPEN | AI cannot widen caller authority or bypass domain services. |
| SaaS Control | Platform capability | OPEN | OPEN | Subscription/entitlement concerns remain future/controlled until scope is approved. |
| Developer Platform | Architectural reservation | NONE | RESERVED | Not an MVP implementation requirement. |

## 4. Known implementation modules

The existence of a historical/module count does not prove that every module is a bounded context. The 15-module claim is therefore retained as a reconciliation input, not promoted to canonical DDD truth.

### Required mapping status

| Claimed module/capability family | Target classification | Context owner | Status |
|---|---|---|---|
| Core | Module | Core | PROPOSED |
| CRM | Module | CRM | PROPOSED |
| Sales | Module | Sales | PROPOSED |
| Inventory | Module | Inventory | PROPOSED |
| Finance | Module | Finance | PROPOSED |
| Studio / Website | Module | Studio | PROPOSED |
| Marketing | Module | Marketing | PROPOSED |
| Analytics | Module | Analytics | PROPOSED |
| Documents | Module | Documents | PROPOSED |
| Scheduling | Capability | OPEN | FOUNDER DECISION REQUIRED |
| Workflow | Capability | OPEN | OPEN |
| Integrations | Capability | OPEN | OPEN |
| Search | Capability | OPEN | OPEN |
| Media | Capability | OPEN | OPEN |
| Notifications | Capability | OPEN | OPEN |

## 5. Dependency direction

Preferred dependency direction:

```text
Experience
   ↓
Application / Decision
   ↓
Domain Contexts
   ↓
Platform Ports / Infrastructure Adapters
   ↓
Data / External Systems
```

Cross-context direct persistence access is prohibited as an architectural shortcut.

A context may consume another context through an explicit application contract, domain event, or approved integration boundary. Shared kernel use must be minimal and explicitly governed.

## 6. Ownership questions that remain open

1. Scheduling ownership — founder decision required.
2. Exact Core scope — must be prevented from becoming a generic shared bucket.
3. Identity/Tenancy/Authorization relationship to Core — platform capability boundary requires explicit contract.
4. Workflow ownership — platform capability versus domain-specific workflow remains open.
5. SaaS control-plane scope — architectural reservation unless product scope authorizes implementation.

## 7. Evidence rule

This map does not claim runtime implementation. It is a design/reconciliation artifact derived from the current architecture sources and forensic findings.

Closure requires:

`authority decision → ADR/contract update → map update → reference reconciliation → verification evidence`

## 8. Gate impact

**ARCH-G02 Contexts:** `PARTIAL`

**Blocking conditions:** Scheduling ownership and unresolved ownership boundaries listed above.

No application implementation task may use an `OPEN` ownership mapping as if it were canonical.
