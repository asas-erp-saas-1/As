# C03 — Project Identity, Ownership & Lifecycle Reconciliation

Status: OPEN — deep closure required
Date: 2026-09-29

## 1. Source basis

This reconciliation is based on the canonical ASAS Architecture V3, the historical ASAS Enterprise Domain Model, and the existing C03 source corpus. Where the sources do not establish a fact, this document records the gap rather than inventing a decision.

## 2. Identity

### Established
- Project is a canonical Real Estate Core object.
- V3 hierarchy is `Organization → Project → Building → Floor → Unit`.
- V3 classifies Project as master data.
- Project is distinct from Listing, Property, and Unit.
- V3 ontology explicitly models `Project → contains → Building`.

### Not yet established
- Canonical Project identifier format.
- Whether a human-facing project reference is globally unique or tenant-scoped.
- Whether an external developer/project identifier is retained as a separate reference.
- Whether Project identity can ever be merged, split, or transferred.

Decision: KEEP OPEN. Do not invent an ID format or persistence key in the conference layer.

## 3. Ownership and tenancy

### Established
- V3 has Organization at the top of the Real Estate hierarchy.
- Every tenant-owned SaaS record requires a tenant boundary across database, cache, search, storage, events, jobs, analytics, AI memory, logs, and integrations.
- Historical Domain Model used Agency as the tenant root and AgencyId on aggregates.

### Reconciliation
The historical `Agency` terminology is retained as historical evidence only. V3 is the current architectural authority and uses `Organization` in the canonical hierarchy. The conference must not silently convert AgencyId into OrganizationId without an explicit compatibility decision.

Decision: Project is tenant/organization scoped in principle. Exact persistence field and ownership-transfer semantics remain OPEN.

## 4. Lifecycle

V3 explicitly defines Unit commercial and construction lifecycles, but does not establish an equivalent authoritative Project lifecycle in the reviewed material.

Decision: DO NOT derive Project lifecycle from Unit lifecycle. DO NOT invent Project states. Project lifecycle remains OPEN until source evidence establishes the business states, transitions, actors, commands, events, and invariants.

## 5. Aggregate boundary

The historical Domain Model explicitly recommended Unit as an independent aggregate because of concurrency and asked for confirmation before implementation. V3 does not, in the reviewed sections, declare Project to be an aggregate root.

Decision: Project Aggregate Root = OPEN. Hierarchical position alone is not sufficient evidence.

## 6. Current canonical decisions

| Question | Decision | Status |
|---|---|---|
| Is Project a Core object? | Yes | LOCKED |
| Is Project master data? | Yes | LOCKED |
| Is Project distinct from Unit? | Yes | LOCKED |
| Is Project distinct from Listing/Property? | Yes | LOCKED |
| Is Project tenant scoped? | Yes, principle | LOCKED |
| Exact tenant field? | Not decided | OPEN |
| Project ID format? | Not decided | OPEN |
| Project lifecycle? | Not decided | OPEN |
| Project aggregate root? | Not decided | OPEN |
| Project commands/events? | Not decided | OPEN |
| Project merge/split/transfer semantics? | Not decided | OPEN |

## 7. Closure blockers

C03 Project cannot be closed until the remaining OPEN questions are reconciled against the full source corpus and, where required, external authoritative research:

1. identity/reference strategy;
2. ownership and transfer rules;
3. lifecycle and state machine;
4. aggregate/consistency boundary;
5. commands and domain events;
6. invariant set;
7. cross-domain dependencies;
8. persistence implications;
9. audit/data-lineage requirements.

## 8. Guardrail

No schema, migration, API, RLS policy, executable state machine, or application implementation is authorized by this document. This is an engineering-conference reconciliation artifact only.
