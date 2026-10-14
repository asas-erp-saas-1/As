# C05 — Sales

**Status:** SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Track type:** Engineering Conference domain/platform workstream (not a bounded context)
**Last updated:** 2026-10-14

## Scope (recovered)

Opportunity, Offer, Hold, Reservation, Contract preparation, approvals, discounts, concurrency and attribution.

## Provenance

- docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md §9 — canonical track enumeration
- docs/architecture/amendments/ASAS-ROADMAP-AMENDMENT-010-ENGINEERING-CONFERENCE-PATH-2026-09-25.md — conference sequence
- docs/architecture/reconciliation/ASAS-C-TRACK-PROVENANCE-RECOVERY-2026-10-14.md — recovery record and register corrections

## Canonical artifacts

adr/ADR-0036-SALES-CANONICAL-SEMANTICS-2026-09-26.md; adr/ADR-0034-RESERVATION-CONSISTENCY-BOUNDARY-2026-09-26.md; contracts/ASAS-RESERVATION-CONSISTENCY-CONTRACT-2026.md; contracts/ASAS-HOLD-LIFECYCLE-CONTRACT-2026-10-14.md

## Open questions

Contract execution authority and permission keys (register-delta P-9, P-10).

## Closure state

SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED.

## Rules

- A C-track is an input to the GATE-00…GATE-07 route, never a parallel authorization path.
- Track closure never authorizes implementation by itself.
- No new C numbering may be created; this scope is recovered from repository provenance.

See ../README.md for the common Phase C protocol.
