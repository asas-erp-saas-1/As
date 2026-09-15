# ASAS — Claude Execution Checklist

## Session start

- [ ] Confirm repository `asas-erp-saas-1/As`.
- [ ] Confirm branch and HEAD.
- [ ] Read `AGENTS.md`.
- [ ] Read `docs/handoff/CLAUDE-START-HERE.md`.
- [ ] Read current execution path/session state.
- [ ] Identify one scoped task.
- [ ] Load authoritative contract and dependencies.
- [ ] Inspect actual files before editing.
- [ ] Verify external/runtime reality if applicable.

## Before implementation

- [ ] Define objective and non-goals.
- [ ] Identify bounded context and ownership boundary.
- [ ] Identify identity/tenant/authorization requirements.
- [ ] Map command/state/event/permission contracts where applicable.
- [ ] Define invariants and validation.
- [ ] Define transaction/idempotency/concurrency behavior.
- [ ] Define external side effects and failure behavior.
- [ ] Define migration and data-safety impact.
- [ ] Define positive, negative and adversarial tests.

## During implementation

- [ ] Make the smallest coherent change.
- [ ] Do not weaken security/RLS to make tests pass.
- [ ] Do not create a competing source of truth.
- [ ] Do not silently alter canonical contracts.
- [ ] Keep financial posting immutable.
- [ ] Preserve audit/outbox semantics for material mutations.

## Before closure

- [ ] Run formatter/typecheck/build as applicable.
- [ ] Run positive tests.
- [ ] Run negative/authorization tests.
- [ ] Run tenant-isolation tests where applicable.
- [ ] Test idempotent retry where applicable.
- [ ] Test race/concurrency behavior where applicable.
- [ ] Inspect migration SQL and rollback/forward-fix considerations where applicable.
- [ ] Review changed files for unintended scope.
- [ ] Record exact evidence.
- [ ] Update task/checkpoint state.
- [ ] Commit atomically.

## Closure statuses

Use only: `VERIFIED`, `FAILED`, `BLOCKED`, `NOT EXECUTED`.

Never convert missing evidence into a success claim.
