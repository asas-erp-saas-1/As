# ASAS Branch Artifact Promotion and Retirement Register — 2026-10-16

**Status:** LIVE PROMOTION LEDGER / RETIREMENT PENDING
**Canonical engineering line:** `platform-architecture-2026`
**GitHub default branch:** `platform-architecture-2026` (verified from repository metadata on 2026-10-16)
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


## 7. Additional historical unique-head branches

### 7.1 `feat/foundation-command-registry`

**Source head:** `affab220ff27d51f360061e5d66fa6b4396dd168` (98 commits ahead of the current canonical line at a prior compare; 70 files in that source tree). This is a divergent older architecture corpus, not just another ref name.

The following higher-value safety, integration, and product-research candidates have been preserved with source blob SHA and a historical-candidate warning:

| Source path | Source blob SHA | Preserved destination | Disposition |
|---|---|---|---|
| `docs/architecture/EXTERNAL-INTEGRATION-ECOSYSTEM-STRATEGY.md` | `e69887f78263e8e023360f3eca7440997c007c08` | same path | Proposed integration strategy; research and provider claims must be revalidated |
| `docs/audit/B6-ALGERIA-PAYMENT-PROVIDER-FEASIBILITY.md` | `0047b37e65e9dc2de592871340d57a92eaa58470` | same path | Dated research; no legal/commercial onboarding implied |
| `docs/audit/B6-COMMAND-EVENT-TRANSACTION-MATRIX.md` | `09133700b51229edf5d2086ef24f94bd8e935d26` | same path | Proposed P0 transaction matrix; implementation gated |
| `docs/audit/B6-RESERVATION-HOLD-DEPOSIT-ATOMICITY.md` | `54a857962aa3d85d324525ebcd6c382020f2fba0` | same path | Proposed atomicity contract; canonical state and permission registers remain authoritative |
| `docs/audit/CONCURRENCY-RACE-CATALOG.md` | `bd9e4b7ebe0f5116244c082653fa633ab2d20bff` | same path | Candidate race catalogue; exact mechanism and policy values remain unresolved |
| `docs/audit/FINANCE-CORRECTNESS-CONTRACT.md` | `2f4054f7a5226346bccc8721a5d06b423d256951` | same path | Proposed finance correctness contract; commercial/accounting policy remains open |
| `docs/audit/IDEMPOTENCY-CATALOG.md` | `c5380b1317ff05c36c8b813ea1c1bc41836b9b47` | same path | Proposed idempotency catalogue; source-open derivation/retention rules remain open |
| `docs/audit/OUTBOX-INBOX-CONTRACT.md` | `dabb54be33c16eecd94c69cc21342c5ab6dfa005` | same path | Proposed delivery reliability contract; operational policy needs current review |
| `docs/security/SECURITY-CONTROL-MATRIX.md` | `5e581a8f24ec94ab1d3612c8d1e43ac488de872c` | same path | Design/handoff only; no control implementation implied |
| `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md` | `3915b5a3cbc162047c3a65bb6a43e82157c052a9` | same path | Historical threat-model candidate; reconcile against current threat model |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/USER-PERSONA-AND-SYSTEM-PILLAR-AUTONOMY.md` | `eb10efe84a2dd58be9b35e429efcf84edb372471` | candidate archive | Historical autonomy model; not canonical |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/PRODUCT_TRUTH.md` | `df83568d1b2d27e2f99e1f44d9c8fc82ce82c5e2` | candidate archive | Product-scope evidence only; Issue #10 remains open |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/INTEGRATION-AND-PLUGIN-CONTRACT.md` | `a7607bf774a9234b590ac9dd9d49738512a39c2c` | candidate archive | Candidate integration contract |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/QUALITY-GATES-AND-EVIDENCE-MATRIX.md` | `b6bc13fb4bf25bd16e5e40013009d03e6ec16406` | candidate archive | Candidate quality framework |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/COMPETITIVE_CAPABILITY_BASELINE.md` | `8639ace259cc9ab1b254ec68a7d0050bcdd4eff2` | candidate archive | Dated competitive-research input |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/FOUNDATION-TECHNOLOGY-RESEARCH-2026-09.md` | `00b5cb26a424bac32aaa1146cacd8710ea984147` | candidate archive | Dated technical research; revalidate before use |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/GOLDEN-JOURNEYS-UX-SPEC.md` | `26260b5e0d4742ac267285dbbd9710ccce1ca7f3` | candidate archive | UX/product candidate |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/FIGMA-UX-UI-ENGINEERING-CONTRACT.md` | `9532331e3cec9be3d49f6348b910fbfcc30fe791` | candidate archive | Design-engineering candidate |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/DOMAIN-INVARIANT-CATALOG.md` | `a67d2351c25e85f8221768a388d06846e5819ea7` | candidate archive | Historical invariant catalogue; reconcile with current aggregate register |
| `docs/architecture/reconciliation/candidate-evidence/2026-10-16/command-registry-candidates/P0_DEPENDENCY_VERIFICATION.md` | `04f7237a9aef03d688842ca38f95f679b9e5ddd6` | candidate archive | Dated dependency verification; do not use as current provider proof |

