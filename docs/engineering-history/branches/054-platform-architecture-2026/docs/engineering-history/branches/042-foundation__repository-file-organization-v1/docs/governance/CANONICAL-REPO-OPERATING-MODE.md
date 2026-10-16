# ASAS Canonical Repository Operating Mode

## One repository, one integration truth

`asas-erp-saas-1/As` is the only canonical engineering repository for ASAS.

`main` is the integration source of truth.

All implementation work must be traceable to a task and return through a pull request.

## Work modes

### FOUNDATION
Architecture, contracts, handoff, governance, verification and repository controls. No speculative application code.

### IMPLEMENTATION
Task-scoped application/database work after the applicable gate is green.

### VERIFICATION
Tests, security checks, adversarial checks, evidence, review and correction.

### RECOVERY
Operational fixes under the incident/rollback rules; no bypass of safety controls.

## Branch rules

- `main`: integration only.
- `foundation/*`: foundation hardening and governance.
- `feat/*`: bounded product capability.
- `fix/*`: bounded defect correction.
- `refactor/*`: behavior-preserving structural change.
- `chore/*`: tooling/documentation/CI maintenance.
- `hotfix/*`: exceptional production correction under incident controls.

Branch names must identify one coherent objective. No numbered/final/final-2 branches for the same work.

## Commit rules

Each commit should represent one coherent change and explain intent. Do not use commits as a substitute for task traceability.

## PR rules

Every PR must state task, scope, contracts, tests, risks and evidence. The merge target is normally `main` unless a documented stacked-PR dependency exists.

## Claude rules

Claude starts from the canonical handoff on the current repository ref. It must never select an old branch merely because it contains more code. It must start from the task graph and current integration truth.

Claude may create task-scoped branches automatically when the required gate is closed and the task packet authorizes implementation. It must not create an uncontrolled branch proliferation pattern.

## No hidden state

If a decision is needed to continue, record it as an ADR/decision or reconciliation record. Do not encode important business meaning only in code comments, branch names or conversation history.
