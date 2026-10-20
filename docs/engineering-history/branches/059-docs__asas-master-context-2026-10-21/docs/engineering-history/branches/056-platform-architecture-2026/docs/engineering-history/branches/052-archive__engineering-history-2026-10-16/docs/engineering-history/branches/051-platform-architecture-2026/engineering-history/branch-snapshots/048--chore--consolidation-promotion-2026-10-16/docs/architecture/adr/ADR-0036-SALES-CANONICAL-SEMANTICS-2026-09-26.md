# ADR-0036 — Sales Canonical Semantics

**Date:** 2026-09-26  
**Status:** ACCEPTED / SEMANTIC / IMPLEMENTATION BLOCKED  
**Context:** C05 Engineering Conference  
**Branch:** `platform-architecture-2026`

## Decision summary

Sales is the commercial transaction context coordinating the path from qualified CRM intent through Offer, Hold/Reservation and contract handoff. It does not own Person/Lead identity, inventory availability truth, legal document storage/signature authority, or financial ledger truth.

## 1. Opportunity

**Decision:** No independent Opportunity aggregate is required for the initial ASAS canonical model.

The CRM Lead remains the commercial engagement anchor through the early funnel. An Opportunity may exist as a semantic projection/read-model when the business needs opportunity-specific reporting, but it is not a second authoritative customer/deal lifecycle unless a future ADR proves an independent transactional boundary, ownership, authorization model and invariants.

**Reason:** creating a second aggregate solely to reproduce a pipeline stage would duplicate authority and conflict with the V3 contract-first/modular-monolith model.

## 2. Offer

**Decision:** Offer is Sales-owned and is a versioned, time-bounded commercial proposal.

An Offer references the target commercial resource (Unit for development or Listing for brokerage), customer/lead context, applicable price version, commercial adjustments, payment-plan/commercial terms, validity, actor and audit provenance.

Offer history is immutable as a business fact. A changed proposal creates a new version/revision rather than rewriting the economics of an already accepted offer.

An Offer does not itself reserve inventory.

An Offer may be created while inventory is available at the time of authoring, but **acceptance cannot bypass the authoritative availability/reservation boundary**.

## 3. Hold

**Decision:** Hold is a temporary inventory-control state and is distinct from Reservation.

Hold creation/release/expiration is an authorized domain action. Hold TTL and exception policy belong to the state/permission/workflow registers and are not encoded as arbitrary UI behavior.

A Hold may block the applicable commercial availability projection, but it does not create a legal or financial sale commitment by itself.

## 4. Reservation

**Decision:** Reservation is the critical commercial consistency boundary for a development Unit.

The invariant is:

> At most one active winning Reservation may exist for a Unit at any instant under the canonical policy.

The authoritative winner is the successful transaction commit. UI order, request timestamp, cache order, analytics order and client-side state are not authoritative.

Reservation requires database-enforced single-winner integrity, conditional state transition, idempotency, expiration/version safety, audit and transactional outbox. The concrete PostgreSQL strategy remains implementation-gated pending brownfield reconciliation.

## 5. Reservation preconditions

A Reservation command must establish, within the authoritative transaction boundary or a formally coordinated consistency mechanism:

1. authorized actor and tenant/organization scope;
2. target resource is eligible;
3. commercial state permits reservation;
4. required offer/hold conditions are satisfied by policy;
5. applicable price/commercial terms are captured;
6. customer identity is established sufficiently for the transaction policy;
7. idempotency key is valid and scoped;
8. no competing active winner has committed.

The exact required customer/KYC/document prerequisites are deferred to the country/legal/contract policy registers where applicable.

## 6. Reservation lifecycle separation

The following are distinct transitions and must not be collapsed:

`Offer expiry ≠ Hold expiry ≠ Reservation cancellation ≠ Contract termination`

Each must have its own authorized action, state transition, audit record and downstream event semantics.

A stale expiration/release worker cannot release a newer reservation because release is conditional on reservation identity/version.

## 7. Contract handoff

Sales owns commercial readiness; Documents owns document artifacts and document lifecycle; Finance owns monetary obligations and ledger facts.

A Reservation becomes contract-ready only when the applicable Sales policy and required approvals/documents are satisfied. The contract package must carry the commercial terms required to reproduce the transaction milestone, including the applicable price/version and approved adjustments.

Sales does not become the owner of the ledger or document store merely because it initiates the handoff.

## 8. Discount and approval

Discounts and overrides are explicit adjustments to a base commercial price version. They never mutate historical base-price authority.

Approval thresholds are policy data and must be represented by the permission/workflow registers rather than hard-coded UI conditions. The policy must be resource/project/organization aware where the governing authorization model requires it.

AI may recommend or draft an override; AI may not execute an approval that requires a human approval tier.

## 9. Brokerage boundary

For brokerage transactions, Sales must establish Owner/Mandate authority before treating a Listing as commercially actionable. A Listing does not itself grant authority to sell.

If a Mandate expires or is revoked, future commercial actions must fail or enter the policy-defined blocked state; historical transactions and audit facts remain immutable.

The brokerage path must not inherit developer-only legal assumptions.

## 10. Attribution and Finance handoff

Commercial attribution remains distinct from Lead source and operational assignment.

Sales emits the milestone facts required by Finance to determine commission entitlement. Finance remains authoritative for entitlement calculation, policy versioning, accounting and payout.

Historical attribution snapshots are not rewritten by later assignment changes.

## 11. Event boundary

Authoritative Sales events are business facts emitted from committed domain state. UI notifications, search updates and analytics projections are consumers, not competing authorities.

Reservation success and the associated Unit commercial-state consequence must be committed atomically within the selected consistency boundary, with the outbox event emitted from the committed transaction.

## 12. Legal boundary — Algeria

For developer transactions involving property under construction, executable legal rules must be derived from the current Algerian legal/country-pack authority, not inferred from the generic Sales model. Law 11-04 contains specific rules for reservation and sale-on-plan contracts, including who may conclude them and required contractual information. Therefore the platform model deliberately separates semantic Sales decisions from legal contract execution.

Brokerage/resale transactions remain a separate legal/commercial track.

## 13. Deferred items

The following are intentionally **DEFERRED / POLICY-REGISTER DEPENDENT**, not silently unresolved:

- exact Hold TTL;
- exact discount thresholds;
- exact approval persona mapping;
- exact KYC/document prerequisites;
- exact event IDs;
- exact permission IDs;
- exact state-machine IDs;
- exact database constraint/index/isolation implementation;
- exact country-specific contract wording.

These require reconciliation with canonical registers, country pack and live brownfield evidence before implementation.

## 14. Rejected alternatives

- Separate universal `Deal` aggregate for CRM/Sales: rejected as duplicate authority without proven independent boundary.
- Offer as an inventory lock: rejected; Offer and Reservation have different consistency semantics.
- UI-only availability check before reservation: rejected.
- Client timestamp as reservation winner: rejected.
- Direct mutation of Unit status: rejected.
- Automatic AI execution of approval: rejected.
- Treating Listing as proof of brokerage authority: rejected.

## 15. Closure

C05 semantic work is **SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED**. Every unresolved item has an explicit downstream authority or evidence dependency. This ADR does not authorize schema, RLS or production implementation.
