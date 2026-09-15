# ASAS Session State

**Repository:** `asas-erp-saas-1/As`  
**Active branch:** `feat/foundation-command-registry`  
**Last updated:** 2026-09-15

## Current state

- Canonical project: `https://github.com/asas-erp-saas-1/As`.
- Historical `asas-erp-saas-1/Asas-website` is NOT part of this project.
- Repository remains documentation/bootstrap-only; no application implementation has been added.
- Supabase/Vercel project identity is not yet verified; Phase P/0 and Phase 1 remain blocked.
- Architecture uses nine canonical bounded contexts. HR/People is currently an enterprise capability, not silently a tenth bounded context.

## New closure artifacts in this pass

- `docs/audit/STATE-EDGE-CLOSURE.md` — exact normative state edges, source-open semantics, and implementation gate for B.1–B.11.
- `docs/audit/COMMAND-CONTRACT-CLOSURE.md` — canonical mutation contract surface and 50-permission command obligations.
- `docs/audit/IDEMPOTENCY-CATALOG.md` — idempotency classes, P0 mutation inventory, replay/conflict semantics, tenant/security boundary, and required evidence.
- `docs/audit/CONCURRENCY-RACE-CATALOG.md` — P0 concurrency hazards and deterministic single-winner/failure contracts.
- `docs/audit/OUTBOX-INBOX-CONTRACT.md` — atomic outbox/inbox, ordering, retry, DLQ and replay contract.
- `docs/audit/FINANCE-CORRECTNESS-CONTRACT.md` — finance invariants, money, double-entry, immutability, payment/allocation, period-close and failure semantics.
- `docs/audit/B4-LEAD-WORKING-STATUS-DECISION-GATE.md` — evidence boundary for B.4, explicit supported semantics, unresolved legal edges, and the minimum founder/product decision packet.
- `docs/audit/STATE-TRIGGER-PRECONDITION-CLOSURE.md` — trigger/precondition closure pass for B.1–B.11, preserving source-open semantics and cross-machine invariants.
- `docs/audit/STATE-TRIGGER-PRECONDITION-CLOSURE-B2-B3-B5.md` — focused evidence-boundary closure for B.2, B.3 and B.5, including source conflicts and exact remaining contract gaps.

## Verified work completed

- Re-read the authoritative v1.6.1 state-machine register: 11 machines.
- Re-read the authoritative v1.6.1 blueprint passages for CRM dual-track lifecycle, inbound engagement behavior, scoring/SLA behavior, and CRM engineer constraints.
- Closed B.1 exact registered edges and B.10 version semantics.
- Closed the authoritative lifecycle/order portions of B.2, B.3, B.5, B.6, B.7, B.8, B.9 and B.11 without inventing unspecified edges.
- Formalized the maximum supported trigger/precondition semantics for B.1–B.11 without promoting candidate event names into causal law.
- B.4 remains RED: the authoritative source defines the state vocabulary, rep-control model, and inbound-engagement auto-promotion to `CONNECTED`, but does not enumerate its legal graph.
- Formalized the B.4 evidence boundary and extracted the minimum decision questions needed to make the graph normative; no inferred transition was promoted into product truth.
- Added focused B.2/B.3/B.5 closure: B.2 exposes a building-scoped milestone trigger against an apartment-scoped aggregate; B.3 lifecycle shape is closed but exact triggers/preconditions remain source-open; B.5 stage shape/probabilities and sanctioned offer-expiry regression are closed, while stage exit criteria and cross-context mappings remain open.
- Preserved source-open items for milestone mapping, lifecycle qualification, opportunity stage exit criteria, reservation cross-aggregate atomicity, legal validation fields, finance timing/policy, approval SLA/delegation, and appointment graph/calendar consistency.
- Formalized idempotency as a P0 correctness contract.
- Formalized concurrency/race hazards and outbox/inbox reliability contracts.
- Formalized finance correctness as a P0 contract: integer DZD centimes, double-entry balance, immutable posted records, compensating correction, duplicate-payment protection, allocation bounds, period-close boundary and explicit accounting-policy OPEN items.
- No application code, schema, migration, deployment, production mutation, reset or force-push was executed.

## Current verdict

**FOUNDATION ARCHITECTURE: OPEN — trigger/precondition semantics are materially deeper, but executable implementation remains gated by unresolved authoritative/product contracts.**

The principal blocker remains B.4. Other material OPEN policy areas remain: approval SLA/delegation, finance policy, time semantics, PII retention/public-private projections, AI egress/governance, exact cross-aggregate transaction boundaries, HR ownership/state, and platform identity/reality verification.

## Remaining closure work — ordered

1. Founder/product closure of B.4 exact graph.
2. B.2 milestone taxonomy and edge predicates.
3. B.3 lifecycle trigger/precondition matrix.
4. B.5 stage exit criteria and offer-expiry target semantics.
5. B.6 reservation/hold cross-aggregate transaction semantics.
6. B.7 exact legal-generation validation predicate and completion semantics.
7. B.8 due/grace/invoice/waiver/cancellation policy.
8. B.9 approval SLA/delegation/escalation/expiry semantics.
9. B.11 appointment cancellation/reschedule/check-in/calendar semantics.
10. Resolve canonical command IDs and complete command ↔ permission ↔ ABAC ↔ approval ↔ state-edge ↔ event mappings.
11. Close exact idempotency storage/retention/canonicalization policy where still OPEN.
12. Close exact concurrency implementation constraints after live schema reality inspection.
13. Close PII/data classification, retention/anonymization and public/private projection contract.
14. Close AI tool/action registry, data-egress policy and governed mutation path.
15. Close J1–J12 golden-journey traceability.
16. Close Figma action mapping and package verifier reconciliation.
17. Close canonical HR ownership/state semantics without creating an unauthorized tenth bounded context.
18. Expand 22 personas × 20 pillars into implementation-ready task packets only after upstream contracts are authoritative.
19. Phase P/0 planning, still gated by platform identity/reality verification.
20. Only after the above gates: executable command kernel and application implementation.

## Active workstream

**Foundation architecture, adversarial research, contract normalization and Claude handoff hardening — documentation/design only.**

## Explicit execution boundary

Do not create application code, database schema, migrations, deployments or production changes in this foundation-only workstream.

## Resume rule

When the founder says `أكمل عملك على المسار`, verify `asas-erp-saas-1/As`, load this state plus the closure/audit/register/autonomy/build-order/persona-pillar contracts, then continue the highest-priority unblocked foundation task without restarting the project.
