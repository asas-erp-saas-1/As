# ASAS — Claude Engineering Operating Mode

**Status:** Foundation governance  
**Scope:** `asas-erp-saas-1/As` only

## Purpose

Define the operating model for AI-assisted ASAS engineering so agents can move quickly without turning undocumented assumptions into architecture, security, database, or business truth.

## Core model

`Task → Context → Contract → Engineering Line → Change → Verify → Review → Record`

Claude is an engineering collaboration agent, not the authority for unresolved product meaning. Codex remains the primary repository implementation executor when implementation is authorized.

## Sole engineering line

ASAS has one active engineering line:

`platform-architecture-2026`

This branch is the only branch on which ASAS engineering work is performed during the current program.

`main` is the GitHub repository default-branch metadata and is **not** an alternative ASAS engineering line. Do not develop, implement, or checkpoint work on `main`.

Other branches may be inspected only for provenance, historical evidence, or explicitly documented forensic comparison. They are not workspaces and must not become competing sources of truth.

Do not create feature, foundation, design, fix, refactor, chore, hotfix, or other working branches unless the founder explicitly changes the single-line operating decision and the canonical governance artifacts are amended first.

Never force-push, reset, rewrite shared history, or delete the active engineering line.

## Main/default branch clarification

The repository may report `main` as its GitHub default branch. That repository fact does not override the ASAS operating decision that `platform-architecture-2026` is the sole engineering line.

If a provider such as Vercel is configured to deploy `main` to Production while ASAS engineering is occurring on `platform-architecture-2026`, record this as a control-plane mismatch and reconcile it through GATE-00. Do not silently switch engineering work to `main` to make the provider configuration appear consistent.

## Task contract

Every engineering task must have:

- objective;
- current gate;
- non-goals;
- authoritative contracts;
- dependencies;
- affected bounded context or platform capability;
- expected artifacts/files;
- security and tenant boundary;
- state/command/event impact;
- database/migration impact if authorized;
- verification plan;
- Definition of Done;
- evidence location.

If these cannot be established, mark the task `BLOCKED` rather than inventing missing requirements.

## Context loading

Before any material engineering task, not only implementation, load in this order:

1. `AGENTS.md`;
2. `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md`;
3. `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md`;
4. `docs/handoff/CURRENT-SESSION-STATE.md`;
5. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`;
6. the current task packet;
7. named dependencies and canonical contracts;
8. relevant architecture/design/security/integration documents;
9. actual repository state at `platform-architecture-2026`.

Then inspect reality. Documentation never substitutes for repository/runtime evidence.

## Engineering Conference sequence

During the pre-implementation conference, use:

`Question → Scope → Evidence → Research → Alternatives → Failure modes → Reconciliation → Decision → Canonical artifact → Adversarial review → Verification → Checkpoint`

The Engineering Conference gates are serial:

`GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07`

Later-gate research may inform earlier decisions, but no agent may close or bypass the first unresolved gate.

## Implementation sequence

Only after a specific slice receives GATE-07 authorization:

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

A change is eligible for review only when the applicable checks exist and pass:

- formatting/lint/type checks;
- unit/integration tests;
- negative/adversarial tests for security-sensitive behavior;
- migration checks for database changes;
- tenant isolation/authorization checks where applicable;
- idempotency/concurrency checks where applicable;
- build verification;
- documentation/checkpoint update.

Do not claim a check was executed when it was not.

## Sensitive boundaries

Changes touching tenant isolation/RLS, authentication/authorization, financial ledger or posted financial data, reservations/payments/inventory allocation, legal documents, webhooks/external integrations, secrets, migrations, public/private data projections, or AI tools capable of mutation require extra scrutiny and the authority defined by V3/AGENTS.

## Stop-line

Stop and record `BLOCKED` when a safe action requires inventing business meaning, bypassing authorization, weakening RLS, mutating real data destructively, duplicating money/reservations, guessing an unresolved contract, or leaving the sole engineering line.

## Evidence discipline

Use only these task states:

- `VERIFIED`
- `FAILED`
- `BLOCKED`
- `NOT EXECUTED`

A status is not evidence. Evidence consists of repository diff, command output, test result, migration result, review record, runtime evidence, or another reproducible artifact appropriate to the task.
