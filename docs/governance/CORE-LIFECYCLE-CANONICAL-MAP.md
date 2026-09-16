# ASAS Core Lifecycle Canonical Map

Status: FOUNDATION WORKING CONTRACT — PRE-IMPLEMENTATION
Purpose: define the cross-context lifecycle that implementation must reconcile before code or database work.

## Canonical business spine

Lead → Qualification → Opportunity → Activity/Visit → Commercial action → Option/Reservation → Contract/VSP/Notarial process → Receivable/Payment → Delivery → SAV/After-sales → Closed relationship.

This is a working cross-context map, not permission to invent missing legal or accounting semantics. Exact state transitions must be reconciled against the authoritative domain contracts before implementation.

## Core bounded-context ownership

| Capability | Owning context | Cross-context consumers |
|---|---|---|
| Identity / users / roles | Identity & Access | All |
| Agency / organization / tenant | Tenancy | All |
| Promoter / client organization | Organizations | CRM, Projects, Finance |
| Project / building / unit inventory | Real Estate / Inventory | Website, CRM, Sales, Finance |
| Leads / contacts / opportunities | CRM | Sales, Marketing, Website |
| Activities / visits | CRM / Engagement | Sales, Calendar, Notifications |
| Options / reservations | Sales | Inventory, CRM, Finance, Documents |
| Contracts / VSP / legal workflow | Contracts | Sales, Finance, Documents |
| Receivables / payments / accounting | Finance | Sales, Contracts, Reporting |
| Construction / delivery | Project Operations | Inventory, Contracts, SAV |
| SAV / after-sales | After-sales | CRM, Projects, Documents |
| Website / CMS / landing pages | Digital Experience | Inventory, CRM, Marketing |
| Integrations | Integration Boundary | Google, WhatsApp, social, providers |
| Audit / compliance | Governance | All privileged contexts |

## Invariants to preserve

1. Every tenant-scoped record has an explicit, enforceable tenant boundary.
2. Authorization is evaluated server-side; UI visibility is not authorization.
3. Inventory state must not be mutated by an unqualified public-web action.
4. Reservation/option operations require explicit actor, scope, state preconditions, idempotency strategy, and audit trail.
5. Financial postings are immutable facts; corrections use controlled reversal/adjustment semantics rather than destructive edits.
6. External provider calls are treated as side effects with idempotency and reconciliation requirements.
7. Domain events represent committed business facts; failed transactions must not publish false committed facts.
8. Cross-context writes require an explicit ownership and transaction/consistency strategy.
9. Historical/audit records cannot be silently rewritten to make an operation appear compliant.
10. No implementation may weaken a stronger contract because a UI or provider workflow is inconvenient.

## State-transition rule

A state transition is legal only when its preconditions, actor permissions, tenant scope, command, resulting state, emitted events, side effects, and failure behavior are defined. If any of these are unknown, the transition is UNRESOLVED and implementation is blocked at that boundary.

## Public website boundary

The website is a presentation and acquisition surface over canonical platform capabilities. It may read only explicitly publishable data and may submit bounded acquisition/commercial intents through authenticated server-side boundaries. It must never become a second source of truth for inventory, reservations, finance, identity, or permissions.

## Integration boundary

Google Maps/Calendar and other providers are external systems, not canonical ASAS data stores. Provider identifiers, synchronization status, retry state, and reconciliation metadata must be retained inside ASAS where operationally necessary.

## Required reconciliation before implementation

For every lifecycle edge, produce a contract row covering:
- source state;
- command;
- actor;
- permission;
- tenant scope;
- preconditions;
- target state;
- domain event;
- transactional boundary;
- external side effect;
- idempotency key;
- concurrency control;
- audit evidence;
- failure/retry behavior;
- acceptance test.

## Stop condition

Do not create application code or database migrations for a lifecycle edge while a C2/C3 semantic or safety conflict remains unresolved.
