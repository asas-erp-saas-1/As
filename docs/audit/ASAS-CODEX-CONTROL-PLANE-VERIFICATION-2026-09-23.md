# ASAS — Codex Control-Plane Verification

**Artifact ID:** ASAS-AUDIT-CODEX-CONTROL-PLANE-2026-001  
**Status:** PARTIAL / CI EXECUTION PENDING / RUNTIME VERIFICATION PENDING  
**Date:** 2026-09-23  
**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  

## 1. Objective

Verify that the repository-side Codex-first engineering control plane is coherent, discoverable, internally referenced, and machine-checkable before moving to domain closure.

This artifact verifies repository structure and governance. It does **not** claim that an external Codex runtime has already loaded or executed the skills.

## 2. Repository identity

- Repository: `asas-erp-saas-1/As` — **RUNTIME/REPOSITORY VERIFIED**
- Branch: `platform-architecture-2026` — **REPOSITORY VERIFIED**
- Latest observed branch HEAD: `7678206091014144369ff2ac9beb64d057c11e03`

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

Workflow run `35837534604` on commit `58f6cd464fe5e7a4c8048c0e606186120415f49b` failed at `Verify Codex entrypoint and routing` after the required-file and nine-skill checks had already passed.

Root cause: the first routing assertion searched for a filename string inside the Codex entrypoint rather than validating its actual header/content.

Corrective action: the assertion was changed to validate the entrypoint heading and explicit references to the current skills catalog and the new Codex-first context/roadmap amendments.

The corrected workflow is now at commit `7678206091014144369ff2ac9beb64d057c11e03`. No workflow result exists yet for that commit.

**Status:** PARTIAL / CORRECTIVE CHANGE APPLIED / CI RETEST PENDING

## 6. Canonical artifact routing

`docs/governance/CANONICAL-ARTIFACT-REGISTER.md` now identifies `CODEX-START-HERE.md` and the Codex Skills Catalog as required Codex control-plane resources.

Retained Claude artifacts are classified as specialized design-collaboration resources or historical/provenance material. They do not authorize application/database implementation.

**Status:** SOURCE-VERIFIED

## 7. Findings

### Q0-F01 — Codex-first routing

**Status:** CLOSED at repository governance level.

Evidence:

- `AGENTS.md`
- `docs/handoff/CODEX-START-HERE.md`
- `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`
- canonical artifact register

### Q0-F02 — Foundation CI was still Claude-oriented

**Status:** CORRECTED.

The foundation workflow previously required Claude implementation handoff artifacts even though Codex is now the primary engineering executor. The workflow was updated to require the Codex entrypoint, agent operating model, architecture control plane and skill manifests instead.

Historical/specialized Claude artifacts were not deleted.

### Q0-F03 — CI routing assertion defect

**Status:** CORRECTED / RETEST PENDING.

The first Codex-first workflow run exposed a test defect in the newly added routing assertion. This was a CI defect, not evidence that the Codex control plane itself was invalid.

### Q0-F04 — Runtime Codex skill discovery

**Status:** NOT_EXECUTED.

Repository files prove that skills are present and CI can validate their manifests. They do not prove that a live Codex session actually discovered, loaded and executed a skill. This requires Codex-side execution evidence.

## 8. Closure boundary

Q0 is **repository-control-plane converged but not fully evidence-closed**.

Q1 may be prepared architecturally, but the Q0 gate should not be described as fully VERIFIED until the corrected CI workflow executes successfully and, separately, Codex-side skill discovery is evidenced.

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
