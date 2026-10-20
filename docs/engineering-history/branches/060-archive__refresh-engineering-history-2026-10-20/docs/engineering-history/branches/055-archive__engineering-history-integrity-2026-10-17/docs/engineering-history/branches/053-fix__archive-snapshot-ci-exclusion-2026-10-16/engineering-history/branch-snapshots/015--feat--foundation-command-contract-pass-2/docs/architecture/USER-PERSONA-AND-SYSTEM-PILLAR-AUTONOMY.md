# ASAS — User, Persona & System-Pillar Autonomous Engineering Contract

**Status:** Foundation planning contract  
**Purpose:** Give Claude a complete map of who ASAS serves and which system pillars must be engineered as coherent operating capabilities, while preventing invented business semantics.

## 1. Core rule

ASAS is one Real Estate Operating System, not a set of disconnected modules.

Every user-facing capability must trace through:

`persona/task → workspace → command → identity/tenant → authorization → invariant → transaction → state → audit/outbox → projection → UX → evidence`

Claude may freely solve implementation details inside an approved contract. Claude must not invent missing business, legal, financial, employment or authorization semantics.

## 2. User universe

The following personas are the canonical working coverage set for product engineering. A persona is a task-oriented operating identity; it is not automatically a database role or permission bundle.

### U01 — Founder / Group Executive

Primary concerns:
- enterprise visibility
- portfolio and company performance
- strategic decisions
- governance
- risk
- financial and commercial intelligence

Engineering requirements:
- executive dashboards are projections, never alternate operational truth
- high-impact actions require explicit authorization
- AI recommendations must be evidence-backed
- financial/legal/security boundaries remain governed

### U02 — Agency Owner / Managing Director

Primary concerns:
- agency operations
- teams
- revenue
- inventory
- promoters/developers
- approvals
- financial exposure

Engineering requirements:
- tenant-scoped control plane
- delegation and approval visibility
- team/branch/workspace scope
- no implicit access to another tenant

### U03 — Sales Manager / Commercial Director

Primary concerns:
- pipeline
- lead distribution
- rep performance
- visits
- offers
- reservations
- targets and follow-up

Engineering requirements:
- assignment and transfer must be auditable
- scope-based visibility
- approval thresholds where defined
- performance analytics must not mutate operational truth

### U04 — Sales Representative / Agent

Primary concerns:
- assigned leads
- follow-up
- calls/messages
- appointments
- visits
- opportunities
- offers
- reservations
- commission visibility

Engineering requirements:
- mobile-first field workflows
- narrow object/property authorization
- no access inferred from UI visibility
- lead ownership and handover are explicit
- compensation and commission are distinct from employment state

### U05 — Sales Support / Inside Sales / Qualification

Primary concerns:
- inbound leads
- first contact
- qualification
- assignment
- appointment scheduling
- recycling/unreachable leads

Engineering requirements:
- PII-aware access
- duplicate/merge controls
- public lead idempotency
- SLA/follow-up evidence

### U06 — CRM / Operations Coordinator

Primary concerns:
- data quality
- lead routing
- appointments
- activities
- records
- operational follow-up

Engineering requirements:
- broad operational read where authorized
- controlled write authority
- no financial authority merely because CRM data is visible

### U07 — Inventory / Project Manager

Primary concerns:
- developers/promoters
- projects
- buildings
- units
- pricing
- availability
- construction milestones
- publishing readiness

Engineering requirements:
- inventory is transactional truth
- commercial and construction states remain separate
- price overrides are threshold-authorized
- reservation concurrency is protected

### U08 — Developer / Promoter Operator

Primary concerns:
- own/managed projects
- buildings
- units
- availability
- commercial information
- project performance

Engineering requirements:
- relationship/portfolio scope
- tenant isolation
- controlled third-party project representation
- public exposure must follow publishing rules

### U09 — Site / Construction / Technical User

Primary concerns:
- construction progress
- milestones
- change orders
- delivery readiness
- technical records

Engineering requirements:
- milestone certification authority must be explicit
- construction status cannot silently change commercial availability
- technical documents require classification/access controls

