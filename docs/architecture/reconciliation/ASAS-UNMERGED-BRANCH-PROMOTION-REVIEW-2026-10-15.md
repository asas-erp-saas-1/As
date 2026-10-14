# ASAS Unmerged-Branch Promotion Review — 2026-10-15

**Artifact class:** A5 evidence / A6 reconciliation aid  
**Repository:** `asas-erp-saas-1/As`  
**Active architecture line:** `platform-architecture-2026`  
**Review branch:** `chore/engineering-corpus-index-2026-10-14`  
**Review date:** 2026-10-15  
**Authorization impact:** None. This review does not close a gate or C-track, ratify a decision, authorize implementation, or make another branch canonical.

> This is a file-level promotion review, not a branch merge recommendation. Git ancestry, path overlap, artifact status, and content-level consistency were checked separately. Branch content is not canonical merely because it is newer or contains more detail.

## 1. Executive disposition

| Source | Observed difference | Disposition |
|---|---|---|
| `main` | Three files were changed on the `main`-only side of the merge base. Two are C03 source-control files absent from the active architecture line; the source-corpus README is an independently divergent version of an existing path. | **Selected documentation-only promotion:** add the C03 queue and source register. **Hold** the README variant; preserve the active-line version. |
| `cline/hp1c6fdq` | 14 commits ahead and 0 behind `platform-architecture-2026`; comparison contains roughly 57 changed paths across decisions, contracts, C-track controls, evidence, and CI tooling. | **Do not merge as a unit.** The semantic ADR/contract bundle merits a dedicated owner review. CI repair remains a separate control-plane change. |
| Current review branch | `docs/architecture/README.md` was created for navigation here, and the same path is independently added with materially different content on `cline/hp1c6fdq`. | Keep one index path. Retain the version based on files present on the active line; reconcile useful candidate material only when its referenced artifacts are promoted or its links clearly label branch-only candidates. |

## 2. `main` — selected C03 source-control promotion

The compare of `platform-architecture-2026` against `main` reports a diverged history: `main` has three commits unique to its side of the merge base, while the architecture line has a much larger independent history. The three paths in the `main`-side file comparison are not all guaranteed to be absent from the architecture line: `docs/architecture/reconciliation/phase-c/Source/README.md` already exists on the active line and its contents differ substantially.

### 2.1 Selected paths added here

| Path | Source ref / source blob | Assessment | Action |
|---|---|---|---|
| `docs/architecture/reconciliation/phase-c/C03/02-SOURCE-RECONCILIATION-QUEUE.md` | `main`, blob `b34dec77273adb5b680d64c0d2ed46ea46bc060b` | Working queue only. Keeps C03 open until source reconciliation, red-team review, and independent closure review; does not claim closure. | Copied as a new file without modifying existing canonical decisions. |
| `docs/architecture/reconciliation/phase-c/Source/C03/00-SOURCE-REGISTER.md` | `main`, blob `8a548b5b0b891a00dba71fe3f6cf159660e9ed7c` | Source/provenance index. Explicitly says it is not a second canonical authority and requires classifying material sources before C03 closure. | Copied as a new file without moving or duplicating the underlying source artifacts. |

The copied text is retained as repository documentation. Git commit ancestry is not grafted or rewritten; the exact source blob SHAs above preserve the provenance trail.

### 2.2 Path deliberately not replaced

`docs/architecture/reconciliation/phase-c/Source/README.md` on the active line is a detailed corpus index (source blob `775132c5cef7f120acd7d7b7a3b4216284cb2f59`, 5,260 characters at review time). The `main`-side version is much shorter (source blob `d6cc00adfdf781f0a52b9c5bb0ac559dd9882601`, 1,231 characters) and represents a different description of the same path. It must not overwrite the active-line index. The new C03 register is linked from the existing index instead.

### 2.3 Why this scope is safe

Both selected files classify themselves as source control / working reconciliation aids; neither alters a contract, ADR, machine-readable register, runtime identity, permission model, or implementation authorization. The C03 queue explicitly requires an independent closure review and says documentation completion alone does not close C03.

## 3. `cline/hp1c6fdq` — grouped review and dispositions

### 3.1 Semantic decision bundle — high value, not yet promoted

Candidate artifacts:
- `docs/architecture/adr/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md`
- `docs/architecture/adr/ADR-0039-UNIT-APARTMENT-CANONICAL-IDENTITY-2026-10-14.md`
- `docs/architecture/adr/ADR-0040-INVENTORY-AVAILABILITY-OWNERSHIP-2026-10-14.md`
- `docs/architecture/adr/ADR-0041-BUILDING-CONSISTENCY-BOUNDARY-2026-10-14.md`
- `docs/architecture/contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md`
- `docs/architecture/contracts/ASAS-INVENTORY-UNIT-RESERVATION-COMMERCIAL-EDGE-CONTRACT-MATRIX-2026-10-14.md`

