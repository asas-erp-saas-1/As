# ASAS — Architecture Decision Record Register 2026

**Status:** ACTIVE INDEX (A6 organizational control)
**Branch:** `platform-architecture-2026`
**Last reconciled:** 2026-10-14

> Index only. An entry in this register does not upgrade or downgrade an ADR's
> authority. The ADR file itself remains the A1 source of record.

## 1. Why this register exists

ADRs are physically split across two directories and the numbering does not
start at 0001:

- `docs/architecture/decisions/` holds **ADR-0021 … ADR-0034**
- `docs/architecture/adr/` holds **ADR-0035 … ADR-0037**

Multiple artifacts reference ADR-0001, ADR-0005, ADR-0013, ADR-0017 and
ADR-0018, none of which are present in this branch. This register records that
fact rather than papering over it.

## 2. Recorded ADRs

| ADR | Title | Location | Status |
|---|---|---|---|
| ADR-0021 | Scheduling ownership | `decisions/` | see file |
| ADR-0022 | Commission entitlement semantics | `decisions/` | see file |
| ADR-0023 | Offer lifecycle semantics | `decisions/` | see file |
| ADR-0024 | Real Estate resource identity | `decisions/` | ACCEPTED / C03.1–C03.2 |
| ADR-0025 | Project domain semantics | `decisions/` | see file |
| ADR-0026 | Building domain semantics | `decisions/` | see file |
| ADR-0027 | Floor domain semantics | `decisions/` | see file |
| ADR-0028 | Unit domain semantics | `decisions/` | see file |
| ADR-0029 | Listing domain semantics | `decisions/` | see file |
| ADR-0030 | Multi-actor authority semantics | `decisions/` | see file |
| ADR-0031 | Unit state doctrine | `decisions/` | ACCEPTED — semantic slice closed / implementation gated |
| ADR-0032 | Pricing & versioning semantics | `decisions/` | ACCEPTED — semantic slice closed / implementation gated |
| ADR-0033 | Inventory lifecycle semantics | `decisions/` | ACCEPTED — semantic slice closed / implementation gated |
| ADR-0034 | Reservation consistency boundary | `decisions/` | ACCEPTED — semantic closed / implementation gated |
| ADR-0035 | CRM canonical semantics | `adr/` | see file |
| ADR-0036 | Sales canonical semantics | `adr/` | see file |
| ADR-0037 | Finance canonical semantics | `adr/` | see file |
| ADR-0038 | Unit state dimensions and commercial lifecycle | `adr/` | ACCEPTED — reconciliation; implementation gated |
| ADR-0039 | Unit / Apartment canonical identity | `adr/` | ACCEPTED — reconciliation; implementation gated |
| ADR-0040 | Inventory availability ownership and aggregate boundary | `adr/` | ACCEPTED — reconciliation; implementation gated |
| ADR-0041 | Building consistency boundary and aggregate classification | `adr/` | ACCEPTED — reconciliation; implementation gated |

### 2.1 Partial supersessions recorded

| Superseded artifact | Superseded by | Scope |
|---|---|---|
| `decisions/ADR-0028-UNIT-DOMAIN-SEMANTICS-2026-09-26.md` | ADR-0038 | State enum lists only; all other doctrine stands |
| `decisions/ADR-0031-UNIT-STATE-DOCTRINE-2026-09-26.md` | ADR-0038 | Commercial and construction value lists; doctrine stands |
| `decisions/ADR-0033-INVENTORY-LIFECYCLE-SEMANTICS-2026-09-26.md` | ADR-0038 | Six-state list and direct release; semantics stand |
| `contracts/ASAS-UNIT-STATE-CONTRACT-2026.md` | ADR-0038 | State value lists; invariants stand |
| `contracts/ASAS-INVENTORY-LIFECYCLE-CONTRACT-2026.md` | ADR-0038 | State list and release path; rules stand |
| `contracts/ASAS-RESERVATION-STATE-MACHINE-CONTRACT-2026.md` | ADR-0038 §10 | Entire candidate state list (WITHDRAWN); ownership statement stands |

Each superseded artifact carries an in-file supersession pointer, so a reader who
opens it directly is not left with a stale enum.

## 3. Referenced but not present in this branch

| ADR | Referenced by | Recorded meaning | Disposition |
|---|---|---|---|
| ADR-0001 | `docs/architecture/reconciliation/ASAS-CONTEXT-AUTHORITY-RECONCILIATION-2026.md` | Canonical context/module decomposition | Recoverable as provenance at `foundation/reconcile-context-map-v2` (`c5dea573`), PR #6 DRAFT — **not promoted** |
| ADR-0005 | governance/context lineage | unknown | OPEN — provenance not located |
| ADR-0013 | governance/context lineage | unknown | OPEN — provenance not located |
| ADR-0017 | `ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md` §2; `OPEN-CONTRACT-CONFLICTS.md` | Single-winner reservations: protocol + DB constraints (v1.6.1 source package, status `Accepted`) | Source-package ADR — **not** repository authority (see `AGENTS.md`) |
| ADR-0018 | `OPEN-CONTRACT-CONFLICTS.md` C2-001-S | Core-hosted Scheduling submodule | Superseded in effect by FD-002; needs explicit supersession record |

ADR-0002…ADR-0004, ADR-0006…ADR-0012, ADR-0014…ADR-0016 and ADR-0019…ADR-0020
are **absent with no located reference**. The numbering gap is unexplained and is
recorded as finding F-03 in the integrity review.

## 4. Placement rule for new ADRs

1. One logical ADR series. New ADRs are numbered sequentially from **ADR-0038**.
2. New ADR files are written to `docs/architecture/adr/`.
3. `docs/architecture/decisions/` is retained as the historical physical location
   of ADR-0021…0034. Those files are **not relocated** (Closure Matrix §2 rule 13).
4. A relocated or superseded ADR is recorded here with an explicit supersession
   pointer, and its historical file is preserved.
5. Source-package ADRs (e.g. ADR-0017) are never presented as repository
   authority. Their effect must be re-expressed through a repository ADR.

## 5. Verification

This register is checked by `scripts/verify-architecture-integrity.sh`, which
verifies that every ADR file under `docs/architecture/adr/` and
`docs/architecture/decisions/` appears in this register and that no two ADR files
share a number.