### U10 — Finance / Accounting User

Primary concerns:
- payment plans
- due dates
- receipts
- allocation
- refunds
- ledger
- periods
- commissions
- payouts

Engineering requirements:
- integer DZD centimes for monetary values unless an approved currency contract says otherwise
- immutable posted financial truth
- balanced journal invariants
- idempotent payment effects
- period-close controls
- finance authorization independent from sales visibility

### U11 — Collection / Cashier / Receivables User

Primary concerns:
- receipts
- allocations
- overdue installments
- collection follow-up
- payment evidence

Engineering requirements:
- cannot rewrite posted financial history
- duplicate receipt protection
- allocation rules are governed by Finance
- sensitive payment data is restricted

### U12 — SAV / After-Sales User

Primary concerns:
- delivery
- defects/requests
- customer follow-up
- service history
- closure

Engineering requirements:
- customer and contract context without broad finance mutation authority
- document/audit history
- SLA and status evidence where defined

### U13 — Marketing / Growth User

Primary concerns:
- campaigns
- audiences
- attribution
- UTM
- channel performance
- public acquisition

Engineering requirements:
- campaign mutations are authorized
- consent and PII rules apply
- attribution is preserved through conversion
- marketing analytics cannot become operational truth

### U14 — Website / Studio Editor

Primary concerns:
- pages
- project/unit content
- media
- SEO
- drafts
- review
- publishing

Engineering requirements:
- draft/review/publish lifecycle
- versioned rollback
- content sanitization
- public/private projection controls
- media security and lifecycle

### U15 — Executive / BI / Analyst

Primary concerns:
- KPIs
- trends
- funnel analysis
- forecasts
- management reporting

Engineering requirements:
- read/projection-oriented by default
- analytical definitions must be versioned
- no accidental operational writes
- freshness and lineage visible where material

### U16 — Platform Administrator

Primary concerns:
- users
- roles
- permissions
- settings
- integrations
- system governance

Engineering requirements:
- platform administration does not automatically grant business authority
- privileged operations are auditable
- deny-by-default remains active
- emergency access must be separately governed if introduced

### U17 — HR / People Operator

Primary concerns:
- workforce demand
- candidates/applications
- interviews
- offers
- onboarding
- employment records
- leave/transfer/promotion/suspension/offboarding

Engineering requirements:
- HR data classification
- employee identity separated from application identity
- compensation policy is not invented
- access state is separate from employment state
- HR permissions are independent from sales authority

### U18 — Document / Legal / Contract Operations User

Primary concerns:
- contracts
- generated documents
- uploads
- versions
- expiry
- controlled access

Engineering requirements:
- immutable/versioned records as required
- classification and retention
- generated vs uploaded provenance
- access independent from general record visibility

### U19 — Integration / Automation Operator

Primary concerns:
- connected providers
- credentials
- webhooks
- retries
- dead letters
- calendar/messaging integrations

Engineering requirements:
- credential isolation
- signature verification
- replay protection
- idempotency
- provider failure isolation

### U20 — Customer / Buyer / Public Visitor

Primary concerns:
- discover project/unit
- compare
- request information
- contact
- schedule visit
- communicate
- progress through sales journey

Engineering requirements:
- public/private boundary is explicit
- no internal data leakage
- public lead creation is abuse-resistant and idempotent
- contextual project/unit attribution preserved

### U21 — External Partner / Broker / Referral Actor

Primary concerns:
- permitted inventory
- referred leads
- referral status
- agreed commercial relationship

Engineering requirements:
- partner scope is explicit
- no tenant breakout
- referral attribution and commission semantics require approved contract

### U22 — ASAS Support / Service Operator

Primary concerns:
- troubleshooting
- customer support
- operational diagnosis

Engineering requirements:
- support access is not blanket tenant access
- sensitive-data minimization
- impersonation/session assistance, if introduced, requires explicit audit and authorization contract

## 3. Persona-to-capability matrix

Every persona must eventually map to:

`persona → workspace → task → command → permission → object → property → scope → ABAC → state edge → event → evidence`

