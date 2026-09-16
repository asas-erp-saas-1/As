# ASAS Claude Code Workspace Protocol

## Purpose

Claude Code is treated as an engineering agent operating inside a controlled software-development system. The repository, task packet, contracts, branch, tests and evidence form one execution unit.

## Before editing

1. Confirm repository is `asas-erp-saas-1/As`.
2. Confirm current branch and base commit.
3. Read repository instructions and the applicable handoff documents.
4. Identify the exact task ID and Definition of Done.
5. Load only the authoritative contracts and dependencies required by that task, while checking for conflicts with higher-authority documents.
6. Inspect existing implementation before designing a replacement.
7. If runtime/database/platform identity matters, verify it before mutation.

## During editing

- Make the smallest coherent change that satisfies the task.
- Preserve existing contracts unless the task explicitly authorizes a contract change.
- Do not silently invent business semantics.
- Do not weaken tenant isolation, authorization, auditability, financial invariants, idempotency or concurrency guarantees to make tests pass.
- Keep generated files deterministic and reproducible.
- Keep unrelated cleanup out of the branch.

## Verification

Run the narrowest relevant checks first, then the repository-level checks required by the task. Include negative/adversarial cases for authorization, tenancy, duplication, concurrency, state transitions and external side effects where applicable.

A task is not complete because tests are green alone. Completion requires evidence that the implementation satisfies the task contract and does not violate protected invariants.

## Stop conditions

Stop and report evidence when:

- an authoritative contract is missing or contradictory;
- the task requires an undefined business/legal/financial decision;
- platform or database identity is unverified;
- a migration may be destructive or irreversible;
- tenant isolation cannot be demonstrated;
- duplicate reservations/payments/messages are possible;
- financial postings can become unbalanced;
- external webhook authenticity/replay semantics are undefined;
- the required Definition of Done cannot be proven.

## Completion record

Before opening a PR, record:

- task ID and scope;
- files changed;
- commands/checks executed;
- test results;
- adversarial/negative checks;
- migration/database evidence where applicable;
- security/authorization evidence;
- residual risks;
- commit/branch;
- next dependency or follow-up task.

## Human control

Claude may autonomously choose implementation details within approved contracts. Human approval remains required for protected product meaning, financial/legal semantics, security-boundary changes, irreversible data operations, production mutations and other A2/A3 decisions defined by the project autonomy matrix.
