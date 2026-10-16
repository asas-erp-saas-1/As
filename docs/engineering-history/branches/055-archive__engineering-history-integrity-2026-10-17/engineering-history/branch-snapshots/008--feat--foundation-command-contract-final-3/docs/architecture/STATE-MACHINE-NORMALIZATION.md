# ASAS State-Machine Normalization Contract

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Authority:** Blueprint Appendix B / `registers/state-machines.json`.

## 1. Purpose

The delivered specification contains 11 canonical lifecycle machines. The implementation must not reconstruct transition behavior from UI labels or generic CRUD status setters.

The register remains authoritative. This document defines the minimum structured representation required before a machine is implemented.

## 2. Canonical machine set

| ID | Machine | Scope |
|---|---|---|
| B.1 | Apartment commercial status | Inventory |
| B.2 | Apartment construction status | Inventory |
| B.3 | Lead lifecycle | CRM |
| B.4 | Lead working state | CRM |
| B.5 | Opportunity pipeline | CRM/Sales boundary as contractually assigned |
| B.6 | Reservation | Sales |
| B.7 | Contract | Sales |
| B.8 | Payment schedule item | Finance |
| B.9 | Approval request | Platform capability attached to owning context |
| B.10 | Studio page version | Website Studio |
| B.11 | Appointment | CRM/Scheduling submodule |

## 3. Required transition record

Every legal edge must be representable as:

```text
machine_id
from_state
to_state
trigger/command
actor_class
permission
minimum_scope
preconditions
reason_required
idempotency_rule
side_effects
audit_action
domain_event
terminal_or_reversible
retry_semantics
conflict/error_code
```

A transition is incomplete if any implementation-critical field is missing.

## 4. Universal transition contract

`authorize → validate preconditions → execute legal edge → persist state → append audit → append outbox event → commit`

The state column is an outcome of the governed transition. It is never a free-form write target.

Illegal transitions return a typed domain error and must not partially mutate the aggregate.

## 5. Special risk classes

### B.1 / B.2 — Inventory
Commercial availability and construction progress are separate axes. A change on one axis must not silently mutate the other.

### B.3 / B.4 — CRM
Lifecycle and working state are distinct dimensions. A working-state action must not fabricate a lifecycle transition merely to satisfy UI convenience.

### B.5 — Opportunity
Pipeline progression must preserve the authoritative stage rules. Loss/withdrawal semantics and sanctioned regression paths must be explicit.

### B.6 — Reservation
The state machine is subordinate to database-level single-winner inventory protection. A legal application transition cannot override a database race result.

### B.7 — Contract
Contract lifecycle must preserve the distinction between preparation, activation and terminal outcomes. Financial collection gates must be enforced by the Finance/Sales contract, not UI assumptions.

### B.8 — Payment schedule item
Schedule state is not receipt state. Payment obligation, receipt and allocation are separate financial facts.

### B.9 — Approval
Approval state is not the same as the business aggregate state. An approval decision authorizes/blocks a governed operation; it must not directly mutate unrelated aggregates.

### B.10 — Studio page version
Published versions are immutable. Rollback creates a governed new version/transition; it is not an in-place edit of published history.

### B.11 — Appointment
Internal appointment truth belongs to ASAS. External calendar state is an integration input/constraint, not the authoritative appointment lifecycle.

## 6. Machine implementation rules

- Exactly one transition service per machine.
- No generic `setStatus()` API for governed aggregates.
- Every transition has an explicit actor and authorization decision.
- Every business transition is auditable.
- Every registered business event is emitted transactionally with the transition when required.
- Retry semantics are explicit; externally retriable commands require idempotency.
- Concurrency-sensitive transitions define the database conflict behavior before UI implementation.
- Terminal states explicitly declare whether reopening is impossible, policy-controlled, or represented by a new aggregate/event.

## 7. Completeness gate

Before Claude implements any machine, the completion report must include:

1. exact register entry used;
2. exhaustive state list;
3. exhaustive legal edges;
4. illegal-edge test strategy;
5. command/permission mapping;
6. event mapping;
7. audit behavior;
8. concurrency behavior where relevant;
9. idempotency behavior where relevant;
10. test evidence.

If the register and prose disagree, Appendix B/register authority wins under the project loading rules; do not silently repair the register from memory.