A persona must never be used as a substitute for authorization.

## 4. System pillars

The following are the canonical engineering pillars. They are capabilities/contexts according to the existing architecture; this list does not silently create new bounded contexts.

### P01 — Identity, Tenant & Authorization Kernel

Must establish:
- authentication/session identity
- tenant/workspace resolution
- role/grant evaluation
- scope union
- deny overrides
- ABAC
- command authorization
- negative authorization tests

Stop-the-line:
- tenant breakout
- default allow
- protected command without authorization proof

### P02 — Organization / People / Workforce Capability

Must establish:
- employee identity vs login identity
- employment lifecycle
- assignment lifecycle
- access lifecycle
- onboarding/offboarding
- leave/transfer/promotion/suspension
- compensation/commission separation
- HR data classification
- handover

Do not invent employment law or payroll policy.

### P03 — Developer / Promoter Relationship

Must establish:
- business relationship
- portfolio scope
- project ownership/representation
- commercial terms where contractually defined
- access boundaries

Exact legal/commercial semantics remain contract-controlled.

### P04 — Project / Building / Inventory

Must establish:
- project
- building
- unit/apartment
- inventory truth
- commercial state
- construction state
- pricing
- availability
- media/floorplan references

### P05 — CRM / Customer Data

Must establish:
- lead identity
- deduplication/merge
- lifecycle
- working status
- ownership/assignment
- activities
- appointments
- PII boundary

### P06 — Sales / Opportunity / Offer / Reservation

Must establish:
- opportunity
- offer
- discount/approval controls
- reservation
- contract handoff
- single-winner reservation concurrency

### P07 — Contracts / Documents

Must establish:
- generated documents
- uploaded documents
- versioning
- classification
- expiry
- access
- retention

### P08 — Finance / Collections / Accounting

Must establish:
- payment plans
- installments
- receipts
- allocations
- refunds
- commissions
- payouts
- ledger
- period close
- immutable/balanced financial truth

### P09 — Website Studio / Public Experience

Must establish:
- content model
- project/unit pages
- media
- SEO
- CTA
- draft/review/publish
- rollback as new version
- public/private projection

### P10 — Marketing / Attribution / Growth

Must establish:
- campaigns
- UTM/source attribution
- audiences
- consent
- ad lead ingestion
- conversion attribution
- campaign lifecycle

### P11 — Scheduling / Communication

Scheduling remains hosted in CRM; communications are platform/integration capabilities unless authoritative registers change this.

Must establish:
- appointment lifecycle
- calendar projection
- messaging adapters
- delivery/retry semantics
- consent and audit

### P12 — Workflow / Approval Orchestration

Must establish:
- durable workflow state
- approvals
- escalation
- expiry
- retries
- compensation where applicable

Workflow orchestrates; domain state remains authoritative in domain commands.

### P13 — Search / Projection / Read Models

Must establish:
- projection ownership
- freshness
- rebuildability
- authorization-aware search
- cache invalidation
- no alternate write authority

### P14 — Analytics / Executive Intelligence

Must establish:
- metric definitions
- lineage
- freshness
- operational vs analytical truth
- forecasts
- executive reporting

### P15 — Integrations / Plugin Platform

Must establish:
- adapter boundary
- credentials
- webhook signatures
- replay protection
- retries/dead letters
- provider limits
- external side-effect idempotency

### P16 — AI Copilot / Intelligence Layer

Must establish:
- data access boundary
- tool registry
- action authorization
- human approval where required
- prompt/input/output classification
- audit
- no implicit ALL scope
- no direct arbitrary database mutation

### P17 — Notifications

Platform capability for:
- in-app notifications
- email/SMS/WhatsApp adapters where approved
- delivery state
- retries
- user preferences
- audit

### P18 — Audit / Governance / Compliance Evidence

Must establish:
- actor
- tenant
- command
- object
- before/after where appropriate
- correlation/causation
- immutable/tamper-evident strategy
- retention
- security-sensitive access evidence

### P19 — Observability / Reliability / Recovery

