# ASAS Roadmap Amendment 013 — Multi-Actor Inventory

**Date:** 2026-09-25
**Status:** ACTIVE DESIGN GATE

## Founder decisions recorded

Q1: C + D — hard allocation where applicable, configurable by project/inventory batch.
Q2: C + A — Hold may exist as an independent state, with hybrid workflow by project.
Q3: E — configurable reservation authority by relationship/project policy.
Q4: F + manual — configurable attribution/dispute workflow with auditable manual adjudication.
Q5: C + D — multiple attribution dimensions and configurable project/relationship rules.
Q6: D — commission governed by commission contract/rule.
Q7: C — developer/authorized authority may override only through reason-coded, audited override.

## New domain clarification

Inventory is organization-neutral. A Developer is not the universal owner.

The platform must support:

1. Developer internal sales team selling its inventory.
2. Developer + external Agency sales channels.
3. Agency-owned/controlled inventory.
4. Agency-represented external inventory.
5. Future brokerage/investor/other authorized inventory actors.

## Required next sequence

1. Define inventory actor and authority semantics.
2. Reconcile Project/Building/Unit model with the new actor-neutral contract.
3. Define allocation and reservation state machine.
4. Define authority matrix for create/approve/cancel/override.
5. Define attribution graph and manual dispute adjudication.
6. Define commission rule model.
7. Define performance metric dictionary across internal and external channels.
8. Define financial settlement responsibility.
9. Derive authorization/RLS invariants.
10. Only then derive schema and implementation.

## Explicit prohibition

Do not encode `Developer` as the universal inventory owner in the database or application domain.
