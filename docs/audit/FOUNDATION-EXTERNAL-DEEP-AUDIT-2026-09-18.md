# ASAS — Foundation External Deep Audit — 2026-09-18

**Status:** External review — findings and recommendations for founder/maintainer action, not itself a foundation gate document.
**Repository reviewed:** `asas-erp-saas-1/As`
**Reviewed scope:** repository structure, Git history/branches, docs, registers, schema, design, and CI.
**Purpose in ASAS:** Preserve Claude's independent repository audit as an evidence artifact and feed its findings into the canonical foundation workstream. This file must not silently override canonical governance, product, architecture, or live-runtime evidence.

## 1. Executive Summary

The specification layer is comparatively strong: domain events, state machines, permissions, design system, scalability posture, and task-packet controls show substantial architectural discipline. The main risks are operational/repository integrity risks that must be closed before implementation authorization.

The audit identified: a stale canonical-artifact register; stale Claude context-loading references; an unresolved live database identity gate following a documented near-miss; Git branch hygiene debt; public repository visibility that should be intentional; an unresolved architecture conflict; overlapping readiness documents; missing `.gitignore` and `LICENSE`; and absence of the normative Blueprint v1.6.1 source from the repository.

## 2. Critical Findings

### FEA-01 — Canonical artifact register drift

The audit reports that `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` incorrectly marks five artifacts as NOT PRESENT although they exist:

- `registers/events.json`
- `registers/permissions.csv`
- `registers/state-machines.json`
- `design/design-tokens.json`
- `design/component-inventory.md`

It also reports that `registers/tasks.json` is correctly absent because tasks are sharded under `registers/tasks/`, and `schema/asas-contracts.prisma` is genuinely absent.

**Required action:** reconcile the canonical artifact register against repository reality and add CI coverage preventing future drift.

### FEA-02 — Deprecated session-state references

The audit reports active context-loading documents referencing `docs/handoff/SESSION_STATE.md`, even though that file is historical/deprecated and `CURRENT-SESSION-STATE.md` is the active checkpoint.

**Required action:** replace active references with `CURRENT-SESSION-STATE.md` and use repo-wide CI detection rather than a manually maintained list of files.

### FEA-03 — Live database identity remains unverified

The audit reports a previous near-miss in which Supabase project `asas-web-site`, belonging to the separate repository `Asas-website`, was treated as the database for `As`. The audit states that the actual Supabase project for `As` remains unverified.

**Required action:** keep GATE-00 open until runtime identity is independently verified. Add a technical pre-flight guard based on the verified Supabase project reference before schema-affecting work.

**Safety rule:** documentation must never be treated as sufficient proof of database identity.

### FEA-04 — Git hygiene debt

The audit reports 42 remote branches and recommends mechanical cleanup of branches with zero unique commits, followed by review of divergent branches before deletion. Required branch protection on `main` must be verified/configured by the repository owner where the connected integration cannot prove or modify it.

### FEA-05 — Repository visibility

The audit reports that the repository is currently public and notes that internal documentation already describes it as private. This is a repository-owner decision and must not be silently changed by this evidence import.

**Required action:** explicitly confirm intended visibility before implementation details accumulate further.

### FEA-06 — Architecture conflict

The audit confirms an unresolved conflict between the repository's 9-context operating model and the Master Implementation Specification's 15-module model.

**Required action:** resolve with one recorded ADR and an evidence-backed canonical Context→Module map before database-affecting implementation.

### FEA-07 — Readiness-document duplication

The audit identifies six overlapping readiness documents and notes that `CLAUDE-IMPLEMENTATION-READINESS-MASTER.md` contains valuable orientation material but is absent from the documented context-loading chains.

**Required action:** select one canonical readiness owner, consolidate unique content, convert superseded documents to pointers/history where appropriate, and wire the canonical survivor into all loading chains.

## 3. Independently Verified Positive Findings

The audit reports direct recounts matching declared totals for:

| Register | Declared | Observed | Result |
|---|---:|---:|---|
| `registers/events.json` | 103 events / 11 modules | 103 / 11 | VERIFIED |
| `registers/permissions.csv` | 50 keys × 8 personas | 50 × 8 | VERIFIED |
| `registers/state-machines.json` | 11 machines | 11 | VERIFIED |
| `design/component-inventory.md` | 42 primitives | 42 | VERIFIED |

It also reports no credentials found in full history scanning.

These positive findings are evidence observations; they do not close any foundation gate by themselves.

## 4. Structural Hygiene Findings

The audit reports:

- no `.gitignore` at review time;
- no `LICENSE` at review time;
- the normative Blueprint v1.6.1 source is not stored in the repository;
- the repository should preserve a versioned/redacted source or reference copy where legally and operationally appropriate.

**Required action:** treat these as repository-hardening work items, not as permission to commit secrets or proprietary source without review.

## 5. Architectural Interpretation

The audit's positive assessment does not change ASAS architecture authority. In particular:

- Bounded Contexts must not be inferred from implementation-module count.
- Read models and workers do not automatically own business rules.
- Schema presence does not prove live database state.
- The scalability blueprint's modular-monolith-first posture should not be converted into premature microservices.

## 6. Priority Order Imported Into Foundation Roadmap

1. Reconcile `CANONICAL-ARTIFACT-REGISTER.md`.
2. Eliminate deprecated `SESSION_STATE.md` references and widen CI coverage.
3. Close GATE-00 only with verified Supabase/Vercel identity and a technical guard.
4. Resolve C2-001 through a recorded architecture decision and canonical Context→Module map.
5. Clean Git branch hygiene safely; verify `main` protection.
6. Confirm repository visibility intentionally.
7. Consolidate readiness documentation and context-loading chains.
8. Add `.gitignore` and `LICENSE` as appropriate.
9. Preserve/reconcile Blueprint v1.6.1 provenance.
10. Re-run independent verification and only then reassess implementation authorization.

## 7. Relationship To Existing Governance

This audit is **evidence**, not a replacement for:

- `AGENTS.md`
- canonical registers
- `docs/handoff/CURRENT-SESSION-STATE.md`
- foundation gate documents
- approved product/domain contracts
- verified live-runtime evidence

If this report conflicts with a newer verified source, the conflict must be recorded and reconciled; this report must not be edited to erase historical evidence.

## 8. Closure Standard

A finding is closed only when:

1. the proposed action is implemented or explicitly dispositioned;
2. references and dependents are updated;
3. an independent verification command/evidence exists where applicable;
4. the relevant foundation register/checkpoint is updated;
5. no unresolved blocker remains hidden behind a status label.

## 9. Claude Operating Instruction

Claude must treat this file as an independent audit input. It should extract findings, verify them against current repository state, and create/execute scoped tasks only after checking canonical authority. It must not blindly execute recommendations, especially visibility changes, destructive Git operations, database operations, or source-document imports.

## 10. Imported Source

Source: independent Claude repository review supplied by the project owner on 2026-09-18.

The original review stated that its findings were produced through direct repository inspection including full clone/history review, branch inspection, cross-reference searches, independent register recounts, and secret scanning. Those methodological claims are preserved as attributed statements; current closure still requires fresh verification against the live repository.
