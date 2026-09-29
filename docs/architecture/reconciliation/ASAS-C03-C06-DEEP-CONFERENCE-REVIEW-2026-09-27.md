# ASAS Engineering Conference — C03/C04/C05/C06 Deep Closure Review

**Status:** ACTIVE / FORENSIC REVIEW / NO NEW IMPLEMENTATION AUTHORIZATION
**Date:** 2026-09-27
**Branch:** `platform-architecture-2026`
**Scope:** C03 Real Estate, C04 CRM, C05 Sales, C06 Finance
**Purpose:** Re-audit semantic closure quality at the same depth and discipline used for the earlier conference decisions. This review does not silently reopen accepted ADRs; it tests whether each closure is complete, cross-context consistent, evidence-backed, and safe to promote later into contracts/registers/implementation.

## 1. Governing closure standard

A conference area is not considered implementation-ready merely because an ADR exists. The required chain remains:

`Question → Research → Alternatives → Failure Modes → ASAS source validation → Authority → Decision → ADR/Contract/Register → Verification → Checkpoint`

For implementation, the additional chain is:

`Requirement → Architecture Decision → Domain Rule → Contract → Implementation → Test → Evidence → Production Metric`

Foundation Gates 00–06 remain mandatory before implementation authorization.

## 2. Source hierarchy used in this review

1. Founder/product decisions for business choices.
2. ASAS V3 architecture for canonical target architecture.
3. Existing ASAS Blueprint/MASTER-SPEC/AGENTS/registers for provenance and existing contract obligations.
4. Repository/runtime evidence for brownfield reality.
5. Current official law/regulatory/standards/vendor sources for external facts.
6. Secondary research only as supporting evidence.

No documentation artifact is treated as runtime truth. The brownfield database remains authoritative for existing persistence once its runtime identity is proven.

## 3. Global findings

### Finding F-01 — C03 is materially stronger than C04–C06 but is not complete

C03 contains a substantial sequence of accepted ADRs covering resource identity, Project, Building, Floor, Unit and related real-estate semantics. However, C03.13 brownfield/schema reconciliation remains explicitly open. Therefore no schema or reservation implementation may be inferred from semantic closure alone.

### Finding F-02 — C04 semantic closure is coherent but has cross-context dependencies that must be verified

ADR-0035 explicitly reconciles C05 Sales, C06 Finance, C07 Marketing and C15 Security/Tenancy. The semantic model is internally coherent, but its deferred registry IDs, legal/privacy execution and authorization details are downstream dependencies. The closure is therefore valid as semantic architecture, not as executable CRM authority.

### Finding F-03 — C05 semantic closure is strong but the critical reservation path remains implementation-gated

ADR-0036 correctly treats Reservation as a critical consistency boundary and rejects UI-only availability, client timestamps and stale release behavior. However, Hold policy, exact approval thresholds, KYC/document prerequisites, registry IDs and concrete PostgreSQL enforcement remain open. These must be reconciled before any claim of executable Sales completeness.

### Finding F-04 — C06 semantic closure is incomplete from an accounting/country-pack perspective by design

ADR-0037 correctly separates commercial obligations, settlement, receipts, ledger truth and commissions. It intentionally defers Algerian statutory accounting, VAT/tax, statutory invoice/receipt rules, payment milestones, chart of accounts and approval delegation. These are legitimate deferrals only if the downstream authority and evidence gates are explicitly tracked.

### Finding F-05 — The most important unresolved cross-context question is not a table design question

The core issue is ownership and event/contract sequencing across:

`Unit → Lead → Offer → Hold → Reservation → Contract → PaymentPlan → Payment → Receipt → Commission`

Each step must have one authoritative owner, explicit preconditions, immutable historical facts where required, event semantics, authorization, and failure/retry behavior.

## 4. C03 — Deep audit matrix

### 4.1 Resource identity

**Accepted:** Unit is canonical development inventory; Listing is brokerage representation; no universal Property aggregate is mandatory.

**Must verify:**
- whether every existing brownfield Apartment maps one-to-one to Unit;
- whether parking/storage are independent inventory resources or Unit accessories in the operating model;
- whether mixed-use and non-building projects are first-class requirements;
- whether a physical resource can change topology without creating historical identity ambiguity.

### 4.2 Project

**Accepted:** Project is first-class and primary development collaboration context.

**Still open:**
- Project lifecycle;
- project type taxonomy;
- geography/address authority;
- inventory-batch semantics;
- project-level pricing authority;
- project inventory access matrix;
- publication workflow.

### 4.3 Building/Floor

**Accepted:** optional according to topology.

**Risk:** optional hierarchy is easy to implement incorrectly as nullable foreign keys without enforcing the allowed topology.

