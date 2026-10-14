# ASAS — Architecture Integrity Review 2026-10-14

**Artifact class:** A5 EVIDENCE (findings record)
**Branch:** `platform-architecture-2026`
**Baseline HEAD at review:** `fdb7e06fdc1818755440cdd72e21ad2b46fd3e48`
**Scope:** architecture corpus organization, reference integrity, duplicate
authority, cross-artifact contradiction, path closure state
**Authorization impact:** none. This record authorizes no implementation.

> This is an evidence record, not a canonical register. It does not close a gate
> or a C-track. Findings are routed to the canonical owner named per finding.

## 0. Method

1. Enumerated the full corpus (`docs/**`, `registers/`, `schema/`, `design/`,
   `config/`, `.github/`, `.agents/`).
2. Extracted every internal path reference of the form
   `(docs|registers|schema|config|design|scripts|.github|.agents|architecture)/….md|json|csv|yml|sh|prisma`
   and resolved it against the working tree.
3. Hashed the corpus to detect duplicate content.
4. Compared stated status across the Gate Model, Closure Matrix, Control Board,
   Source of Truth and the current checkpoint.
5. Reconciled contract/ADR claims against the machine-readable registers
   (`registers/state-machines.json`, `registers/events.json`,
   `registers/permissions.csv`).
6. Located provenance for absent referenced artifacts across all remote branch
   tips.

## 1. Findings summary

| ID | Finding | Severity | Classification | Owner |
|---|---|---|---|---|
| F-01 | A1 authority `ASAS-ARCHITECTURE-V3.md` referenced but absent from all branches | HIGH | OPEN / MISSING CANONICAL SOURCE | Lead Architecture + Founder |
| F-02 | Duplicate Building domain contract at two paths with divergent content | MEDIUM | CONFLICT / DUPLICATE AUTHORITY | Domain Architecture |
| F-03 | ADR series split; ADR-0001–0020 absent with unexplained numbering gap | MEDIUM | OPEN / PROVENANCE GAP | Lead Architecture |
| F-04 | Two amendment lineages with colliding numbers, no global registry | MEDIUM | OPEN / ORGANIZATIONAL | Lead Architecture |
| F-05 | Source of Truth contradicts the checkpoint and itself (skills count, Supabase identity) | HIGH | CONFLICT | Lead Architecture |
| F-06 | State-machine register vs. Unit/Reservation contracts disagree on states and guards | HIGH | **RESOLVED — `ADR-0038`** | Engineering Conference |
| F-07 | Reservation lifecycle events used by contracts are absent from the 103-event register | MEDIUM | **RESOLVED — zero register edits; contract names mapped (`ADR-0038` §11)** | Domain Architecture |
| F-08 | Permission register has no keys for release/expire/unblock/off-market transitions | MEDIUM | OPEN — deltas specified, awaiting owner ratification | Security/Tenancy |
| F-09 | 12 dangling internal references (3 recoverable from unmerged branches) | MEDIUM | OPEN / REFERENCE INTEGRITY | Lead Architecture |
| F-10 | Root `README.md` states the v1.6.1 blueprint is the "specification baseline" | MEDIUM | **RESOLVED — aligned with `AGENTS.md`** | Lead Architecture |
| F-11 | Gate/C-track status disagrees across five canonical-ish artifacts | HIGH | **RESOLVED — statuses reconciled to the checkpoint** | Lead Architecture |
| F-12 | C03 workspace has duplicate sequence numbers; C01 and C07–C22 lacked track indexes | LOW | **RESOLVED — 22 track indexes populated with recovered scope** | Engineering Conference |
| F-13 | Two sibling audit directories (`docs/audit/`, `docs/audits/`) | LOW | OPEN / ORGANIZATIONAL | Lead Architecture |
| F-14 | Root-level `ASAS-*-CONTRACT/REGISTER-2026.md` files bypass `docs/architecture/contracts/` | LOW | OPEN / ORGANIZATIONAL | Lead Architecture |
| F-15 | CI `Foundation Verify` is RED on every recent push; two checks are broken | HIGH | OPEN / CONTROL-PLANE FAILURE | Lead Architecture |
| F-16 | Two canonical registers recorded C01 and C07–C22 as "not recovered"; the provenance was recoverable by content search | HIGH | **RESOLVED — C-track provenance recovery 2026-10-14** | Lead Architecture |
| F-17 | Registers recorded boundary questions as OPEN that accepted ADRs had already resolved | MEDIUM | **RESOLVED — statuses reconciled to their resolving ADRs** | Lead Architecture |

