# ASAS Blueprint → Claude Execution Contract

Status: CANONICAL FOUNDATION CONTROL
Version: 1.0

## Purpose

This contract defines how the ASAS Enterprise Architecture Blueprint is transformed into implementation-ready context for Claude Code without allowing implementation to become the source of truth.

## Authority chain

Blueprint → canonical registers/contracts → repository governance → task packet → implementation → verification → evidence.

Never reverse this chain. Code must not be used to silently rewrite the Blueprint or a canonical register.

## Pre-implementation boundary

This foundation phase does not authorize application code, database schema creation, migrations, production changes, secrets, external side effects, or destructive operations.

## Required machine-readable shadows

- `registers/tasks.json` — all 114 playbook tasks plus recurring rituals.
- `registers/events.json` — 103 domain events and envelope contract.
- `registers/permissions.csv` — 50 permission keys × 8 personas.
- `registers/state-machines.json` — 11 lifecycle state machines.
- `schema/asas-contracts.prisma` — 59 models + 16 enums + Appendix W indexes.
- `design/design-tokens.json` — compiled design-system tokens.
- `design/component-inventory.md` — 42 component contracts.

If a declared artifact is absent or incomplete, record `PENDING_EXTRACT` or `UNVERIFIED`; never fabricate its contents.

## Required provenance fields

Every generated register or contract must preserve:

- source document/version
- source chapter/appendix/locator
- permanent identifier
- derivation status
- validation status
- generated/verified timestamp
- unresolved conflicts

## Contract reconciliation

Before canonical promotion, validate:

1. permanent IDs are unique;
2. all references resolve;
3. declared counts match extracted records;
4. enum vocabulary is exact where the Blueprint requires exactness;
5. state transitions agree with Appendix B;
6. event names/payload envelopes agree with Appendix C;
7. permission keys/scopes agree with Appendix A;
8. schema relations/indexes/constraints agree with Chapter 39 + Appendix W;
9. task dependencies and acceptance evidence agree with the playbook;
10. provenance exists for every promoted artifact.

## Claude context loading

Claude must load only the context required by the task, using the context-loading map. For every task:

L1 Locate task → L2 Load context → L3 Plan → L4 Verify reality → L5 Contract-first → L6 Prove → L6.5 Converge → L7 Report with evidence.

A task is not implementation-ready merely because a document exists. Its contracts, dependencies, permissions, tenant scope, state transitions, failure semantics, acceptance evidence, and applicable gates must be resolved.

## Escalation

Escalate product behavior, legal interpretation, destructive operations, spending/plan changes, residency decisions, or changes to Non-Negotiables. Engineering ambiguity that can be resolved from authoritative repository/source evidence should be resolved without founder interruption.

## Closure rule

A foundation gate becomes GREEN only when its evidence is reproducible and current. Documentation that merely claims readiness is not evidence.
