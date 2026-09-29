# ASAS C03–C06 Deep Closure Decisions — 2026-09-27

**Status:** ACTIVE DEEP-REVIEW / SEMANTIC BASELINE, NOT IMPLEMENTATION AUTHORIZATION
**Branch:** `platform-architecture-2026`
**Scope:** C03 Real Estate, C04 CRM, C05 Sales, C06 Finance
**Authority:** Engineering Conference + V3 governance. Founder/product intent is represented by the established ASAS operating direction. Legal/accounting statutory interpretation remains authority-gated.

## 0. Why this record exists

Previous conference checkpoints moved C04–C06 to semantic closure too quickly. This record deliberately performs a second-pass closure audit before any implementation authorization. A semantic decision is accepted only when:

`decision → cross-context dependency → invariant → contract consequence → registry consequence → test/evidence consequence → explicit deferral/authority`

No database schema, migration, RLS policy, production mutation or financial posting is authorized by this record.

## 1. Governing method

The V3 operating loop is:

`L0 Reality Lock → L1 Locate → L2 Load → L3 Plan → L4 Verify → L5 Implement → L6 Prove → L6.5 Converge → L7 Report`.

The conference method remains:

`Question → research → alternatives → failure modes → ASAS source validation → provenance/authority → decision → contract/ADR/register → verification → checkpoint`.

The governance hierarchy is:

`Founder/Product Constitution → Architecture → Contracts → Registers → Repository → Runtime → Evidence`.

For brownfield reality, live database introspection outranks documentation. For unfamiliar external facts, primary official sources outrank secondary sources. The project definition of done requires acceptance evidence, green relevant gates, and an L7 report; no completion claim is valid without evidence.

## 2. Deep review result

### C03 — Real Estate

**Decision:** Retain the C03 semantic baseline. Do not reopen the already sound conceptual hierarchy merely to create more entities.

Canonical development topology:

`Organization → Project → Building? → Floor? → Unit`

`Building` and `Floor` are optional topology levels. `Unit` is the canonical development inventory resource.

Brokerage topology remains separate:

`Owner → Mandate → Listing → underlying property interest`

`Listing ≠ Unit ≠ Property ≠ Mandate`.

Identity, ownership, visibility, allocation, reservation control, publication and finance remain separate authority dimensions.

#### Q1 — Parking/storage
**Decision:** Treat independently salable parking/storage as **ancillary inventory items** within the Inventory bounded context, not as a new bounded context and not as generic Units. An ancillary item has stable identity, commercial availability and its own price/version history. It may be bundled into the same commercial transaction/reservation package as a Unit when policy permits, but it does not alter the Unit single-winner invariant.

**Why:** Parking can be independently priced/allocated/transferred in real projects. Modeling it as an ordinary Unit would pollute Unit semantics; modeling it as a separate bounded context would be architecture inflation. The Inventory context can own both primary development Units and ancillary inventory while preserving distinct resource types.

**Implementation consequence:** This becomes an Inventory contract/schema question in C03.13; do not create a universal `Resource` table solely to solve this.

#### Q2 — Inventory batches/releases
**Decision:** Support a `Release/InventoryBatch` concept as an **optional Inventory control construct**, not as a mandatory parent of every Unit. It governs commercial release/visibility/pricing/availability policy for a set of inventory items. A Unit remains independently authoritative.

**Why:** phased commercial releases are normal in development sales, but forcing every Unit into a batch would create artificial coupling and make historical inventory awkward. Batch membership is policy metadata; Unit identity and reservation remain independent.

#### Q5 — Pricing authority
**Decision:** Use a two-level model without creating two competing prices: a project-level **price policy/schedule** may provide defaults; the **Unit PriceVersion** is the authoritative commercial fact applicable to a Unit at a given time. An explicit Unit override creates a versioned Unit fact with provenance to its policy/source. There is never a mutable scalar `current_price` that rewrites history.

**Invariant:** At a specified effective timestamp, exactly one applicable authoritative Unit price may win under the configured overlap policy. Overlapping effective versions are rejected unless explicitly modeled as non-competing scopes.

#### Q6 — Reservation with apartment + parking
**Decision:** A Reservation may contain a **commercial reservation package** containing one primary Unit and zero or more eligible ancillary inventory items. The Unit remains the primary reservation consistency boundary. Each ancillary item has its own availability constraint; the transaction succeeds only if all required components can be committed atomically or the policy explicitly permits partial allocation (default: no partial success for a user-visible reservation package).

**Why:** this matches real commercial bundles while avoiding a fake rule that one reservation must equal exactly one physical asset.

### C04 — CRM

**Decision:** Retain ADR-0035 semantics, but deepen the identity/engagement boundary.

#### Q7 — One person, multiple projects
**Decision:** One canonical Person can have multiple Leads when they represent materially distinct active commercial engagements. The Lead is the engagement record; Person is identity. Interest in multiple units/projects can be represented on the same engagement when it is one buying journey, otherwise separate Leads require explicit commercial-context justification.

