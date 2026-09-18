# ASAS — Claude Engineering Operating Mode

**Status:** Foundation governance  
**Scope:** `asas-erp-saas-1/As` only

## Purpose

Define the operating model for AI-assisted implementation so Claude can move quickly without turning undocumented assumptions into architecture, security, database, or business truth.

## Core model

`Task → Context → Contract → Branch → Change → Verify → Review → Merge → Record`

Claude is an implementation agent, not the authority for unresolved product meaning.

## Repository hierarchy

- `main`: canonical integration branch and source of truth.
- `foundation/*`: governance, architecture, contracts, repository controls and implementation-readiness work.
- `design/*`: design-system, UX and Figma-contract work.
- `feat/*`: bounded product implementation.
- `fix/*`: bounded defect correction.
- `refactor/*`: behavior-preserving structural change.
- `chore/*`: tooling, CI and maintenance.
- `hotfix/*`: exceptional production-critical correction; requires explicit review.

Do not create long-lived branches without a documented reason. Prefer one task or one tightly coupled vertical slice per branch.

## Main branch policy

`main` must remain releasable in principle and must not be used as a scratchpad.

No direct application implementation push to `main`.

Changes enter `main` through a pull request unless an explicit repository emergency procedure exists.

Never force-push, reset, rewrite shared history, or delete `main`.

## Task workspace contract

Every implementation branch must have a task identity and bounded scope. The task record must identify:

- objective;
- non-goals;
- authoritative contracts;
- dependencies;
- affected bounded context;
- expected files/modules;
- security and tenant boundary;
- state/command/event impact;
- database/migration impact;
- verification plan;
- Definition of Done.

If these cannot be established, mark the task `BLOCKED` rather than inventing missing requirements.

## Context loading

Before changing code Claude must load, in order:

1. `AGENTS.md`;
2. `docs/handoff/CLAUDE-START-HERE.md`;
3. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`;
4. `docs/handoff/CURRENT-SESSION-STATE.md`;
5. the task packet;
6. named dependencies and canonical contracts;
7. relevant architecture/design/security/integration documents.

Historical session material is never part of the active loading sequence. `docs/handoff/SESSION-STATE.md` is a compatibility pointer only; `docs/handoff/SESSION-STATE-HISTORICAL.md` is provenance/history only.

Then inspect the actual repository state. Documentation never substitutes for repository reality.

## Implementation sequence

`Inspect → Model → Plan → Implement → Test → Attack → Verify → Record`

For state-changing business operations:

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Invariants → Transaction → State transition → Audit + Outbox → Response`

## AI autonomy

### A0 — Read / analyze

Research, inspect, map dependencies, identify contradictions and propose plans. No mutation.

### A1 — Safe foundation

Documentation, tests, deterministic tooling and non-production scaffolding within an approved task. No irreversible runtime effect.

### A2 — Scoped implementation

Application implementation inside closed contracts with tests and review. No unilateral semantic changes.

### A3 — Sensitive operations

Database migrations, production configuration, deployment, secrets, destructive operations and external side effects. Require explicit authorization and evidence; default to stop.

## Verification gates

A change is eligible for PR review only when the applicable checks exist and pass:

- formatting/lint/type checks;
- unit/integration tests;
- negative/adversarial tests for security-sensitive behavior;
- migration checks for database changes;
- tenant isolation/authorization checks where applicable;
- idempotency/concurrency checks where applicable;
- build verification;
- documentation/checkpoint update.

Do not claim a check was executed when it was not.

## Pull requests

Every PR must explain:

- what changed;
- why;
- contract/task reference;
- what did not change;
- verification performed;
- known limitations;
- migration/deployment implications;
- rollback or forward-fix approach when applicable.

Large changes should be decomposed into reviewable PRs. Stacked PRs are allowed when dependency order requires them.

## Sensitive boundaries

Changes touching any of these require extra scrutiny:

- tenant isolation / RLS;
- authentication and authorization;
- financial ledger or posted financial data;
- reservations, payments and inventory allocation;
- legal documents;
- webhooks and external integrations;
- secrets and credentials;
- migrations;
- public/private data projections;
- AI tools that can mutate data.

## Stop-line

Stop and record `BLOCKED` when a safe implementation requires inventing business meaning, bypassing authorization, weakening RLS, mutating real data destructively, duplicating money/reservations, or guessing an unresolved contract.

## Evidence discipline

Use only these task states:

- `VERIFIED`
- `FAILED`
- `BLOCKED`
- `NOT EXECUTED`

A status is not evidence. Evidence consists of repository diff, command output, test result, migration result, review record, or other reproducible artifact appropriate to the task.
