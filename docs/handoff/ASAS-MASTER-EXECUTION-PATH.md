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
14. Update session state and task graph before starting the next slice.

## Product execution order

The platform is treated as one integrated product, not unrelated applications:

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

A slice is implementation-ready only when its task packet identifies:

- bounded context and owner;
- objective and explicit non-goals;
- authoritative contracts;
- dependencies and predecessor tasks;
- actors and authorization policy;
- tenant/data boundary;
- legal state transitions;
- commands and events;
- invariants;
- transaction boundary;
- idempotency and concurrency strategy where applicable;
- audit requirements;
- external side effects and failure handling;
- migration/data impact;
- UX states and accessibility/localization impact;
- acceptance tests and evidence;
- rollback/recovery strategy where applicable.

## Hard stops

Implementation MUST stop when any of these is unresolved in the affected scope:

- conflicting business semantics;
- undefined privileged authorization;
- unclear tenant isolation;
- unsafe financial mutation semantics;
- illegal state transition;
- ambiguous ownership of a cross-context write;
- destructive migration without a reviewed recovery plan;
- external side effect without idempotency/retry semantics when required;
- missing acceptance evidence for a critical invariant;
- task dependency not closed;
- repository reality contradicts the declared architecture.

## Claude autonomy

Claude may inspect, research, propose, implement, test and refactor within an authorized task boundary. It may not silently redefine product scope, canonical business semantics, tenant model, financial invariants, security policy, or irreversible data operations.

For C0 editorial conflicts it may normalize. For C1 structural conflicts it proposes and records a resolution. C2 semantic and C3 safety-critical conflicts require explicit recorded resolution before implementation.

## Closure

A task is CLOSED only after:

- implementation is complete for its declared scope;
- applicable automated tests pass;
- adversarial checks pass;
- security and tenant isolation are verified;
- data/migration safety is verified where relevant;
- UX states are verified where relevant;
- evidence is recorded;
- residual risks are documented;
- task status is updated;
- session state is updated;
- the PR is reviewable.

## Resume protocol

When the operator says `أكمل عملك على المسار` / `continue the path`:

1. Read this file.
2. Read `docs/handoff/SESSION_STATE.md`.
3. Read governance and current task graph.
4. Inspect the repository at the current target ref; do not trust stale conversation state.
5. Find the highest-priority task that is not CLOSED.
6. Verify its prerequisites and current evidence.
7. Continue from the first incomplete gate.
8. Never restart completed work without evidence that it is invalid.
9. Never mark a gate green merely because documentation exists.

## Authority rule

This path governs execution order. It does not override higher-authority product decisions or reconciled domain contracts. If a contradiction exists, invoke the Contract Reconciliation Protocol and stop the affected implementation slice.
