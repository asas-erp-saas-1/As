# ASAS Real Estate OS

ASAS is being engineered as a Real Estate Operating System for real-estate agencies, developers, and future ASAS Group operations.

## Canonical project

The canonical implementation repository is:

`asas-erp-saas-1/As`

Similarly named repositories or deployments are not implementation authority unless their linkage is explicitly proven in current governance records.

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

The ASAS Enterprise Architecture Blueprint v1.6.1 and its machine-readable handoff package are the specification baseline. Repository artifacts are derived shadows unless explicitly promoted. Reality must be inspected before schema-touching work. Extend; do not rewrite production data. Every important implementation claim requires execution evidence.

## Current repository state

The repository is in **foundation hardening / pre-implementation**. Governance, handoff, source provenance, derived registers, design contracts, and verification controls are being reconciled before application/database implementation.

Application implementation is task-scoped and is not authorized merely because the repository exists.

## Canonical workspace

```text
/
├── AGENTS.md
├── CODEOWNERS
├── .github/
├── design/
├── docs/
│   ├── audit/
│   ├── architecture/
│   ├── contracts/
│   ├── decisions/
│   ├── domains/
│   ├── governance/
│   ├── handoff/
│   ├── product/
│   └── research/
├── registers/
├── schema/
├── src/          # implementation gate
├── prisma/       # database/migration gate
├── tests/        # implementation gate
└── scripts/      # deterministic tooling
```

## Start here

For Claude/implementation agents, load:

1. `AGENTS.md`
2. `docs/handoff/CLAUDE-START-HERE.md`
3. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
4. `docs/handoff/CURRENT-SESSION-STATE.md`
5. the current task packet and its dependencies

Then inspect repository reality and the applicable canonical contracts.

## Important boundary

`docs/handoff/CURRENT-SESSION-STATE.md` is the sole current checkpoint. Historical and compatibility artifacts must never be used as current execution state.

The exact application architecture is finalized from validated domain/contracts and verified platform reality; this repository does not authorize speculative code or destructive database changes.
