# ASAS Claude Agent Operating Protocol

Status: FOUNDATION PROTOCOL — NON-IMPLEMENTATION
Version: 1.0

## Purpose

This document defines how Claude Code is expected to operate inside `asas-erp-saas-1/As` before, during, and after implementation. It supplements `AGENTS.md`, the canonical execution path, the foundation gate register, and the open-contract conflict register. It does not replace any higher-authority Blueprint artifact.

## Authority order

1. Approved/source Blueprint package and its explicit appendices/contracts.
2. Canonical repository governance (`AGENTS.md`, execution path, gate register, open conflicts).
3. Canonical derived registers only when their provenance and validation state are GREEN.
4. Implementation code and runtime evidence.
5. Claude inference.

Inference can never override a higher layer. If two authoritative layers conflict, stop at the conflict and record evidence rather than silently choosing.

## Mandatory startup sequence

At the beginning of every new or resumed work session, Claude MUST:

1. Establish the repository root with `pwd`.
2. Read `AGENTS.md`.
3. Read `docs/handoff/CURRENT-SESSION-STATE.md`.
4. Read `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`.
5. Read `docs/governance/OPEN-CONTRACT-CONFLICTS.md`.
6. Read `registers/BLUEPRINT-SOURCE-OBSERVATIONS.json`.
7. Inspect `git status`, current branch, and recent relevant commits.
8. Identify the first unresolved dependency in the checkpoint.
9. Read only the additional source files required for that dependency.
10. Do not begin implementation merely because a task title exists.

## Investigate before claiming

Claude MUST open and inspect relevant files before making claims about repository behavior, architecture, schema, tests, configuration, or existing implementation. It MUST distinguish:

- observed fact;
- source-derived requirement;
- verified runtime evidence;
- derived inference;
- unresolved hypothesis.

A missing artifact is not permission to reconstruct it from memory.

## Source and provenance discipline

Every derived artifact MUST retain enough provenance to answer:

- which source artifact produced it;
- which version/date was used;
- which section/appendix was read;
- what transformation was applied;
- what validation was performed;
- whether the result is canonical, derived, provisional, conflicting, or stale.

Never normalize a count, identifier, relation, permission, event, or state silently.

## Conflict protocol

When a conflict is found:

1. Identify every conflicting source.
2. Capture exact evidence and provenance.
3. Classify the conflict.
4. Determine whether an existing approved artifact resolves it.
5. If not resolved, create or update the appropriate decision record.
6. Trace affected tasks, contracts, schemas, events, permissions, and tests.
7. Keep affected implementation gates BLOCKED.
8. Do not manufacture a compromise value merely to make registers agree.

Current hard blockers include C2-001 and C2-002 as recorded in `OPEN-CONTRACT-CONFLICTS.md`.

## Task execution contract

For every implementation task Claude MUST know:

- task ID;
- objective;
- non-goals;
- authoritative sources;
- bounded context/module;
- aggregate owner;
- tenant/security boundary;
- commands/events affected;
- schema objects affected;
- dependencies;
- allowed files;
- forbidden files/actions;
- acceptance evidence;
- verification commands;
- stop conditions.

If any required contract is unavailable, Claude should investigate source material first. If the missing contract is itself a blocked architectural dependency, Claude must stop rather than invent it.

## Implementation safety

Until the foundation checkpoint authorizes implementation, Claude MUST NOT:

- modify application behavior;
- create or alter database migrations;
- mutate a live database;
- reset/drop tables;
- change production configuration;
- deploy infrastructure;
- force-push;
- rewrite published history;
- bypass verification with `--no-verify` or equivalent.

Reversible local inspection, documentation, validation, and evidence gathering are allowed when they stay inside the active task boundary.

## Coding behavior once implementation is authorized

Claude should implement the smallest complete change that satisfies the contract. Avoid speculative abstractions, unrelated refactors, hypothetical extensibility, and test-specific hardcoding. Tests verify the contract; they do not redefine it.

Before declaring a task complete, Claude MUST run the strongest relevant verification available and record the result. A green test suite does not close a task if architectural, security, provenance, or acceptance evidence remains missing.

## Long-running work and context continuity

For multi-window work, Claude MUST persist durable state in repository files and Git rather than relying on conversational memory. At minimum, update the relevant checkpoint/progress artifact after meaningful milestones. Before context compaction or handoff, leave the repository in a recoverable state with no unexplained uncommitted work.

Claude should complete coherent units of work before switching domains. Independent investigations may run in parallel; dependent operations must remain sequential and must never use guessed parameters.

## Subagent policy

Use subagents when workstreams are genuinely independent, require isolated context, or benefit from specialist review. Do not spawn subagents for trivial single-file edits or sequential work that requires shared state. Every delegated result must be treated as evidence to review, not as unquestioned authority.

## Research protocol

For external technical research:

1. Define the decision/question.
2. Prefer primary/official documentation.
3. Verify important claims across relevant authoritative sources.
4. Record source URLs and date/version where material.
5. Separate researched facts from project-specific inference.
6. Do not replace an ASAS source contract with generic industry advice.

## Self-check before completion

Claude MUST ask itself:

- Did I read the relevant source before changing anything?
- Did I stay inside the task boundary?
- Did I preserve provenance?
- Did I introduce any unverified assumption?
- Did I alter a higher-authority contract to fit implementation?
- Did I verify security/tenant boundaries?
- Did I run the strongest relevant tests/checks?
- Did I leave evidence another engineer can reproduce?
- Did I update the checkpoint if the continuation point changed?

## Completion definition

A task is complete only when:

`Contract → Implementation → Verification → Evidence → Traceability → Checkpoint`

is complete for that task and all required gates are GREEN.

A commit or passing test alone is never sufficient evidence of architectural completion.

## External operating guidance

This protocol is also informed by current Anthropic guidance for agentic coding: explicit task/context instructions, investigating code before making claims, structured durable state for long-running work, deliberate subagent use, verification/self-checking, and caution around destructive or shared-system actions.

Reference: https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/prompt-templates-and-variables

## Current project gate

This protocol does not unlock implementation. The current canonical checkpoint remains the source of truth for authorization. In particular, C2-001, C2-002, task-register reconciliation, and schema-contract reconciliation remain unresolved until their stated closure criteria are satisfied.
