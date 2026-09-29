# ASAS Roadmap Amendment 011 — C02 Lead Ownership / Assignment / Attribution

**Date:** 2026-09-25
**Status:** ACTIVE / CANONICAL ROADMAP AMENDMENT
**Parent:** `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`

## Decision

Close the first C02 attribution slice with the following separation:

`Lead Ownership ≠ Operational Assignment ≠ Source Attribution ≠ Commercial Attribution ≠ Commission Entitlement`

## Research / source reconciliation

The current ASAS permission register already distinguishes lead read/update/transfer/export scopes and apartment assigned access, while the canonical lifecycle defines Lead → Qualification → Opportunity → Activity/Visit → Commercial action → Option/Reservation → Contract → Payment. The new contract makes the semantics explicit without treating existing permission rows as proof of implementation.

External SaaS authorization research confirms that role-based authorization alone is insufficient for fine-grained resource access and that tenant isolation is a separate concern. ASAS therefore retains the hybrid relationship/team/project/resource model rather than reducing attribution or access to a single role/owner field.

## Engineering decisions

1. Lead ownership identifies the organization responsible for the CRM relationship record.
2. Operational assignment identifies the current user/team/queue responsible for work.
3. Source attribution preserves the original acquisition origin.
4. Commercial attribution records credit for defined commercial milestones.
5. Commission entitlement is Finance-owned and derived from approved commission rules and authoritative commercial facts.
6. Reassignment does not rewrite historical commercial attribution.
7. Reservation/sale attribution is snapshotted at the governing milestone.
8. Cross-agency collaboration does not merge private CRM records.
9. Attribution disputes require explicit audited correction/dispute workflows.
10. No production schema/RLS implementation is authorized by this amendment alone.

## Dependency queue

Now proceed in this order:

`Project Inventory Access → Reservation Attribution → Commission Semantics → Developer/Agency Performance Read Models`

Then return to C03/C04/C05/C06 closure as applicable.

## Required artifact synchronization

The following must remain synchronized:

- Engineering Conference Path;
- Current Session State;
- Source of Truth amendment;
- Product Requirements amendment where customer-visible semantics change;
- Team/Project Authorization Contract;
- Lead Ownership/Assignment/Attribution Contract;
- permission/event/state-machine registers when implementation is authorized;
- main Engineering Roadmap through this amendment;
- implementation task packets only after applicable gates close.

## Evidence state

`SEMANTICALLY DECIDED / REPOSITORY RECONCILIATION REQUIRED / IMPLEMENTATION BLOCKED`
