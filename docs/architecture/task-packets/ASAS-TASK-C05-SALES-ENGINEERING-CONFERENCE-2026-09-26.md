# ASAS Engineering Conference — C05 Sales Task Packet

**Status:** SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Branch:** `platform-architecture-2026`
**Depends on:** C02 attribution/commission semantics; C03 Unit/Listing/inventory semantics; C04 CRM semantics
**ADR:** `ADR-0036-SALES-CANONICAL-SEMANTICS-2026-09-26.md`
**Contract candidate:** `ASAS-SALES-CONTRACT-CANDIDATE-2026-09-26.md`

## Objective

Close Sales semantics without inventing runtime implementation. Sales defines the commercial transaction layer between CRM intent and authoritative inventory/financial milestones.

## Closed decisions

### Opportunity / commercial engagement

1. **Independent Opportunity aggregate:** rejected for the initial canonical model. Lead remains the commercial engagement anchor; an Opportunity may exist as a projection/read-model. A future aggregate requires independent lifecycle, ownership, authorization and invariants.
2. **Opportunity ownership/lifecycle:** therefore no independent authority is introduced.
3. **Lead → Opportunity threshold:** no mandatory aggregate transition exists in the initial model.
4. **Multiple commercial engagements:** one Person may participate in multiple distinct commercial engagements; CRM remains the identity/lead authority.

### Offer

5. **Offer:** Sales-owned, versioned, time-bounded commercial proposal.
6. **Versioned terms:** target resource, applicable price version, adjustments, commercial/payment terms, validity and provenance required to reproduce the proposal.
7. **Approval:** governed by permission/workflow policy; thresholds remain register/policy data.
8. **Unavailable target:** an Offer does not grant reservation authority; authoritative availability must be revalidated at reservation/commit.
9. **Changed conditions:** accepted commercial facts are preserved; later price versions do not rewrite prior economics.
10. **Expiry/withdrawal:** separate authorized lifecycle action; historical facts remain auditable.

### Hold

11. **Creation:** authorized domain action.
12. **Release/expiry:** authorized domain actions; exact IDs/TTL remain register/policy dependent.
13. **Effect:** temporary commercial inventory control; not a legal/financial sale commitment.
14. **TTL:** policy/register dependent, not hard-coded in UI.
15. **Concurrency:** Hold remains distinct from Reservation; Reservation retains the single-winner boundary.

### Reservation

16. **Preconditions:** tenant/actor authorization, resource eligibility, permitted commercial state, required offer/hold conditions, commercial terms, customer identity requirements and idempotency.
17. **Snapshot:** applicable commercial terms are captured at reservation milestone.
18. **Authorization:** evaluated through the platform's multi-actor authorization chain.
19. **Idempotency:** command boundary uses an idempotency key; same key/same command replays committed result; conflicting reuse is rejected.
20. **Transaction boundary:** reservation success and Unit commercial-state consequence share the authoritative consistency boundary; concrete PostgreSQL implementation remains gated.
21. **Release/expiry:** conditional on reservation identity/version so stale jobs cannot release newer winners.
22. **Race tests:** required for same-unit concurrency, expiry race, retries, stale reads, cross-tenant access and manager override contention.

### Contract preparation

23. **Ownership:** Sales owns commercial readiness; Documents owns document artifacts/lifecycle; Finance owns monetary obligations/ledger.
24. **Eligibility:** Reservation becomes contract-ready only after applicable Sales policy, approval and prerequisite-document checks.
25. **Snapshot:** contract package carries reproducible commercial terms, price/version, approved adjustments, reservation and provenance.
26. **Re-approval:** policy-driven; exact thresholds belong to approval registers/workflows.

### Discount / approval

27. **Authority:** explicit policy/permission/workflow, not UI role alone.
28. **Thresholds:** manager/director/persona mapping is register/policy dependent.
29. **Scope:** policy is resource/project/organization aware where required by authorization.
30. **AI:** may recommend or draft; cannot execute a human approval tier.

### Brokerage / mandate

31. **Mandate validation:** Owner/Mandate relationship establishes authority; Listing itself does not.
32. **Revocation/expiry:** future commercial actions fail or enter the policy-defined blocked state; historical facts remain intact.

### Attribution / commission bridge

33. **Snapshot milestone:** Sales records the commercial milestone facts needed by Finance; exact event/permission IDs remain register dependent.
34. **Corrections:** later attribution changes do not rewrite historical snapshots; corrections are new authorized facts.
35. **Finance handoff:** reservation/sale milestone, actor/organization context, attribution snapshot, applicable policy/version references and required commercial provenance.

### Events / audit

36. **Authoritative events:** committed business facts from Sales/domain transactions.
37. **Projections/notifications:** search, analytics and UI notifications are consumers, not competing authorities.
38. **Reservation emission:** authoritative reservation state and Unit consequence commit first; transactional outbox emits the event from committed state.

## Required outputs — completed

- C05 ADR: `ADR-0036-SALES-CANONICAL-SEMANTICS-2026-09-26.md`;
- Sales contract candidate: `ASAS-SALES-CONTRACT-CANDIDATE-2026-09-26.md`;
- Offer/Hold/Reservation semantic deltas recorded;
- approval policy dependencies recorded;
- attribution-to-Finance handoff recorded;
- concurrency/race-test requirements recorded;
- legal boundary explicitly separated from generic Sales semantics.

## Explicitly deferred / blocked

- exact Hold TTL;
- exact discount thresholds;
- exact approval persona mappings;
- exact KYC/document prerequisites;
- exact event IDs;
- exact permission IDs;
- exact state-machine IDs;
- PostgreSQL constraint/index/isolation implementation;
- country-specific contract wording.

These are not unresolved by omission. Each has a downstream authority: canonical registers, country pack/legal verification, or brownfield/runtime evidence.

## Non-goals

- No Prisma schema generation.
- No production migration.
- No runtime claim without evidence.
- No replacement of C03 reservation semantics without new evidence.
- No duplicate CRM Lead authority.

## Closure gate

**C05 = SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED.**

Semantic closure does not authorize implementation while Foundation Gates 00–06 remain unresolved.
