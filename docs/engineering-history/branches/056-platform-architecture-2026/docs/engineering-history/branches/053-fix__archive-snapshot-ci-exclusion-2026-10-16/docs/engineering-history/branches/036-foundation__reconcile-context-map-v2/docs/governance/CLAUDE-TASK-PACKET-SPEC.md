# ASAS Claude Task Packet Specification

Status: CANONICAL FOUNDATION CONTROL

Every implementation task handed to Claude must be representable as a bounded packet. The packet is the bridge between architecture and code.

## Required fields

```yaml
task_id:
phase:
title:
objective:
non_goals: []
authority_sources: []
context_to_load: []
bounded_context:
aggregate:
commands: []
events: []
states: []
permissions: []
tenant_scope:
invariants: []
data_dependencies: []
external_dependencies: []
files_allowed: []
files_forbidden: []
acceptance_evidence: []
verification_commands: []
applicable_gates: []
open_questions: []
stop_conditions: []
```

## Required behavior

- `files_allowed` defines the blast radius. Unlisted files require a plan update.
- `files_forbidden` is a hard stop, not a suggestion.
- `authority_sources` must point to canonical repository artifacts or verified primary research.
- `permissions` and `tenant_scope` are mandatory for protected data.
- `invariants` must be explicit for money, inventory, lifecycle, authorization, and concurrency-sensitive work.
- `acceptance_evidence` must be observable and reproducible.
- `open_questions` may not contain questions answerable from repository evidence or approved research.
- `stop_conditions` define when Claude must stop rather than guess.

## Readiness states

`DRAFT` → `RECONCILED` → `IMPLEMENTATION_READY` → `IN_PROGRESS` → `VERIFIED` → `CLOSED`.

A packet may not enter `IMPLEMENTATION_READY` while a dependency is unresolved, a required source is missing, a load-bearing conflict is open, or required live verification is unavailable.

## Completion requirements

The completion report must include task ID, files/tables/endpoints/events changed, acceptance evidence, deviations, known gaps, follow-up task IDs, skill contribution, lesson entry/no-new-lesson, and failure-mode self-check.
