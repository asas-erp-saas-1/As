# ASAS PRD Amendment 001 — Organization Collaboration Model

**Date:** 2026-09-25
**Status:** PROPOSED / FOUNDER-CONFIRMED DIRECTION
**Parent:** `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md`
**Conference:** `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`

## Product decisions captured

1. ASAS targets a broad real-estate ecosystem, with Developer + Agency + Brokerage as the initial commercial wedge.
2. Organizations are independent business principals; they are not nested child accounts.
3. Developer-controlled Project and Inventory remain authoritative.
4. Developer ↔ Agency collaboration is a first-class commercial relationship.
5. Collaboration uses Hybrid D: Organization Relationship + Project context + Resource Scope.
6. Partner performance visibility uses Hybrid E: useful default visibility with authorized configuration for sensitive fields/details.
7. Employee authorization uses Hybrid D: relationship + team/role scope + project assignment + individual exception.
8. `Visibility follows responsibility` is a product experience requirement.
9. A separate Collaboration Space is not required in the core at this stage.

## Product acceptance implication

The PRD's existing multi-organization and visibility sections remain valid and are refined by this amendment. The exact entitlement matrix, sensitive-field policy and legal/commercial relationship semantics remain open until their respective product/security/domain gates close.

This amendment does not authorize schema or RLS implementation.
