# ADR-0035 — CRM Canonical Semantics

**Status:** ACCEPTED — SEMANTIC / IMPLEMENTATION BLOCKED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Conference:** C04 CRM
**Depends on:** C01, C02, C03
**Reconciles with:** C05 Sales, C06 Finance, C07 Marketing, C15 Security/Tenancy

## Decision summary

ASAS CRM is the canonical bounded context for the customer-acquisition and relationship-work operating model. It owns Person/Lead/Customer relationship semantics and lead lifecycle, while platform capabilities own channel transport, scheduling infrastructure, notifications, search and audit infrastructure. Sales owns Offer/Reservation/Contract; Marketing owns Campaign and marketing execution; Finance owns commission and financial facts.

The existing 17-stage unified sales pipeline remains the source workflow baseline. It is a business workflow, not a new bounded context and not a reason to create a separate `Deal` aggregate. `Deal` remains a computed commercial view over a Lead until a future Sales ADR proves an independent aggregate is required.

## 1. Identity

1. **Person is the canonical human identity** across CRM, Sales, Documents and Communications.
2. **Customer is not a second human identity.** It is a customer role/relationship over a Person within an organization/business context, with customer-specific profile and relationship facts.
3. One Person may participate in multiple organizations as separate organization-scoped relationships. Tenant isolation and relationship scope remain mandatory.
4. Deduplication hierarchy:
   - normalized phone is the primary deterministic match key, consistent with the existing ASAS CRM basis;
   - normalized email is a secondary supporting signal where present;
   - other identifiers may be used only when their collection and use are authorized by the applicable country/privacy policy;
   - fuzzy matching may propose a duplicate but may not silently merge records.
5. Immutable identity facts are separated from mutable profile facts. A correction changes the profile record while preserving audit/provenance; identity merges are controlled actions, not ordinary edits.

## 2. Lead authority

6. Lead is organization-owned and always tenant-scoped.
7. Multiple active Leads for one Person are permitted only when they represent materially distinct commercial engagements (for example distinct project/property intent, mandate/context, or separately justified opportunity). Duplicate lead creation must trigger detection and either reuse/link or an explicit override reason.
8. A duplicate Lead is determined by identity plus organization plus materially equivalent active commercial intent/context, not by name similarity alone.
9. Merge authority belongs to an authorized CRM manager/administrator policy; ordinary agents cannot perform irreversible merges unless explicitly granted.
10. A merge preserves the surviving canonical Person/Lead identity, all auditable history, source/attribution facts, activities, communications, documents and references; the losing record becomes a merge tombstone/reference, not a destructive deletion.
11. Lead transitions are domain actions, not raw status writes. Each transition records actor, time, previous stage, next stage, reason/required evidence and audit lineage.
12. `QUALIFIED` means the lead has sufficient validated need, budget/financial capacity signal, relevant property/project intent and actionable timeline/contactability according to the configured qualification policy. Qualification is a business decision, not merely a field being non-null.
13. Approval is required for exceptional transitions or policy-controlled overrides; the exact approval thresholds belong to policy configuration and C15 authorization rules.
14. `LOST` is an explicit terminal pipeline outcome with a required reason. Reopening is a controlled action that preserves the previous lost state and creates a new transition/audit fact.

## 3. Pipeline

The existing 17-stage pipeline remains the canonical CRM workflow baseline:

1. New lead captured
2. Lead assigned
3. First contact attempted
4. Lead contacted
5. Needs qualified
6. Property matched
7. Visit scheduled
8. Visit completed
9. Interested
10. Offer submitted
11. Negotiation
12. Reservation
13. Contract preparation
14. Payment follow-up
15. Sale closed
16. Post-sale follow-up
17. Lost

The legacy source specifies Lost as reachable from stages 3, 5, 7, 10, 11 and 12, and stages 13–14 vary by business track while remaining one pipeline. That baseline is retained. Exact executable state IDs and transition registry entries remain implementation-gated until registry reconciliation.

`Deal` is not a separate CRM aggregate. It is a derived/computed view over eligible Leads. C05 Sales may later propose an independent Opportunity aggregate, but that requires a separate decision.

## 4. Ownership, assignment and responsibility

15. **Lead Owner** is the accountable commercial owner of the lead relationship.
16. **Assigned Agent** is the operational actor currently responsible for the next work. Assignment may change without transferring ownership when policy permits.
17. **Team** is a responsibility/visibility grouping, not an ownership substitute.
18. **Branch** is organizational scope and does not automatically create a tenant boundary.
19. **Organization** is the business principal/tenant boundary.
20. Assignment history is immutable evidence. Employee departure does not erase ownership history; policy must transfer operational responsibility to an authorized successor while preserving historical attribution.
21. Multiple collaborators are allowed without creating multiple owners. One accountable owner remains authoritative unless a future policy explicitly defines co-ownership.

