# ASAS Partner Performance Read Model Contract — 2026

**Status:** PROPOSED — implementation blocked
**Conference:** C02

## Purpose

Provide Developer and authorized Agency users with useful commercial performance without copying authoritative CRM, inventory or sales facts into separate partner databases.

## Canonical principle

`Authoritative facts → authorized projection/read model → role-specific view`

## Developer project view

Subject to policy, a Developer may see:

- inventory totals/state;
- leads attributable to authorized commercial channels;
- visits;
- offers;
- reservations;
- sales;
- conversion rates;
- inventory velocity;
- agency/team performance;
- attribution summaries;
- approved commission/performance metrics.

## Agency view

An Agency sees its own authorized performance and the project/inventory information needed for its commercial work. It does not automatically see another Agency's private CRM details, notes, internal compensation or unrelated projects.

## Metric semantics

Every metric must identify:

`metric owner → source fact → time window → scope → aggregation → authorization → freshness → lineage`

Counts must not be computed from mutable UI state.

## Privacy

Partner performance can be aggregated without exposing private customer/CRM data. The read model must be authorization-aware at query time and must not become a cross-tenant leakage channel through cache, search, exports, analytics or events.

## Attribution

Performance uses the appropriate historical attribution facts for the metric's business definition. Reassignment after a reservation/sale must not retroactively change historical commercial credit.

## Implementation gate

Before implementation:

- metric dictionary;
- source-of-truth mapping;
- authorization matrix;
- freshness SLA;
- aggregation strategy;
- cache/search isolation rules;
- export policy;
- reconciliation tests.
