# ASAS — Register Delta Record 2026-10-14

**Status:** PROPOSED — requires register-owner ratification. **No register file has been edited.**
**Branch:** `platform-architecture-2026`
**Resolves:** integrity findings F-07 (event drift) and F-08 (permission coverage)
**Owner:** Security / Tenancy + Lead Architecture
**Related:** `ADR-0038` §11 (event semantics), `ADR-0040` (ownership), `contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` (G-18)

## 1. Purpose and method

Findings F-07 and F-08 showed that contracts referenced events and permissions
that the canonical registers do not contain. Two opposite mistakes are possible:
silently editing the registers to match the contracts, or silently editing the
contracts to match the registers. Both hide the conflict.

This record resolves each gap explicitly and states which side must move. It is a
proposal; the registers are untouched.

## 2. F-07 — event drift: RESOLVED with zero register edits

The canonical event register (`registers/events.json`) is sufficient. The
contract-level names were the divergent side. `ADR-0038` §11 records the full
mapping; the essential result:

| Contract name | Registered expression |
|---|---|
| `ReservationCreated` | `reservation.created` |
| `ReservationCancelled` | `reservation.cancelled` |
| `ReservationReleased` | `hold.released` (pre-deposit) / `apartment.released` (post-deposit) |
| `ReservationExpired` | `hold.expired` (hold) / `reservation.cancelled` with expiry reason after auto-cancel approval (reservation) |
| `ReservationRejected` | not a domain event — `approval.rejected` or a failed command |

**Delta required: none.** The register's structural claim (103 events / 11
emission lanes) remains valid. Contracts must use the registered names.

**Observation carried forward:** the register has no `apartment.cancelled` and no
`hold.converted` event. Neither is invented; consumers observe cancellation
through `reservation.cancelled` / `contract.terminated` plus `apartment.released`,
and conversion through `reservation.created` plus `apartment.reserved`.

## 3. F-08 — permission coverage: delta required

`registers/permissions.csv` contains 50 keys across 8 persona columns. Every Unit
commercial transition in `ADR-0038` must be authorised, but several transitions
have no key. The command/action register §8 forbids inventing permissions, so the
gap is recorded here for ratification rather than applied.

### 3.1 Transitions already covered

| Transition | Existing key |
|---|---|
| Unit creation (`DRAFT`) | `apartment.create` |
| `AVAILABLE → HELD` | `apartment.hold.create` |
| `HELD → RESERVED` | `reservation.create` + `receipt.record` (deposit) |
| `RESERVED → CANCELLED` | `reservation.cancel` |
| Price mutation in any state | `apartment.price.override` |
| Public marketing publication | `apartment.marketing.publish` |
| Structural amendment | `apartment.update` |
| Discount/override approval | `approval.decide`, `offer.discount.request` |

### 3.2 Proposed new keys

Persona values are proposals only. Where an existing key provides a direct
analogue, the analogous mapping is shown; otherwise the mapping is marked
`REQUIRES DESIGN` and must not be treated as decided.

| # | Proposed key | Authorises | Analogue / proposed personas |
|---|---|---|---|
| P-1 | `apartment.publish` | `DRAFT → AVAILABLE` (release to the commercial offering) | Analogue `apartment.create`/`apartment.update`: `sales.manager` BRANCH, `director` ORG, `ceo` ORG. Distinct from `apartment.marketing.publish` (public web) |
| P-2 | `apartment.hold.release` | `HELD → AVAILABLE` (manual release) | Analogue `apartment.hold.create`, scoped to the holder: `field.agent` OWN, `sales.agent` OWN, `sales.manager` BRANCH, `director` ORG, `ceo` YES |
| P-3 | `apartment.block` | `AVAILABLE → BLOCKED` | REQUIRES DESIGN — legal/operational restriction authority |
| P-4 | `apartment.unblock` | `BLOCKED → AVAILABLE` | REQUIRES DESIGN — must not be weaker than P-3 |
| P-5 | `apartment.off_market` | `AVAILABLE → OFF_MARKET` | Analogue `apartment.marketing.publish`: `marketing` ORG, `director` ORG, `ceo` ORG |
| P-6 | `apartment.back_on_market` | `OFF_MARKET → AVAILABLE` | Same as P-5 |
| P-7 | `apartment.release` | `CANCELLED → AVAILABLE` (return to offering after cooling) | Analogue `apartment.update` |
| P-8 | `apartment.mark_sold` | `CONTRACTED → SOLD` (final payment + handover confirmed) | REQUIRES DESIGN — touches Finance; must not be a Sales-only authority |
| P-9 | `contract.sign` | `RESERVED → CONTRACTED` (contract execution) | Analogue `contract.generate` |
| P-10 | `contract.terminate` | `CONTRACTED → CANCELLED` | REQUIRES DESIGN — legal/commercial weight |
| P-11 | `milestone.certify` | construction advancement (`milestone.certified`) | REQUIRES DESIGN — project/milestone scope, not `apartment.*` scope |

