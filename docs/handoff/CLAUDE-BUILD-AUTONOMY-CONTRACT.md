# ASAS — Claude Build Autonomy Contract

**Purpose:** Give Claude enough authority and operational structure to execute the approved engineering roadmap independently, while preserving founder control over irreversible product, legal, financial and security decisions.

## 1. Principle

Claude should not wait for founder approval for every implementation detail.

Claude **must act autonomously** when the requested work is already authorized by canonical contracts and the change is reversible, testable and within established boundaries.

Claude **must stop** only when a decision crosses a protected boundary or evidence proves the contract is insufficient.

Autonomy is therefore:

`freedom inside contracts + mandatory evidence + automatic stop on protected boundaries`

## 2. Authority tiers

### A0 — Autonomous execution

Claude may decide and implement without asking when all are true:

- task is explicitly authorized
- existing contract is sufficient
- no product scope change
- no new canonical domain event
- no new bounded context
- no legal/financial policy interpretation
- no destructive migration
- no security weakening
- reversible or safely migratable
- objective tests can prove correctness

Examples:
- refactoring without behavior change
- unit/integration/E2E tests
- accessibility fixes
- RTL/i18n implementation under existing contract
- loading/error/empty states
- performance optimization within budget
- component extraction using registered components
- typed validation
- observability instrumentation
- internal adapters using approved interfaces
- documentation and evidence updates
- fixing defects discovered by tests

### A1 — Autonomous implementation + recorded micro-ADR

Claude may choose between reasonable technical options if the choice does not alter business semantics. Record:

- options considered
- chosen option
- reason
- trade-off
- rollback
- revisit trigger

Do not wait for founder approval unless the choice later crosses A2/A3.

### A2 — Stop for founder decision

Stop before implementation if the decision changes:

- money semantics
- legal/compliance interpretation
- employment policy
- compensation policy
- contractual business behavior
- canonical domain ownership
- bounded-context boundaries
- canonical event taxonomy
- data ownership
- tenant model
- public/private boundary
- privileged AI capability
- production-data transformation
- irreversible migration
- external provider commitment with material lock-in/cost
- security posture

### A3 — Hard prohibition

Never execute:

- production reset
- `prisma migrate reset`
- `prisma db push` against governed production
- destructive `DROP`/truncate without explicit approved migration
- force-push
- bypassing branch protection/CI gates
- disabling RLS/security controls to make a feature work
- committing secrets
- exposing production credentials
- deleting production records to fix application logic
- silently changing canonical contracts to match implementation

## 3. Self-directed execution loop

For every authorized task Claude runs:

1. **Locate** — task ID, module, acceptance criteria.
2. **Load** — registers, ADRs, architecture contract, skills and prior evidence.
3. **Inspect** — repository, runtime/database reality, current migrations and generated artifacts as applicable.
4. **Research** — current primary sources for version-sensitive or unfamiliar behavior.
5. **Model** — command, state edge, authorization, transaction, events, failure modes.
6. **Plan** — smallest coherent vertical slice.
7. **Build** — implementation + tests together.
8. **Attack** — tenant breakout, privilege escalation, race, retry, failure, malformed input, i18n/RTL, accessibility, performance.
9. **Verify** — objective evidence.
10. **Record** — changed files, evidence, risks, ADRs, session state.
11. **Integrate** — task-scoped commit/PR only.
12. **Continue** — automatically proceed to the next unblocked task in the approved dependency graph.

## 4. No artificial waiting

Claude must not stop merely because:

- a UI detail is unspecified but the existing design system determines it
- a standard test is missing but can be written safely
- a component needs extraction
- a type needs tightening
- a bug is discovered in the current authorized scope
- documentation is stale and the correction is factual
- an existing contract has an obvious implementation mapping

Claude should fix these within A0/A1 authority and continue.

## 5. Automatic escalation triggers

Claude must stop and report a decision packet when it discovers:

- production reality contradicts a canonical contract
- two authoritative sources conflict
- required state edge is not defined
- required event is not registered
- required permission is missing
- an operation requires a new permission or new bounded context
- an invariant cannot be enforced at the correct layer
- concurrency cannot be made race-safe without changing the model
- a migration cannot be expanded/contracted safely
- an external provider is required but not approved
- HR/legal/financial policy is missing
- AI would gain mutation authority not already approved
- evidence cannot establish the acceptance criterion

Decision packet must contain:

`problem → evidence → affected contracts → options → recommended option → risks → reversibility → exact founder decision required`

## 6. Build-order hierarchy

Claude should prioritize work in this order unless the task graph explicitly overrides it:

### Layer 0 — Reality

Repository identity, environment identity, database identity, migrations, branch state, backup/restore evidence.

### Layer 1 — Kernel

Identity, tenant context, authorization, command execution, validation, transactions, audit, idempotency, outbox/inbox.

### Layer 2 — Domain correctness

Aggregates, invariants, state machines, concurrency, money, time, document/version rules.

### Layer 3 — Cross-domain workflows

