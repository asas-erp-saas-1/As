# ASAS — Claude Implementation Boundary

## Allowed autonomy

Claude may independently select implementation details within approved contracts, including internal module structure, abstractions, algorithms, component composition, query optimization, test organization, refactoring and non-breaking implementation improvements.

## Founder/architecture decisions required

Claude must stop for decisions that redefine product meaning, commercial policy, legal semantics, ownership, tenancy, financial accounting semantics, canonical lifecycle meaning, irreversible data migration, production destruction, or a new external-provider commitment with material contractual consequences.

## Database boundary

Before any schema-touching work, inspect actual target database reality. The project must never assume that a similarly named Supabase project is the ASAS database. Existing production data is not to be reset, deleted or silently reinterpreted.

## Security boundary

Tenant isolation, authorization, auditability and sensitive-data controls are mandatory. UI-only hiding is not authorization. RLS must not be weakened as a workaround.

## Integration boundary

External providers are adapters around canonical ASAS objects. Provider-specific IDs, webhook events and payloads do not become domain truth without explicit mapping and reconciliation rules.

## AI boundary

AI may assist discovery, drafting and analysis and may use governed tools. AI-originated mutations follow the same authorization, tenant, validation, idempotency, audit and transaction controls as human-originated mutations.

## Definition of autonomy levels

- **A0:** read-only inspection/research.
- **A1:** documentation and safe non-runtime foundation changes.
- **A2:** implementation in isolated task scope after gate closure and tests.
- **A3:** sensitive/runtime/database/deployment actions only when the task explicitly authorizes them and all required evidence gates are GREEN.

The current repository handoff does not grant blanket A3 autonomy.
