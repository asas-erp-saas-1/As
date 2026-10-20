# ADR-0021 — Scheduling Ownership

**Status:** ACCEPTED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Decision owner:** Founder, delegated through Engineering Conference instruction
**Scope:** Scheduling ownership, persistence boundary, cross-context usage

## Context

ASAS contains CRM activities, Sales appointments, Studio/site visits, Marketing events and future operational workflows. Existing architecture evidence contains conflicting formulations: Scheduling has historically appeared as CRM-adjacent and as a Core-hosted capability. The current conference requires an explicit ownership decision before scheduling persistence, events or implementation can be authorized.

## Decision

Scheduling is a **Core-hosted platform capability**.

It is not a separate bounded context at the current architecture stage and it is not owned by CRM persistence.

Core owns the canonical scheduling model and primitives required to manage time-bound operational commitments, including appointment identity, time window, participant/resource references, lifecycle, conflict checks, cancellation/rescheduling semantics, reminders as scheduling outputs, and audit metadata.

CRM, Sales, Studio, Marketing and future domains may create and consume scheduling use cases through explicit application contracts. A consuming domain may maintain a projection or domain-specific reference, but it does not acquire ownership of the canonical schedule merely by consuming it.

Calendar/provider integrations belong to the Integrations capability and do not become Scheduling ownership.

## Why

1. Scheduling is cross-domain and is not intrinsically a CRM business model.
2. CRM-owned scheduling would couple non-CRM workflows to CRM persistence and make future Sales/Studio/operations use cases depend on the wrong domain owner.
3. A separate bounded context would introduce an additional semantic boundary without evidence of an independent scheduling business principal, financial authority, or consistency model.
4. Core hosting provides one canonical schedule while allowing consuming domains to expose purpose-specific views.
5. This remains compatible with future extraction if scheduling develops independent scale, availability, security, team ownership, or domain semantics that justify a bounded context.

## Alternatives rejected

### A. CRM-owned Scheduling
Rejected because scheduling is used outside CRM and would make CRM the accidental owner of a cross-domain capability.

### B. Independent Scheduling bounded context
Rejected for the current stage because evidence does not show a sufficiently independent domain model or business authority to justify another bounded context.

### C. Per-context scheduling tables
Rejected because duplicated canonical schedules would create conflicting truths and synchronization problems.

## Boundary rules

- Scheduling does not own Lead, Opportunity, Unit, Reservation, Campaign or Contract.
- Scheduling may reference those resources by stable identity where needed.
- Reservation remains owned by the Sales/Inventory consistency boundary; an appointment or calendar event cannot create a reservation by itself.
- Financial commitments remain Finance-owned.
- Provider synchronization remains Integrations-owned.
- Authorization is evaluated by the caller's organization, relationship, role/team/project/resource scope and permission; Scheduling does not widen authority.
- Public calendar availability must not leak private partner or customer data.

## Persistence rule

No new scheduling schema is authorized solely from this ADR. Before implementation, the brownfield persistence trace must establish whether existing scheduling/appointment records exist, which tables are authoritative, and whether migration or compatibility work is required.

## Events

Scheduling may emit domain-significant events such as appointment created, rescheduled, cancelled, completed or no-show only after the event contract is defined. Durable publication follows the platform transactional-outbox doctrine.

## Verification

Before implementation authorization:

- inspect repository scheduling references;
- inspect migration/schema history;
- reconcile any existing appointment/activity persistence;
- define Scheduling domain contract;
- define permissions and resource scopes;
- define event ownership;
- add concurrency tests for conflicting booking/rescheduling where applicable;
- verify tenant isolation and audit behavior.

## Supersession trigger

Reopen this ADR only if new runtime evidence, a stronger authoritative product decision, legal requirements, security evidence, operational scale requirements or domain analysis demonstrates that Scheduling has become an independently governed bounded context.
