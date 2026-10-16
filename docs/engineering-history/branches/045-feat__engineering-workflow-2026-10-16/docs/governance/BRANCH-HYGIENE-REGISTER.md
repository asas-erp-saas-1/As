# ASAS Branch Hygiene Register

Status: ACTIVE REPOSITORY CONTROL
Repository: `asas-erp-saas-1/As`

## Canonical branches

- `main` — canonical integration branch.
- `foundation/repository-governance` — current foundation-hardening branch.

## Historical branches retained pending controlled cleanup

These branches exist in the repository and are not current implementation bases. They may be retained temporarily for provenance/history:

- `feat/foundation-command-contract-final`
- `feat/foundation-event-permission-command-closure`
- `feat/foundation-platform-identity-gate`
- `feat/phase-1-iam-foundation`

## Redundant branch refs detected

Multiple branch refs point to identical historical commits, including numbered variants of:

- `feat/foundation-command-contract-final-*`
- `feat/foundation-command-contract-pass-*`
- `feat/foundation-command-registry-*`
- `feat/foundation-platform-identity-gate-*`
- temporary refs `x` and `x2`

These refs are repository-hygiene debt. They do not represent independent product work merely because the names differ.

## Cleanup rule

Do not delete a branch solely because it looks old. Before deletion, verify:

1. it is not the base/head of an open PR;
2. it does not contain unique commits absent from retained canonical history;
3. it is not referenced by release/deployment automation;
4. any unique evidence has been preserved in the canonical repository;
5. the branch deletion is recorded.

When the GitHub administrative capability is available, redundant refs should be deleted. No commit object should be rewritten or force-pushed to perform this cleanup.

## Claude rule

Claude must use only `main` plus the task-scoped branch specified by the task graph. Historical branches are evidence only and must not be selected as implementation bases unless a task explicitly names them.
