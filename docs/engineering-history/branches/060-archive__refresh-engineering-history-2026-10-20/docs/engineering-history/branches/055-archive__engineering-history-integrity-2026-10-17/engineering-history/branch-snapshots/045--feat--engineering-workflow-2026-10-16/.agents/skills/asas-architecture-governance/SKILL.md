---
name: asas-architecture-governance
description: Maintain ASAS architecture-as-code, ADRs, canonical artifacts, traceability, task authorization and gate discipline without creating duplicate truth.
---

# Architecture Governance

## Canonical control plane

Load `AGENTS.md`, current checkpoint, Source of Truth, Blueprint, Roadmap, Context Prompt, Master Execution Path and affected contracts/registers before material architecture changes.

## Artifact governance

One concept has one canonical owner. Derived artifacts cannot redefine sources. Historical evidence stays historical. The consolidated Source of Truth routes and reconciles; it does not override A1 authority.

## ADR rule

Material architecture decisions record:
`problem → context → evidence → options → decision → rejected alternatives → consequences → owner → status → review trigger → affected artifacts → verification`.

## Traceability

Maintain:
`requirement → decision → context → module → aggregate → invariant → command → permission → event → schema → task → implementation → test → evidence`.

Unresolved nodes remain explicit.

## Gate rule

Allowed states:
`VERIFIED / PARTIAL / BLOCKED / NOT_EXECUTED / OPEN`.

Never use vague readiness words as evidence.

## Architecture-as-code

Prefer machine-checkable rules for canonical paths, version routing, stale references, duplicate authority, event/permission/state/task consistency, schema contracts and dangerous dependencies. Only add checks for commands that actually exist and can produce trustworthy results.
