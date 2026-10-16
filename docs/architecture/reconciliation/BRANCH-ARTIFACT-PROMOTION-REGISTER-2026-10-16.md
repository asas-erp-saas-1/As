# ASAS Branch Artifact Promotion and Retirement Register — 2026-10-16

**Status:** LIVE PROMOTION LEDGER / RETIREMENT PENDING
**Canonical engineering line:** `platform-architecture-2026`
**GitHub default branch:** `platform-architecture-2026` (verified from repository metadata)
**Purpose:** Make non-canonical branch content independent of its source ref before PRs are closed and branches are retired.

> This ledger distinguishes **merged/canonical controls**, **preserved candidate evidence**, **working procedures**, and **deliberately not promoted** changes. A source branch's `ACCEPTED` or `CANONICAL` wording is not independent proof of canonical approval.

## 1. Prior completed promotions

| Source PR / branch | Promoted result | Evidence |
|---|---|---|
| PR #18, `chore/engineering-corpus-index-2026-10-14` | Merged branch/corpus inventory, default-branch migration update, C03 source register + queue, architecture index and CI gate/checkpoint guard | Merge commit `cc37482a0604ef96f78ac7a3df73a65b7fa18435`; Foundation Verify run `38884718327` succeeded on the pre-merge head |
| PR #26, `chore/consolidation-promotion-2026-10-16` | Merged engineering delivery workflow, structural verifier, PR template, source authority ledger, lineage contract, agent protocol, external audit/plan, task source map and source extraction provenance | Merge commit `8041835bffd67a968ca7d76a9eb7b0fa64f3e171`; Foundation Verify run `38885378830` succeeded on exact head `c3a719124134e2736f49512de8a864cecda97650`; Vercel check was success |
| PR #5 | Closed as superseded; only reconciliation report, task source-map and additive source-extraction evidence promoted by PR #26 | Older checkpoint replacement and old schema index were deliberately not copied |
| PR #8 | Closed as superseded; source-authority ledger promoted by PR #26 | Canonical copy: `docs/architecture/SOURCE-AUTHORITY-LEDGER.md` |
| PR #9 | Closed as superseded; non-implementation agent protocol promoted by PR #26 | Canonical copy: `docs/handoff/CLAUDE-AGENT-OPERATING-PROTOCOL.md` |
| PR #12 | Closed as superseded; lineage reconciliation contract promoted by PR #26 | Canonical copy: `docs/architecture/ARCHITECTURE-LINEAGE-RECONCILIATION.md` |
| PR #14 | Closed as superseded; dated audit + integration plan promoted by PR #26 | Canonical copies under `docs/audit/` and `docs/governance/` |
| PR #20 | Closed as superseded; workflow, templates, verifier and routing changes promoted by PR #26 | Canonical workflow checks green on PR #26 head before merge |

## 2. PR #23 — architecture package preserved as candidate evidence, not accepted wholesale

**Source branch/head:** `cline/hp1c6fdq` at `e866cd4aa07c8a89ee146cb9dc83f28db71911fa`  
**Source branch Foundation Verify:** run `38879545899` succeeded, but Vercel was failure on that source head.  
**Disposition:** valuable source material is preserved under `docs/architecture/reconciliation/candidate-evidence/2026-10-16/`. No candidate below is an accepted ADR or implementation authorization.