**Duplicate rule:** no blind `one person = one lead` constraint and no unrestricted duplicate creation. Detection uses Person + Organization + active commercial intent/context.

#### Q9 — Lost then returns
**Decision:** A returned customer should **reopen an existing Lead only when the business relationship is materially the same engagement and policy permits reopening**. If the return is a materially new engagement (new project/mandate/intent/context or a completed prior engagement), create a new Lead linked to the same Person and preserve the historical Lost lead.

`LOST` is therefore a historical pipeline outcome, not a Person identity state.

#### Q10 — When Person becomes Customer
**Decision:** Do not convert/rename Person. Customer is an organization-scoped relationship/role created when a defined commercial/customer milestone establishes the relationship according to policy. Person remains the canonical human identity before, during and after customer status.

**Default engineering trigger:** contract/customer establishment may create the Customer relationship; a mere lead or visit must not silently create a Customer unless product policy explicitly requires prospect-customer modeling.

### C05 — Sales

**Decision:** Retain ADR-0036, but explicitly model the commercial transaction as a sequence of independent facts rather than one mega-aggregate.

`Lead → Offer → Hold? → Reservation → Contract readiness → Finance obligations`

#### Q11 — Hold without Offer
**Decision:** A Hold may be created without a formal Offer **only through an explicit authorized operational hold action** (e.g. internal temporary control) and must carry actor, reason, TTL/policy and audit. Customer-facing commercial reservation must not bypass the Offer/required commercial terms policy.

**Default:** normal customer path is Offer → Hold/Reservation; exceptional internal hold is policy-controlled.

#### Q12 — Hold TTL
**Decision:** TTL is **policy configuration**, not a UI constant. Default hierarchy: project/organization policy → country/product policy → platform safe default. The platform must record the policy version used at creation. A hold never gains an unlimited lifetime by missing configuration.

#### Q13 — Multiple Offers on one Unit
**Decision:** Multiple Offers may exist concurrently because Offers are proposals, not locks. They may be submitted to different actors/clients, subject to commercial policy. Only one winning reservation may control the Unit. Acceptance of an Offer does not itself win inventory.

This preserves the distinction:

`Offer ≠ Hold ≠ Reservation`.

#### Q14 — Reservation before payment
**Decision:** Separate **commercial reservation creation** from **payment settlement**. The platform may create a Reservation only when its configured legal/commercial preconditions are satisfied; payment proof is a separate fact. For Algerian developer/off-plan flows, executable payment rules must be derived from the current country/legal pack and contract model rather than hard-coded from a generic Sales rule. No Finance entry is created merely because a Reservation exists.

This avoids turning a legal assumption into an architecture invariant.

#### Q15 — KYC/documents as hard block
**Decision:** Required documents are policy-driven. Some documents may be hard preconditions for a specific transition (e.g. contract-ready), while others are warnings or post-transaction obligations. The state machine must distinguish:

`required evidence missing → transition denied`

from

`recommended evidence missing → transition allowed + task/escalation`.

The exact Algeria legal document list is C15/country-pack authority, not a generic Sales constant.

#### Brokerage authority

A Listing is actionable only while the applicable Owner/Mandate authority is valid. Mandate expiry/revocation blocks future commercial actions; historical facts remain immutable.

### C06 — Finance

**Decision:** Retain ADR-0037. Finance is an integrity boundary, not a mirror of CRM/Sales.

#### Q17 — Finance MVP scope
**Decision:** Build a **real financial integrity core**, not a fake accounting dashboard. The first implementation slice should support contractual obligations, installment schedules, payments, allocations, receipts, reconciliation and an immutable double-entry posting boundary. Full statutory accounting/reporting/tax localization is a country/accounting pack layered on top.

This is deliberately narrower than a complete national accounting ERP while still preventing non-auditable money handling.

#### Q19 — Payment allocation cardinality
**Decision:** Support both:

`Payment → many Installments`

and

`Installment → many Payments`

through an explicit allocation entity/fact. Partial payments and one payment covering several obligations are normal. Allocation must be immutable once financially posted, with corrections represented as new reconciliation/allocation facts.

#### Q21 — Commission entitlement
**Decision:** Commission entitlement is policy-driven and versioned. There is no universal ASAS rule such as reservation = commission. The default architectural trigger is the **configured qualifying commercial milestone plus any collection/contract conditions defined by the CommissionPlan**. Finance snapshots the policy and attribution facts at entitlement time.

Recommended default for ASAS developer/brokerage operations: entitlement should normally require the milestone defined in the commercial agreement and, where the agreement makes payment/collection a condition, the required collection threshold. Exact timing remains project/contract/country policy.

