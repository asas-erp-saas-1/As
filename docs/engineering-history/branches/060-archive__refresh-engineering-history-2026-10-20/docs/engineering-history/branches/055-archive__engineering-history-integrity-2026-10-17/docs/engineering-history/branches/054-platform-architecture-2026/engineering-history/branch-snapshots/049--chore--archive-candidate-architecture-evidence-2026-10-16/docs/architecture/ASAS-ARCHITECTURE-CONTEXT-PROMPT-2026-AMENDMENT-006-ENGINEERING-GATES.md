# ASAS Architecture Context Prompt Amendment 006 — Engineering Gates

**Date:** 2026-09-27
**Branch:** `platform-architecture-2026`
**Status:** CANONICAL OPERATING AMENDMENT

## Agent rule

When operating on the ASAS Engineering Conference, treat the canonical gate model as the primary execution route:

`GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07`

Read:

`docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md`

before taking a gate action.

## Current phase

ASAS is **PRE-IMPLEMENTATION / ARCHITECTURE ENGINEERING**.

Do not infer that creation of GitHub/Vercel/Supabase infrastructure means database or application implementation has started.

Canonical platform project:

`Supabase PROJECT_REF = oliiumegstqujwexikhr`

## Gate semantics

- GATE-00: platform identity/control plane.
- GATE-01: architecture authority/canonical baseline.
- GATE-02: domain topology/ontology/context boundaries.
- GATE-03: contracts/invariants/behavior.
- GATE-04: security/tenancy/data-governance architecture.
- GATE-05: experience/integration/operations architecture.
- GATE-06: engineering system, verification and AI-agent governance.
- GATE-07: bounded, slice-specific implementation authorization.

## Prohibited shortcut

Do not pull schema, Prisma, migrations, RLS implementation, feature code or production work forward because a later C-track item exists or because infrastructure is connected.

## Research and agent discipline

For external technical facts, prefer current official sources. Record source date/version and distinguish source fact from ASAS derivation.

Agents must work with explicit role, scope, tools, guardrails, stop conditions and evidence obligations. High-risk or irreversible actions require human control.

## Closure

A gate is GREEN only when its decision, canonical artifact, ownership, dependencies, invariants, verification method, evidence, deferrals and checkpoint are present.