| Original source path | Source blob SHA | Preserved path | Disposition |
|---|---|---|---|
| `docs/architecture/adr/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md` | `1f8d06a51d62867099fc0ea39a1dbe1f6c061306` | `adr-candidates/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md` | Status downgraded to proposed candidate; references retained for review |
| `docs/architecture/adr/ADR-0039-UNIT-APARTMENT-CANONICAL-IDENTITY-2026-10-14.md` | `346b85345cc2007eef046dc286c1850349070edd` | `adr-candidates/ADR-0039-UNIT-APARTMENT-CANONICAL-IDENTITY-2026-10-14.md` | Proposed candidate; not ratified |
| `docs/architecture/adr/ADR-0040-INVENTORY-AVAILABILITY-OWNERSHIP-2026-10-14.md` | `bad4171b0d7bbe39befaa3cd7dc47457aabd361e` | `adr-candidates/ADR-0040-INVENTORY-AVAILABILITY-OWNERSHIP-2026-10-14.md` | Proposed candidate; not ratified |
| `docs/architecture/adr/ADR-0041-BUILDING-CONSISTENCY-BOUNDARY-2026-10-14.md` | `03cb35e3ba9dba85c4332a6afb6d34e0967edae6` | `adr-candidates/ADR-0041-BUILDING-CONSISTENCY-BOUNDARY-2026-10-14.md` | Proposed candidate; not ratified |
| `docs/architecture/contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` | `b7502a78e64b206efdf52916918224d1aa1301ac` | `contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` | Proposed candidate contract; founder policy values remain open |
| `docs/architecture/contracts/ASAS-INVENTORY-UNIT-RESERVATION-COMMERCIAL-EDGE-CONTRACT-MATRIX-2026-10-14.md` | `ddbc57cb699b56354641b67c18e1648dac36c929` | `contracts/ASAS-INVENTORY-UNIT-RESERVATION-COMMERCIAL-EDGE-CONTRACT-MATRIX-2026-10-14.md` | Proposed candidate matrix; permission, concurrency and independent-review evidence remain open |
| `docs/architecture/reconciliation/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md` | `a7feebd37f63b306e2bd0a5b184020990413fb5b` | `findings/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md` | Preserved as A5 candidate evidence; finding closure labels are not adopted automatically |
| `docs/architecture/reconciliation/ASAS-C-TRACK-DISPOSITION-REGISTER-2026-10-14.md` | `39965846ac6b8a021b81b7c49b497c90a7515653` | `findings/ASAS-C-TRACK-DISPOSITION-REGISTER-2026-10-14.md` | Candidate A6 dispositions; no track is closed by this copy |
| `docs/architecture/reconciliation/ASAS-C-TRACK-PROVENANCE-RECOVERY-2026-10-14.md` | `9e50a2a4a36e40bb5c7c875dc4703c8f8af0fadd` | `findings/ASAS-C-TRACK-PROVENANCE-RECOVERY-2026-10-14.md` | Candidate A5 evidence; must reconcile to canonical track mapping |
| `docs/architecture/reconciliation/ASAS-REGISTER-DELTA-2026-10-14.md` | `6b2ff7dcbd757362042a0f633ce67b6d80b69b96` | `findings/ASAS-REGISTER-DELTA-2026-10-14.md` | Proposed register delta only; no machine-readable register values changed |

**Explicitly not promoted from PR #23:** overlapping workflow hunks (now reconciled through the merged #18/#26 workflow); changes to `CURRENT-SESSION-STATE.md`, Gate Model, Closure Matrix, Domain Track Register and C01–C22 readmes that rely on unratified ADR/status claims; the standalone integrity script because its new ADR register and path expectations need separate reconciliation. The old CI-repair note/patch remains historical because the relevant live Foundation Verify fixes are now merged and passing.

## 3. PR #6 — 15-context/module proposal preserved as evidence only

**Source branch/head:** `foundation/reconcile-context-map-v2` at `c5dea5731b14224c72d2f02423ead54e2433d815`.

| Original source path | Source blob SHA | Preserved path | Disposition |
|---|---|---|---|
| `docs/architecture/C2-001-IMPACT-TRACEABILITY.md` | `26af165a10caf569dd553fa7e212b96065ae48c5` | `context-map-proposal/C2-001-IMPACT-TRACEABILITY.md` | Candidate traceability; not canonical |
| `docs/architecture/CANONICAL-CONTEXT-TO-MODULE-MAP.md` | `cc3ba557cb09ff68df8d05b7a855f9745fea3d2f` | `context-map-proposal/CANONICAL-CONTEXT-TO-MODULE-MAP.md` | Proposal only |
| `docs/decisions/ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md` | `fc85e91a31d14b1236d99cc395726ebb5f4b3472` | `context-map-proposal/ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md` | Proposal only; not accepted |

The proposal is deliberately kept outside active ADR/contract paths because issues #7, #11 and #15 still record the missing approved Domain Model v2 / Context Map v2 and the distinction between bounded contexts and implementation modules. No 15-context decision is made by preservation.

## 4. PR #13 — useful procedures and traceability artifacts

**Source branch/head:** `foundation/repository-file-organization-v1` at `99a0f9481237baf603e463c0e0a9067e7d960ca4`.

### Preserved as candidate evidence

