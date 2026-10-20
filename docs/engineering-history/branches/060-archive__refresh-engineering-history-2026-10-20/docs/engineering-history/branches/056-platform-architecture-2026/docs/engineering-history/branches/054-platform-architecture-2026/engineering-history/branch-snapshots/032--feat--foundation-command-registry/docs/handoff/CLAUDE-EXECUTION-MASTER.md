# ASAS Real Estate OS — Claude Execution Master Contract

**Status:** DESIGN / HANDOFF ONLY — no implementation is authorized by this document.
**Canonical repository:** `asas-erp-saas-1/As`
**Specification baseline:** ASAS Enterprise Architecture Blueprint v1.6.1 + machine-readable handoff package.
**Execution owner:** Claude (future implementation operator).
**Decision owner:** Founder.

## 0. Mission

Build ASAS as a coherent Real Estate Operating System, not a collection of disconnected CRUD screens. The product has three connected surfaces:

1. **Public Experience** — discovery, project/unit presentation, media, floor plans, SEO, contextual CTAs, forms and WhatsApp conversion.
2. **Studio / Publishing OS** — professional real-estate website builder and publishing workflow.
3. **Operations OS** — inventory, CRM, sales, reservations, contracts, collections, finance, marketing, scheduling, workflow, governance and intelligence.

The canonical chain is:

`Agency/Workspace → Developer relationship → Project → Building → Unit → Public presentation → Lead → Qualification → Visit → Offer → Reservation → Contract → Payment schedule → Collection → Accounting/Finance → Post-sale`

Every surface must use the same governed domain model. Integrations are adapters, never alternate sources of truth.

## 1. Founder authority

Claude may implement only after the founder explicitly authorizes execution. Capability is not consent.

### Tier A — act freely
Routine implementation inside approved contracts: tests, refactors preserving behavior, documentation, small internal improvements, accessibility fixes, performance work within established budgets, implementation of already-decided contracts.

### Tier B — act + micro-ADR
Reversible technical choices that do not change product scope, money/legal behavior, data ownership, domain boundaries or security posture. Record options, choice, reason, revisit trigger.

### Tier C — founder decision required
Money/spend, legal/compliance interpretation, destructive or irreversible changes, product-facing scope, new bounded contexts, new domain events, architectural changes that alter system boundaries, security exceptions, production-data transformations, or changes to any Non-Negotiable.

### Blackout
Never execute `DROP`, destructive schema rewrites, production reset, `prisma db push`, `prisma migrate reset`, force-push, disabling RLS/branch protection/CI gates, deleting projects, printing/committing secrets, or other destructive actions.

## 2. Mandatory operating loop

For every task:

1. Locate exact task ID.
2. Load task context and applicable ADRs/registers/skills.
3. Inspect reality before schema-touching work.
4. Research unknowns using primary/current sources.
5. State plan, scope, risks and evidence to collect.
6. Implement the smallest coherent slice.
7. Test at the correct layer.
8. Run adversarial review: auth, tenancy, race, failure, accessibility, i18n/RTL, performance, observability.
9. Record exact evidence and update durable project state.
10. Open a task-scoped PR; never silently bundle unrelated work.

## 3. Phase gate

Do not start Phase 1 IAM merely because the branch is named `feat/phase-1-iam-foundation`.

Required order:

`P platform identity/protection → Phase 0 reality/schema baseline → Phase 0 exit gate → Phase 1 IAM`

The current repository has not yet proven those gates. Therefore this document is a future execution contract, not authorization to implement.

## 4. Foundation architecture

### Runtime
- Next.js App Router + React/TypeScript.
- Modular monolith.
- Supabase/Postgres as system-of-record database.
- Prisma as application schema/migration layer, reconciled against live reality.
- Server Actions for internal application mutations where appropriate + `/api/v1` for explicit API surfaces + `/api/public/v1` for public APIs.
- Transactional outbox + pg-boss for asynchronous domain/integration work.
- OTel + structured logs + Sentry for observability.

### Domain boundaries
The nine bounded contexts are the architectural modules defined by the v1.6.1 Blueprint. Scheduling is hosted as the Scheduling submodule in the Core/Operations architecture, not as an independent microservice.

Each context follows:

`domain/ → application/ → infrastructure/ → presentation/`

Domain logic must not depend on UI, database clients, HTTP or provider SDKs.

## 5. Data integrity foundation