These documents address real cross-artifact issues: Unit/Apartment identity, commercial-state enums and release paths, availability ownership, Building aggregate boundaries, hold expiry, and the inventory–unit–reservation edge model. Their headers state that implementation remains gated. They are coherent candidates for **a dedicated decision-review PR**, not for blind branch merge.

Required before promotion:
1. Verify the claimed conference/founder delegation and acceptance status against the canonical decision/closure records on the target branch.
2. Reconcile all in-file supersession pointers and internal links with the files actually present on the target branch.
3. Confirm the C03 decision log and closure matrix express the same dispositions as the ADRs.
4. Preserve the unresolved permission boundary: `ASAS-REGISTER-DELTA-2026-10-14.md` correctly says F-08 is still open and that `registers/permissions.csv` must not be edited until Security/Tenancy ratifies the permission changes and the system-principal authority expression.
5. Keep C03 and GATE-01/GATE-02/GATE-03 implementation authorization blocked until their independent evidence requirements are met.

### 3.2 Checkpoint contradiction — blocking promotion of the candidate checkpoint

The candidate `docs/handoff/CURRENT-SESSION-STATE.md` (v3.72) first lists Apartment↔Unit identity, Unit↔Inventory ownership, commercial-status mapping, and hold/reservation expiry as unresolved zero-trust findings. Later in the same file it marks the first three and the hold lifecycle resolved by ADR-0038…0041 and the Hold contract.

That may be stale legacy text rather than a substantive architecture dispute, but it is a same-file state contradiction. Before this checkpoint is promoted, edit the unresolved list to distinguish (a) semantic decisions now recorded in the candidate ADRs from (b) remaining evidence, permission, runtime identity, and independent-review blockers. Do not resolve it by marking C03 closed.

### 3.3 C-track recovery and disposition controls — review individually

Candidate artifacts:
- `ASAS-C-TRACK-PROVENANCE-RECOVERY-2026-10-14.md`
- `ASAS-C-TRACK-DISPOSITION-REGISTER-2026-10-14.md`
- `ASAS-REGISTER-DELTA-2026-10-14.md`
- changed C01–C22 workspace READMEs, closure matrix, domain track register, and Source Corpus index.

The provenance recovery's distinction between “scope recovered” and “track closed” is useful. The disposition register also names outstanding ratifications and does not itself authorize implementation. However, its proposed DEFERRED/FUTURE classifications for some tracks explicitly require governance confirmation. Verify any changed canonical-ish table against the actual controlling checkpoint before promoting those status changes. The changes must not imply a C-track or gate is closed solely because its folder/index exists.

### 3.4 Architecture integrity script and CI repair — separate review

Candidate tooling:
- `scripts/verify-architecture-integrity.sh`
- `docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.md`
- `docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.patch`
- candidate edit to `.github/workflows/foundation-verify.yml` contained in the patch.

The patch replaces a brittle literal arrow-sequence assertion with semantic assertions and adds an integrity-check invocation. It is a plausible control-plane repair, but it must be validated against the actual Constitution, Gate Model, allowed reference gaps, and shell behavior. Do not call CI fixed until the workflow change is applied with proper repository permission and a fresh successful run is recorded. The current PR #18 remains blocked by the existing Foundation Verify assertion and the observed Vercel failure.

### 3.5 Duplicate architecture index path

Both this review branch and `cline/hp1c6fdq` add `docs/architecture/README.md`, but the contents differ materially. The version in this branch is designed around files verifiably present on the active line; the candidate version includes links to ADRs, integrity reports and status records not yet present on that line. Keep one physical index at that path and reconcile only after candidate artifacts are promoted or their branch-only status is explicit.

## 4. Promotion order

1. **Done in this branch:** copy the two C03 source-control files from `main`; link them from the active Source Corpus README; record the provenance and conflict disposition.
2. **Next separate review PR:** semantic ADRs 0038–0041 + Hold contract + edge matrix, with checkpoint contradictions corrected and links/register mappings validated.
3. **Separate control-plane PR:** architecture-integrity script and CI workflow repair; run CI on the resulting head and disposition Vercel status.
4. **Then reconcile** C-track status changes, the Domain Track Register and Closure Matrix against the now-promoted decision records and authorized governance dispositions.
5. **Only after reference/owner reconciliation:** decide whether physical organization changes are justified. No mass move, branch deletion, reset, rebase, or force push is part of this review.

## 5. Explicit non-actions

- No branches or pull requests were deleted, merged, rebased, reset, or force-pushed.
- No machine-readable register, schema, migration, RLS policy, application code, permission key, or platform identity was changed.
- No gate or C-track was closed.
- No implementation is authorized by this review.

## 6. Verification performed

- Compared `main` and `cline/hp1c6fdq` against `platform-architecture-2026` through the GitHub compare API.
- Fetched source-corpus files from both `main` and the active architecture line; confirmed the Source Corpus README path conflict rather than assuming all three `main`-side paths were absent.
- Read the candidate ADR headers, C03 disposition register, provenance recovery, permissions delta, and candidate session checkpoint.
- Kept candidate-branch status assertions explicitly separate from canonical target-branch status.
