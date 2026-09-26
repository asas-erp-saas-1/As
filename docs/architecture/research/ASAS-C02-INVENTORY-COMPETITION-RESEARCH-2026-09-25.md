# ASAS — C02 INVENTORY COMPETITION RESEARCH 2026-09-25

**Status:** ACTIVE RESEARCH / DECISION SUPPORT
**Outcome:** Hybrid E selected

## Question

How should ASAS resolve competition when Developer internal sales, agencies, brokerages, or other authorized channels can act on the same Unit?

## ASAS evidence

The current architecture baseline establishes:

- one active winner per Unit under concurrency;
- commercial state and construction state are separate;
- Reservation is the critical single-winner consistency boundary;
- state changes must use registered state machines;
- authorization is server-side and deny-by-default;
- RLS is defense-in-depth;
- allocation must be traceable;
- commission must be auditable;
- the platform must support multiple organization types and future SaaS evolution.

The conference also established:

`Inventory Ownership ≠ Inventory Visibility ≠ Commercial Allocation ≠ Reservation Control`

and the founder explicitly added that a Developer may have an internal sales team while an Agency may also own/control its own inventory or represent inventory from other organizations.

## Alternatives considered

### A — First valid reservation only
Simple, but insufficient for contractual/exclusive allocation and partner-priority business models.

### B — Fixed hierarchy
For example, Developer internal sales always outrank agencies. Rejected as a platform invariant because it incorrectly assumes organizational type determines commercial priority.

### C — Allocation first, otherwise first valid reservation
Useful baseline but insufficiently expressive for project-specific policies and multiple priority tiers.

### D — Fully configurable
Expressive but unsafe if configuration can alter core invariants or produce nondeterministic competition semantics.

### E — Hybrid policy
Project/inventory policy defines eligible channels and allocation/priority; deterministic first-valid-commit fallback resolves same-tier competition.

## Decision

**E is selected.**

The policy is configurable per Project/Inventory Batch but constrained by platform invariants.

Organization type does not automatically determine priority.

Within the same effective priority tier, the winner is the first valid reservation transaction that successfully commits against the Unit's single-winner consistency boundary.

## Engineering reasoning

The system must distinguish business priority from transactional race resolution.

Business priority answers:

`Who is eligible and what priority do they have?`

Concurrency control answers:

`Which eligible transaction becomes the one authoritative winner when requests overlap?`

These must not be conflated.

Client timestamps are unsuitable as authority because clients can be stale, skewed, retried, delayed, or reordered. The authoritative outcome must be determined at the server/database transaction boundary.

The exact database enforcement mechanism remains open until concurrency tests compare candidate mechanisms. The contract therefore specifies the invariant rather than prematurely selecting a PostgreSQL implementation pattern.

## Failure modes covered

- stale browser state;
- duplicate submissions;
- retry after timeout;
- simultaneous agencies;
- internal team vs agency race;
- allocation expiration during request;
- Hold expiration race;
- transaction rollback;
- event publication failure;
- manual override during contention.

## Classification

- ASAS evidence: SOURCE-VERIFIED
- Founder business decision: FOUNDER-DECISION
- Competition model: ENGINEERING-DERIVATION from the founder decision and platform invariants
- Exact persistence mechanism: PROPOSED / IMPLEMENTATION GATED
