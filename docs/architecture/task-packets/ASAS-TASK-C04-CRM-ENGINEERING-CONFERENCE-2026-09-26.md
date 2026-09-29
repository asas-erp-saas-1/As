# ASAS Engineering Conference — C04 CRM Task Packet

**Status:** OPEN / RESEARCH-FIRST / SEMANTIC DECISION WORK
**Branch:** `platform-architecture-2026`
**Depends on:** C01 baseline; C02 identity/relationship decisions; C03 domain resource semantics

## Objective

Close the CRM semantic layer without inventing implementation reality. The package must produce decisions that can later become contracts, registers and tests.

## Existing ASAS basis

The Enterprise Domain Model defines Lead & CRM as a Core subdomain. Lead has owner, pipeline stage, source, priority, score, dates, probability, budget/preferences and Agency scope. Client may link to multiple Leads. Phone normalization is the dedup key. Lead transitions raise domain events.

V3 retains CRM as a canonical bounded context and introduces a broader ontology including Person, Lead, Customer, Opportunity, Visit, Appointment, Activity and Communication.

These are source inputs, not automatic final decisions where the terminology or ownership boundary differs.

## Questions to close

### Identity
1. Is Person the canonical human identity across CRM, Sales, Documents and Communications?
2. Is Customer a role/state/relationship over Person or a separate aggregate?
3. Can one Person have multiple Customer relationships across organizations?
4. What is the exact identity/deduplication key hierarchy?
5. Which fields are immutable identity facts versus mutable profile facts?

### Lead
6. Is Lead always organization-owned?
7. Can one Person have multiple active Leads in one organization?
8. What makes two Leads duplicates?
9. Who owns merge authority?
10. What survives a merge?
11. Which Lead transitions are allowed and who may execute them?
12. What is the exact definition of qualified?
13. Which transitions require approval?
14. What is the lost/reopened policy?

### Ownership and assignment
15. What is the difference between Lead Owner, Assigned Agent, Team, Branch and Organization?
16. Can assignment change without changing ownership?
17. Which historical assignments must be preserved?
18. What happens when an employee leaves?
19. Can a lead have multiple collaborators without multiple owners?

### Source and attribution
20. How are source, acquisition source, campaign, channel and commercial attribution separated?
21. Which attribution facts are immutable after qualification/reservation/sale?
22. Which corrections are allowed and through what workflow?

### Communication
23. Is Communication a CRM-owned object or platform capability with CRM projections?
24. What is the authoritative conversation identity across WhatsApp, phone, email and future channels?
25. Which message metadata is retained?
26. What data is searchable?
27. What is sensitive and requires elevated audit?

### Consent / privacy
28. What consent facts must be captured?
29. What is the lawful basis / purpose model for CRM data?
30. What is the retention and anonymization policy?
31. What happens when a user requests restricted access or deletion where legal rules permit it?

### Activities / follow-up
32. Is Activity an append-only event projection or an operational task entity?
33. What is the distinction between Activity, Task, Appointment and Communication?
34. What is the authoritative next-follow-up model?
35. Which reminders are deterministic platform behavior versus workflow automation?

### AI
36. What CRM actions may AI recommend?
37. Which CRM actions may AI execute?
38. Which require human approval?
39. How does AI inherit caller authorization and tenant scope?

## Required outputs

- C04 ADR / decision record;
- CRM contract candidates;
- Lead state-machine delta;
- CRM permission/action delta;
- CRM event delta;
- ontology object/link/action updates;
- traceability entries;
- test scenarios including duplicate/merge, reassignment, cross-organization access and AI authorization.

## Non-goals

- No Prisma schema generation.
- No production migration.
- No runtime claim without evidence.
- No new bounded context.
- No implementation merely to make the conference appear complete.

## Closure gate

C04 is CLOSED only when every question is decided, deferred with explicit trigger, rejected with rationale, or blocked by named evidence. The resulting decision must reconcile with C02, C03, C06 Finance, C07 Marketing and C15 Security/Tenancy.
