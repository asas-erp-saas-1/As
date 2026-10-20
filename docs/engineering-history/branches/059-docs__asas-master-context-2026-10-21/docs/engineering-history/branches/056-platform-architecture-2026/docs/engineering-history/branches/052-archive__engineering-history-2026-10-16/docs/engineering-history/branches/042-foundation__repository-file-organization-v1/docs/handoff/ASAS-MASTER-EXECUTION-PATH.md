# ASAS Master Execution Path

Status: CANONICAL HANDOFF CONTROL
Repository: `asas-erp-saas-1/As`
Implementation state: PRE-IMPLEMENTATION FOUNDATION

## Mission
Prepare and govern the ASAS Real Estate OS so an implementation agent can build it incrementally without inventing business semantics, bypassing security boundaries, or confusing research with canonical truth.

## Non-negotiable sequence
1. Establish repository identity and governance.
2. Reconcile product, architecture, domain contracts, registers, and repository reality.
3. Define bounded contexts and ownership.
4. Close command/event/state/permission/data contracts for the implementation slice.
5. Build the task dependency graph and task packets.
6. Establish CI and verification gates appropriate to the actual stack.
7. Define database/migration safety contracts before schema implementation.
8. Define UX/UI contracts and Figma handoff for the affected slice.
9. Authorize implementation only for a bounded, verified slice.
10. Implement on a short-lived branch.
11. Verify correctness, security, tenancy, concurrency, idempotency, migration safety, UX states, and external side effects.
12. Produce evidence and open a PR.
13. Review and merge only when all applicable gates are closed.
14. Update current session state and task graph before starting the next slice.

## Product execution order
- Platform Kernel: identity, tenancy, organizations, authorization, audit, files, notifications, configuration.
- Real Estate Core: developers/promoters, projects, buildings, units, inventory, pricing, availability.
- CRM & Sales: leads, contacts, opportunities, activities, visits, options, reservations, contracts.
- Finance: receivables, payments, allocations, accounting controls, financial auditability.
- Operations: construction/project progress, delivery, handover, SAV.
- Digital Experience: website, CMS/page builder, property/project pages, forms, CTA, WhatsApp, SEO, analytics.
- Integrations: maps, calendar, communications, social channels, identity/payment/document providers where justified.
- Analytics: operational, commercial, financial and executive reporting.

This is a sequencing model, not permission to implement every area at once.

## Implementation slice rule
A slice is implementation-ready only when its task packet identifies bounded context and owner, objective/non-goals, authoritative contracts, dependencies, actors and authorization, tenant/data boundary, legal state transitions, commands/events, invariants, transaction boundary, idempotency/concurrency strategy where applicable, audit, external effects/failure handling, migration impact, UX/accessibility/localization impact, acceptance tests/evidence, and rollback/recovery where applicable.

## Hard stops
Implementation MUST stop for unresolved affected-scope conflicts involving business semantics, privileged authorization, tenant isolation, financial mutation, illegal state transitions, cross-context write ownership, destructive migrations, external side effects, critical invariant evidence, task dependencies, or repository reality contradicting declared architecture.

## Claude autonomy
Claude may inspect, research, propose, implement, test and refactor within an authorized task boundary. It may not silently redefine product scope, canonical business semantics, tenant model, financial invariants, security policy, or irreversible data operations. C0 may be normalized. C1 may be proposed and recorded. C2/C3 requires explicit recorded resolution before implementation.

## Closure
A task is CLOSED only after implementation is complete for declared scope; applicable automated and adversarial tests pass; security/tenant isolation and relevant data/migration/UX/external effects are verified; evidence and residual risks are recorded; task status and current session state are updated; and the PR is reviewable.

## Resume protocol
When the operator says `أكمل عملك على المسار` / `continue the path`:
1. Read this file.
2. Read `docs/handoff/CURRENT-SESSION-STATE.md`.
3. Read governance and current task graph.
4. Inspect the repository at the current target ref; do not trust stale conversation state.
5. Find the highest-priority task that is not CLOSED.
6. Verify prerequisites and evidence.
7. Continue from the first incomplete gate.
8. Never restart completed work without evidence that it is invalid.
9. Never mark a gate green merely because documentation exists.

## Authority rule
This path governs execution order. It does not override higher-authority product decisions or reconciled domain contracts. If a contradiction exists, invoke the Contract Reconciliation Protocol and stop the affected implementation slice.

## Canonical checkpoint rule
`docs/handoff/CURRENT-SESSION-STATE.md` is the sole current execution checkpoint. Historical and compatibility session-state artifacts are retained only for provenance/compatibility and MUST NOT be referenced by active automation, documentation, or task packets. New automation, documentation, or task packets MUST reference `CURRENT-SESSION-STATE.md`.
