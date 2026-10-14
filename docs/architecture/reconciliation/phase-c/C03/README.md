# C03 — Real Estate

**Status:** OPEN — ZERO-TRUST DEEP CLOSURE REQUIRED
**Last updated:** 2026-10-14

Canonical C03 workspace. Existing C03 contracts, ADRs, research, persistence trace and deep-closure review remain authoritative where their ownership is established. Do not recreate them; index and reconcile them here.

## Current stage

`C03 → semantic blockers resolved; evidence blockers remain`

**Resolved on 2026-10-14** (see `DECISIONS.md` C03-D09…C03-D16):

| Blocker | Resolution |
|---|---|
| B1 `Apartment ↔ Unit` identity | **CLOSED** — `ADR-0039` adopts identity equivalence |
| B2 Unit ↔ Inventory ownership | **CLOSED** — `ADR-0040`: no separate Inventory entity |
| B3 commercial status ↔ availability | **DISSOLVED** — `ADR-0040`: availability *is* the commercial dimension |
| B4 hold/reservation concurrency | SEMANTIC CLOSED — `ADR-0038` + hold contract (HELD waypoint, deposit trigger, conditional expiry) |
| B5 pricing commitment | SEMANTIC CLOSED — `ADR-0032` unchanged; registered event mapped |
| F-06 state enum / release path | **CLOSED** — `ADR-0038` (nine states, two-hop release) |
| F-07 event drift | **CLOSED** — zero register edits; contract names mapped |

**Still open:** brownfield persistence evidence (C03-O08), permission-register
ratification (C03-O11), founder policy values (C03-O10), Floor semantics
(C03-O07), and the independent-review prerequisite.

The concrete edge artifact is:

`docs/architecture/contracts/ASAS-INVENTORY-UNIT-RESERVATION-COMMERCIAL-EDGE-CONTRACT-MATRIX-2026-10-14.md`

The branch also contains the C03 sequence through artifact 31:

`Project → Building → Floor → Unit → Inventory/Availability/Pricing → Construction/Commercial Readiness → Studio/Publication → Documents/Media → Cross-Domain Red-Team → Source Reconciliation → Adversarial Closure Review → Inventory–Unit–Reservation Contract Reconciliation`

## Current architectural position

- Project→Building→Floor→Unit is canonical real-estate ontology.
- Structural `contains` relationships do not by themselves establish DDD aggregate containment.
- Building has independent identity; Building lifecycle is not inferred from construction milestones.
- Floor lifecycle/aggregate semantics remain open.
- Unit structural identity and aggregate ownership remain open.
- The normative state-machine register establishes `apartment.commercial_status`; exact mapping of `apartment` terminology to canonical Unit terminology remains an explicit reconciliation question.
- Inventory availability is owned by the Real Estate capability boundary and PostgreSQL is authoritative.
- Reservations are owned by Sales and cross the Inventory boundary.
- Pricing belongs conceptually to Real Estate; price commitment/versioning remains open.
- Construction progress does not automatically equal commercial availability.
- Studio/public website is a projection, not inventory authority.
- Documents/media have lifecycle and authorization distinctions from structural entities and ordinary publication content.
- No destructive cascade, lifecycle inheritance or cross-context mutation is authorized from `contains` alone.

## Zero-trust closure findings

C03 is **OPEN / BLOCKED**. The following are load-bearing unresolved contracts:

1. Floor identity/lifecycle and exact ownership semantics.
2. Unit identity and structural mutation semantics.
3. Exact `Apartment ↔ Unit` identity mapping.
4. Inventory entity/state ownership and availability state machine.
5. Relationship between `apartment.commercial_status` and authoritative inventory availability.
6. Reservation/hold concurrency, expiry and idempotency.
7. Pricing version/snapshot/commit semantics.
8. Construction-to-commercial-readiness policy.
9. Studio publication eligibility and projection repair semantics.
10. Document taxonomy, retention and authorization.
11. Final Unit/Inventory aggregate boundary.
12. Brownfield persistence evidence and constraints.
13. Cross-context command/event contracts.

## Review status

`30-INDEPENDENT-CLOSURE-REVIEW-2026-10-04.md` is now correctly classified as an **adversarial closure review**, not an independent review. It correctly reaches BLOCK but cannot satisfy the independent-review requirement.

A genuine independent review remains a closure prerequisite.

## Next concrete work

Build the commercial edge contract matrix for:

```text
AVAILABLE → HELD
HELD → RESERVED
RESERVED → CONTRACTED
RESERVED → CANCELLED / RELEASED
price change during active hold/reservation
structural Unit amendment during active commitment
```

Each edge must define:

`actor → permission → tenant → preconditions → invariant → command → transaction/consistency boundary → concurrency → idempotency → resulting state → event → audit → failure/retry → acceptance evidence`

No schema, ORM, migration, API or production implementation is authorized by C03 documentation alone.