- Money is integer DZD centimes with explicit currency.
- Financial postings are immutable and double-entry.
- Inventory has separate commercial and construction axes.
- Lifecycle changes occur only through canonical state machines.
- Reservations use database-enforced single-winner/race-safe constraints.
- Tenant isolation is enforced at the database layer, not only the UI/API layer.
- Material state changes are auditable.
- Outbox writes occur transactionally with the state mutation.
- At-least-once consumers are idempotent through processed-event/deduplication mechanisms.
- Production data is extended, not rewritten without an approved migration plan.

## 6. Identity and authorization foundation

The authorization kernel is a single service, not scattered permission checks.

Required model:

`tenant guard → identity → role hierarchy → grant union → scope union/max → deny overrides → ABAC → decision → audit where required`

Scopes are contract-defined (`NONE/OWN/TEAM/BRANCH/COMPANY/ORG/ALL`). Route authorization is centrally mapped and default-deny. Unmapped protected routes fail CI/build gates.

Sessions, lockout, token handling, privilege rotation and impersonation must follow the Phase 1 contract. Never invent a parallel auth system in a module.

## 7. UI/UX is a first-class engineering system

UI is not "after backend". Every user-facing capability must have:

- task model / user goal
- information architecture
- permissions model
- happy path
- loading state
- empty state
- filtered-empty state
- error state
- no-permission state
- destructive confirmation where required
- optimistic/pessimistic behavior explicitly chosen
- keyboard path
- screen-reader semantics
- Arabic RTL and French/English LTR behavior
- responsive behavior at 360–430, 768–1024 and 1280–2560 widths
- dense-data behavior at 100k-scale datasets where applicable
- analytics/event instrumentation where appropriate
- performance budget
- visual regression evidence

### UX principles
- Role/task-oriented workspaces, not generic dashboards.
- Reduce context switching.
- Show next-best action and blocking reason where useful.
- Preserve user orientation during drawers/modals/route transitions.
- Use progressive disclosure for complex real-estate workflows.
- Dense enterprise data is allowed; density must remain scannable.
- Never encode meaning by color alone.
- Arabic is a primary product language, not a translation afterthought.
- Western numerals are used in commercial/data surfaces.

## 8. Design-system contract

The v1.6.1 design register is the baseline. Tokens are compiled into CSS custom properties/Tailwind/DTCG-compatible design-tool representations. Styling must be token-only; no arbitrary hex values, physical-direction hacks, or off-scale values.

The component inventory is a governed registry. New primitives require proposal and registry update; they do not silently become one-off components.

Each component must define:
- anatomy
- variants
- states
- keyboard behavior
- ARIA/semantic contract
- RTL behavior
- responsive behavior
- loading/error/empty behavior when relevant
- visual tokens
- contract tests

## 9. Figma ↔ code workflow

Figma is a design-system and product-design collaboration surface, not a replacement for the codebase's domain contracts.

Preferred future workflow:

`Product task → UX model → Figma design → Figma variables/components → implementation → live UI validation → Figma/code reconciliation`

The official Figma MCP server supports structured access to Figma components, variables and layout data, and can support write-back to native Figma content. Figma documents Claude Code as a supported MCP client and recommends its remote MCP server for the broadest feature set. citeturn0search1turn0search3

### Figma rules
- Figma variables must map to ASAS design tokens; do not invent a second token system.
- Figma component names should map to the governed component registry.
- Component variants/states must correspond to implementation states.
- Auto Layout is the default layout model.
- RTL layouts must be represented and reviewed explicitly.
- Responsive frames must cover mobile, tablet and desktop classes.
- Critical flows should have annotated interaction states, not only static screens.
- Claude must inspect the selected Figma node/design context before implementing a Figma-derived screen.
- Claude must validate the rendered implementation against Figma, not merely produce visually similar code.
- If Figma and the contractual design tokens conflict, the contract/ADR decides; do not silently mutate tokens.

## 10. Required enterprise UI examples

### Inventory workspace
Hierarchy browser → project/building/unit table → filters → status chips → unit detail drawer → floor plan/media → price history → lifecycle timeline → actions allowed by permission.

### CRM workspace
Lead queue → qualification state → owner/team → next activity → contact history → WhatsApp action → visit scheduling → opportunity timeline → source/UTM attribution.

