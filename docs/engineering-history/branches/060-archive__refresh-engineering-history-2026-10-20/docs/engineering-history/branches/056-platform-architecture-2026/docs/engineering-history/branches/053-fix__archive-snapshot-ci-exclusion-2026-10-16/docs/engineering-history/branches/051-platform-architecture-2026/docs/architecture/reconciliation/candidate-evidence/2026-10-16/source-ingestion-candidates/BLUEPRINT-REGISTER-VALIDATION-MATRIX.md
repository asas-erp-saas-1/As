# ASAS Blueprint Register Validation Matrix

> **SOURCE-INGESTION / TRACEABILITY CANDIDATE (source blob `7aff25267d2549a390750ec0260f527f5a9564ee`):** Preserved from `foundation/c2-001-traceability-v1` to maintain provenance. This artifact is not automatically canonical; its counts, paths and status claims must be reconciled against the current source-observation manifest and Canonical Artifact Register. It does not resolve C2-001 or authorize schema/register mutation.


Status: CANONICAL CONTROL SPECIFICATION

This matrix defines how Blueprint-derived artifacts are validated before Claude can rely on them.

| Artifact | Declared scope | Validation | Promotion condition |
|---|---|---|---|
| tasks | 114 tasks + T-R.1–3 | ID uniqueness, phase coverage, dependencies, contracts, acceptance evidence, provenance | 100% accounted for; no unresolved load-bearing references |
| events | 103 events | unique event type, aggregate ownership, envelope, producer/consumer references, idempotency semantics | catalog and envelope reconcile |
| permissions | 50 keys × 8 personas | key uniqueness, persona coverage, scope, sensitive-data restrictions | matrix reconciles with Appendix A |
| state machines | 11 machines | state uniqueness, legal transitions, terminal rules, command mapping | reconciles with Appendix B |
| schema | 59 models + 16 enums + 15 indexes | model/enum/index counts, relations, constraints, tenant ownership, naming, provenance | complete contract reconciles with Ch.39 + App.W |
| design tokens | Appendix U token system | token uniqueness, required scales, RTL/mirroring, accessibility semantics | token set reconciles with U.1–U.4/U.9 |
| components | 42 primitives | variants, states, accessibility contracts, token references | count and contracts reconcile with U.5/U.6 |

## Validation states

`NOT_EXTRACTED` — source body has not been completely extracted.

`EXTRACTED_UNVERIFIED` — extraction exists but reconciliation has not passed.

`RECONCILED` — cross-reference checks pass.

`CANONICAL` — promoted to repository source-of-record shadow.

`STALE` — source or external fact requires re-verification.

`CONFLICT` — authoritative sources disagree; implementation must stop for the affected scope.

## Anti-fabrication rule

A count is not evidence of content. A filename is not evidence of completeness. A generated approximation is never promoted to canonical.

## External research rule

Load-bearing current facts use the project's research protocol: primary sources first, current verification, explicit URL/date/confidence, and an UNVERIFIED label when evidence is insufficient.

## Database rule

For pre-existing database objects, live introspection outranks every document. Repository contracts remain the target specification for new work until reconciled with reality.

## Final promotion evidence

Every promoted artifact records source, version, locator, derivation method, validation result, verifier, timestamp, and unresolved limitations.
