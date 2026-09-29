# ASAS — GOVERNANCE DRIFT REPAIR 2026-09-26

**Status:** ACTIVE RECONCILIATION FINDING  
**Branch:** `platform-architecture-2026`

## Finding

The current branch contains a known metadata/semantic drift between the latest Engineering Conference checkpoint and older companion documents.

### Conflict A — Scheduling

`docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md` records Scheduling as Core-hosted and the current checkpoint treats current-branch governance as authoritative.

Older companion material in the Roadmap and Source of Truth still contains `FOUNDER-DECISION-REQUIRED` language for Scheduling.

### Disposition

The current Conference Path + current checkpoint are the current decision record for the conference workstream. The older Scheduling statements are retained as historical provenance until a controlled maintenance update edits those documents.

No implementation should derive Scheduling ownership from the stale text.

## Finding B — C03 sequence

Older Roadmap language describes a prior contract-closure order centered on Unit/Reservation, Building, Offer and Finance. The current Conference Path has since closed the C03 semantic sequence through Reservation and now identifies C03.13 Schema Contract as the next dependency, gated by brownfield evidence.

### Disposition

The current checkpoint + Platform Engineering Track + Conference Path control the active sequence. The older roadmap text remains historical until a controlled reconciliation update.

## Finding C — Building evidence

The current checkpoint states that the historical Building contract reference remains unverified. This must not be converted into implementation authority merely because a path is named in an older Source of Truth table.

## Repair rule

Until the companion files are updated in a controlled maintenance pass:

`CURRENT-SESSION-STATE + CONFERENCE-PATH + PLATFORM-ENGINEERING-TRACK + verified repository/runtime evidence`

control active continuation, while stale conflicting statements are classified as `CONFLICT / HISTORICAL` rather than silently averaged.

## Required maintenance pass

Update, with full-file preservation and review:

1. `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`
2. `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
3. `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`

The update must preserve historical provenance and must not delete unique evidence.
