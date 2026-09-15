# ASAS — MASTER EXECUTION PATH

**Repository:** `asas-erp-saas-1/As`
**Status:** CANONICAL OPERATING PATH
**Owner:** Founder defines business meaning; Claude executes safely inside approved contracts.
**Rule:** This file is the durable resume point for the instruction `أكمل عملك على المسار`.

## 1. Mission

Prepare every condition required for Claude to develop the ASAS application and database autonomously, safely, incrementally and with objective evidence.

This path is not a documentation exercise. Documentation exists to make implementation safe and autonomous. Once a task's gates are closed, implementation is expected rather than postponed.

## 2. Repository identity — absolute rule

The active product repository is:

`asas-erp-saas-1/As`

`asas-erp-saas-1/Asas-website` is a different project and must never be used as evidence, codebase, deployment, database, migration history, or product state for ASAS.

Any similarly named Supabase/Vercel project is UNKNOWN until explicitly verified against the `As` deployment/repository identity.

## 3. Resume protocol

Whenever the founder says:

> **أكمل عملك على المسار**

Claude must immediately:

1. open this file first;
2. open `docs/handoff/SESSION_STATE.md`;
3. inspect the current `As` branch/commit state;
4. inspect the active task register and closure evidence;
5. identify the highest-priority unblocked task;
6. continue from its recorded checkpoint;
7. update this file and `SESSION_STATE.md` after substantive work;
8. commit durable changes to the active task branch;
9. continue automatically until an A2/A3 decision, hard blocker, or completed work boundary is reached.

Claude must not restart the project, repeat completed work, or ask what to do next when the dependency graph already determines the next task.

## 4. Operating layers

### Layer 0 — Reality
Repository, branch, deployment identity, database identity, migrations, backups/restores, runtime and CI.

### Layer 1 — Kernel
Identity, tenant, authorization, command boundary, validation, transaction, idempotency, audit, outbox/inbox.

### Layer 2 — Domain correctness
Aggregates, invariants, state machines, concurrency, money, time, document/version semantics.

### Layer 3 — Golden workflows
Lead → qualification → visit → opportunity → offer → reservation → contract → payment/collection.

### Layer 4 — Experience
Role/task UX, Studio, public experience, responsive behavior, RTL/LTR, accessibility and error/permission states.

### Layer 5 — Integrations
Calendar, WhatsApp, payments, marketing, identity, storage, documents and provider adapters.

### Layer 6 — Intelligence
Analytics, AI recommendations and governed AI actions.

### Layer 7 — Scale/reliability
Performance, queues, caching, projections, rate limits, SLO/RPO/RTO, recovery and cost controls.

Never use a downstream layer to conceal an upstream correctness defect.

## 5. Task lifecycle

Every task has exactly one lifecycle state:

`BLOCKED → READY → IN_PROGRESS → VERIFYING → DONE`

or:

`IN_PROGRESS → ESCALATED`

A task cannot be `DONE` because code was written. It is DONE only when the closure standard below is satisfied and evidence is recorded.

## 6. Task closure standard

A task closes only if all applicable gates are GREEN:

### C1 — Contract
- authoritative source identified;
- scope and non-goals explicit;
- no unresolved semantic contradiction.

### C2 — Reality
- relevant repository/runtime/database/migration reality inspected;
- no assumption substituted for evidence.

### C3 — Design
- command(s), state edge(s), permission(s), invariant(s), event(s), transaction boundary and integration effects mapped where applicable;
- OPEN items are explicitly recorded.

### C4 — Security & tenancy
- authentication/authorization path verified;
- tenant/object/property boundaries verified;
- negative tests for unauthorized access exist where applicable;
- public/private exposure checked.

### C5 — Correctness
- positive tests prove intended behavior;
- negative tests prove rejection of illegal behavior;
- idempotency verified where mutation/retry can occur;
- concurrency/race behavior verified where contention can occur;
- finance invariants verified for financial work.

### C6 — Persistence & migration
- transaction boundary is explicit;
- audit/outbox/inbox behavior verified where applicable;
- migrations are expand/contract safe;
- backfill/invariant validation is evidenced;
- rollback or forward-fix path is documented.

### C7 — External effects
- provider adapter boundary preserved;
- webhook signature/replay protection verified where applicable;
- external side effects are idempotent/retry-safe;
- credentials are isolated and never exposed.

### C8 — UX
For UI work only:
- loading/empty/error/permission states;
- responsive 360–430, 768–1024 and 1280–2560;
- Arabic/French/English;
- RTL/LTR;
- keyboard/accessibility;
- visual evidence against approved design/Figma where required.

### C9 — Observability
- logs/traces/metrics/correlation added where operationally relevant;
- failures are diagnosable;
- business-critical events are observable.

### C10 — Verification evidence
The task record must contain exact commands/checks/results, not statements such as “tested” or “works”.

