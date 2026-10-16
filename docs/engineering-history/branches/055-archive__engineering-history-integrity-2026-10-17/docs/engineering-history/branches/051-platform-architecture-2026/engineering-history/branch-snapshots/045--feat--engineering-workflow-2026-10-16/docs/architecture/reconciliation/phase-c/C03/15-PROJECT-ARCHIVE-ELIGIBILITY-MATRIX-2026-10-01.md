# C03 — Project Archive Eligibility Matrix

**Date:** 2026-10-01  
**Status:** RECONCILIATION — OPEN ITEMS REMAIN  
**Scope:** Project archive semantics only  
**Implementation status:** NOT AUTHORIZED

## 1. Purpose

Define the evidence-backed policy boundary for archiving a Project without inventing a Project-wide cascade lifecycle.

## 2. Governing source facts

- ASAS V3 is the architectural target and explicitly does not claim that the repository, live database, or production environment already implements V3.
- V3 requires evidence before claims, red-team verification, CI enforcement, and production reality to override documentation when implementation begins.
- The current canonical architecture has nine bounded contexts: Core, CRM, Sales, Inventory, Finance, Studio, Marketing, Analytics, Documents. Identity, Tenancy, Authorization, Audit, Events, Workflow, Search, Media, Notifications, Integrations, Configuration, AI and SaaS Control are platform capabilities/planes unless a future ADR proves otherwise.
- The implementation specification uses `archivedAt` as the cross-cutting soft-archive mechanism and states that application code must not hard-delete records. Erasure is a separate anonymization process and is not ordinary archival.
- Outbox rows are written in the same transaction as an aggregate mutation; event publication is durable and ordered per aggregate.
- Public publication is a projection concern and must not be treated as direct exposure of operational data.

## 3. Archive eligibility matrix

| Dependency / condition | Blocks Project archive? | Evidence status | Required policy decision |
|---|---|---|---|
| Project has no Buildings | NO — archive remains semantically possible | Supported by separation of Project/Building relationship | Confirm no-child archive semantics |
| Active Buildings exist | NOT automatically proven to block | No Project-wide cascade rule found | Define whether active child objects require explicit review |
| Active Units exist | NOT automatically proven to block | Unit is independent and has its own lifecycle | Project archive must not silently mutate Unit state |
| Active reservation exists | MUST NOT be silently invalidated | Reservation has its own consistency boundary | Define whether archive is prohibited, approval-gated, or allowed with reservation continuity |
| Signed contract exists | MUST NOT be silently invalidated | Contract/Finance are independent boundaries | Define legal/business archive rule |
| Outstanding payment schedule/installments exist | MUST NOT be silently invalidated | Finance records have independent lifecycle and integrity rules | Define finance hold/approval rule |
| Public Project publication exists | Does not itself define domain archive | Studio/publication is separate projection concern | Define unpublish/projection cleanup ordering |
| Documents exist | Does not imply deletion | Documents are a canonical bounded context | Retention/link preservation rule required |
| CRM leads reference Project | Does not imply deletion | CRM is separate context | Preserve historical references |
| Analytics/read models reference Project | Does not imply deletion | Read models are projections | Rebuild/invalidation semantics required |
| Outbox/event history exists | NEVER delete as part of ordinary archive | Outbox/event durability is cross-cutting | Preserve audit/event evidence |
| Tenant/organization boundary | Archive must execute within authorized tenant scope | Tenancy is platform-kernel boundary | Authorization + RLS verification required |

## 4. Locked rules

1. **Archive is not delete.**
2. **Archive must not silently cascade commercial, contractual, financial, reservation, or Unit state changes.**
3. **Existing transactional history remains addressable/auditable after Project archival.**
4. **Public publication is handled through the Studio/projection boundary, not by treating `published` as the Project domain lifecycle.**
5. **Archival mutation must respect tenant authorization and audit requirements.**
6. **Any cross-context side effects must be explicit and observable; they cannot be hidden inside a generic cascade.**

## 5. Still OPEN — must not be invented

The source corpus does not currently establish the exact canonical answer for:

- whether an active reservation categorically blocks archive;
- whether a signed contract categorically blocks archive;
- whether outstanding finance obligations categorically block archive;
- whether active Buildings/Units require approval;
- who can authorize Project archival;
- whether archive triggers automatic Studio unpublish or a separately governed command;
- whether a Project can ever be restored after archive;
- exact event names and payloads for archival;
- exact command/API contract.

These require a dedicated business-policy/architecture decision before implementation.

## 6. Architectural consequence

Project archive is a **governed cross-context workflow**, not a database cascade.

The existence of dependencies does not justify expanding the Project aggregate to contain those dependencies. The current evidence instead supports preserving independent consistency boundaries and coordinating them explicitly.

## 7. Closure gate

C03 Project archive is **NOT CLOSED** until the open policy questions are resolved and verified against:

`Core → Inventory → Sales → Finance → Studio → Documents → CRM → Analytics`

No schema, migration, ORM cascade, API endpoint, event contract, or UI archive button is authorized by this document alone.
