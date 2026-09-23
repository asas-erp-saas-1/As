# ASAS — Codex Control-Plane Verification

**Artifact ID:** ASAS-AUDIT-CODEX-CONTROL-PLANE-2026-001  
**Status:** REPOSITORY-VERIFIED / RUNTIME VERIFICATION PENDING  
**Date:** 2026-09-23  
**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  

## 1. Objective

Verify that the repository-side Codex-first engineering control plane is coherent, discoverable, internally referenced, and machine-checkable before moving to domain closure.

This artifact verifies repository structure and governance. It does **not** claim that an external Codex runtime has already loaded or executed the skills.

## 2. Repository identity

- Repository: `asas-erp-saas-1/As` — **REPOSITORY VERIFIED**
- Branch: `platform-architecture-2026` — **REPOSITORY VERIFIED**
- Latest observed branch HEAD at this verification: `6a57c46a1f326cc7f3d023911724b36683b7fdb3`

## 3. Codex entrypoint

Canonical entrypoint:

`docs/handoff/CODEX-START-HERE.md`

Root operating contract:

`AGENTS.md`

The repository explicitly defines Codex as the primary ASAS engineering executor and Claude/Figma as specialized design collaboration. The v1.6.1 package is research/provenance input, not implementation authority.

**Status:** SOURCE-VERIFIED / REPOSITORY-VERIFIED

## 4. Registered skill system

The catalog declares nine repository-local skills:

1. `asas-engineering`
2. `asas-repository-forensics`
3. `asas-architecture-governance`
4. `asas-domain-contracts`
5. `asas-database-engineering`
6. `asas-security-ai-safety`
7. `asas-design-fidelity`
8. `asas-testing-verification`
9. `asas-observability-reliability`

Each registered skill has a matching `.agents/skills/<name>/SKILL.md` manifest with matching `name` metadata and a description.

**Status:** REPOSITORY-VERIFIED

## 5. CI enforcement

`.github/workflows/foundation-verify.yml` checks:

- canonical foundation files;
- Codex entrypoint;
- all nine skill manifests;
- skill name/description metadata;
- wrong-project references in executable/configuration surfaces;
- JSON syntax for existing machine-readable artifacts;
- stale current-checkpoint references;
- promoted-shadow inventory;
- explicit foundation status vocabulary.

### First execution result

Workflow run `35837534604` failed at `Verify Codex entrypoint and routing` after the required-file and nine-skill checks had passed.

Root cause: the first routing assertion was too brittle and did not match the actual entrypoint content reliably.

### Corrective execution

The routing assertion was hardened to use explicit file/needle pairs and fixed-string matching, with diagnostic output on failure.

The corrected workflow was committed in `2686e117d70a0aafcb9f03b4d15325c3fbdd36ee`, which exposed a second genuine content omission: `CODEX-START-HERE.md` did not explicitly load the skills catalog even though `AGENTS.md` routed it.

The entrypoint was then corrected to version `1.0.2`, explicitly loading and referencing:

`docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`

### Verified execution

Workflow run `35879311233` on head commit `6a57c46a1f326cc7f3d023911724b36683b7fdb3` completed with **SUCCESS**.

This execution verified:

- all required foundation files;
- all nine skill manifests;
- Codex entrypoint heading and routing references;
- the corrected CI logic itself.

**Status:** TEST-VERIFIED / REPOSITORY-VERIFIED

## 6. Canonical artifact routing

`docs/governance/CANONICAL-ARTIFACT-REGISTER.md` identifies `CODEX-START-HERE.md` and the Codex Skills Catalog as required Codex control-plane resources.

Retained Claude artifacts are classified as specialized design-collaboration resources or historical/provenance material. They do not authorize application/database implementation.

**Status:** SOURCE-VERIFIED

## 7. Findings

### Q0-F01 — Codex-first routing

**Status:** CLOSED at repository governance level.

### Q0-F02 — Foundation CI was still Claude-oriented

**Status:** CORRECTED.

### Q0-F03 — CI routing assertion defect

**Status:** CLOSED.

The initial assertion defect was detected by execution, corrected, re-executed, and passed.

### Q0-F04 — Explicit skills-catalog loading

**Status:** CLOSED at repository routing level.

The entrypoint now explicitly loads and references the canonical skills catalog.

### Q0-F05 — Runtime Codex skill discovery

**Status:** NOT_EXECUTED.

Repository files and CI prove that skills are present and machine-validated. They do not prove that a live Codex session actually discovered, loaded and executed a skill. This remains a separate runtime-evidence item.

## 8. Closure boundary

The **repository control-plane gate is VERIFIED**.

The **Codex runtime execution gate remains NOT_EXECUTED** because no live Codex session evidence is available through this verification surface.

This distinction is intentional and must remain visible.

## 9. Exact next dependency

`Q1 — Building Contract Closure`

Required before schema promotion:

- authoritative home-chapter Building definition;
- aggregate/entity/reference classification;
- relationship cardinality and ownership semantics;
- structural rename/move/archival rules;
- tenant inheritance;
- current repository schema representation;
- verified live database representation when runtime identity is authorized;
- permissions/events/state implications;
- tests/evidence plan;
- canonical contract/register update.

No Building table, Prisma model, migration, endpoint, permission, event or state machine is authorized by this artifact.