## 2. Findings in detail

### F-01 — Absent A1 architecture authority

`docs/architecture/ASAS-ARCHITECTURE-V3.md` is referenced by at least 11
artifacts, including `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` (class
**A1**), `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md`,
`docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` §2 and §11, and
`.agents/skills/asas-conference-engineering/SKILL.md`.

`docs/architecture/ASAS-CANONICAL-ARCHITECTURE-BASELINE-V3.md` is likewise
referenced by `amendments/ASAS-CANONICAL-ARCHITECTURE-AMENDMENT-013-…` and is
also absent.

**Forensic result:** every remote branch tip was searched. Neither file exists on
any reachable branch. This is not a lost branch; the artifact was never installed
in reachable history.

**Consequence:** the corpus names a single architecture authority (A1) that
cannot be loaded. GATE-01's exit criterion — "one coherent architecture baseline
exists" — cannot be satisfied while the named baseline is absent. The
`ASAS-ARCHITECTURE-V3-ENGINEERING-AMENDMENT-2026-09-27.md` amends a document that
is not in the repository.

**Smallest defensible disposition (not applied unilaterally):** either the
verified V3 baseline is installed by its owner, or the Canonical Artifact
Register demotes the reference to `NOT PRESENT / BLOCKED` and dependent artifacts
stop citing it as loadable authority. This crosses architecture-ownership
authority, so it is owner-assigned / `FOUNDER-DECISION-REQUIRED` rather than
agent-decidable.

### F-02 — Duplicate Building domain contract

Two files carry the same subject with different content and different IDs:

| Path | Artifact ID | Status | Effective date |
|---|---|---|---|
| `docs/architecture/ASAS-BUILDING-DOMAIN-CONTRACT-2026.md` | `ASAS-ARCH-BUILDING-2026-001` | DERIVED DOMAIN CONTRACT — OPEN | 2026-09-20 |
| `docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026.md` | `ASAS-CONTRACT-BUILDING-2026-001` | PROPOSED / OPEN / IMPLEMENTATION BLOCKED | Q1 closure |

The Source of Truth §2 routes the Building domain contract to the `contracts/`
path, which makes that the canonical owner and the root file the earlier derived
artifact.

**Disposition applied:** pointer conversion only. A supersession banner was added
to the root file; its body is preserved verbatim as historical provenance. No
deletion, no rewrite.

### F-03 — ADR numbering and location

See `docs/architecture/ASAS-ADR-REGISTER-2026.md`. Summary: one logical series
split across `decisions/` (0021–0034) and `adr/` (0035–0037); ADR-0001
recoverable from `foundation/reconcile-context-map-v2`; ADR-0017/0018 are
source-package ADRs, not repository authority; 0002–0020 otherwise unexplained.
**Disposition applied:** index created; placement rule recorded; no files moved.

### F-04 — Amendment lineage collisions

See `docs/architecture/README.md` §5. Two physical lineages
(`docs/architecture/` root and `docs/architecture/amendments/`) reuse numbers:
Context Prompt 004 twice, Roadmap 003 twice, Roadmap 005 twice.
**Disposition applied:** inventory recorded; naming rule stated; files preserved.

### F-05 — Source of Truth internal contradiction

