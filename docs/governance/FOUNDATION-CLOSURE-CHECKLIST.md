# ASAS Foundation Closure Checklist

Status: CANONICAL GATE CHECKLIST

This checklist is the final pre-implementation control. A checkbox is evidence-driven; documentation alone is insufficient.

## F0 — Repository foundation
- [x] Canonical repository is `asas-erp-saas-1/As`.
- [x] `main` is the integration source of truth.
- [x] Claude handoff chain exists on the canonical ref.
- [x] Branch/PR lifecycle is documented.
- [x] Repository structure contract exists.

## F1 — Agent context
- [x] Mandatory loading order is documented.
- [x] Current session state is required.
- [x] Task-scoped context minimization is required.
- [x] Stale/historical artifacts are explicitly non-authoritative.
- [x] Contradiction stop rule is explicit.

## F2 — Governance
- [x] Authority order exists.
- [x] Conflict classes C0-C3 exist.
- [x] Task closure evidence is defined.
- [x] Branch and PR DoD exists.
- [x] Foundation CI exists.

## F3 — Domain preparation
- [x] Core lifecycle working spine exists.
- [x] Context/capability coverage exists.
- [ ] Every implementation slice has reconciled command/event/state/permission/data contracts.
- [ ] Cross-context write ownership is closed for the first implementation slice.
- [ ] Critical invariants have executable acceptance criteria.

## F4 — Implementation authorization
- [ ] Canonical application stack is declared.
- [ ] Implementation CI commands are verified against the actual stack.
- [ ] Database/migration contract is approved for the first slice.
- [ ] UX contract and affected Figma handoff are ready.
- [ ] First task packet is marked READY.
- [ ] Claude implementation authorization is explicitly recorded.

## Closure rule

F0-F2 may be considered structurally established. F3-F4 remain open until the first implementation slice is reconciled and independently verifiable. Do not call the entire foundation GREEN while F3/F4 contain unchecked critical items.
