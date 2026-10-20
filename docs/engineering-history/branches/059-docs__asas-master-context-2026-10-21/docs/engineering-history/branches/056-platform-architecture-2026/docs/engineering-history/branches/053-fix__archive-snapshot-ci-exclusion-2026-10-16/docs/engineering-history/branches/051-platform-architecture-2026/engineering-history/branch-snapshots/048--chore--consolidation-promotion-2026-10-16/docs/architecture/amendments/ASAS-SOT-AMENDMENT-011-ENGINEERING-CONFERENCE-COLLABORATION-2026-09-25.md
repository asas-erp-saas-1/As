# Source of Truth Amendment 011 — Engineering Conference / Collaboration

**Date:** 2026-09-25
**Status:** ACTIVE / CANONICAL AMENDMENT
**Parent:** `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
**Conference:** `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`

## New canonical decisions

### Organization
`Organization = business principal`.

Developer, Agency, Brokerage and other future real-estate company types are independent organizations. No nested Developer-under-Agency or Agency-under-Developer account model is canonical.

### Ownership
The organization that owns/controls an authoritative Project controls its authoritative Inventory. Partner organizations do not receive copied authoritative Project/Inventory records.

### Relationship
`OrganizationRelationship` is a first-class commercial collaboration concept. It can be scoped to Organization, Project, Building, Inventory, Leads, Sales and Reporting.

### Collaboration boundary
Hybrid D:

`Organization Relationship + Project context + Resource Scope`.

A standalone Collaboration Space is reserved for future evidence, not required now.

### Employee authorization
Hybrid D:

`Organization relationship + Team/Role scope + Project assignment + Individual exception`.

### Visibility
`Visibility follows responsibility.`

The UI is task-oriented and must not expose unrelated data simply because it exists in the platform.

### Partner performance
Hybrid E:

Developer-side performance visibility is configurable. Project-level partner performance may expose Leads, Visits, Offers, Reservations, Sales, Attribution, Conversion and Inventory Velocity as authorized. Agency-internal data remains private unless explicitly shared.

## Authority classification

Founder-selected decisions above are desired-state authority. The engineering representation remains subject to domain-contract, security, persistence and runtime verification.

## Verification requirements

Before implementation, reconcile these decisions against repository identity/membership, current schema/migrations, existing authorization/RLS, historical context maps, permission/event registers and runtime evidence where available.

No decision above proves that the repository already implements it.
