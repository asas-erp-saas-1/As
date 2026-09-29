# ASAS Architecture Evidence-Control Roadmap 2026

**Status:** ACTIVE / PROPOSED CONTROL ROADMAP
**Canonical branch:** `platform-architecture-2026`
**Purpose:** Sequence forensic reconciliation before schema/application implementation.

## Current route

`Repository reality → authority control → artifact map → context reconciliation → domain contract closure → state/event/permission reconciliation → schema authority → implementation authorization`

## Current workstream

### W0 — Evidence control
- Maintain one authority-routing artifact.
- Classify branches before using their contents.
- Search current repository, historical branches, supplied source packages, and authoritative external sources for load-bearing claims.
- Never promote research or historical material directly into implementation authority.

### W1 — Architecture reconciliation
- Nine bounded contexts remain the current canonical hypothesis.
- Platform capabilities remain separate from bounded contexts unless an ADR proves independent ownership and transactional boundaries.
- Resolve Scheduling ownership explicitly.

### W2 — Domain contract closure
Order:
1. Building
2. Offer
3. Payment / Receipt / Allocation / Ledger
4. Scheduling
5. Cross-domain commercial loop

Each contract must close ownership, invariants, commands, permissions, events, state transitions, failure modes, tests, and evidence before schema design.

### W3 — Schema authority
Only after W0–W2:
- introspect live reality when access exists;
- reconcile target schema vs migration history vs implementation;
- classify drift;
- create migration plan;
- rehearse and verify recovery;
- then authorize implementation.

## Source discovery command set

Use repository-safe discovery before making a load-bearing claim:

```bash
git fetch --all --prune
git branch -a --no-color
git ls-remote --heads origin
git log --all --oneline --decorate --graph --date-order
git log --all --follow -- <path>
git diff --name-status <canonical>...<candidate>
rg -n "SESSION_STATE|CURRENT-SESSION-STATE|CANONICAL-ARTIFACT|ADR-|events\.json|permissions\.csv|state-machines\.json" .
```

For external facts, prefer official documentation, standards, regulators, and vendor engineering sources. Record the source date and applicability.

## Closure rule

A workstream is not closed because a document was written. Closure requires evidence, verification, updated references, and absence of unresolved canonical conflict.

## Immediate next checkpoint

**ARCH-2026-W0.4:** Complete canonical artifact and branch provenance reconciliation; then resume Building/Offer contract closure.
