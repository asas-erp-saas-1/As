# ASAS — Single Engineering Path Amendment 007

**Status:** CANONICAL AMENDMENT / ACTIVE
**Date:** 2026-09-27
**Branch:** `platform-architecture-2026`

## Purpose

This amendment freezes the corrected interpretation of the ASAS Engineering Conference and prevents older implementation-readiness material from creating a second architecture path.

## Decision

The canonical architecture-engineering route is:

```text
GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07
```

as defined by:

`docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md`

and:

`docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md`

All older documents that use `GATE-00…GATE-07` to describe implementation readiness are downstream and are now interpreted as `IG-00…IG-07`. The implementation-readiness master has been explicitly reclassified accordingly.

## Single active engineering line

The Engineering Conference operates only on:

`platform-architecture-2026`

The repository default `main` is not an alternative Engineering Conference work line. Vercel production branch mapping is a control-plane configuration question, not permission to create a second architecture path.

## C-track rule

C01–C22 are domain/platform conference inputs. They do not form an alternative implementation route. A C-track decision enters the applicable Engineering Conference gate, receives cross-context reconciliation, and reaches implementation only through GATE-07 slice authorization.

## Agent rule

The mandatory architecture-conference agent skill is:

`.agents/skills/asas-conference-engineering/SKILL.md`

Agents must load the single-path constitution, current session, gate model, V3, Source of Truth, Context Prompt and Roadmap before material architecture work. They must identify the first unresolved gate and may not bypass it.

## CI rule

`foundation-verify.yml` now validates the presence of the single-path constitution and conference skill, validates the GATE-00…GATE-07 sequence, and scopes the foundation workflow to the active Engineering Conference line.

## Known legacy material

Historical/readiness artifacts may retain old terminology for provenance. They are not allowed to define the active architecture route. When a legacy document is edited, its gate labels must be migrated to `IG-*` or explicitly marked historical/downstream.

## Verification

The following canonical artifacts were reconciled in this amendment:

- Engineering Conference Constitution;
- Engineering Conference Gate Model;
- Master Execution Path;
- Current Session State;
- Implementation Readiness Master;
- conference agent skill;
- foundation CI workflow.

## Closure rule

This amendment does not close GATE-00. It closes the **route ambiguity**. GATE-00 remains open until its own evidence requirements are satisfied.