Two statements in `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
conflict with the current checkpoint:

1. §2 records "9 registered skills". The repository contains **10** skill
   manifests, and `.github/workflows/foundation-verify.yml` enforces exactly 10.
2. §11 asserts `oliiumegstqujwexikhr` "is the canonical ASAS platform project",
   while `docs/handoff/CURRENT-SESSION-STATE.md` and roadmap amendment 006 record
   Supabase canonical runtime identity as **UNVERIFIED / BLOCKED**.

**Disposition applied:** supersession pointers added at both locations. The
underlying assertions were not rewritten, because runtime identity is an evidence
question for its owner and must not be silently averaged.

### F-06 — State-machine register vs. contract conflict

The most consequential finding for the commercial spine.

| Dimension | Machine-readable register (A2) | Contract/ADR set |
|---|---|---|
| Unit/apartment commercial states | 9: `DRAFT, AVAILABLE, HELD, RESERVED, CONTRACTED, SOLD, BLOCKED, OFF_MARKET, CANCELLED` | 6: `AVAILABLE, HELD, RESERVED, CONTRACTED, SOLD, OFF_MARKET` |
| `HELD → RESERVED` trigger | `deposit.recorded` | ADR-0033/ADR-0034: a reservation wins the single-winner boundary |
| `RESERVED → AVAILABLE` | no direct edge; release runs `RESERVED → CANCELLED → AVAILABLE` | `ASAS-INVENTORY-LIFECYCLE-CONTRACT` permits `RESERVED → AVAILABLE` |
| Reservation states | 7: `DRAFT, PENDING_DEPOSIT, ACTIVE, CONVERTED, CANCELLED, REFUND_PROCESSING, CLOSED` | `ASAS-RESERVATION-STATE-MACHINE-CONTRACT`: `REQUESTED, PENDING_APPROVAL, CONFIRMED, ACTIVE, CANCELLED, EXPIRED, CONVERTED` |

The register carries an explicit normative warning ("Enum values are
character-for-character normative"), and C03-D03 records that
`apartment.commercial_status` "must not be duplicated/renamed without superseding
authority".

**Classification:** `CONFLICT`. Per Closure Matrix §2 rule 6 and SoT §12 a
conflict is never silently averaged. Resolution requires a superseding ADR that
either (a) extends the contract states to the full normative enum, or (b) narrows
the register to the contract subset through an explicit amendment.

**Disposition:** **RESOLVED 2026-10-14 by `ADR-0038`.** The register's enums were
adopted as canonical (nine commercial, six construction, seven reservation
states), the release path was decided two-hop, the mandatory `HELD` waypoint and
the deposit trigger were established, and the divergent contract state lists were
superseded with in-file pointers. No register file was edited, so the resolution
required no canonical-count change. See §5.

### F-07 — Reservation event drift

`ASAS-RESERVATION-CONSISTENCY-CONTRACT-2026.md` lists `ReservationCreated,
ReservationRejected, ReservationReleased, ReservationExpired, ReservationCancelled`
"subject to register reconciliation". The canonical register
(`registers/events.json`, Sales and Inventory groups) contains only
`reservation.created`, `reservation.cancelled`, plus `apartment.reserved`,
`hold.expired`, `hold.released`, `apartment.released`.

**Disposition:** **RESOLVED 2026-10-14.** No event name was invented and no
register edit was needed: the contract-level names were the divergent side.
`ADR-0038` §11 maps every contract name onto a registered event, and the register
delta record confirms the 103-event structural claim still holds.

### F-08 — Permission register coverage

`registers/permissions.csv` contains `reservation.create` and `reservation.cancel`
but no key for reservation release/expiry, hold expiry, `apartment.release`,
`apartment.unblock`, or `apartment.off_market`. Commercial edges that must be
authorized therefore have no register key.

**Disposition:** recorded with an exact proposed delta.
`docs/architecture/reconciliation/ASAS-REGISTER-DELTA-2026-10-14.md` specifies the
required keys (P-1…P-11), the persona analogues where they exist, and a structural
finding the register cannot currently express: **system-principal authority** for
deterministic expiry processing. The register is **not** edited until the
Security/Tenancy owner ratifies, because the command/action register §8 forbids
creating permissions absent from the canonical register and `AGENTS.md` treats
tenant/security authority as a stop condition.

### F-09 — Dangling internal references

12 reference targets do not resolve in the working tree. Provenance located:

| Missing target | Referenced by | Provenance found |
|---|---|---|
| `docs/architecture/SOURCE-AUTHORITY-LEDGER.md` | `reconciliation/ASAS-CONTEXT-AUTHORITY-RECONCILIATION-2026.md` | `foundation/source-authority-ledger-v1` (`52a0c735`), PR #8 DRAFT |
| `docs/architecture/ARCHITECTURE-LINEAGE-RECONCILIATION.md` | same | `foundation/architecture-lineage-reconciliation-v1` (`1a4cd48c`), PR #12 DRAFT |
| `docs/architecture/CANONICAL-CONTEXT-TO-MODULE-MAP.md` | `ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md` + above | `foundation/reconcile-context-map-v2` (`c5dea573`), PR #6 DRAFT |
| `docs/decisions/ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md` | `ASAS-CONTEXT-AUTHORITY-RECONCILIATION-2026.md` | `foundation/reconcile-context-map-v2` (`c5dea573`) |
| `docs/architecture/ASAS-ARCHITECTURE-V3.md` | 11 artifacts | not on any reachable branch (see F-01) |
| `docs/architecture/ASAS-CANONICAL-ARCHITECTURE-BASELINE-V3.md` | amendment-013 | not on any reachable branch |
| `docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026-09-24.md` | `research/ASAS-RESEARCH-RECORD-C03-BUILDING-2026-09-26.md` | filename drift to the `-2026.md` contract |
| `docs/memory/lessons.md`, `docs/skills/INDEX.md` | `governance/C-TRACK-DEEP-CLOSURE-PROTOCOL-2026.md` | not located |
| `docs/reports/t-p.9-exit-trace.md` | `registers/tasks/phase-P.json` | not located |
| `registers/tasks.json` | 6 artifacts | intentionally NOT PRESENT (Canonical Artifact Register) |
| `schema/asas-contracts.prisma` | 22 artifacts | intentionally NOT PRESENT / BLOCKED |

Unmerged-branch content is provenance only. It does **not** become canonical
because it exists (Canonical Artifact Register, canonicality rule 8).

**Disposition applied:** these targets are recorded in
`scripts/verify-architecture-integrity.sh` as an explicit, auditable allowlist so
the check fails on *new* breakage while tracking known gaps.

### F-10 — Root README doctrine statement

`README.md` "Engineering doctrine" states the v1.6.1 blueprint and its handoff
package "are the specification baseline". `AGENTS.md` states the v1.6.1 package
is a research/provenance source and **not** implementation authority, and
`docs/architecture/ASAS-SOURCE-PACKAGE-ROLE-AND-DECISION-2026.md` governs this.

**Disposition:** recorded. The README is a repository front-door document; its
correction belongs to the same authority that owns `AGENTS.md`.

### F-11 — Divergent gate/C-track status across artifacts

| Artifact | GATE-00 | GATE-01 | C01 |
|---|---|---|---|
| Gate Model §9 | OPEN | PENDING | — |
| Closure Matrix §3 | OPEN | IN PROGRESS | — |
| Checkpoint | OPEN / BLOCKED FOR FINAL IDENTITY PROOF | IN PROGRESS / REBASELINED | — |
| Control Board | NOT CLOSED / EXTERNAL ACCESS BLOCKER | not listed | "C01 closed" |
| Domain Track Register | — | — | MAPPING OPEN |

The Control Board additionally states Supabase project `oliiumegstqujwexikhr` is
verified `ACTIVE_HEALTHY`, which amendment 006 and the checkpoint contradict.

**Disposition:** recorded as `CONFLICT`. The checkpoint is the sole active state
(A3) and therefore outranks the older control board for current status; the
control board requires an explicit supersession note rather than silent editing.

### F-12 — C03 sequence collisions and missing track indexes

`docs/architecture/reconciliation/phase-c/C03/` contains two `14-` files and two
`27-` files. `C01` and `C07–C22` contain only a stub `README.md`, while the
Closure Matrix §6 requires each track README to identify status, canonical
artifacts, historical artifacts, open questions, evidence and closure state.

**Disposition:** recorded. Duplicate-numbered files are preserved (renaming would
break references and destroy provenance). Track index enrichment requires
recovered provenance and is assigned to the conference, not guessed here.

### F-13 — Sibling audit directories

`docs/audit/` (5 files, forensic/reconciliation evidence) and `docs/audits/`
(6 files, readiness/gap audits) are distinct siblings. Both are A5. The split is
not documented anywhere.

**Disposition:** recorded in the architecture index directory map.

### F-14 — Root-level contract/register lineage

Files such as `ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md`,
`ASAS-COMMAND-ACTION-CONTRACT-REGISTER-2026.md` and
`ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md` sit at
`docs/architecture/` root while the newer canonical contracts live in
`docs/architecture/contracts/`.

**Disposition:** recorded. No relocation (Closure Matrix §2 rule 13). New
contracts are written to `docs/architecture/contracts/`.

### F-15 — CI control plane is red

**Evidence.** `gh run list` shows `Foundation Verify` failing on
`platform-architecture-2026` for every recorded push, e.g. runs `37168808023`
and `37168783671` (2026-10-04), each terminating with
`Process completed with exit code 1`. The job aborts at the first failing step,
so later failures were masked.

**Root cause 1 — brittle assertion.** The step "Verify single engineering
conference route" asserted the literal string
`GATE-00 → GATE-01 → … → GATE-07` inside the Constitution. The Constitution
declares the route in stage names and maps them to the gate IDs in prose
(line 33: "The first seven stages are `GATE-00` through `GATE-07`"), so the
literal string never existed. Reproduced locally: the grep fails.

**Root cause 2 — over-broad prohibition (latent).** The step "Verify canonical
session state references repository-wide" matched three legitimate references to
the legacy `SESSION_STATE.md`: a procedural *prohibition* in
`.agents/skills/asas-conference-engineering/SKILL.md`, the workflow's own text,
and historical audit evidence in
`docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md`. That step would
also have failed once the earlier step was fixed.

**Fix applied.**

1. The route check now asserts the semantic claim instead of a punctuation form:
   the Constitution must reference the Gate Model, declare `GATE-00` and
   `GATE-07`, and declare the no-parallel-route rule.
2. The session-state prohibition is scoped to the surfaces that actually route
   work (`docs/handoff`, `docs/architecture`, `docs/governance`, `AGENTS.md`,
   `CODEOWNERS`), so historical evidence and procedural prohibitions are
   preserved.
3. A new step runs `scripts/verify-architecture-integrity.sh` (this review's
   F-09/F-12 machine checks).

**No A1 canonical text was edited to make a check pass.** The Constitution was
left unchanged; the check was corrected to match the canonical claim.

**Push blocker.** The GitHub App used by the automation is not permitted to
update workflow files, so the workflow repair cannot be committed to the branch:

```text
refusing to allow a GitHub App to create or update workflow
`.github/workflows/foundation-verify.yml` without `workflows` permission
```

The repair is preserved as a reviewable patch:
`docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.patch`, with apply
instructions in `docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.md`.
`scripts/verify-architecture-integrity.sh` is committed and can be invoked
manually in the meantime.

**Verification status.** With the patch applied locally, all 10 workflow
run-blocks pass (0 failures). Without the patch, 2 steps fail — reproduced
locally, matching the observed CI failure. GitHub-side re-verification is
`NOT_EXECUTED` and requires the owner to apply the patch.

### F-16 — Canonical registers recorded recoverable C-track provenance as unrecovered

`DOMAIN-ENGINEERING-TRACK-REGISTER-2026.md` §4 and
`ENGINEERING-CLOSURE-MATRIX-2026.md` §6 both recorded C01, C07–C14 and C16–C22 as
"Not yet recovered from a single canonical track artifact — MAPPING OPEN", and
`phase-c/Source/README.md` stated that no branch file identified those tracks.

**Root cause.** The search was **filename-based**. The tracks are named in
artifact *content*, not in filenames.

**Recovery.** A content-based search over `docs/**` for `Cnn` tokens located two
independent enumerations: `ASAS-ENGINEERING-CONFERENCE-PATH-2026.md` §9 (all
twenty-two tracks with scope statements) and
`ASAS-ROADMAP-AMENDMENT-010-ENGINEERING-CONFERENCE-PATH-2026-09-25.md` line 33
(the full sequence plus the qualifier "These are workstreams, not bounded
contexts").

**Corrections applied.** C01 → CLOSED; C02 → Organization / Membership /
Relationship (the register had recorded only its inventory/attribution
extension); C11 → ownership CLOSED (Core-hosted, `FD-002`, `ADR-0021`); C07–C14
and C16–C22 → scope recovered. All 21 previously-stub track indexes were
populated with recovered scope, provenance, canonical artifacts, open questions
and closure state.

**What this did not do.** It did not close any track. Eight tracks have scope but
no decision package, and C16–C22 have no closure assessment at all — recorded as
an explicit gap requiring a CLOSED / DEFERRED / REJECTED / BLOCKED disposition.

**Disposition:** RESOLVED for the mapping. Full record:
`docs/architecture/reconciliation/ASAS-C-TRACK-PROVENANCE-RECOVERY-2026-10-14.md`.

### F-17 — Registers recorded already-resolved questions as OPEN

**Finding.** Two canonical reconciliation artifacts carried stale open questions
whose answers already existed in accepted ADRs:

| Artifact | Stale entry | Already resolved by |
|---|---|---|
| Aggregate & Invariant Boundary Register §10 | OI-002 Unit vs Project | `ADR-0040` Decision 4 |
| Aggregate & Invariant Boundary Register §10 | OI-004 Offer ownership | `ADR-0023` |
| Aggregate & Invariant Boundary Register §10 | OI-005 Payment vs PaymentSchedule | `ADR-0037` §2 |
| Aggregate & Invariant Boundary Register §10 | OI-006 Receipt ownership | `ADR-0037` §2 |
| Aggregate & Invariant Boundary Register §10 | OI-007 Building aggregate | `ADR-0041` |
| Aggregate & Invariant Boundary Register §10 | OI-008 Scheduling | `FD-002`; `ADR-0021` |
| Context / Module / Capability Ownership Map §3, §4 | Scheduling = `CONFLICT / FOUNDER DECISION REQUIRED` | `FD-002`; `ADR-0021` |

**Why this matters more than tidiness.** A stale `OPEN` in a canonical register is
not neutral: it invites a future agent to re-open a decided question, and the
register's own rule warns that "an `OPEN` ownership mapping must not be used as if
it were canonical". Stale OPENs are therefore a source of future duplicate
decisions, not merely untidy documentation.

**Disposition:** **RESOLVED.** The aggregate register §10 is now a reconciled
status table citing the resolving authority for each item; OI-001 remains a
deliberate DEFERRED with its ADR trigger. The ownership map records Scheduling as
CLOSED and states explicitly why the remaining capability-owner rows are deferred
to GATE-04 rather than omitted.

**Residual (not a defect):** BLD-03/04/07 (Building cardinality, floor semantics,
unit move) remain genuine product/domain decisions, and the ownership map's items
2–5 remain GATE-04 scope. Both are dispositions with owners, not omissions.

## 3. Findings closed by this review

| Finding | Closure basis | Evidence |
|---|---|---|
| F-02 duplicate authority | pointer conversion applied | root Building contract supersession banner; `contracts/` version is the SoT-routed owner |
| F-03 ADR index gap | index created | `docs/architecture/ASAS-ADR-REGISTER-2026.md` |
| F-04 amendment inventory | inventory created | `docs/architecture/README.md` §5 |
| F-05 stale SoT statements | supersession pointers added | SoT §2 and §11 banners |
| F-09 reference integrity | tracked and machine-checked | `scripts/verify-architecture-integrity.sh` + CI step |
| F-12 C-track README presence | machine-checked | integrity script asserts 22 track READMEs |
| F-13 audit directory split | documented | `docs/architecture/README.md` §3 |
| F-14 root contract lineage | documented + placement rule | `docs/architecture/README.md` §3; ADR register §4 |
| F-15 CI control plane red | root causes identified and repair prepared as a patch | `docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.patch`; local re-execution with the patch passes all 10 steps |
| F-06 state enum / release-path conflict | resolved by a superseding ADR | `docs/architecture/adr/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md`; no register edit |
| F-07 reservation event drift | resolved with zero register edits | `ADR-0038` §11; `docs/architecture/reconciliation/ASAS-REGISTER-DELTA-2026-10-14.md` §2 |
| F-12 C-track index completeness | all 21 stub indexes populated with recovered scope | `docs/architecture/reconciliation/phase-c/C01…C22/README.md` |
| F-16 C-track provenance recorded as unrecovered | mapping recovered and both canonical registers corrected | `docs/architecture/reconciliation/ASAS-C-TRACK-PROVENANCE-RECOVERY-2026-10-14.md` |
| F-10 front-door doctrine statement | aligned with the `AGENTS.md` authority model | `README.md` |
| F-11 cross-artifact status divergence | Control Board supersession notice; Gate Model §9 reconciled; C01 corroborated | `ASAS-PLATFORM-ENGINEERING-CONTROL-BOARD-2026.md`; Gate Model §9 |
| F-17 already-resolved questions recorded as OPEN | both registers reconciled with cited authority | `ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md` §10; `ASAS-CONTEXT-MODULE-OWNERSHIP-MAP-2026.md` §3/§4/§6/§8 |

## 4. Findings remaining open

| Finding | State | Owner | Next action |
|---|---|---|---|
| F-01 absent A1 V3 baseline | OPEN / FOUNDER-DECISION-REQUIRED | Lead Architecture + Founder | install the verified baseline, or demote the register entry |
| F-08 permission coverage | OPEN — analysis complete, authority pending | Security/Tenancy | ratify the deltas and the system-principal authority gap in the register-delta record |

None of these can be closed by this review, and none authorizes implementation.
This review is an **adversarial/authoring-stream review**, not independent
evidence; it does not satisfy the C03 independent-review prerequisite.

## 5. Resolution log — 2026-10-14

Findings F-06 and F-07 were resolved after this review was authored, by decisions
recorded under the founder delegation of 2026-09-26. The resolution deliberately
required **no edit to any register file**, so no canonical structural count
changed and no new authority was created by accident.

| Artifact | Resolves | Nature |
|---|---|---|
| `adr/ADR-0038-UNIT-STATE-DIMENSIONS-AND-COMMERCIAL-LIFECYCLE-2026-10-14.md` | F-06; C03-O09 | Adopts the register's nine commercial and six construction states; decides two-hop release, the mandatory `HELD` waypoint, the `deposit.recorded` trigger, the projection doctrine, and event semantics; withdraws the divergent reservation state list |
| `adr/ADR-0039-UNIT-APARTMENT-CANONICAL-IDENTITY-2026-10-14.md` | C03 blocker B1; C03-O01 | Adopts identity equivalence (`Unit = Apartment`), with `apartment.*` as the source/persistence namespace and an explicit statement that identity is not aggregate absorption |
| `adr/ADR-0040-INVENTORY-AVAILABILITY-OWNERSHIP-2026-10-14.md` | C03 blockers B2 and B3; C03-O02 | Availability *is* the Unit commercial dimension, so B3 dissolves rather than being mapped; no separate Inventory aggregate or entity; ownership table; Unit as aggregate root |
| `contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` | Hold lifecycle gap | Hold identity requirement, creation, conditional expiry (suppressed while a reservation references the Unit), release, conversion, 12 acceptance scenarios |
| `reconciliation/ASAS-REGISTER-DELTA-2026-10-14.md` | F-07 fully; F-08 analysis | F-07 closes with zero register edits; F-08 deltas specified and awaiting Security/Tenancy ratification |
| `contracts/ASAS-INVENTORY-UNIT-RESERVATION-COMMERCIAL-EDGE-CONTRACT-MATRIX-2026-10-14.md` (updated) | — | Re-expressed in the nine canonical states; edges moved off `BLOCKED-ON-F-06` |

Superseded artifacts carry in-file supersession pointers:
`ADR-0028`, `ADR-0031`, `ADR-0033`, `ASAS-UNIT-STATE-CONTRACT-2026.md`,
`ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md`, and
`ASAS-RESERVATION-STATE-MACHINE-CONTRACT-2026.md` (withdrawn).

**Authority basis.** The founder delegation of 2026-09-26 authorises the
Engineering Conference to close open architecture questions that do not require
legal interpretation, destructive production authority or unavailable runtime
evidence. Enum reconciliation, trigger semantics, release-path shape and resource
identity are architecture questions. Policy **values** (hold duration, cooling
length, deposit amounts, approval thresholds) are commercial/product decisions and
were deliberately left `FOUNDER-DECISION-REQUIRED`.

**Not claimed.** These decisions close semantic conflicts. They do not establish
runtime truth, do not authorise implementation, and do not substitute for the
independent review that C03 closure requires.


