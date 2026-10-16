# ASAS Engineering Truth Baseline — 2026-09-27

Status: CANONICAL WORKING BASELINE

## 1. Operating branch decision

The Engineering Conference and Platform Engineering work are operated exclusively on:

`platform-architecture-2026`

No additional working branch is to be created for this conference path.

This document does not silently redefine GitHub's repository default/integration branch. It records the project's explicit operating decision that `platform-architecture-2026` is the sole active engineering work line for this program. Any future change to repository-default semantics requires an explicit governance decision.

## 2. Evidence hierarchy

The project follows the V3 authority chain:

Founder/Product Constitution → Architecture → Contracts → Registers → Repository → Runtime → Evidence.

For existing brownfield reality, live database introspection is authoritative. Documentation must never be changed merely to make it agree with an unverified runtime.

Research follows:

Question → Primary source → Current version/date → Alternative evidence → Decision → ADR/research note → Review date.

## 3. Reviewed corrections

### 3.1 Platform identity

Known repository:
- `asas-erp-saas-1/As`
- active engineering line: `platform-architecture-2026`

Known candidate Supabase project:
- project ref: `oliiumegstqujwexikhr`
- project name: `Asas platform`

Known candidate Vercel project:
- project id: `prj_4yF8PAE1axukJh4fWwbZmBGXRKZB`
- project name: `asas-erp-saasv2`

These identifiers are recorded as candidates/evidence, not as proof of production mapping.

### 3.2 GATE-00 status

`OPEN — EVIDENCE INCOMPLETE`

GATE-00 requires verified GitHub repository, Supabase project, Vercel project, production branch, development project, and environment mapping, plus a technical guard.

The current repository guard correctly fails closed when Vercel identity/environment mapping is not independently verified. No secret values are stored here.

### 3.3 Branch contradiction correction

Older governance describes `main` as the canonical integration branch and the current engineering branch as a task branch. The present project instruction is different: this conference operates only on `platform-architecture-2026`.

Therefore:

- do not create additional conference branches;
- do not silently claim `platform-architecture-2026` is GitHub's default branch unless GitHub configuration independently proves it;
- use `platform-architecture-2026` as the sole active work line for this program;
- treat any mismatch between repository-default configuration and this operating decision as governance debt, not as a reason to invent a second working branch.

### 3.4 Foundation closure correction

The Foundation Closure Checklist is not allowed to be called fully GREEN while F3/F4 remain unchecked. Structural F0–F2 status is not equivalent to implementation authorization.

### 3.5 Canonical artifact correction

The V3 canonical-owner rule remains mandatory:

- architecture → V3 / master specification
- tasks → task register
- events → `registers/events.json`
- permissions → `registers/permissions.csv`
- states → `registers/state-machines.json`
- design tokens → `design/design-tokens.json`
- components → `design/component-inventory.md`
- schema → contract schema plus live DB reality
- readiness → one canonical readiness document
- session state → `CURRENT-SESSION-STATE.md`

Known external audit findings about stale artifact registration and deprecated session-state references remain remediation items until independently verified closed.

## 4. Serial execution policy

The engineering path is intentionally sequential:

1. GATE-00 — Platform identity
2. GATE-01 — Canonical artifacts
3. GATE-02 — Architecture conflict
4. GATE-03 — Database reality
5. GATE-04 — Security baseline
6. GATE-05 — Architecture CI
7. GATE-06 — Repository hygiene
8. GATE-07 — Implementation authorization
9. Return to the Engineering Conference C03–C06 deep closure audit
10. Only then continue the next conference stage.

No later gate is declared closed merely because its work can be done independently. This sequence is the project's current operating discipline.

## 5. Conference decision status

C03–C06 are not treated as implementation-ready merely because ADRs exist.

The reviewed semantic decisions are retained only where supported by canonical project material. Any remaining contract, register, legal, runtime, or invariant gap remains explicitly OPEN/DEFERRED/BLOCKED.

The cross-context golden journey remains:

`Project → Building → Unit → Lead → Visit → Offer → Reservation → Contract → Payment Plan → Payment → Receipt`

with Finance and inventory integrity boundaries preserved.

## 6. Non-negotiable safety rules

- No production destructive migration.
- No financial correction.
- No security bypass.
- No tenant deletion.
- No legal interpretation presented as engineering fact.
- No schema mutation before the required foundation gates.
- No claim of production/runtime identity without evidence.
- No autonomous AI authority escalation.

## 7. Closure standard

A stage is closed only when its decision, contract, canonical ownership, dependencies, invariants, verification method, evidence, and known deferrals are all recorded.

"ADR exists" is not a closure criterion.
