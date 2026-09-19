# ASAS Repository File Organization & Naming Standard

**Status:** FOUNDATION PROPOSAL — REVIEW BEFORE PROMOTION  
**Scope:** Repository file placement, naming, canonical ownership, consolidation and handoff consistency.  
**Canonical repository:** `asas-erp-saas-1/As`

## 1. Why this exists

The repository has reached the point where adding more governance files without a naming/ownership discipline would create a second problem: too many documents saying similar things, ambiguous current files, and fragile Claude context loading.

This standard therefore separates four concerns:

1. **Placement** — where a concept belongs.
2. **Naming** — how the file is named.
3. **Authority** — which file is allowed to be the source of truth.
4. **Lifecycle** — active, derived, historical, compatibility, or deprecated.

The goal is not to rename files for aesthetics. The goal is to make the repository mechanically understandable to Claude and to humans.

## 2. Existing repository structure confirmed

The current `main` repository already declares these canonical areas:

```text
AGENTS.md
CODEOWNERS
.github/
docs/
  handoff/
  governance/
  architecture/
  product/
  domains/
  contracts/
  decisions/
  research/
  audit/
registers/
schema/
design/
src/              # implementation gate
prisma/             # implementation gate
 tests/             # implementation gate
scripts/            # deterministic tooling
```

This agrees with `REPOSITORY-STRUCTURE-CONTRACT.md` and `REPOSITORY-HANDOFF-MAP.md`. Do not introduce another top-level documentation system without an explicit architecture/governance decision.

## 3. Naming rule

### 3.1 General documentation

Use:

`<SUBJECT>-<PURPOSE>.md`

Examples:

- `REPOSITORY-STRUCTURE-CONTRACT.md`
- `CONTRACT-RECONCILIATION-PROTOCOL.md`
- `FOUNDATION-GATE-REGISTER.md`

Use **uppercase kebab-case** for governance and handoff documents because the existing canonical set already uses this convention.

Do not introduce mixed styles such as:

- `RepositoryStructure.md`
- `repository_structure.md`
- `repo-structure-final.md`
- `repo-structure-v2-new.md`

### 3.2 Machine-readable artifacts

Keep the extension dictated by the consumer:

- `.json` for structured registries
- `.csv` for matrix/tabular registries
- `.prisma` for Prisma contracts
- `.yml/.yaml` for CI/configuration

Machine-readable filenames must be stable identifiers. Do not put dates, versions, `final`, `new`, or personal names in canonical filenames.

### 3.3 Handoff files

Handoff filenames are protocol identifiers and must remain stable because `AGENTS.md` and other loaders reference them directly.

Canonical names:

```text
AGENTS.md

docs/handoff/CLAUDE-START-HERE.md
docs/handoff/CLAUDE-IMPLEMENTATION-BOUNDARY.md
docs/handoff/ASAS-MASTER-EXECUTION-PATH.md
docs/handoff/CURRENT-SESSION-STATE.md
docs/handoff/CLAUDE-CONTEXT-INDEX.md
```

`SESSION_STATE.md` may exist only as explicitly marked historical compatibility material. It must never be presented as the current checkpoint.

### 3.4 Phase documents

Use:

`PHASE-<number>-<SUBJECT>.md`

Example:

`PHASE-11-SCALABILITY-BLUEPRINT.md`

Phase numbers belong in filenames only when the artifact is genuinely phase-specific. Do not encode the phase into reusable contracts.

### 3.5 ADRs

Use:

`NNN-short-decision-slug.md`

Example:

`001-context-boundary-decomposition.md`

The number is sequence identity, not priority.

### 3.6 Research

Use the protocol already defined by the engineering doctrine:

`docs/research/NNN-slug.md`

The document must contain question, facts, source URLs, date, confidence, applicability and explicit UNVERIFIED labels where needed.

## 4. Canonical placement matrix

| Concept | Canonical location |
|---|---|
| Agent root operating contract | `AGENTS.md` |
| Claude startup/resume | `docs/handoff/` |
| Current execution state | `docs/handoff/CURRENT-SESSION-STATE.md` |
| Execution path | `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` |
| Repository governance | `docs/governance/` |
| Architecture | `docs/architecture/` |
| Product/business truth | `docs/product/` |
| Domain/bounded-context contracts | `docs/domains/` |
| Cross-cutting behavioral contracts | `docs/contracts/` |
| Explicit architectural/business decisions | `docs/decisions/` |
| External research | `docs/research/` |
| Audit/evidence | `docs/audit/` |
| Machine-readable executable shadows | `registers/` |
| Database contract | `schema/` |
| Design-system machine artifacts | `design/` |
| Implementation | `src/` |
| DB migrations | `prisma/` |
| Automated tests | `tests/` |
| Deterministic tooling | `scripts/` |

## 5. Canonical-owner rule

One concept gets one canonical owner.

If two files describe the same concept:

1. identify authority;
2. choose one canonical owner;
3. turn the other into a derived index, compatibility pointer, or historical record;
4. update all references;
5. only then delete/rename the duplicate if safe.

Never solve duplication by creating a third summary.

## 6. Current consolidation findings

The current `main` governance area contains several clusters that overlap in purpose. They must be reconciled before any broad rename/delete operation.

### 6.1 Foundation closure cluster

Current files include:

- `FOUNDATION-CLOSURE-PROTOCOL.md`
- `FOUNDATION-CLOSURE-CHECKLIST.md`
- `FOUNDATION-GATE-REGISTER.md`
- `FOUNDATION-GATE-MATRIX.md`
- `FOUNDATION-READINESS-REPORT.md`
- `FOUNDATION-ENVIRONMENT-STATUS.md`
- `FOUNDATION-HANDOFF-READINESS.md`
- `FOUNDATION-SESSION-CLOSURE.md`
- `FOUNDATION-PR-CHECKLIST.md`
- `FOUNDATION-PR-BOUNDARY.md`

These are not automatically duplicates. Their intended roles should be:

- **Protocol** = rules for how a gate closes.
- **Register** = current gate states and evidence references.
- **Matrix** = gate definitions/dependencies.
- **Checklist** = execution checklist for a specific closure activity.
- **Readiness report** = narrative assessment snapshot.
- **Environment status** = repository/runtime status snapshot.
- **Session closure** = durable end-of-session checkpoint.
- **PR boundary/checklist** = PR-specific controls.

If two files contain the same role after reconciliation, consolidate them rather than preserving both.

### 6.2 Claude operating cluster

Current files include:

- `CLAUDE-CONTEXT-LOADING-PROTOCOL.md`
- `CLAUDE-ENGINEERING-OPERATING-MODE.md`
- `CLAUDE-READY-REPOSITORY-CLOSURE.md`
- `CLAUDE-READY-IMPLEMENTATION-GATE.md`
- `CLAUDE-TASK-PACKET-SPEC.md`
- `CLAUDE-TASK-PACKET-TEMPLATE.md`
- `CLAUDE-WORKSPACE-PROTOCOL.md`
- `BLUEPRINT-TO-CLAUDE-EXECUTION-CONTRACT.md`

These should remain separate only if each has a distinct job. The startup loader must never need to read five documents to discover one rule.

### 6.3 Repository identity/structure cluster

Current files include:

- `CANONICAL-REPO-OPERATING-MODE.md`
- `REPOSITORY-HANDOFF-MAP.md`
- `REPOSITORY-STRUCTURE-CONTRACT.md`
- `CANONICAL-ARTIFACT-REGISTER.md`

Recommended ownership:

- `REPOSITORY-STRUCTURE-CONTRACT.md` = placement and directory semantics.
- `REPOSITORY-HANDOFF-MAP.md` = navigation and startup routing.
- `CANONICAL-REPO-OPERATING-MODE.md` = work modes and branch/PR operating model.
- `CANONICAL-ARTIFACT-REGISTER.md` = authoritative artifact inventory.

Do not merge these merely because their subjects are related.

## 7. Mandatory consistency correction

`CLAUDE-CONTEXT-LOADING-PROTOCOL.md` currently refers to `docs/handoff/SESSION_STATE.md`, while `CLAUDE-START-HERE.md` and the canonical artifact register identify `docs/handoff/CURRENT-SESSION-STATE.md` as the sole current checkpoint and explicitly classify `SESSION_STATE.md` as historical compatibility material.

This is a naming/reference defect and must be corrected before Claude handoff is declared clean.

The canonical reference is:

`docs/handoff/CURRENT-SESSION-STATE.md`

## 8. Rename protocol

Renaming a canonical file is a migration, not cosmetic cleanup.

Before renaming:

1. search the entire repository for the old path;
2. classify every reference as active, historical or stale;
3. create the destination file with identical content plus any approved correction;
4. update every active reference in the same change;
5. run foundation verification;
6. preserve a compatibility pointer only if an external consumer still requires it;
7. delete the old file only after references are clean;
8. record the rename in the canonical artifact register.

Never rename handoff artifacts in isolation.

## 9. Prohibited filenames

Do not create canonical files containing:

- `FINAL`
- `FINAL2`
- `NEW`
- `OLD`
- `TEMP`
- `COPY`
- personal names
- dates, unless the date is the identity of an evidence snapshot
- vague names such as `NOTES.md`, `MISC.md`, `TODO.md` when a real owner can be identified

Historical evidence may retain its original filename when changing it would damage provenance.

## 10. Review/rename workflow

The repository cleanup must occur in waves:

### Wave A — inventory
Build a complete path inventory and classify every file as:

`CANONICAL | DERIVED | OPERATIONAL | EVIDENCE | HISTORICAL | COMPATIBILITY | DUPLICATE-CANDIDATE`

### Wave B — references
Search all active references before changing any path.

### Wave C — canonical ownership
Assign exactly one owner per concept.

### Wave D — safe renames/consolidation
Rename or delete only after references and CI checks are prepared.

### Wave E — verification
Run foundation CI and verify that all handoff paths, internal links and loaders resolve.

### Wave F — closure
Update the artifact register, session state and readiness report with exact commit/CI evidence.

## 11. Acceptance criteria for this standard

This standard is considered adopted only when:

- all canonical directories have one declared purpose;
- all mandatory Claude paths resolve;
- no active loader points at the wrong session-state filename;
- every governance artifact has a declared role;
- duplicate concepts have a canonical owner;
- all renamed paths have zero stale active references;
- foundation CI passes;
- the canonical artifact register reflects the resulting state.

Until then, this document is a proposal and does not authorize deletion or mass renaming.
