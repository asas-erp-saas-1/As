# ASAS Repository Structure Contract

Status: CANONICAL FOUNDATION POLICY

## Principle

Repository structure is an engineering boundary, not a filing cabinet. A directory may exist only when its ownership, authority, input/output expectations, and lifecycle are understood.

## Canonical areas

- `.github/` — repository automation, PR templates, ownership and CI policy.
- `docs/handoff/` — agent/operator entrypoint and current execution state.
- `docs/governance/` — repository operating rules, gates, closure standards and reconciliation policy.
- `docs/architecture/` — approved architecture and system-level technical decisions.
- `docs/product/` — product requirements and product truth.
- `docs/domains/` — bounded-context/domain definitions.
- `docs/contracts/` — canonical behavioral contracts.
- `docs/decisions/` — ADRs and explicit decisions.
- `docs/research/` — external research and source-backed investigation; never canonical business truth by itself.
- `docs/audit/` — audit findings and verification records.
- `registers/` — machine-oriented indexes for tasks, capabilities, commands, events, states and permissions once their schemas are finalized.
- `src/` — application implementation only after implementation authorization.
- `tests/` — automated verification corresponding to implemented behavior.
- `prisma/` — database schema/migrations only after database architecture authorization.
- `scripts/` — deterministic engineering/verification automation; scripts must document side effects.

## Placement rules

1. Product requirements do not become architecture merely by being copied into `docs/architecture`.
2. Research does not override canonical contracts.
3. An ADR records a decision; it does not replace the domain contract that expresses the resulting behavior.
4. Generated output must never become a source of truth unless explicitly declared canonical.
5. Secrets, credentials, production dumps and personal data must never be committed.
6. Implementation code must not be created merely to make a gate appear green.
7. A single concept must have one canonical owner; cross-references are preferred over duplicated definitions.

## Empty-directory rule

If an implementation directory is intentionally absent or empty, that is an explicit pre-implementation state, not missing work. Do not populate it with speculative scaffolding.

## Change rule

Changing the meaning or ownership of a canonical directory requires an ADR or governance update before dependent implementation changes.