#### Q22 — Cancellation after commission entitlement
**Decision:** Never rewrite the historical entitlement. Create a governed adjustment/reversal/recovery fact according to the CommissionPlan. The lifecycle is:

`Entitled → Payable → Paid → Adjustment/Recovery (if later event requires it)`.

The original entitlement remains auditable. Whether money is clawed back, offset against future commissions or treated as a company loss is a policy/accounting decision, not a generic domain mutation.

## 3. Cross-context invariants discovered during review

### Commercial truth

`CRM Lead` identifies commercial engagement.

`Sales Offer/Hold/Reservation` controls commercial progression.

`Inventory` controls resource availability.

`Documents` controls document artifacts.

`Finance` controls monetary facts.

No context may silently become authoritative for another context's fact.

### Reservation

`Reservation success = committed transaction + single-winner inventory constraint + immutable commercial snapshot + outbox event`.

Search, analytics, cache, UI and notification state are projections.

### Pricing

`Price policy → applicable Unit PriceVersion → commercial snapshot`.

Later price versions never rewrite accepted economic facts.

### Attribution

`source ≠ campaign ≠ assignment ≠ commercial attribution ≠ commission`.

Historical attribution used by Finance/Analytics is reconstructable.

### Tenant security

Tenant context must be derived from server-verified identity/membership, propagated through all tenant-sensitive layers, and re-authorized for delayed jobs. OWASP recommends defense-in-depth across database, cache, storage, queues and asynchronous work, and explicit negative-path cross-tenant tests. See research record for external references.

## 4. Questions intentionally NOT guessed

These remain Tier-C/D or external-authority items and are not silently invented:

1. Exact Algerian statutory accounting treatment for each transaction class.
2. Exact VAT/tax treatment.
3. Exact legal document/KYC checklist for each regulated transition.
4. Exact statutory invoice/receipt wording and numbering rules.
5. Exact professional registry requirements beyond verified legal authority.
6. Exact CommissionPlan percentages, clawback policy and payout timing for a specific commercial contract.
7. Exact reservation/payment legal sequence where current country-pack evidence is required.
8. Exact approval thresholds where the business has not yet specified them.

These are not engineering uncertainty. They are authority dependencies and must be represented as such.

## 5. Closure standard for C03–C06

A context cannot be marked fully closed merely because an ADR exists. Full closure requires:

- semantic decisions reconciled with neighboring contexts;
- canonical contract candidate;
- event/state/permission IDs reconciled against registers;
- domain invariants mapped to tests;
- data impact identified;
- brownfield reality reconciled where persistence is affected;
- security/tenant impact reviewed;
- external/legal/accounting facts recorded with source/date/authority;
- rejected alternatives recorded for material choices;
- checkpoint updated;
- implementation gate green before code/migration.

Therefore the current state is intentionally:

`C03 = semantic baseline + C03.13 OPEN`

`C04 = semantic baseline, registry/evidence convergence OPEN`

`C05 = semantic baseline, registry/evidence convergence OPEN`

`C06 = semantic baseline, statutory/accounting authority + registry/evidence convergence OPEN`

This is a stricter and more accurate status than treating the ADRs as implementation-ready.

## 6. Research basis

Primary/authoritative external research used in this review includes:

- Journal Officiel de la République Algérienne, Law 25-11 of 24 July 2025 amending Law 18-07 on personal data protection: current privacy baseline; used to prevent obsolete 18-07-only assumptions.
- Journal Officiel material implementing Law 11-04, including the prescribed reservation and sale-on-plan contract framework and payment limits: used to keep Algerian developer legal execution in the country-pack/legal authority boundary rather than hard-code generic Sales semantics.
- OWASP Multi-Tenant Application Security Cheat Sheet: tenant context must be server-verified; RLS is defense-in-depth; tenant isolation must be tested across database, cache, storage, asynchronous work and deployed request roles.
- OWASP Authorization Regression Testing guidance: authorization rules should be represented as a machine-readable Actor/Resource/Action matrix and continuously regression-tested, including cross-tenant and privilege-escalation cases.

## 7. Next execution order — intentionally serial

The requested execution mode is **serial, not parallel**:

1. **GATE-00** — close platform/runtime identity.
2. **GATE-01** — close canonical artifact ownership/convergence.
3. **GATE-02** — close nine-context vs historical-module conflict.
4. **GATE-03** — verify live database reality and reconcile C03.13.
5. **GATE-04** — establish security/RLS baseline from verified runtime.
6. **GATE-05** — make architecture gates executable in CI.
7. **GATE-06** — repository hygiene and branch/control-plane evidence.
8. **GATE-07** — implementation authorization.
9. Resume implementation only after GATE-00..06 are green.
10. Then execute conference slices in dependency order: C03.13 → C04 contract convergence → C05 contract convergence → C06 finance contract/country-pack convergence → C07 onward.

No later gate or domain implementation is declared green merely because a prior document exists.
