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

## Context loading

Before changing code Claude must load, in order:

1. `AGENTS.md`;
2. `docs/handoff/CLAUDE-START-HERE.md`;
3. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`;
4. `docs/handoff/CURRENT-SESSION-STATE.md`;
5. `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`;
6. the task packet;
7. named dependencies and canonical contracts;
8. relevant architecture/design/security/integration documents.

Historical session material is never part of the active loading sequence. The compatibility and historical session-state materials are retained only for provenance and are not execution inputs.

Then inspect the actual repository state. Documentation never substitutes for repository reality.

If a named canonical artifact is marked missing, blocked, historical, or non-canonical by the artifact register, Claude MUST NOT recreate it from memory or implementation code. Follow its stated unlock condition or escalate through reconciliation.

## Implementation sequence

`Inspect → Model → Plan → Implement → Test → Attack → Verify → Record`

For state-changing business operations:

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Invariants → Transaction → State transition → Audit + Outbox → Response`

## AI autonomy
