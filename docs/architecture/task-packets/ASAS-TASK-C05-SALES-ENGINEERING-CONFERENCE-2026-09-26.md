# ASAS Engineering Conference — C05 Sales Task Packet

**Status:** OPEN / RESEARCH-FIRST / SEMANTIC DECISION WORK
**Branch:** `platform-architecture-2026`
**Depends on:** C02 attribution/commission semantics; C03 Unit/Listing/inventory semantics; C04 CRM semantics
**Bridge already closed:** Offer semantic baseline

## Objective

Close Sales semantics without inventing runtime implementation. Sales must define the commercial transaction layer between CRM intent and authoritative inventory/financial milestones.

## Existing accepted basis

- Offer is Sales-owned and does not itself reserve inventory.
- Hold and Reservation are distinct.
- Reservation is the Unit single-winner consistency boundary.
- Development uses Unit as canonical resource; brokerage uses Listing under Owner/Mandate semantics.
- CRM Lead is not replaced by a separate `Deal` object by default.
- Commission entitlement is Finance-owned and attribution is snapshotted at the applicable milestone.
- Pricing is versioned and historical transaction economics must remain reconstructable.

## Questions to close

### Opportunity / commercial engagement
1. Does Sales require an independent Opportunity aggregate, or is Lead sufficient until a defined commercial threshold?
2. If Opportunity exists, what is its ownership and lifecycle relative to Lead?
3. What makes a Lead become an Opportunity?
4. Can one Person have multiple Opportunities against different Units/Listings?

### Offer
5. What constitutes an Offer and what fields/terms are authoritative?
6. Which Offer terms are versioned?
7. Which Offer changes require approval?
8. Can an Offer be accepted while the target Unit/Listing is unavailable?
9. What happens to an accepted Offer when price/inventory conditions change?
10. What is the exact expiry/withdrawal behavior?

### Hold
11. What creates a Hold?
12. Who may create/release/expire a Hold?
13. Does Hold block public availability, operational allocation, or both?
14. What is Hold TTL and who controls exceptions?
15. How does Hold interact with Reservation concurrency?

### Reservation
16. What exact preconditions are mandatory before Reservation?
17. What commercial terms are snapshotted?
18. What authorization is required?
19. What is the idempotency key boundary?
20. What is the authoritative transaction boundary?
21. What is the release/expiration mechanism?
22. What race conditions must be proven?

### Contract preparation
23. What is Sales ownership versus Documents ownership?
24. When does a Reservation become eligible for Contract preparation?
25. Which terms are copied/snapshotted into the contract package?
26. Which changes require re-approval?

### Discount / approval
27. What discount/override authority is delegated by policy?
28. Which thresholds require manager/director approval?
29. Are approvals resource/project/organization/currency aware?
30. Can AI recommend or draft an override without executing it?

### Brokerage / mandate
31. How does Sales validate Owner/Mandate authority before accepting an Offer or Reservation for a Listing?
32. What happens when a mandate expires or is revoked while a commercial process is open?

### Attribution / commission bridge
33. At what exact Sales milestones are commercial attribution facts snapshotted?
34. Which later changes may be corrected without rewriting history?
35. What data is handed to Finance for commission entitlement?

### Events / audit
36. Which Sales events are authoritative domain events?
37. Which are projections/notifications only?
38. What must be emitted transactionally with Reservation?

## Required outputs

- C05 ADR(s);
- Sales domain contract candidates;
- Offer/Hold/Reservation state-machine deltas;
- Sales permission/action delta;
- Sales event delta;
- approval policy delta;
- attribution-to-Finance handoff contract;
- race/concurrency test specification;
- traceability updates.

## Non-goals

- No Prisma schema generation.
- No production migration.
- No runtime claim without evidence.
- No replacement of C03 reservation semantics without new evidence.
- No duplicate CRM Lead authority.

## Closure gate

C05 is CLOSED only when every question is decided, explicitly deferred with a named downstream authority/evidence trigger, rejected with rationale, or blocked by a concrete evidence dependency. Semantic closure does not authorize implementation while foundation gates remain unresolved.
