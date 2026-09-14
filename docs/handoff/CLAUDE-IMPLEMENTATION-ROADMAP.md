# ASAS Claude Implementation Roadmap

This is the execution map to be used after founder GO. It intentionally contains no implementation code.

## Gate 00 — Read / measure / reconcile

**Goal:** prove Claude understands the package and repository.

Evidence:
- package file inventory
- measured Blueprint page count
- measured task/event/permission/state-machine/schema/component counts
- authority hierarchy acknowledged
- known package consistency gaps recorded
- repository reality report
- platform identity report

Stop if core evidence is missing.

## Gate 01 — Platform identity and protection (Phase P)

Execute T-P.1 → T-P.9 exactly in order.

Critical rule: T-P.2 protects the existing production database before any other production-project configuration. Phase P must not alter production schema.

Exit evidence:
- protected GitHub main
- restore drill
- isolated dev DB
- least-privilege DB roles
- Vercel wiring
- environment/secrets matrix
- CI gates
- release workflow
- end-to-end trace

## Gate 02 — Phase 0 foundation

Execute T-0.1 → T-0.11.

Key outcomes:
- application skeleton
- forensic schema reality
- Prisma reconciliation
- zero-DDL migration baseline
- CI/CD drift protection
- shared kernel
- tenant plumbing
- cross-tenant attack gate
- transactional outbox
- observability baseline

No feature phase should proceed if tenant isolation or migration discipline is unproven.

## Gate 03 — Phase 1 IAM

Execute T-1.1 → T-1.9.

Order:
1. permission registry
2. roles/grants/scopes
3. organization hierarchy/users
4. secure sessions/login
5. centralized AuthorizationService
6. append-only audit chain
7. route→permission registry
8. permission-matrix release gate
9. audited impersonation

Exit condition: all admin routes permission-mapped, audit chain verified, session/lockout behavior tested.

## Gate 04 — Phase 1.5 authentication hardening

Complete MFA/security hardening according to the v1.6.1 register before treating IAM as mature.

## Gate 05 — Inventory OS

Execute Phase 2 in task order.

Special dependency:
- design system work T-2.11–T-2.14 is not a side project; it becomes the UI foundation inherited by every later phase.

Inventory engineering:
- floor plans
- dual-axis status
- safe price fields
- holds
- milestones
- media normalization
- availability projection
- inventory integrity gates
- hierarchy/unit workspaces

## Gate 06 — UX/UI system stabilization

Although T-2.11–T-2.14 are registered in Phase 2, the implementation operator must apply the design system to every subsequent UI task.

Required:
- tokens compiled
- component registry implemented
- i18n/RTL formatter layer
- Figma mapping
- screenshot baselines
- axe in journeys
- client JS budget
- visual regression gate

## Gate 07 — CRM

Lead identity → lifecycle → working state → ownership → activity → appointments → opportunity → attribution.

The CRM must consume canonical inventory/project/unit context rather than duplicating it.

## Gate 08 — Sales OS

Offer → negotiation → reservation → contract.

Reservation is race-safe and state-machine controlled.

## Gate 09 — Finance OS

Payment plan → collection → receipt → allocation → commission → ledger → reporting.

No mutable posted ledger.

## Gate 10 — Studio

Build a professional real-estate publishing system with:

- project templates
- unit/project content
- media
- floor-plan blocks
- CTA blocks
- contextual WhatsApp
- lead forms
- SEO
- preview
- versioning
- approval/publish
- rollback
- analytics hooks

Studio must remain separated from operational truth while binding to it through governed references.

## Gate 11 — Marketing / scheduling / automation

Integrate attribution, campaigns, messaging, calendar sync, workflows and approvals without bypassing the core domain model.

## Gate 12 — Mobile Field OS

Field workflows must optimize for speed, intermittent connectivity, phone ergonomics and immediate next actions.

## Gate 13 — Intelligence

AI is added after data/event/auth foundations are trustworthy.

AI features must inherit tenant/permission controls and use governed domain/application services for actions.

## Gate 14 — SaaS platform

Multi-workspace/multi-company/group features remain gated until the core operating system is stable enough to justify the additional tenancy/control-plane complexity.

---

# Cross-cutting gates that apply to every phase

## Security gate

No unresolved critical authorization, tenant isolation, secret leakage, injection, webhook or file-upload issue.

## Data gate

No unapproved destructive migration. Every schema change has a migration plan, rollback/recovery story and drift evidence.

## UX gate

No critical user journey ships with only a happy path. Arabic RTL + French/English LTR are part of acceptance.

## Figma gate

For Figma-designed UI, inspect the actual node/design context and map variables/components before implementation. Validate runtime against design.

## Accessibility gate

Keyboard path + semantic structure + axe + focus management + reduced motion + status not color-only.

## Performance gate

Relevant client JS, bundle, CLS and route budgets are measured.

## Observability gate

Critical mutations have sufficient logs/traces/audit/events to diagnose failure.

## Evidence gate

Every task PR links exact evidence. "It works" is not evidence.

---

# Example task packet Claude should produce

## Before implementation

```text
Task: T-2.10 Inventory admin screens
Contract sources: Appendix J, U, V, permissions registry, state machines
Reality inspected: current schema + implemented modules + design registry
Scope: hierarchy browser + unit workspace + floor-plan editor
Security: inventory permissions + tenant scope
UX: AR RTL, FR/EN LTR, 360/768/1280+, loading/empty/error/no-permission
Figma: selected nodes/components/variables inspected
Tests: permission matrix, component contracts, axe, visual snapshots, e2e
Evidence: listed before implementation
Rollback: revert task-scoped commit; no destructive DB change
```

## After implementation

```text
Changed: exact files/modules
Tests: exact commands + result
DB: migration/diff status or N/A
Security: negative tests
UX: viewport + locale matrix
Accessibility: axe + keyboard result
Visual: screenshot comparison result
Observability: events/logs/probes
Risks: remaining known risks
Docs: ADR/research/skill/lesson updates
```

---

# Founder review checkpoints

Founder approval is required before:

- platform spend or plan changes
- production data transformation
- new domain module/event
- product-facing behavior that was not already specified
- legal/compliance interpretation
- irreversible architecture change
- security exception

The implementation operator should batch these decisions into concise decision packets rather than interrupting every routine implementation detail.
