# ASAS Foundation Engineering Map

This document defines what must be established before feature velocity. It is a map for the future implementation operator, not a license to execute now.

## A. Platform foundation

- GitHub repository governance
- protected `main`
- task-scoped branches/PRs
- CODEOWNERS for high-blast-radius paths
- CI required checks
- Supabase production protection + restore evidence
- isolated development database
- least-privilege database roles
- Vercel preview/production topology
- secret-store matrix
- Sentry/OTel/logging baseline
- spend alerts
- incident/recovery runbooks

## B. Repository foundation

Target structure:

```text
/
  AGENTS.md
  README.md
  docs/
    blueprint/
    architecture/
    product/
    design/
    research/
    adr/
    runbooks/
    reports/
    memory/
    skills/
  src/
    app/
    modules/
    lib/
    components/
    design-system/
  prisma/
    schema.prisma
    migrations/
    supplementary-sql/
  tests/
    unit/
    integration/
    e2e/
    security/
    visual/
  scripts/
  .github/
    workflows/
    CODEOWNERS
    pull_request_template.md
```

Exact paths may be adjusted only by an approved architectural decision; the module boundaries must remain explicit.

## C. Module foundation

Every bounded context follows the same internal dependency direction:

`presentation → application → domain`

and:

`application → infrastructure ports`
`infrastructure → concrete adapters`

Never:

`domain → Prisma`
`domain → Next.js`
`domain → React`
`domain → external provider`

Cross-context communication uses explicit application interfaces or domain/integration events, not direct database table manipulation.

## D. Shared kernel

The shared kernel must be deliberately small:

- branded identifiers
- Money + currency
- Clock
- Result/error model
- validated primitive types
- phone/email normalization
- date/time primitives
- authorization decision contracts
- audit context
- request/correlation context
- domain-event envelope

If a utility contains business rules for one bounded context, it does not belong in the shared kernel.

## E. Database foundation

Before schema implementation:

1. introspect reality
2. inventory unmanaged objects
3. compare field-by-field with Chapter 39
4. record every divergence
5. baseline migrations without destructive DDL
6. prove migration status is reproducible

Supplementary SQL must explicitly cover database behavior Prisma cannot express completely, such as required RLS policies, triggers, functions, indexes or provider-specific constructs.

## F. Multi-tenancy

Tenant identity is not inferred from URL/UI state alone.

Every tenant-owned table must have the correct tenant boundary. Queries must be scoped by transaction context and protected by RLS. Tests must attempt cross-tenant access using both read and mutation paths.

Acceptance example:

`tenant A user + tenant B identifier → no data disclosure and no unauthorized mutation`

Test both direct API paths and UI-triggered server actions.

## G. Domain state machines

For every stateful aggregate:

- explicit state enum
- legal transitions
- illegal transition result
- actor/context
- reason where required
- audit event
- domain event
- idempotency where needed

No arbitrary `setStatus()` method may bypass the transition policy.

## H. Event backbone

Mutation transaction:

`validate → authorize → mutate aggregate → append audit → write outbox → commit`

Dispatcher:

`claim → publish/process → mark processed → retry/backoff on failure`

Consumers must tolerate duplicate delivery.

Do not introduce Kafka or microservices merely for fashion; the approved architecture is a modular monolith with transactional outbox/pg-boss.

## I. API/application contract

Every mutation should define:

- input schema
- authorization requirement
- tenant scope
- domain command
- transaction boundary
- expected domain errors
- emitted events
- audit requirement
- idempotency requirement
- observability fields

Public endpoints have separate abuse/rate-limit/security policies.

## J. Authentication / authorization

Identity is separate from authorization.

Authorization decisions must be centrally testable. A screen hiding a button is never a security boundary.

Required negative tests:

- authenticated but wrong tenant
- authenticated but wrong role
- correct role but insufficient scope
- explicit deny override
- inactive/locked session
- expired session
- impersonated session
- direct endpoint access without UI

## K. Finance foundation

Financial design must preserve:

`contractual obligation → payment schedule → receipt → allocation → commission → ledger`

Money is integer centimes. Posted ledger records are immutable. Corrections happen through compensating entries, never edits/deletes of posted history.

Finance UI must expose provenance and reconciliation state rather than only totals.

## L. Inventory foundation

Inventory has two independent axes:

- commercial availability/status
- construction progress/status

Do not collapse them into one `status` field.

Reservation must be race-safe at database level. Application-level `if available then reserve` without a database constraint is insufficient.

## M. CRM foundation

The CRM is the customer/workflow context, not merely a contact table.

Lead identity, normalization, ownership, lifecycle, working state, activity, source, attribution, appointments, offers and opportunities must compose into one history.

Public conversion must carry contextual information such as project/unit/source/campaign/UTM where available.

## N. Studio foundation