## 5. Source and attribution

22. CRM separates:
   - acquisition/source;
   - campaign;
   - channel/touch;
   - operational assignment;
   - commercial attribution;
   - commission entitlement.
23. Source and attribution are versioned facts with provenance. They must not be overwritten by a later correction without an auditable correction event.
24. Attribution changes after qualification/reservation/sale require controlled correction policy; historical facts used by Finance or Analytics must remain reconstructable.
25. Marketing owns campaign execution and campaign truth; CRM owns the lead relationship and its attribution references; Finance owns commission entitlement/payout.

## 6. Communication

26. Communication is a platform capability with a canonical Conversation/Message model; CRM owns the CRM relationship/projection that associates communications with People/Leads.
27. Conversation identity is channel-independent. External channel identifiers are retained as channel identities linked to one canonical conversation subject where safely resolved.
28. Retained message metadata includes source/channel, external identifier where available, timestamps, direction, participants/subject references, delivery status where available, correlation/trace identifiers and security classification. Message body retention is policy-controlled.
29. Searchability follows data classification and authorization. Restricted communication content is not globally searchable merely because it exists.
30. Sensitive communications require elevated audit and must respect tenant, purpose and field-level access controls.

## 7. Consent and privacy

31. CRM captures consent/purpose facts as first-class governed data rather than a single boolean. At minimum: subject, purpose, channel/scope, status, source, captured_at, effective_at/withdrawn_at where applicable, and evidence reference.
32. The system does not encode a universal legal conclusion inside CRM. Applicable legal basis, retention and data-subject rights are governed by the country pack and Security/Tenancy conference (C15). Existing ASAS source material identifies Algerian data-protection obligations and requires access/correction/erasure handling; legal verification remains an explicit C15 evidence item.
33. Retention and anonymization are policy-driven. Business/audit evidence that must be retained is not physically deleted merely because a profile becomes restricted; anonymization/restriction behavior must preserve required legal and accounting evidence.
34. Access restriction and lawful deletion/anonymization requests are workflow-controlled, audited and tenant-scoped. No agent may bypass them through direct mutation.

## 8. Activity, Task, Appointment and Communication

35. **Activity** is an operational CRM timeline record describing an observed/actionable interaction or milestone. It is not the immutable event store and not a task queue.
36. **Task** is an actionable work item with owner, due date, status and completion semantics.
37. **Appointment** is a scheduled time commitment owned by the Scheduling capability and referenced by CRM.
38. **Communication** is an interaction/message/conversation record owned by the Communication capability and projected into CRM.
39. The authoritative next-follow-up is a derived operational commitment (Task or Appointment) rather than an arbitrary text field. A Lead may have many historical Activities but only the policy-defined next actionable commitment should drive follow-up queues.
40. Deterministic reminders for required pipeline actions are platform behavior; configurable escalations/automations are Workflow capability behavior.

## 9. AI

41. CRM AI may read authorized CRM data, identify duplicates, summarize history, recommend qualification/follow-up/assignment and draft communications.
42. AI may execute only actions classified as permitted by the AI action policy and caller authorization. It cannot create authority by itself.
43. Sensitive, financial, destructive, legal or mass-communication actions require the applicable approval policy and may be human-only.
44. AI inherits caller identity, organization/tenant, relationship, role, scope, attributes, purpose and resource authorization. The model never receives direct database credentials.

## 10. Canonical boundaries

- CRM owns Person/Lead/Customer relationship semantics and CRM lifecycle.
- Sales owns Offer/Reservation/Contract and commercial transaction boundaries.
- Inventory owns Unit/listing availability and inventory lifecycle.
- Marketing owns Campaign and marketing execution/attribution source truth.
- Finance owns commission entitlement/payout and financial facts.
- Scheduling owns appointment/calendar mechanics.
- Communication owns channel/conversation transport and message mechanics.
- Documents owns document lifecycle and document governance.
- Security/Tenancy owns authorization, RLS, tenant isolation and privacy control-plane rules.
- Analytics consumes governed facts and does not mutate CRM authority.

## 11. Implementation constraints

No executable schema, migration, RLS policy or runtime state-machine change is authorized by this ADR. Implementation requires:

1. foundation gates 00–06 to pass as applicable;
2. live database identity and brownfield reconciliation;
3. registry reconciliation for states/events/permissions;
4. C05/C06/C07/C15 boundary checks;
5. contract tests and adversarial tenant/duplicate/merge/authorization cases.

## 12. Closure status

All C04 task questions are either decided above or explicitly deferred to a named downstream authority/evidence gate. C04 is therefore **SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED**.

The remaining work is registry/contract/evidence convergence, not reopening the semantic decisions without new evidence.