**Required later:** topology invariants and representative tests for:
- Project → Unit;
- Project → Building → Unit;
- Project → Building → Floor → Unit;
- mixed topology;
- non-residential resources.

### 4.4 Unit

**Accepted:** stable technical identity; human reference is mutable; commercial and construction states are independent.

**Critical unresolved points:**
- exact unit/resource taxonomy;
- inventory ownership representation;
- Inventory Batch relationship;
- whether parking/storage can participate in the same reservation/contract path;
- unit-level publication eligibility;
- exact state transition authority.

### 4.5 Pricing

**Accepted:** price is versioned, immutable commercial history; current price is a deterministic projection.

**Required before implementation:**
- interval semantics (`effective_from`, `effective_to` or equivalent);
- overlap prohibition;
- timezone/time precision policy;
- adjustment vs price-version distinction;
- project/unit scope;
- currency precision;
- treatment of future-effective prices;
- historical reconstruction algorithm;
- interaction with accepted Offer, Hold, Reservation and Contract.

### 4.6 Inventory lifecycle

**Accepted:** commercial and construction states are separate; direct raw status mutation is prohibited.

**Required before implementation:** complete transition matrix, guards, actors, events, expiry behavior, stale-worker behavior and projection consistency.

### 4.7 Reservation

**Accepted:** one active winner per Unit; winner is transaction commit; idempotency and database enforcement required.

**Required before implementation:** choose and test the concrete PostgreSQL mechanism only after brownfield persistence is known. Candidate mechanisms must be evaluated against concurrent create, retry, expiry race, stale worker, manager override and transaction failure.

## 5. C04 — Deep audit matrix

### 5.1 Person / Customer

**Accepted:** Person is canonical human identity; Customer is organization-scoped relationship.

**Founder confirmation still valuable:** whether customer relationship semantics should permit simultaneous active relationships across multiple organizations and what cross-organization visibility, if any, ASAS should support for future SaaS.

### 5.2 Lead

**Accepted:** organization-owned; multiple active Leads only for materially distinct engagements; duplicate detection before creation; merge is controlled and auditable.

**Needs operational contract:** exact definition of materially distinct intent/context and the deterministic/fuzzy duplicate review workflow.

### 5.3 Pipeline

**Accepted:** existing 17-stage pipeline remains semantic baseline; Deal is not a separate CRM aggregate.

**Risk to resolve:** exact executable transition matrix, especially Lost reachability, Reopen semantics, track-specific stages and whether a stage change is always a Lead domain event or sometimes a projection of another context.

### 5.4 Ownership/assignment

**Accepted:** Lead Owner ≠ Assigned Agent ≠ Team ≠ Branch ≠ Organization.

**Required:** transfer policy for employee departure, temporary delegation, team reassignment, co-working/collaboration, SLA ownership and historical attribution.

### 5.5 Attribution

**Accepted:** source/campaign/channel/touch/assignment/commercial attribution/commission are distinct.

**Required:** versioned attribution contract and correction semantics, especially the exact snapshot points that become financially authoritative.

### 5.6 Communication

**Accepted:** transport is platform-owned; CRM holds relationship/projection.

**Required:** canonical conversation identity resolution, channel identity collision handling, retention, search classification and WhatsApp-specific evidence/consent rules.

### 5.7 Privacy

Current Algerian primary law has changed since the older ASAS material: Law 25-11 of 24 July 2025 modifies Law 18-07. It explicitly addresses profiling, pseudonymisation and personal-data breaches among other matters. This means the old source-package privacy assumptions cannot be promoted unchanged into the final country pack. Primary-source verification is mandatory. citeturn1search0

### 5.8 AI

**Accepted:** caller-authorized, no direct DB credentials, human approval for sensitive/high-impact actions.

**Required:** exact AI action classification and evaluation/authorization tests.

## 6. C05 — Deep audit matrix

### 6.1 Opportunity

**Accepted:** no independent aggregate initially; Lead remains commercial engagement anchor.

**Required evidence for future change:** independent lifecycle, ownership, authorization and invariants.

### 6.2 Offer

**Accepted:** Sales-owned, versioned, time-bounded, references applicable price version and adjustments, does not reserve inventory.

**Required:** exact Offer versioning semantics; whether acceptance is a state transition on an Offer version or creation of a new accepted commercial fact; cancellation/withdrawal behavior; multiple competing offers on one Unit; customer acceptance evidence.

### 6.3 Hold

**Accepted:** temporary inventory-control state, distinct from Reservation.

**Major unresolved item:** exact TTL and semantics. This must not be left to UI configuration because expiry affects inventory truth.

### 6.4 Reservation

**Accepted:** critical consistency boundary.

**Required:** final transaction contract, exact state transitions, required preconditions, override policy, idempotency scope, expiry semantics and event ordering.

