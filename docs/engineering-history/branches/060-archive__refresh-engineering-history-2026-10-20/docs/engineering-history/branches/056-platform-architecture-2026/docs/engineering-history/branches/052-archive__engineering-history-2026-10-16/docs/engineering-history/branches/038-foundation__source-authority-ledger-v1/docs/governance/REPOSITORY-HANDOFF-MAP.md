# ASAS Repository Handoff Map

## Canonical repository

`asas-erp-saas-1/As`

## Purpose

This repository is the canonical engineering workspace for ASAS. The current phase is foundation hardening so Claude Code can enter implementation with a stable contract, predictable context loading, bounded autonomy, and reviewable Git workflow.

## Canonical top-level structure

```text
/
├── AGENTS.md
├── CODEOWNERS
├── .github/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/
│
├── docs/
│   ├── product/          # product truth and founder-confirmed business meaning
│   ├── architecture/     # system architecture and sequencing decisions
│   ├── domains/          # bounded-context and domain contracts
│   ├── contracts/        # implementation-facing cross-cutting contracts
│   ├── governance/       # engineering operating controls and gates
│   ├── decisions/        # ADRs and protected decisions
│   ├── research/         # validated external research and provider evidence
│   ├── audit/            # forensic findings, evidence and reconciliations
│   └── handoff/          # Claude entry point, session state and execution path
│
├── registers/            # machine-readable canonical registries; populated only from validated sources
├── src/                  # application implementation; intentionally not started in foundation phase
├── prisma/               # database schema/migrations; intentionally not started in foundation phase
├── tests/                # application tests; introduced with implementation
└── scripts/              # deterministic repository/verification tooling
```

## Placement rules

- Product meaning belongs in `docs/product/` and the canonical founder state.
- Architecture belongs in `docs/architecture/`.
- Bounded-context/domain semantics belong in `docs/domains/`.
- Cross-cutting implementation contracts belong in `docs/contracts/`.
- Execution, branch, PR, CI and gate controls belong in `docs/governance/`.
- Decisions that change protected semantics belong in `docs/decisions/`.
- External factual research belongs in `docs/research/` with source/provenance.
- Forensic or verification findings belong in `docs/audit/`.
- Claude startup and durable checkpoints belong in `docs/handoff/`.
- Machine-readable source-of-truth registries belong in `registers/`; do not manufacture registers to fit implementation.
- Application code, schema and tests enter only when the relevant readiness gate is green.

## Canonical handoff chain

`AGENTS.md → CLAUDE-START-HERE.md → CLAUDE-IMPLEMENTATION-BOUNDARY.md → ASAS-MASTER-EXECUTION-PATH.md → CURRENT-SESSION-STATE.md → task packet → dependencies → canonical contracts`

## Source-package rule

The supplied ASAS architecture package is a source input. It is not copied wholesale into the repository. Only validated and operationally useful artifacts are promoted, with provenance and reconciliation recorded.

## Branch rule

`main` is the canonical integration branch. Work occurs on task-scoped branches and returns through pull requests. Stacked PRs are allowed only when a real dependency requires them.
