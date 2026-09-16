# ASAS Contract Reconciliation Protocol

Status: CANONICAL FOUNDATION POLICY
Scope: Pre-implementation architecture and handoff

## Purpose

Prevent Claude or any implementer from treating architecture prose, registers, task packets, research, and repository artifacts as interchangeable sources of truth.

## Authority order

1. Explicit founder/product decisions recorded in the canonical repository.
2. Approved ASAS architecture blueprint and reconciled contracts.
3. Canonical machine-readable registers and domain contracts.
4. Approved task packets and acceptance criteria.
5. Current repository implementation evidence.
6. External research and provider documentation.
7. Historical or superseded material.

When two artifacts disagree, implementation MUST stop at the affected boundary until the conflict is resolved and recorded.

## Required reconciliation dimensions

For every bounded context and material capability, reconcile:

- terminology and ownership;
- aggregate/entity boundaries;
- commands and actors;
- permissions and tenant scope;
- state machines and legal transitions;
- domain events and causality;
- invariants;
- idempotency requirements;
- concurrency/locking requirements;
- transactional boundaries;
- audit requirements;
- data retention and deletion semantics;
- external side effects and provider commitments;
- financial implications;
- migration implications;
- UI/UX states and role visibility;
- acceptance evidence.

## Conflict classes

### C0 — Editorial
Wording or formatting only. May be normalized without changing meaning.

### C1 — Structural
Different names, IDs, ownership, dependencies, or boundaries. Requires reconciliation before implementation.

### C2 — Semantic
Different business meaning, state transition, authorization, tenant rule, financial treatment, or lifecycle semantics. HARD STOP.

### C3 — Safety-critical
Security isolation, privileged authority, irreversible data mutation, accounting integrity, legal/compliance semantics, or production migration conflict. HARD STOP and explicit approval required.

## Closure rule

A conflict is closed only when the canonical artifact is updated, the superseded interpretation is identified, affected task IDs are traced, and verification requirements are updated.

## Anti-drift rule

Do not solve a contract conflict by silently changing code, creating a local interpretation, or copying one source over another. Resolve the contract first; implementation follows.

## Claude rule

Claude may resolve C0 normalization. Claude may propose resolutions for C1-C3, but MUST NOT silently choose a C1/C2/C3 interpretation. C2/C3 changes require an explicit recorded decision before implementation.

## Required evidence

Every reconciliation pass must record:

- sources inspected;
- conflicts found;
- disposition;
- affected contexts;
- affected tasks/events/permissions/schema;
- verification impact;
- unresolved blockers.

## Definition of done

The reconciliation task is CLOSED only when no unresolved C2/C3 conflict remains in its declared scope, all C1 conflicts have dispositions, and the resulting canonical references are internally traceable.
