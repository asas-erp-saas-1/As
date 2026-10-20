# ASAS — Foundation Readiness Authority

Status: CANONICAL FOUNDATION GOVERNANCE
Authority: Operational ownership contract; it does not override product/architecture decisions, the v1.6.1 Blueprint, live runtime evidence, or the current session checkpoint.

## Purpose

ASAS accumulated several readiness-oriented documents during foundation hardening. They must not become competing status authorities.

This file establishes the ownership model.

## Single operational readiness authority

The canonical operational readiness document for Claude implementation readiness is:

`docs/handoff/CLAUDE-IMPLEMENTATION-READINESS-MASTER.md`

It owns:

- Claude implementation-readiness criteria;
- autonomy levels and founder decision boundaries;
- implementation gate sequence;
- task-scoped readiness definition;
- database doctrine for implementation tasks;
- stop-line conditions;
- the implementation operating loop.

It does **not** override:

- `docs/handoff/CURRENT-SESSION-STATE.md` for current checkpoint/status;
- `docs/governance/FOUNDATION-GATE-REGISTER.md` for gate status;
- approved ADRs for product/architecture decisions;
- the source Blueprint/package for source-derived requirements;
- live Supabase/Vercel/database evidence for runtime reality.

## Supporting artifacts and ownership

| Artifact | Classification | Owns | Must not own |
|---|---|---|---|
| `docs/handoff/CLAUDE-IMPLEMENTATION-READINESS-MASTER.md` | CANONICAL OPERATIONAL | Claude implementation-readiness model | Current checkpoint or product decisions |
| `docs/governance/FOUNDATION-READINESS-REPORT.md` | DERIVED REPORT | Foundation capability assessment and unresolved evidence needs | Final readiness status outside its report scope |
| `docs/governance/FOUNDATION-HANDOFF-READINESS.md` | DERIVED HANDOFF SUMMARY | Structural handoff summary | Runtime/database readiness or architecture approval |
| `docs/governance/CLAUDE-READY-IMPLEMENTATION-GATE.md` | DERIVED GATE DEFINITION | Repository-ready criterion | Current gate result |
| `docs/governance/FOUNDATION-ENVIRONMENT-STATUS.md` | OPERATIONAL ENVIRONMENT REPORT | Runtime/platform readiness findings | Repository readiness or product architecture |
| `docs/governance/FOUNDATION-PR-BOUNDARY.md` | GOVERNANCE BOUNDARY | Foundation PR scope | Readiness verdict |
| `docs/handoff/IMPLEMENTATION-READINESS-MATRIX.md` | TASK-SCOPED CONTROL | Per-task readiness assessment | Global foundation status |

## Status authority

For any phrase such as `READY`, `NOT READY`, `BLOCKED`, or `VERIFIED`, the reader must identify the scope first:

1. **Current session:** `CURRENT-SESSION-STATE.md`
2. **Foundation gate status:** `FOUNDATION-GATE-REGISTER.md`
3. **Claude implementation model:** `CLAUDE-IMPLEMENTATION-READINESS-MASTER.md`
4. **Task readiness:** task packet + `IMPLEMENTATION-READINESS-MATRIX.md`
5. **Runtime/platform:** current evidence and `FOUNDATION-ENVIRONMENT-STATUS.md`

No supporting readiness document may silently promote itself to a global authority.

## Loading rule

Claude should load `CLAUDE-IMPLEMENTATION-READINESS-MASTER.md` when a task enters implementation-readiness evaluation. Supporting readiness documents are loaded only when their owned subject is relevant.

## Drift rule

If two readiness artifacts disagree:

`STOP → identify scope → identify authority owner → compare evidence → reconcile → update dependent summaries → verify`

Do not solve readiness conflicts by editing whichever document is easiest to change.

## Closure condition

This consolidation is complete only when:

- the canonical readiness owner is recorded;
- supporting documents explicitly have bounded ownership;
- current checkpoint and gate status remain separate;
- no readiness document claims authority outside its scope;
- the context-loading chain points to the canonical owner where implementation-readiness is required.
