# ASAS CRM Contract Candidate — 2026-09-26

**Status:** CANDIDATE / NOT IMPLEMENTATION AUTHORITY
**Owner:** CRM bounded context
**Semantic authority:** ADR-0035
**Branch:** `platform-architecture-2026`

## Canonical objects

| Object | Authority | Role |
|---|---|---|
| Person | CRM | Canonical human identity/master record |
| Customer Relationship | CRM/Core | Organization-scoped customer relationship over Person |
| Lead | CRM | Organization-owned commercial engagement/work item |
| Activity | CRM | Operational interaction/timeline record |
| Attribution Fact | CRM/Marketing boundary | Versioned source/campaign/touch attribution reference |
| Conversation / Message | Communication capability | Channel-independent communication model; CRM projection |
| Task | Workflow/Platform | Actionable work item referenced by CRM |
| Appointment | Scheduling capability | Scheduled commitment referenced by CRM |

## Non-objects / derived views

- `Deal` is a derived view over eligible Lead records, not a separate authority.
- Pipeline metrics are projections, not CRM source-of-truth mutations.
- Search indexes are projections.
- AI summaries/recommendations are derived artifacts and never replace authoritative records.

## Lead invariants

1. Every Lead is tenant/organization scoped.
2. Every Lead has one accountable owner under the active policy.
3. Operational assignment may differ from ownership.
4. Assignment changes preserve history.
5. Duplicate detection is mandatory before creating a new active Lead when a likely existing Person/engagement is detected.
6. Fuzzy duplicate detection may propose but may not silently merge.
7. Merge is an authorized domain action with audit evidence.
8. `LOST` requires a reason.
9. State transitions occur through domain actions, not raw status mutation.
10. A Lead may reference Project/Unit/Listing context without owning those lifecycles.
11. CRM cannot mutate Reservation, Contract, Payment, Commission or Unit state directly.
12. Attribution corrections preserve historical facts required by downstream Finance/Analytics.

## Pipeline baseline

The current source baseline contains 17 stages:

`NEW_LEAD → ASSIGNED → FIRST_CONTACT_ATTEMPTED → CONTACTED → NEEDS_QUALIFIED → PROPERTY_MATCHED → VISIT_SCHEDULED → VISIT_COMPLETED → INTERESTED → OFFER_SUBMITTED → NEGOTIATION → RESERVATION → CONTRACT_PREPARATION → PAYMENT_FOLLOW_UP → SALE_CLOSED → POST_SALE_FOLLOW_UP → LOST`

These labels are the semantic baseline from the existing implementation specification. Executable state IDs and transition rules must be reconciled with the canonical state-machine register before implementation.

## Authorization model

CRM actions are evaluated using the ASAS multi-actor model:

`identity + organization/tenant + relationship + role/team + scope + attributes + purpose + resource + action + policy + audit`

Role-only checks are insufficient.

## Communication boundary

Communication transport is platform-owned. CRM consumes/provides governed projections:

`Person/Lead ←→ Conversation/Message`

CRM does not become the WhatsApp/email/phone transport system.

## Consent boundary

Consent and purpose are first-class governed facts. Legal basis and retention policy are country-pack/security governed and must not be hard-coded as universal CRM rules.

## AI boundary

AI uses CRM through authorized tools/actions. It inherits caller authority and tenant scope. It never receives direct database credentials and cannot bypass approval policy.

## Required contract tests

- Person duplicate by normalized phone.
- Secondary email duplicate signal.
- False-positive fuzzy duplicate does not auto-merge.
- Cross-organization Person isolation.
- Lead assignment without ownership transfer.
- Ownership transfer with preserved history.
- Unauthorized merge rejected.
- Merge preserves audit/history and downstream references.
- Lost transition requires reason.
- Reopen preserves previous lost state.
- CRM cannot mutate Reservation/Contract/Payment/Commission directly.
- Tenant A cannot read Tenant B Lead/Person/Activity/Conversation projections.
- AI cannot exceed caller authorization.
- Restricted communication is not exposed through unauthorized search.
- Attribution correction preserves historical downstream facts.
