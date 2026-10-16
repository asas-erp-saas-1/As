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

The supplied ASAS Enterprise Architecture Blueprint v1.6.1 and its machine-readable package are research/provenance inputs for architecture review, not direct implementation authority. Repository artifacts derived from the package must be reconciled and explicitly promoted through the canonical architecture/contract/register process before they guide implementation. Reality must be inspected before schema-touching work. Extend; do not rewrite production data. Every important implementation claim requires execution evidence.

## Engineering navigation

- [Architecture and engineering corpus index](docs/architecture/README.md)
- [Current session checkpoint](docs/handoff/CURRENT-SESSION-STATE.md)
- [Engineering Conference Gate Model](docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md)
- [Engineering Closure Matrix](docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md)
- [Branch inventory and reconciliation record](docs/governance/BRANCH-INVENTORY-AND-RECONCILIATION-2026-10-14.md)
- [Engineering branch consolidation and retirement ledger](docs/governance/ENGINEERING-BRANCH-CONSOLIDATION-2026-10-16.md)

## Repository status

The current engineering work is in the architecture/foundation phase. The active checkpoint and gate model define what is authorized at any point; the presence of an architecture document, schema contract, cloud project or unmerged branch is not proof of implementation or production readiness. Read the current checkpoint from the branch you are working on, verify the relevant repository/runtime facts, and keep changes task-scoped in reviewed branches and pull requests.

## Intended application workspace (target, not a claim about the current tree)

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