### C11 — Documentation/state
- task packet updated;
- residual OPEN risks recorded;
- ADR added for A1 technical decisions;
- SESSION_STATE updated;
- this master path updated with the new checkpoint.

### C12 — Git hygiene
- task-scoped branch/PR/commit;
- no force-push/reset;
- no unrelated changes;
- no secrets;
- CI/checks green where applicable.

## 7. Minimum evidence by task type

| Task | Required evidence |
|---|---|
| Documentation/contract | source traceability + consistency check |
| Domain command | unit + negative authorization + invariant + integration transaction evidence |
| Database/migration | schema diff + migration test + backfill/invariant validation + rollback/forward-fix evidence |
| Auth/RLS | positive + cross-tenant negative + object/property negative |
| Payment/finance | idempotency + duplicate/replay + balance/allocation + period rules |
| Webhook/integration | signature + replay + duplicate delivery + retry/DLQ + reconciliation |
| UI | responsive + RTL/LTR + accessibility + loading/error/permission + visual evidence |
| AI action | tool authorization + tenant scope + data egress + audit + refusal/negative tests |
| Performance | baseline + target budget + measured result |
| Reliability | failure injection + recovery + RPO/RTO evidence where applicable |

## 8. Autonomous authority

### A0 — execute
Claude may implement when the contract is sufficient, the scope is authorized, the change is reversible/safely migratable, and objective verification exists.

### A1 — execute + micro-ADR
Claude may select among technically equivalent options without changing business semantics. Record the decision and trade-offs.

### A2 — stop for Founder
Stop before implementation when semantics change money, law, employment, contracts, canonical ownership/events/permissions, tenant/data ownership, public/private boundaries, privileged AI, production-data transformation, irreversible migration, or material provider lock-in/cost.

### A3 — prohibited
Never reset production, force-push, disable security/RLS to make code work, commit secrets, delete production data to hide defects, or silently rewrite canonical contracts.

## 9. Automatic task selection

When no A2/A3 blocker exists:

1. inspect all READY tasks;
2. choose P0 before P1/P2;
3. choose the task that unblocks the most downstream work;
4. prefer a complete vertical slice over isolated CRUD;
5. execute to DONE;
6. update evidence/state;
7. select the next unblocked task;
8. repeat.

## 10. Stop-the-line conditions

Immediately stop downstream implementation for:

- tenant breakout;
- unauthorized protected access;
- duplicate reservation winner;
- unbalanced ledger;
- duplicate non-idempotent side effect;
- audit tampering;
- lost outbox/inbox event;
- unsafe migration;
- public/private data leak;
- AI authorization bypass;
- secret exposure;
- unsafe webhook replay;
- material contradiction between reality and canonical contract.

Only the affected dependency chain is blocked; unrelated safe READY work may continue.

## 11. Foundation-to-implementation gate

The project becomes implementation-ready only when:

1. `As` repository identity is verified;
2. actual `As` deployment and database identity are verified;
3. reality baseline is reproducible;
4. critical state/command/event/permission mappings are closed;
5. tenant/IAM kernel contract is executable;
6. idempotency/concurrency/outbox/inbox contracts are implementable;
7. finance invariants affecting the first financial workflow are closed;
8. public/private and AI egress boundaries are explicit;
9. migration strategy is safe;
10. Claude task packets are sufficiently precise for autonomous implementation;
11. required tests/evidence can objectively prove completion.

No requirement for perfect documentation is imposed. The gate is **implementation sufficiency**, not paperwork completeness.

## 12. Current checkpoint

As of 2026-09-15:

- Canonical repository: VERIFIED as `asas-erp-saas-1/As`.
- `Asas-website`: explicitly excluded.
- Foundation documents and adversarial contracts: substantially established.
- **GATE-00 executed read-only:** repository identity verified; connected platform inventories do not prove an `As` deployment/database identity.
- Current connected Supabase inventory exposes only `asas-web-site` (`xwokfufeeodobkuaxvgx`), explicitly excluded.
- Current connected Vercel team exposes no project linked to `asas-erp-saas-1/As`.
- Current `As` branch contains no `package.json`, `vercel.json`, `.vercel/project.json`, or `.github/workflows`, so repository-local deployment linkage is not available.
- B.6 reservation/hold/deposit remains high-risk and not implementation-ready.
- No application/database implementation is authorized until GATE-00 and the complete implementation-readiness gate are passed.

## 13. Required update discipline

After every substantive work session, update:

1. this file — current checkpoint, completed gates, next task;
2. `docs/handoff/SESSION_STATE.md` — durable session summary;
3. relevant task/closure artifact — exact evidence;
4. commit SHA — exact durable checkpoint.

If a task is blocked, record:
`BLOCKER → evidence → affected tasks → founder decision required (if any) → safe next work`.

## 14. Final rule

The path exists to make Claude productive, not to keep Claude waiting.

**Close the contract enough to implement. Implement. Prove. Record. Continue.**

**Founder controls business meaning. Claude controls safe engineering execution.**
