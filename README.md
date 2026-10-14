# ASAS Real Estate OS

ASAS is being engineered as a Real Estate Operating System for real-estate agencies, developers, and future ASAS Group operations.

## Product direction

- Premium public real-estate website and publishing Studio
- Real-estate project and unit inventory
- CRM and unified sales lifecycle
- Reservations, contracts, payment schedules and finance controls
- Marketing, attribution, analytics and communications
- Role/scope-based administration and governance
- Workflow, audit and event-driven integration backbone
- AI-ready operational and executive intelligence
- Future multi-agency / multi-workspace / multi-company SaaS capability

## Engineering doctrine

The ASAS Enterprise Architecture Blueprint v1.6.1 and its machine-readable handoff package are a **research and provenance source**, not implementation authority. Architecture authority is the reconciled canonical baseline, the approved ADRs, the canonical contracts/registers and the current session checkpoint. Reality must be inspected before schema-touching work. Extend; do not rewrite production data. Every important implementation claim requires execution evidence.

See `AGENTS.md` for the authority model and `docs/architecture/ASAS-SOURCE-PACKAGE-ROLE-AND-DECISION-2026.md` for the source-package rule.

## Repository status

This repository was empty at initialization. The first commit establishes the workspace and product-truth layer. Application implementation will be added through task-scoped branches and pull requests.

## Planned top-level workspace

```text
/docs
  /product
  /architecture
  /research
  /decisions
  /handoff
/src
/prisma
/tests
/scripts
/.github
```

The exact application structure will be finalized from the validated architecture and existing production reality; this skeleton does not authorize speculative code or database changes.