Studio must be a controlled publishing system:

`draft → autosave → preview → approval (when required) → publish → version → rollback`

Publishing must be auditable and version-aware. Public content must not mutate operational truth accidentally.

## O. Integrations foundation

Every external integration gets:

- adapter boundary
- credential lifecycle
- provider account identity
- inbound verification
- outbound idempotency
- retry policy
- dead-letter/error state
- audit trail
- provider event mapping
- rate-limit handling
- health signal

Examples include WhatsApp, calendars, ads, email/SMS and future plugins.

No provider SDK should leak through the domain layer.

## P. Plugin / ecosystem foundation

ASAS eventually needs an ecosystem similar in spirit to mature SaaS platforms, but plugins must not bypass the core governance model.

Plugin contract should define:

- manifest
- permissions
- scopes
- event subscriptions
- API capabilities
- webhooks
- UI extension points
- credential requirements
- version compatibility
- tenant installation state
- uninstall/revocation behavior
- auditability

A plugin is never allowed to access another tenant by default.

## Q. UI engineering foundation

UI architecture should support:

- server-first rendering where appropriate
- small client islands
- route-level data boundaries
- consistent loading/error/empty states
- URL-addressable filters
- deep links
- keyboard navigation
- responsive layouts
- RTL/LTR
- high-density enterprise tables
- virtualization where required
- optimistic updates only where rollback semantics are clear

Avoid global client state unless there is a measured reason.

## R. UX foundation

Every workflow must be modeled as a user task.

For example, "Reserve apartment" is not one screen. It is:

`identify unit → validate availability → identify customer → qualification → approval if required → hold/reserve → financial obligations → confirmation → next action`

The UX must expose where the user is, what is blocking progress, and what happens next.

## S. Design-system foundation

The design system must provide:

- tokens
- typography
- spacing
- colors
- semantic states
- density
- primitives
- patterns
- layout templates
- accessibility rules
- RTL rules
- Figma mapping
- implementation mapping
- visual regression

The component registry is a contract, not a shopping list.

## T. Testing foundation

Tests must be selected by failure mode, not convenience.

| Risk | Required evidence |
|---|---|
| Authorization bypass | matrix + direct endpoint tests |
| Tenant leakage | cross-tenant attack suite |
| Reservation race | concurrent transaction test |
| Illegal lifecycle change | state-machine transition tests |
| Financial corruption | invariant + ledger tests |
| Migration drift | introspection/diff gate |
| UI regression | screenshot/visual diff |
| Accessibility regression | axe + keyboard journey |
| i18n/RTL regression | AR/FR screenshot matrix |
| Duplicate event | idempotency/processed-event tests |
| Provider failure | retry/dead-letter tests |
| Performance regression | bundle/route/CLS budgets |

## U. Observability foundation

At minimum:

- request ID
- trace ID where available
- structured logs
- error tracking
- deployment/release tag
- DB query instrumentation
- domain event metrics
- outbox lag
- queue retry/dead-letter counts
- authentication failure/lockout metrics
- critical business probes

Avoid logging secrets or unnecessary personal data.

## V. Security foundation

Threat-model the system before exposing public APIs.

Minimum areas:

- authentication/session theft
- IDOR/BOLA
- tenant breakout
- privilege escalation
- webhook spoofing
- replay attacks
- CSRF where applicable
- XSS/content injection in Studio
- file upload abuse
- SSRF through integrations/media URLs
- secret leakage
- dependency/supply-chain risk
- rate-limit bypass
- audit tampering

## W. Performance foundation

Design performance into architecture:

- server rendering by default where suitable
- avoid unnecessary hydration
- paginate large collections
- virtualize large tables
- select only required columns
- cache only with explicit invalidation semantics
- use namespaced/id-keyed revalidation tags
- measure Core Web Vitals and ops-specific budgets
- avoid N+1 data access

## X. AI foundation

AI is an intelligence layer over governed data.

AI must:

- respect authorization
- respect tenant boundaries
- cite/trace source data where useful
- use domain services for mutations
- never directly mutate production tables outside approved application paths
- produce explainable actions for consequential workflows
- support human approval for high-risk actions

Examples:

- lead next-best-action
- follow-up drafting
- sales pipeline risk
- inventory demand signal
- collection risk
- anomaly detection
- executive brief
- marketing attribution analysis

## Y. Documentation / knowledge foundation

Every durable lesson becomes one of:

- ADR
- research note
- skill
- lesson entry
- runbook
- product truth update
- architecture contract

Chat history is not the source of truth.

## Z. Release foundation

A release should answer:

- What changed?
- Which task authorized it?
- What data/schema changed?
- What security boundary changed?
- What evidence proves correctness?
- What is the rollback path?
- What monitoring detects failure?
- Which documentation was updated?

If these cannot be answered, the release is not ready.