The branch also contains older governance, lifecycle, task, and closure documents, and a one-line `registers/tasks.json` placeholder. The placeholder was deliberately **not** promoted; the current canonical task shards/indexes and source reconciliation controls remain the authority. Older `AGENTS.md`, README, `SESSION_STATE.md`, gate/closure and broad task-packet copies were not promoted because they conflict with or are superseded by the current canonical handoff, PR #26 workflow and PR #27 disposition register.

### 7.2 `foundation/blueprint-register-ingestion` and `foundation/c2-001-traceability-v1`

| Source branch / path | Source blob SHA | Preserved destination | Disposition |
|---|---|---|---|
| `foundation/blueprint-register-ingestion`: `docs/governance/BLUEPRINT-DERIVATION-PROVENANCE.md` | `546b14edee4e04365321e7eefd8e24f28b38fedc` | `source-ingestion-candidates/BLUEPRINT-DERIVATION-PROVENANCE.md` | Candidate provenance procedure |
| `foundation/blueprint-register-ingestion`: `docs/governance/BLUEPRINT-REGISTER-INGESTION-PLAN.md` | `fb3afedfd5ee5070e0a89961976be8c7f9133b38` | `source-ingestion-candidates/BLUEPRINT-REGISTER-INGESTION-PLAN.md` | Candidate ingestion plan |
| `foundation/c2-001-traceability-v1`: `docs/governance/BLUEPRINT-REGISTER-VALIDATION-MATRIX.md` | `7aff25267d2549a390750ec0260f527f5a9564ee` | `source-ingestion-candidates/BLUEPRINT-REGISTER-VALIDATION-MATRIX.md` | Candidate validation matrix |
| `foundation/c2-001-traceability-v1`: `docs/governance/BLUEPRINT-TO-CLAUDE-EXECUTION-CONTRACT.md` | `c0cabdbabe7f738b16b0f167d1468a045eef70a6` | `source-ingestion-candidates/BLUEPRINT-TO-CLAUDE-EXECUTION-CONTRACT.md` | Candidate handoff contract |
| `foundation/c2-001-traceability-v1`: `docs/architecture/C2-001-TRACEABILITY-MATRIX.md` | `ea07d2ec51d24c53aa9cd78754a9ab0488c2c49e` | `context-map-proposal/C2-001-TRACEABILITY-MATRIX.md` | Proposal/evidence only; no context decision implied |

These branches’ older manifest, task index, schema index and phase-P copies were not directly overlaid because the canonical line already has newer source observations and a controlled task source map. Count disagreements remain open.

### 7.3 `foundation/repository-governance` and forensic reconstruction

- `foundation/repository-governance` at `af3a17de9377dbe8310a0bda4372e9d8412fb8ef` has a large divergent set of older repository/governance documents. Its principal operating instructions, branch hygiene, templates, master execution routing and gate/checkpoint documents overlap with the current canonical line and the merged PR #26 workflow. No wholesale merge is recommended; the old branch is classified **SUPERSEDED / NOT REQUIRED AS AN ACTIVE LINE** after checking references.
- `foundation/forensic-repository-reconstruction-2026-09-20` at `c8d3d7e23095ba6e169f1aae9c00b796f878217f` compares as **0 commits ahead / 0 changed files** against the current canonical line; the PR was previously closed. It is a strong ref-retirement candidate after a final SHA/open-reference check.
- The three exact-head duplicate families remain: `2ce6b00536b83615f134998c57e191f51211036f` (17 names), `1a21a311bd27eb0e4c16415a7de6ee1a9e040389` (10 names), and `5c2021eaf5402e6316687b5bd99a6047d40387b9` (4 names). All duplicate-name members have the same tip SHA within their family; earlier Vercel inspection found no nonterminal deployments for the 31 names. Keep one representative per family until a final current-ref check; delete the other 28 redundant names first.

### 7.4 Legacy `main` divergence

- `main` is no longer the default branch; live metadata confirms `platform-architecture-2026` is default.
- Its two C03 controls were promoted by PR #18.
- The divergent `docs/architecture/reconciliation/phase-c/Source/README.md` from `main` (blob SHA `d6cc00adfdf781f0a52b9c5bb0ac559dd9882601`) is preserved at `docs/architecture/reconciliation/candidate-evidence/2026-10-16/main-divergent-source/Source-README-from-main.md`. It remains historical only because the canonical Source Corpus index is fuller and already owns the path.
- `main` has no remaining identified unique accepted content in this ledger, but should only be deleted after the owner’s observation/rollback decision and a last check for workflow/release/deployment dependencies.