### 6.5 Contract handoff

**Accepted:** Sales owns commercial readiness; Documents owns document lifecycle; Finance owns monetary truth.

**Required:** exact handoff contract and failure semantics: what happens when document generation fails after commercial readiness, when approval is revoked, or when financial prerequisites change.

### 6.6 Brokerage

**Accepted:** Mandate establishes authority; Listing does not.

**Required:** exact mandate states, revocation/expiry effect on active offers/holds/reservations, and who is legally/operationally authorized to proceed after mandate changes.

### 6.7 Legal boundary

Law 11-04 is the primary Algerian source governing promotion immobilière and includes rules relevant to reservation and sale-on-plan. The generic Sales model must therefore remain separate from country-specific legal execution. citeturn1search2

## 7. C06 — Deep audit matrix

### 7.1 Obligation chain

**Accepted:** commercial milestone → PaymentPlan → Installment → Payment → Receipt → Subledger → GL → Reporting.

**Required:** exact point at which an obligation becomes legally/accountingly recognized, and distinction between operational receivable projection and posted accounting fact.

### 7.2 Developer track

**Accepted:** Contract/PaymentPlan is the normal receivable source; construction milestone may gate eligibility but is not itself a ledger posting.

**Required:** exact milestone/contract dependency for VSP and country pack; amendment behavior; cancellation/refund behavior; partial payment allocation.

### 7.3 Brokerage

**Accepted:** commission is Finance-owned; Sales provides attribution/milestone facts.

**Required:** exact entitlement trigger, reversal/cancellation handling, split commissions, clawbacks, approval, payable and paid state model.

### 7.4 Payment

**Accepted:** idempotent settlement; duplicate provider notifications cannot create duplicate settlement facts.

**Required:** external reference uniqueness, partial payment allocation, overpayment, underpayment, refund, failed payment, chargeback/dispute and reconciliation states.

### 7.5 Ledger

**Accepted:** immutable posted entries, double-entry balance, closed periods.

**Required:** chart-of-accounts authority, journal posting authority, period-close/reopen policy, currency conversion policy, audit evidence and country accounting rules.

### 7.6 Reporting

**Accepted:** posted ledger truth is authoritative; projections must be explicitly labelled.

**Required:** reconciliation between operational Sales/CRM figures and Finance figures so executive dashboards do not create competing truths.

## 8. Cross-context invariants that must be locked before implementation

1. One authoritative Unit identity.
2. One active Reservation winner per Unit.
3. No Offer acceptance bypasses Reservation authority.
4. Reservation commercial snapshot is reproducible.
5. Later price versions never rewrite historical transaction economics.
6. Attribution snapshots used by Finance are immutable historical facts.
7. Payment cannot silently alter commercial state without an authorized domain transition.
8. Posted financial facts cannot be rewritten.
9. Commission entitlement cannot be derived from mutable UI assignment alone.
10. Tenant/organization authorization is enforced server-side and at the data boundary.
11. All critical mutations are auditable and idempotent where retries are possible.
12. Events are emitted from committed state and consumers are idempotent.
13. Analytics/search/publication never become competing business authorities.

## 9. External engineering/security validation

OWASP guidance reinforces the ASAS direction that authentication and authorization are distinct, authorization must be server-side, least privilege must apply horizontally and vertically, and authorization tests should be automated. citeturn0search1turn0search3

For multi-tenancy, OWASP recommends deriving tenant context from server-verified identity/membership, enforcing isolation at an appropriate boundary, testing cross-tenant denial using the real request role/connection path, and avoiding RLS bypass roles for normal tenant requests. citeturn0search2

## 10. External accounting validation

IFRS 15 is not being adopted as Algerian statutory accounting authority. It is used only as an external conceptual check: revenue recognition requires identifying the contract, performance obligations, transaction price, allocation and satisfaction of obligations. Principal-versus-agent analysis is also relevant to brokerage economics. Any final Algerian accounting treatment remains country/accounting authority work. citeturn0search0turn0search5

## 11. Closure decision of this review

No new semantic area C03–C06 is being promoted to implementation authority by this review.

C03 remains **OPEN at C03.13**.

C04 remains **SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED**, subject to registry/evidence convergence and Founder confirmation of the high-impact business policies identified below.

C05 remains **SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED**, but its deferred items must be explicitly tracked before contract promotion.

C06 remains **SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED**, with statutory/accounting/country-pack decisions explicitly outstanding.

The next action is not to write schema. It is to obtain Founder decisions on the questions below and then reconcile those answers against the existing ADRs/contracts/registers.

## 12. Founder decision questions — only questions that materially change the architecture

### A. C03 Real Estate

**Q1. Inventory topology:** Should parking/storage be independently reservable/sellable inventory with its own Unit identity, or may they be attached accessories to an apartment Unit in the first canonical model?

