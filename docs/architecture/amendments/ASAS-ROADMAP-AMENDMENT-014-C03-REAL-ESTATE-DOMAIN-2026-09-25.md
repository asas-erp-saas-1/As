# ASAS Roadmap Amendment 014 — C03 Real Estate Domain

**Date:** 2026-09-25
**Status:** ACTIVE CONFERENCE WORKSTREAM

## Trigger

C02 established that inventory may be controlled, listed, allocated, reserved, sold, or reported by multiple organization types. This invalidates any implicit assumption that Developer is the universal owner/controller.

## C03 objective

Define the canonical real-estate resource model before schema implementation.

## Sequence

```text
Resource Identity
  ↓
Asset Taxonomy
  ↓
Hierarchy
  ↓
Ownership / Control / Authority
  ↓
Inventory Representation
  ↓
Availability State Machine
  ↓
Pricing / Versioning
  ↓
Listing / Distribution
  ↓
Reservation Boundary
  ↓
Cross-organization access
  ↓
Schema Contract
```

## Founder gates expected

Only questions that change business semantics should be returned to the founder. Engineering details should be decided by the architecture track after research and source reconciliation.

## Implementation gate

C03 remains implementation-blocked until the domain contract, security implications, state machine, schema contract, migration impact, and test specification are green.

## Required evidence

- ASAS canonical identity;
- core lifecycle map;
- current repository schema/domain evidence;
- research record;
- edge-case scenarios;
- approved founder decisions;
- resulting contract and verification plan.