Lead → qualification → visit → offer → reservation → contract → payment/collection.

### Layer 4 — Experience

Role/task workspaces, responsive UI, RTL/LTR, accessibility, loading/error/permission states.

### Layer 5 — Integrations

WhatsApp/provider adapters, calendar, webhooks, marketing, storage, publishing.

### Layer 6 — Intelligence

Analytics, forecasts, AI copilots, recommendations and governed tool execution.

### Layer 7 — Scale

Performance, caching, queues, projections, load shedding, cost controls and disaster recovery.

Do not build Layer 6 or 7 to compensate for a broken Layer 1 or 2.

## 7. Engineering command pattern

All business mutations must be expressible as an explicit command.

Canonical conceptual shape:

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Domain invariant → Transaction → State transition → Audit + Outbox → Response`

A command must not:
- trust client-provided authorization
- mutate arbitrary status fields
- write financial truth outside the finance kernel
- bypass domain invariants
- emit an event before the transaction is durable
- perform non-idempotent external effects inside the database transaction

## 8. Task packet required before coding

For each implementation task Claude should create/maintain a compact task packet:

```text
TASK
Owner:
Task ID:
Goal:

CONTRACTS
Product:
Domain:
State machine:
Permission:
Event:
ADR:

REALITY
Repo:
DB/migrations:
Runtime:
Dependencies:

PLAN
Files:
Commands:
Data changes:
UI changes:
Integration changes:

RISKS
Security:
Tenancy:
Concurrency:
Failure/retry:
Performance:
Accessibility/i18n:

EVIDENCE
Unit:
Integration:
E2E:
Security:
Visual:
Performance:
Migration:

DONE
Acceptance criteria:
Rollback:
Residual risks:
```

## 9. Build orders

Build orders are dependency-aware execution directives, not vague prompts.

### BO-00 — Reality Gate

Do not write domain code. Prove repository, branch, environment and database identity; inspect migration history; establish backup/restore evidence where required.

### BO-01 — Kernel Gate

Implement/verify identity, tenant context, authorization kernel, command boundary, validation, audit, idempotency and transaction primitives.

### BO-02 — State Gate

Normalize every implemented state machine. No arbitrary status setter. Every legal transition has a command and negative tests.

### BO-03 — Event Gate

Every implemented event maps to registered identity/version, producer, aggregate, command, consumers, transaction/outbox behavior and idempotency semantics.

### BO-04 — Security Gate

Prove tenant isolation, object/property authorization, deny-by-default routes and sensitive-data boundaries with negative tests.

### BO-05 — Finance Gate

Prove integer money, currency, immutable postings, balanced journal invariants, receipt allocation and idempotent payment effects.

### BO-06 — CRM/Sales Vertical Slice

Build one complete golden journey end-to-end before multiplying screens:

`Lead → Qualification → Visit → Opportunity → Offer → Reservation`

Every step must traverse the kernel and emit governed evidence.

### BO-07 — Contract/Collection Vertical Slice

`Reservation → Contract → Payment Schedule → Receipt → Allocation → Collection → Accounting projection`

### BO-08 — Studio/Public Vertical Slice

`Project/Unit → Page Draft → Review → Publish → Public CTA → Lead attribution`

### BO-09 — Sales Representative / HR Capability

Implement only after HR ownership, lifecycle state machines, data classification and authorization boundaries are approved. Until then, build contract/tests/tooling without inventing HR policy.

### BO-10 — Integration Hardening

Webhooks, external APIs, calendars, messaging and storage use adapters, signatures, replay protection, idempotency and failure queues.

### BO-11 — Intelligence

AI recommendations first; governed tool execution second. AI never becomes an authorization bypass.

### BO-12 — Scale / Reliability

Load testing, query budgets, cache policy, queue backpressure, projections, recovery drills, SLOs and cost controls.

## 10. Autonomous continuation rule

When a task finishes, Claude should inspect the dependency graph and automatically continue with the highest-priority unblocked task **unless** an A2/A3 escalation is encountered.

Do not ask:
> “What should I do next?”

Instead report:
> “Completed X. Y is the next unblocked task. I continued until Z became a protected decision.”

## 11. Failure protocol

If implementation fails:

1. preserve the failure evidence
2. classify it: code / contract / environment / dependency / data / race / authorization
3. fix A0/A1 failures autonomously
4. do not weaken tests to make CI green
5. escalate A2/A3 failures with evidence
6. update the durable state

## 12. Definition of Done for autonomous work

A task is complete only when:

- contract satisfied
- implementation is scoped
- tests prove positive and negative behavior
- authorization/tenant isolation verified
- race/retry semantics verified where relevant
- audit/outbox semantics verified where relevant
- accessibility/i18n/RTL verified for UI
- observability is present where needed
- migration is safe and reversible where applicable
- documentation/evidence updated
- no unexplained warnings or failing checks remain

## 13. Final operating rule

**Claude has freedom to solve implementation problems. Claude does not have freedom to redefine the business.**

That distinction is the central autonomy boundary for ASAS.
