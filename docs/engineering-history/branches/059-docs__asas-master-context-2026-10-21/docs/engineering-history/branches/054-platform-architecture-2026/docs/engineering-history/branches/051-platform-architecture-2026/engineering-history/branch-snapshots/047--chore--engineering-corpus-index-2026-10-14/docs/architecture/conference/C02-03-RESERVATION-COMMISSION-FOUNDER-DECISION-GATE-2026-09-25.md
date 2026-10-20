# C02-03 — Reservation / Commission Founder Decision Gate

**Status:** ACTIVE — requires Founder decisions for business semantics
**Date:** 2026-09-25
**Conference:** ASAS Engineering Conference 2026

## Purpose

This gate separates decisions that require founder/product authority from technical decisions that engineering can derive.

## Engineering conclusions already derived

1. Developer remains authoritative owner/controller of project inventory unless a future product rule explicitly changes ownership semantics.
2. Agency access is scoped commercial access, not duplicated inventory ownership.
3. Allocation, reservation, ownership, visibility and commission entitlement are distinct concepts.
4. Reservation is a state transition against canonical inventory and requires a single-winner concurrency guarantee.
5. Historical attribution at commercial milestones must be snapshotted and must not be silently rewritten by later reassignment.
6. Commission entitlement is derived from approved commercial facts and versioned rules; it is not inferred from current lead ownership alone.
7. Tenant isolation and authorization remain separate controls; authorization is deny-by-default and least-privilege. External research supports this separation. PostgreSQL row-level locking can support concurrency but does not by itself define the business transaction or guarantee every invariant.

## Founder decisions required

### Q1 — Inventory allocation

When a Developer allocates a Unit to Agency A, what commercial meaning should the allocation have?

A. Visibility only — Agency can market/see the Unit but has no priority claim.
B. Soft commercial allocation — Agency has a defined priority window but the Developer can reclaim it under policy.
C. Hard allocation — Unit is reserved for Agency A until explicit release/expiry.
D. Configurable per project — Developer chooses A/B/C per project or inventory batch.

### Q2 — Hold vs reservation

Should ASAS model a temporary "Hold/Option" distinct from a Reservation?

A. Yes — Hold is a short-lived pre-reservation state; Reservation is a formal commercial commitment.
B. No — use one Reservation lifecycle with statuses.
C. Hybrid — Hold exists only for configured projects/workflows.

### Q3 — Reservation authority

Who can create/confirm a Reservation?

A. Agency agent can create; Developer confirms.
B. Agency manager can create; Developer confirms.
C. Both sides can create requests; policy determines who confirms.
D. Developer controls confirmation, while Agency can only submit a reservation request.
E. Configurable per relationship/project.

### Q4 — Duplicate-client / competing-agency conflict

If Agency A and Agency B claim the same client for the same Unit, which commercial rule should govern?

A. First valid attribution wins.
B. First qualified lead wins.
C. First verified visit wins.
D. First valid reservation wins.
E. Developer/admin adjudication using evidence.
F. Configurable rule with an explicit dispute workflow.

### Q5 — Multi-agency credit

Can more than one Agency receive commercial credit for the same sale?

A. Never — one Agency owns the commercial credit.
B. Yes, but only by explicit split/commission rule.
C. Yes — lead-source Agency and closing Agency may receive different attribution dimensions.
D. Configurable per project/relationship.

### Q6 — Cancellation and commission

If a Reservation or Sale is cancelled, what happens to commission entitlement?

A. Entitlement is immediately voided.
B. It remains accrued but becomes subject to clawback/reversal.
C. It depends on the commercial milestone reached.
D. Configurable by commission rule/contract.

### Q7 — Developer override

Can an authorized Developer override Agency allocation/attribution/reservation decisions?

A. Yes, anytime.
B. Only before reservation confirmation.
C. Only through a reason-coded, auditable override workflow.
D. Never after a legally/commercially binding milestone.
E. Configurable per relationship/project, with protected legal/financial milestones.

## Decision protocol

Founder answers determine product/business semantics. Engineering will then derive:

`state machine → commands → authorization → invariants → audit → events → schema contract → tests → migration plan`

No production schema or RLS implementation is authorized by this gate alone.
