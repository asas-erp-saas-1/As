# ASAS — Claude Start Here

## Mission

Build **ASAS Real Estate OS** from the validated contracts in this repository. ASAS is a modular-monolith-first, multi-tenant real-estate operating platform covering public website/publishing Studio, project/unit inventory, CRM and sales lifecycle, reservations/contracts/payment schedules/finance controls, marketing/attribution/communications, administration/governance, workflow/audit/integration backbone, and AI-ready operational intelligence.

This file is an execution entry point. It is **not** the product specification and must never override a higher-authority contract.

## Repository identity

Canonical repository: `asas-erp-saas-1/As`.

Any separate historical repository/project is out of scope and must not be used as an ASAS implementation source.

## Before changing anything

1. Read `AGENTS.md`.
2. Read `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`.
3. Read `docs/handoff/CURRENT-SESSION-STATE.md`.
4. Read the current task packet and every dependency it names.
5. Inspect the actual repository tree and current code/configuration.
6. For runtime/database work, verify the actual ASAS platform/database identity before schema-touching work.
7. Research current official documentation for non-trivial framework/provider decisions.
8. If authoritative sources conflict, STOP and record the contradiction; do not invent a resolution.

## Product principles

- Canonical domain data is shared across Website, Studio, CRM, ERP and integrations; do not create competing truths.
- Agency/workspace ownership is a first-class data boundary.
- Tenant isolation is enforced at the data layer as well as application authorization.
- Mutations are command-oriented and authorization-gated.
- Lifecycle transitions use canonical state machines.
- Money is integer DZD centimes; posted financial records are immutable and corrected by compensating entries.
- Material changes are auditable.
- External effects use idempotent, replay-safe integration patterns.
- Prefer a coherent modular monolith until evidence justifies a boundary change.
- Do not optimize for feature count at the expense of invariants, security, correctness, or operational evidence.

## Implementation freedom

Claude has freedom to choose implementation details **inside closed contracts**: file organization, internal abstractions, algorithms, component composition, query strategy, test structure and refactoring approach.

Claude must not unilaterally redefine product scope, ownership/data tenancy, financial semantics, authorization model, legal/business lifecycle meaning, canonical states/events/commands when a contract exists, destructive data policies, or irreversible external side effects.

## Standard mutation path

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Invariants → Transaction → State transition → Audit + Outbox → Response`

Use the shortest coherent implementation that preserves this contract.

## Definition of Done

A task is not DONE because code exists. It requires contract compliance, type/build correctness, positive tests, negative/adversarial tests, authorization/tenant isolation evidence where applicable, database/migration evidence where applicable, observability/evidence output where applicable, race/idempotency/failure review where applicable, updated task/checkpoint documentation, and an exact commit reference.

Use status vocabulary only: `VERIFIED`, `FAILED`, `BLOCKED`, `NOT EXECUTED`.

## Stop conditions

Stop before implementation if the task contract is missing; dependencies are unresolved; platform/database identity is unverified for a runtime/database task; tenant isolation cannot be proven; authorization semantics are undefined; a state transition has no canonical edge; a financial mutation could duplicate, become unbalanced, or become silently mutable; a migration could destroy or reinterpret real data without an approved plan; an external integration lacks authenticity, replay, idempotency or reconciliation semantics; or two authoritative sources disagree.

## Current handoff state

This repository is being prepared for implementation. Do **not** assume global implementation authorization merely because this guide exists. Follow `docs/handoff/CURRENT-SESSION-STATE.md` and the Master Execution Path. Foundation work must remain separate from application/database implementation until its gates are explicitly closed.

## Canonical checkpoint

`docs/handoff/CURRENT-SESSION-STATE.md` is the sole current execution checkpoint. Historical and compatibility session-state artifacts are retained only for provenance/compatibility and MUST NOT be referenced by active automation, documentation, or task packets. New automation, documentation, or task packets MUST reference `CURRENT-SESSION-STATE.md`.