### Reservation workspace
Unit availability → reservation request → eligibility/approval → race-safe hold/reservation → countdown/expiry → payment plan → audit trail → next action.

### Finance workspace
Contractual obligation → payment schedule → collection → receipt → allocation → commission → ledger entry → reconciliation → immutable audit.

### Studio
Page tree → section editor → responsive preview → media → SEO → forms/CTA bindings → WhatsApp contextual action → draft/autosave → preview → approval/publish → version history → rollback.

## 11. Accessibility contract

Every journey must be keyboard-complete and axe-clean. Use semantic HTML, correct labels/roles, focus management, focus restoration, live-region announcements, reduced-motion behavior, sufficient contrast and non-color status encoding.

For forms: server-side validation, field-level errors, summary where needed, preserved input and accessible announcements. Next.js documentation explicitly supports accessibility checks through `eslint-plugin-jsx-a11y` and accessible form/error patterns. citeturn0search6

## 12. i18n / RTL contract

Supported locales: `ar-DZ` primary, `fr`, `en`.

Rules:
- logical CSS properties only (`margin-inline`, `padding-inline`, `inset-inline`, etc.)
- no hard-coded left/right semantics in reusable UI
- `<bdi>` around mixed-direction identifiers/names where needed
- typed message keys
- Arabic screenshots are mandatory for critical journeys
- Friday/Saturday weekend and Saturday week start are domain/UI defaults in the v1.6.1 design contract
- money, dates, phone numbers and relative time use shared formatters

## 13. Testing pyramid

Minimum gates:

- unit tests for domain/application invariants
- integration tests against real PostgreSQL behavior where SQL/RLS/constraints matter
- authorization matrix tests
- tenant-isolation attack tests
- state-machine transition tests
- reservation race tests
- migration/drift tests
- contract tests for UI primitives
- accessibility tests in every critical journey
- Arabic/French visual baselines
- end-to-end golden journeys
- performance/bundle budgets
- security scanning and dependency audit

A green test suite is not sufficient if the test suite cannot detect a seeded defect. CI must prove its gates can fail.

## 14. Observability

Every meaningful request should be traceable by request/correlation ID. Business probes should monitor at least outbox lag and critical workflow health. Errors must be release-tagged. Domain events and audit records must make important business mutations explainable after the fact.

## 15. Security

- deny by default
- tenant guard first
- no authorization from user-editable profile metadata
- secrets never in repository/client
- production credentials in approved secret stores
- least-privilege database roles
- RLS defense in depth
- no privileged function used merely to bypass an authorization problem
- webhook signatures and idempotency where applicable
- rate limits on authentication/public abuse surfaces
- audit sensitive administration and impersonation

## 16. Performance budgets

Respect the Blueprint budgets, including the client-layer budgets established by T-2.14. Performance work must be measured, not guessed. Avoid shipping large client bundles for server-renderable enterprise screens. Virtualize large data tables and paginate server-side.

## 17. AI / Claude operating model

Claude must not become a code generator that blindly follows screenshots. It is the implementation operator of a governed architecture.

For each task it must return before coding:

1. task ID
2. contract sources
3. current reality inspected
4. assumptions (ideally zero)
5. plan
6. affected modules
7. security/tenant implications
8. data/migration implications
9. UX/UI implications
10. tests and evidence
11. rollback/recovery plan

After coding it must return:

- changed files
- tests run + results
- migration/drift evidence if relevant
- visual/accessibility evidence if UI
- security review
- remaining risks
- ADR/memory updates

## 18. Definition of Done

A task is not done because code compiles.

Done means:
- contract satisfied
- scope respected
- tests green
- relevant negative tests green
- authorization/tenant isolation verified
- accessibility verified
- i18n/RTL verified for UI
- visual validation completed for UI
- performance budget respected
- observability present where needed
- migration safe and reversible where applicable
- documentation/ADR/lesson updated where required
- exact evidence attached to the PR

## 19. Stop conditions

Claude must stop and ask the founder when:
- production reality contradicts the contract materially
- a destructive migration seems necessary
- money/legal/product behavior changes
- a new domain event/module is required
- security posture must weaken
- Figma design requires changing canonical tokens/components without an approved decision
- a provider dependency becomes mandatory but was not approved
- evidence cannot prove the acceptance criterion

## 20. Final rule

Prefer a boring, correct, observable, reversible system over a clever system. Build the foundations once and make every later feature inherit them automatically.