Must establish:
- traces
- structured logs
- metrics
- correlation IDs
- business probes
- queue/outbox lag
- SLOs
- RPO/RTO
- backup/restore evidence
- failure drills

### P20 — UX / Design System / Accessibility

Must establish:
- tokens
- registered components
- role/task workspaces
- responsive behavior
- RTL/LTR
- keyboard/focus
- loading/empty/error/permission states
- mobile field workflows
- Figma-to-code traceability

## 5. Cross-pillar construction rule

No pillar is complete merely because screens or tables exist.

Completion requires:

`contract → domain model → command → authorization → invariant → transaction → state → event/audit → projection → UX → tests → evidence`

## 6. Autonomous build order by pillar

Claude should use this dependency order unless an explicit task graph overrides it:

1. P19 Reality/observability/recovery baseline
2. P01 Identity/tenant/authorization kernel
3. command + transaction + idempotency + audit/outbox primitives
4. P04 Inventory
5. P05 CRM
6. P06 Sales
7. P08 Finance
8. P07 Documents
9. P03 Developer/Promoter relationship
10. P09 Studio/Public
11. P10 Marketing
12. P11 Scheduling/Communication
13. P12 Workflow/Approvals
14. P13 Search/Projections
15. P14 Analytics
16. P15 Integrations
17. P02 People/HR
18. P17 Notifications
19. P20 UX hardening across completed vertical slices
20. P16 AI only after authorization/tool contracts are proven
21. P19 scale/recovery hardening continuously and finally as release gate

This order is not permission to bypass Phase P/0 gates. It is a dependency model.

## 7. Autonomous implementation rule for every pillar

For every pillar Claude must:

1. discover authoritative contracts
2. enumerate entities/aggregates
3. enumerate commands
4. map permissions
5. map state machines
6. map events
7. define invariants
8. identify idempotency keys
9. identify concurrency hazards
10. define transaction boundary
11. define audit/outbox behavior
12. define public/private boundary
13. define data classification/retention
14. define integration side effects
15. define tests, negative tests and evidence
16. implement the smallest coherent vertical slice
17. attack the slice adversarially
18. document residual OPEN items
19. continue to next unblocked task

## 8. User lifecycle principle

For users who are employees, Claude must never collapse these independent lifecycles:

`Person → Applicant → Employee → Assignment → User Account → Role/Grant → Session → Employment Status → Access Status → Compensation → Commission Eligibility → Offboarding`

A person may exist without an account. An account may be suspended while employment remains active. Employment may end while financial reconciliation remains open. Commission eligibility may outlive active selling access according to approved policy. These semantics must be modeled explicitly, not inferred from a single `status` field.

## 9. Handover principle

Any user exit, suspension, leave or transfer that can affect operational ownership must trigger a controlled handover analysis for:

- leads
- opportunities
- appointments
- offers
- reservations
- tasks/follow-ups
- conversations
- documents
- campaigns
- approvals

The system must never silently orphan operational work.

## 10. Protected decisions

Claude must escalate rather than invent:

- employment law/policy
- payroll rules
- commission formulas
- legal contract semantics
- promoter commercial terms
- financial accounting policy
- approval thresholds not defined by source contracts
- new canonical events
- new permissions
- new bounded contexts
- tenant/data ownership changes
- privileged AI mutations
- irreversible migrations

## 11. Definition of system completeness

ASAS is engineering-complete only when every critical persona and every critical pillar can be traced through the same governed chain:

`user/task → workspace → command → permission → invariant → transaction → state → event/audit → projection → UX → evidence`

A module can be visually complete while still being incomplete. A database can be structurally complete while still being incomplete. The chain is the completion criterion.

## 12. Autonomous continuation

When Claude completes one persona/pillar task, it must automatically inspect the dependency graph and continue with the highest-priority READY task.

It must not stop merely because the next task belongs to another persona or pillar.

It must stop only for:
- protected founder decision
- missing authoritative contract that materially changes behavior
- unsafe production reality
- failed security/financial/tenant invariant
- inability to produce objective evidence

Otherwise: continue.