Key naming follows the register's `resource.action` convention. Final names must
be confirmed by the register owner; a rename is a delta to this proposal, not a
free choice for implementation.

### 3.3 System-authorised transitions cannot be expressed by the persona matrix

Hold expiry and reservation `PENDING_DEPOSIT` auto-cancel are performed by a
**system principal**, not a persona. The 8-persona matrix has no column for system
authority.

**Delta required (structural):** the permission model must explicitly express
system-principal authority for deterministic expiry/cancellation processing,
including the conditional rules in
`contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md` §4. A persona key for
expiry would be wrong twice over: it would let a human trigger an expiry they are
not authorised to decide, and it would leave the *system* path unauthorised.

### 3.4 Related authority gaps outside the Unit lifecycle

Recorded for completeness; owned by their domains, not by this delta:

| Gap | Domain | Note |
|---|---|---|
| `offer.submit`, `offer.withdraw` | Sales / C05 | `ADR-0023` lifecycle `DRAFT → SUBMITTED → … → WITHDRAWN`; approval covered by `approval.decide` |
| `contract.notarize` | Sales / C05 | Contract machine B.7 `SIGNED → NOTARIZED` |
| `change_order.approve` | Core / project | Reuse `approval.decide` if the change order runs through the Approval Engine; otherwise a distinct key is required |

## 4. Impact on canonical structural claims

`docs/governance/CANONICAL-ARTIFACT-REGISTER.md` records
`registers/permissions.csv` as "VERIFIED structurally — 50 keys / 8 persona
columns".

If this proposal is ratified, that claim must be updated in the same change, and
the new count recorded. Ratifying the delta without updating the structural claim
would make a canonical control false — exactly the drift this record exists to
prevent.

## 5. Authority and ratification path

| Question | Answer |
|---|---|
| Who owns `registers/permissions.csv`? | The permission register is an A2 shadow. `AGENTS.md` lists "tenant/security authority is unclear" as a stop condition, so this delta is **not** agent-decidable. |
| Who ratifies? | Security / Tenancy owner with Lead Architecture; the founder delegation of 2026-09-26 covers product/business questions, and authorization-model changes are security-authority changes. |
| What is required to apply? | (a) ratify the key set and names; (b) resolve the `REQUIRES DESIGN` persona mappings; (c) add the system-authority expression; (d) update the structural claim and count; (e) re-run `scripts/verify-architecture-integrity.sh` and CI. |
| What must not happen? | Editing `registers/permissions.csv` to match the contracts without ratification; creating keys in implementation code that are absent from the register. |

## 6. State until ratification

1. The register remains unchanged and canonical at 50 keys.
2. Every affected transition in
   `docs/architecture/contracts/ASAS-INVENTORY-UNIT-RESERVATION-COMMERCIAL-EDGE-CONTRACT-MATRIX-2026-10-14.md`
   and `docs/architecture/contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md`
   remains marked `PERMISSION-GAP`.
3. Implementation of any affected transition is blocked — a governed transition
   without an authorising key cannot be implemented without violating the
   "every mutation is authorization-gated and deny-by-default" non-negotiable.
4. Finding F-08 remains `OPEN — awaiting owner ratification`; the analysis is
   complete, the authority is not.

## 7. Verification

| Check | Method | Status |
|---|---|---|
| No register file edited by this record | `git diff` shows no change under `registers/` | VERIFIED (no edits) |
| Every proposed key maps to a real transition in ADR-0038 §11 | manual cross-check | VERIFIED |
| Every covered transition cites an existing key present in `registers/permissions.csv` | cross-check against the 50-key file | VERIFIED |
| Structural claim updated on ratification | required at ratification time | NOT_EXECUTED (proposal only) |

