# ASAS Decision Rules & Change Control

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

## 1. Why this exists

ASAS has a large specification surface. The primary architectural risk is not missing features; it is uncontrolled divergence between Blueprint, contracts, design, code, database reality and product decisions.

This document defines how Claude resolves ambiguity without silently changing the product.

## 2. Authority order

1. Live database reality for pre-existing production tables
2. Blueprint Chapter 39 contracts
3. Blueprint appendices and machine-readable registers
4. Blueprint chapter prose
5. Approved ADRs and founder Product Truth
6. Existing implementation patterns
7. General best practice

When higher authority conflicts with lower authority, do not silently normalize the conflict. Record it and escalate when the conflict changes behavior or data meaning.

## 3. Decision classes

### Class A — implementation detail

Examples: function naming, internal file placement, test helper structure, non-observable refactor.

Claude may decide if contracts remain unchanged.

### Class B — architecture-preserving engineering choice

Examples: library choice within an approved boundary, query optimization, component composition.

Claude may decide, but must document rationale and evidence.

### Class C — product/contract decision

Examples: new business state, new permission, changed workflow, changed financial semantics, new public behavior, new domain event.

Founder decision required before implementation.

### Class D — irreversible/high-risk change

Examples: destructive migration, production data transformation, security exception, tenancy-model change, irreversible external contract change.

Founder approval + explicit recovery plan required.

## 4. Ambiguity protocol

When requirements conflict or are incomplete:

`Locate authority → inspect reality → identify conflict → classify decision → propose smallest safe resolution → obtain approval if Class C/D → record decision → implement`

Never resolve ambiguity by guessing what is easiest to code.

## 5. Schema change protocol

Before changing schema:

- identify whether the object is pre-existing production reality;
- inspect live structure and dependencies;
- compare against Chapter 39 and registers;
- record every divergence;
- define migration/recovery behavior;
- prove the change does not destroy unknown production data.

No migration is accepted merely because Prisma generates SQL successfully.

## 6. Domain change protocol

A new entity, aggregate, command, state, event or invariant requires an explicit contract update first. Then update dependent permission, API, audit, outbox, UX/Figma and test specifications as applicable.

## 7. UX/Figma change protocol

A visual improvement may be implemented without founder approval when it preserves approved behavior. Any change to workflow, permission visibility, destructive-action semantics, data hierarchy or public conversion behavior is a product decision.

Figma must never become a hidden second product specification.

## 8. Research protocol

Use authoritative/current sources for non-trivial framework, platform, security, accessibility and integration decisions. Record source date and the decision it supports. Do not convert vendor marketing claims into architectural requirements without validation.

## 9. Evidence protocol

Use only:

- **VERIFIED** — direct execution evidence exists.
- **FAILED** — expected control/test did not pass.
- **BLOCKED** — cannot execute because a prerequisite is absent.
- **NOT EXECUTED** — intentionally not run yet.

Do not use "done", "works", or "should work" as substitutes for evidence.

## 10. Change propagation checklist

For a material change, inspect all affected surfaces:

`Domain → State machine → Permission → API/Command → DB constraint → Event/Audit → Projection → UX → Figma → i18n/RTL → Tests → Observability → Documentation`

The change is not complete until affected contracts are reconciled.