| Original source path | Source blob SHA | Preserved path | Disposition |
|---|---|---|---|
| `docs/architecture/C2-001-EVIDENCE-RECONCILIATION-PACKAGE.md` | `399b27d17eb42af8fa5113450a95e1856ace58f8` | `context-map-proposal/C2-001-EVIDENCE-RECONCILIATION-PACKAGE.md` | Evidence only; does not choose context cardinality |
| `docs/architecture/C2-001-SOURCE-AUTHORITY-MATRIX.md` | `a8bebecf499c576ff787fead3f471f84d5639730` | `context-map-proposal/C2-001-SOURCE-AUTHORITY-MATRIX.md` | Evidence only; one source-recovery claim needs authoritative provenance review |
| `docs/architecture/CONTEXT-MODULE-OWNERSHIP-RECONCILIATION.md` | `024e40403bd053cc6c9a7a0101223d47ce354600` | `context-map-proposal/CONTEXT-MODULE-OWNERSHIP-RECONCILIATION.md` | Candidate working artifact |
| `docs/governance/REPOSITORY-FILE-ORGANIZATION-AND-NAMING-STANDARD.md` | `cf0b46a9efbc97d6ddf2ce77ac6191ed628a2648` | `repository-organization/REPOSITORY-FILE-ORGANIZATION-AND-NAMING-STANDARD.md` | Historical proposal; not a current enforced standard |
| `docs/architecture/ASAS-CANONICAL-ARCHITECTURE-DECISIONS.md` | `2b9b6ba2c28cd4aff850a1bf6950078806ca58ae` | `repository-organization/ASAS-CANONICAL-ARCHITECTURE-DECISIONS.md` | Candidate working index |
| `docs/architecture/ASAS-PLATFORM-MASTER-EXECUTION-BLUEPRINT.md` | `c2d5eecd683fc5db9c17c1be4884dbf1075663ca` | `repository-organization/ASAS-PLATFORM-MASTER-EXECUTION-BLUEPRINT.md` | Candidate source-era execution blueprint; do not substitute for current Master Execution Path |
| `docs/architecture/ASAS-VISION-AUTHORITY-AND-ARBITRATION.md` | `7ee327dced27d3ad02d86386174803c9de51c5e5` | `repository-organization/ASAS-VISION-AUTHORITY-AND-ARBITRATION.md` | Candidate authority proposal, not ratified |
| `docs/governance/FOUNDATION-READINESS-AUTHORITY.md` | `a3da50addf82daac5bc123d4fd5150f70f2604f3` | `repository-organization/FOUNDATION-READINESS-AUTHORITY.md` | Candidate proposal; cannot override current gate/checkpoint model |

### Preserved as working artifacts on known paths

| Path | Source blob SHA | Classification on the canonical line |
|---|---|---|
| `docs/architecture/DOMAIN-OWNERSHIP-AND-TRACEABILITY-CONTRACT.md` | `24fb981cd7c7fa8446fe41f6b0030a76779358b7` | Proposed working contract; pending ADR-0021/C2-001 |
| `docs/architecture/EVENT-OWNERSHIP-TRACEABILITY-WAVE-2.md` | `30ba8b5aad0674e3afb5f21ceed121766316d640` | Proposed working traceability artifact; does not redefine event register |
| `docs/architecture/EVENT-STATE-PERMISSION-TRACEABILITY-MATRIX.md` | `1a7cad265d62ecfccea04ed2938e287ce000cd3b` | Proposed traceability matrix; derived view, not source of record |
| `docs/audit/PLATFORM-IDENTITY-VERIFICATION-CONTRACT.md` | `a673f0fb829eb239ed8259da3f19596d5fe3681f` | Proposed safety procedure; does not establish provider identity |
| `docs/governance/TASK-REGISTER-RECONCILIATION-PROTOCOL.md` | `8a2686f561860adb82f1c21080aa241e76a2c1d6` | Proposed procedure for 114-vs-119 count reconciliation |
| `docs/architecture/STATE-MACHINE-IMPLEMENTATION-CONTRACT.md` | `676e122e551e69b14db1a7de3c30166b1badd7d6` | Proposed implementation contract; no implementation authorization |

**Explicitly not promoted from PR #13:** its divergent full checkpoint, broad replacements to the Canonical Artifact Register, Gate Matrix, Gate Model, Closure Matrix and C-track readmes; dated `main` repository inventory; and large convenience/roadmap documents where the active canonical handoff chain already serves the purpose. These changes are either stale snapshots, duplicate authority, or status changes that require decision-owner review.

## 5. Remaining canonical hard stops

- C2-001: approved Domain Model v2 / Context Map v2 provenance or explicit architecture decision remains unresolved (Issues #7/#11/#15).
- GATE-00: Vercel intended canonical resource and runtime-to-Supabase mapping remain unresolved (Issues #1/#21); do not infer identity from a project display name.
- GATE-03/C03: candidate ADR and contract content is not accepted by this archive and implementation remains gated.
- Branch protection is unverified (Issue #22).
- The selected C03 source queue/register remain open work, not closure evidence.

## 6. Default branch, cleanup, and actual action state

- GitHub live metadata confirms `default_branch: platform-architecture-2026`.
- PR #18 and PR #26 are merged to the canonical branch.
- PRs #5, #8, #9, #12, #14 and #20 were closed as superseded after their useful artifacts were selectively promoted.
- This PR adds candidate preservation so PRs #6/#13/#23 can be dispositioned without relying on their branches as the only home for unique evidence.
- No source branch is called “deleted” here. The connected GitHub interface used for this task exposes branch creation, ref updates, file/PR operations, but no branch-delete action. Physical deletion still requires a delete-capable repository-admin action with a fresh SHA/reference check.
