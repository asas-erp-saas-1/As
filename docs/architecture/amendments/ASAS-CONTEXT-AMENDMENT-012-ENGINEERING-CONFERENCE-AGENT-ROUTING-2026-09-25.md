# Context Prompt Amendment 012 — Engineering Conference Routing

**Date:** 2026-09-25
**Status:** ACTIVE / CANONICAL AMENDMENT
**Parent:** `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md`
**Conference:** `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`

## Mandatory behavior

When continuing ASAS architecture work, load the Engineering Conference Path after the current checkpoint and before selecting the next engineering task.

## Research-first conference loop

`Question → Research → Alternatives → Failure Modes → ASAS Sources → Authority → Decision → Contract/ADR/Register → Verification → Checkpoint`

## Agent authority

- Founder decisions govern product/business choices.
- Architecture agents derive and document engineering conclusions.
- Codex is the primary engineering executor.
- Claude/Figma is the design collaboration specialist.
- No agent may treat v1.6.1 as implementation authority.
- No agent may turn a proposed or inferred concept into a production schema without the applicable gate.

## Organization/collaboration model

Use:

`Organization → Membership → Relationship → Team/Role Scope → Project Assignment → Individual Exception → Resource Authorization`

Do not interpret organization relationships as universal employee access.

## Visibility rule

`Visibility follows responsibility.`

Design and authorization should expose only task-relevant authorized resources. UI filtering is never the sole security control.

## Synchronization obligation

When a conference decision changes architecture semantics, update all affected canonical owners or create an explicit amendment. Do not allow the conference document to become an isolated second source of truth.

## Required session closeout

Report:

1. decisions closed;
2. evidence used;
3. external research used;
4. contracts/registers changed;
5. roadmap/checkpoint changes;
6. unresolved conflicts;
7. blocked gates;
8. founder decisions required;
9. implementation impact;
10. exact next conference checkpoint.