**Q2. Inventory batches:** Do you want ASAS to model a real `InventoryBatch/Release` concept now (e.g. tranche/phase/release of units with its own availability/pricing rules), or should batches remain future capability until operating demand proves them necessary?

**Q3. Project ownership:** Can an Organization other than a Developer be the authoritative owner/controller of development inventory in the initial product, or is Developer-owned project inventory the only canonical Track A case?

**Q4. Unit topology changes:** If a promoter changes unit numbering, merges/splits units, or changes building/floor topology after transactions exist, should ASAS preserve the old identity and create successor resources rather than mutate identity? Recommended engineering answer: yes.

**Q5. Price authority:** Should a Project-level base price schedule be allowed to generate Unit prices, with Unit-level overrides, or is every Unit independently priced from the beginning?

**Q6. Reservation target:** In the first commercial product, can a Reservation contain more than one Unit (e.g. apartment + parking), or must one Reservation correspond to exactly one primary Unit with related accessory reservations?

### B. C04 CRM

**Q7. Duplicate leads:** If the same person contacts ASAS about two genuinely different projects, do you want two active Leads linked to one Person, or one Lead with multiple project interests? This changes CRM aggregate semantics.

**Q8. Lead ownership:** Can the Lead Owner and Assigned Agent be different by default, or should they normally be the same unless a manager explicitly separates them?

**Q9. Lost/reopen:** When a Lost lead returns months later for a new project, should ASAS reopen the old Lead or create a new commercial engagement linked to the same Person?

**Q10. Customer conversion:** Should a Person become a Customer only after a Reservation/Contract, or can a qualified CRM relationship itself create Customer status?

### C. C05 Sales

**Q11. Hold:** Should Hold be allowed without an Offer, or must every Hold originate from an accepted/eligible Offer?

**Q12. Hold duration:** Should TTL be globally configured, project-configured, unit-class-configured, or policy-driven per organization/project?

**Q13. Competing offers:** Can multiple active Offers exist simultaneously for the same Unit, provided only one can win Reservation?

**Q14. Reservation payment:** In the Algerian developer workflow, do you want the system to permit Reservation creation before proof of the required reservation payment, with a later payment obligation, or must the reservation payment evidence exist before the Reservation becomes active?

**Q15. Contract readiness:** Should Sales be able to mark a Reservation contract-ready while Documents/KYC evidence is incomplete, or must the system hard-block the transition?

**Q16. Brokerage mandate:** If a Mandate expires after an Offer was accepted but before Reservation, should the system block Reservation automatically, or allow an authorized exception workflow?

### D. C06 Finance

**Q17. Finance scope for MVP:** Do you want ASAS MVP Finance to be a controlled operational collections/payment subledger, or do you want a true general-ledger double-entry accounting capability from the first financial release? The architecture supports both, but implementation scope and controls differ materially.

**Q18. Revenue accounting:** Who is the intended accounting authority for ASAS financial treatment in Algeria — internal accountant/accounting firm, or will the product initially treat ledger outputs as management accounting until statutory mapping is supplied?

**Q19. Partial payments:** Can one Payment be allocated across multiple Installments, and can one Installment be settled by multiple Payments? Recommended answer: yes to both, with allocation records.

**Q20. Refunds/cancellations:** Should refunds be represented as first-class financial facts linked to the original Payment, rather than negative payments? Recommended answer: first-class reversal/refund facts.

**Q21. Commission trigger:** For ASAS brokerage, when should commission become an entitlement: Reservation, Contract signature, first payment, a defined collection percentage, or Sale/closed milestone?

**Q22. Commission clawback:** If a reservation/contract is cancelled after commission entitlement, should the system create a clawback/adjustment fact rather than rewrite the original entitlement? Recommended answer: yes.

### E. Cross-context / product policy

**Q23. Developer vs Brokerage:** Should the initial ASAS canonical model treat Developer Track and Brokerage Track as two commercial policy tracks over the same CRM/Sales/Finance architecture, rather than separate pipelines? Current architecture assumes yes.

**Q24. Country pack:** Should Algeria be the first and only legally active country pack for the initial implementation, with international legal rules explicitly disabled until separately verified?

**Q25. Authority of founder decisions:** Where a founder business rule conflicts with a technical recommendation, should the conference preserve the founder rule and require engineering to design a safe implementation around it unless it violates law/security/integrity? This is consistent with the existing governance model.

## 13. Immediate next step

Do not create Prisma models or migrations from this review.

First obtain answers to Q1–Q25. Then:

`Founder answers → reconcile ADRs → update contracts → reconcile state/event/permission registers → update traceability → verify C03.13/Gates → implementation authorization only after Foundation Gates 00–06.`
