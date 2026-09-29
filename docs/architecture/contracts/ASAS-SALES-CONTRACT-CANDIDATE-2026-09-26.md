# ASAS Sales Contract Candidate

**Status:** CANDIDATE / SEMANTIC / NOT IMPLEMENTATION AUTHORITY
**ADR:** ADR-0036
**Date:** 2026-09-26

## Canonical responsibilities

### Sales owns
- Offer lifecycle and commercial proposal semantics.
- Commercial negotiation/adjustment semantics.
- Hold/Reservation command orchestration at the Sales boundary.
- Contract-readiness handoff.
- Sales milestone facts required by downstream contexts.

### Sales does not own
- Person/Lead identity (CRM).
- Inventory availability truth (Inventory).
- Document storage/signature lifecycle (Documents).
- Payment/receipt/ledger truth (Finance).
- Tenant/authorization kernel (Platform).

## Core actions

`create_offer`
`revise_offer`
`withdraw_offer`
`place_hold`
`release_hold`
`expire_hold`
`create_reservation`
`cancel_reservation`
`release_reservation`
`prepare_contract`
`request_discount_approval`

Actual permission/state/event IDs must be reconciled against canonical registers before implementation.

## Reservation contract invariants

1. One active winning reservation per Unit.
2. Winner is the successful authoritative transaction commit.
3. Application/UI checks are insufficient.
4. Same idempotency key + same command is replay-safe.
5. Same key + conflicting command is rejected deterministically.
6. Expiration/release is conditional on reservation identity/version.
7. Reservation commercial terms are snapshot facts.
8. Unit state consequence and reservation success share the authoritative consistency boundary.
9. Authoritative event emission uses transactional outbox.

## Offer contract invariants

1. Offer is not inventory reservation.
2. Offer references an applicable price version.
3. Accepted/revised terms are auditable.
4. Historical commercial economics are not rewritten.
5. Availability must be revalidated at reservation/commit boundary.

## Brokerage invariant

Listing is not authority to sell. Owner/Mandate relationship must authorize the commercial action.

## Contract handoff payload (conceptual)

- organization/tenant context;
- actor and approval provenance;
- customer/person reference;
- Unit or Listing reference;
- accepted Offer reference/version;
- applicable price version;
- approved adjustments;
- payment/commercial terms;
- reservation reference;
- audit/correlation identifiers;
- required document prerequisites.

Exact API shape is deferred until contract registry and brownfield/runtime reconciliation are complete.
