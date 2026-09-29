# ASAS Lead Ownership, Assignment & Attribution Contract — 2026

**Status:** PROPOSED — SEMANTIC CONFERENCE CLOSED FOR THIS SLICE / IMPLEMENTATION BLOCKED
**Date:** 2026-09-25
**Conference:** C02 Organization / Membership / Relationship

## 1. Purpose

Separate four concepts that must never be collapsed into one `owner` field:

1. Lead record ownership / stewardship;
2. operational assignment;
3. origin/source attribution;
4. commercial performance attribution.

Commission entitlement is a fifth downstream concept and must not be inferred from the current lead assignee.

## 2. Canonical doctrine

`Ownership ≠ Assignment ≠ Source Attribution ≠ Commercial Attribution ≠ Commission Entitlement`

The same person or organization may hold multiple roles in one case, but the data model must preserve the semantic distinction.

## 3. Lead record ownership

Lead ownership identifies the organization responsible for the CRM relationship record and its governed lifecycle.

Default rule:
- A lead originating from an Agency's own acquisition channel is owned by that Agency unless an explicit commercial/legal intake rule assigns ownership elsewhere.
- A lead created directly by a Developer's own channel is owned by the Developer unless an explicit partner-attribution rule applies.
- Ownership is organization-scoped and does not automatically grant every employee access.
- A cross-organization collaboration creates a controlled view/share; it does not silently transfer ownership.

Ownership transfer is an explicit audited command, not a side effect of reassignment.

## 4. Operational assignment

Assignment identifies who is currently responsible for the next operational work.

Assignment may target:
- individual user;
- team;
- branch where the policy permits;
- queue/work distribution rule.

Assignment is temporal and mutable. Historical assignments must remain auditable.

Assignment does not change lead ownership or commercial attribution unless a separate explicit command does so.

## 5. Source / origin attribution

Source attribution records how the lead entered ASAS and must preserve the original acquisition fact.

Examples:
- website form;
- WhatsApp inbound;
- Facebook/Instagram campaign;
- Ouedkniss;
- referral;
- partner Agency;
- Developer direct channel;
- manual/import/API.

The source record should be immutable after capture except through an auditable correction process.

## 6. Commercial attribution

Commercial attribution identifies the organization/person/team credited for a defined commercial outcome.

It must be attached to a defined outcome and effective period, not inferred from whichever user currently owns the lead.

Potential outcome attribution points include:
- qualified lead;
- visit;
- offer;
- reservation;
- contract/sale.

The system must support the possibility that different actors receive different attribution dimensions.

Example:

```text
Lead source: Agency A / Facebook campaign
Lead owner: Agency A
Current assignee: Ahmed / Agency A
Visit contributor: Ahmed
Reservation commercial credit: Agency A
Sale contributor: Karim / Agency A
```

## 7. Cross-organization rule

If Agency A and Agency B collaborate with Developer X on the same Project:

- Agency A cannot access Agency B's private CRM notes merely because both work on the Project.
- Developer X may receive authorized performance projections.
- The shared project context does not merge the agencies' CRM ownership.
- Attribution must remain traceable to the organization/person that earned the relevant credit.

## 8. Project and inventory scope

A lead may be related to a Project/Building/Unit context, but this relationship does not itself transfer ownership of the lead or inventory.

Inventory remains authoritative under the owning organization. Agency access is a scoped commercial authorization.

## 9. Reservation and sale attribution

At reservation and sale milestones, the system must snapshot the applicable attribution facts required by the commercial relationship.

Later reassignment of the lead must not retroactively rewrite historical reservation/sale attribution.

If attribution is disputed, use an explicit correction/dispute workflow with audit evidence; never silently edit historical facts.

## 10. Commission boundary

Commission is a Finance-owned downstream entitlement. It must be calculated from an approved commission rule and authoritative commercial facts.

It must not be derived solely from:
- current lead owner;
- current assignee;
- current team;
- current project assignment.

Commission accrual, payout and clawback remain auditable finance facts.

## 11. Required audit facts

For every ownership transfer, assignment, attribution change/correction, reservation attribution and commission decision, retain:

- actor;
- timestamp;
- organization context;
- previous value;
- new value;
- reason where required;
- source/correlation id;
- affected resource;
- governing relationship/policy;
- resulting event/evidence.

## 12. Authorization implications

Access must evaluate:

`Identity → Membership → Organization Context → Relationship → Team/Role Scope → Assignment/Resource Scope → Permission → Action`

A user may be authorized to work a lead without being authorized to see every field of that lead. PII/private notes/financial fields require field/resource policy where applicable.

## 13. Invariants

1. No single `owner_id` field may represent all five concepts.
2. Assignment changes do not rewrite historical attribution.
3. Lead ownership transfer is explicit and auditable.
4. Original source attribution is preserved.
5. Historical commercial attribution is immutable after the governing milestone except through controlled correction/dispute.
6. Commission entitlement requires an approved financial rule and cannot be inferred from UI state.
7. Cross-agency collaboration does not merge private CRM data.
8. Ambiguous attribution must not silently award commercial or financial credit.
9. Duplicate/merged leads must preserve provenance and attribution history.
10. Public acquisition actions cannot directly mutate authoritative inventory or financial facts.

## 14. Implementation gate

Do not create production schema or migration from this contract alone. Reconcile it against the current CRM/Sales/Finance schema, event register, state machines, permissions, live database, and existing attribution implementation before implementation authorization.
