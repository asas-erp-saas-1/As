# ASAS Repository Reality Map

Status: CANONICAL FORENSIC DERIVATION
Version: 1.0
Date: 2026-09-20
Audited commit: `0b8a0e3e80056bffb93f4edc37a61fe6185ce28d`

## Authority

This map describes **observed repository reality**, not desired architecture.

## Repository identity

| Property | Evidence | Status |
|---|---|---|
| Repository | `asas-erp-saas-1/As` | VERIFIED |
| Default/integration branch | `main` | VERIFIED |
| Audited commit | `0b8a0e3e80056bffb93f4edc37a61fe6185ce28d` | VERIFIED |
| Visibility | public | VERIFIED |
| Canonical checkpoint | `docs/handoff/CURRENT-SESSION-STATE.md` | VERIFIED |
| Other ASAS repository | `asas-erp-saas-1/Asas-website` | DISTINCT / NOT AUTHORITY |

## Repository strata

| Area | Observed | Status |
|---|---|---|
| Root governance | `AGENTS.md`, `CODEOWNERS`, `README.md` | PRESENT |
| Handoff | Claude start, execution path, context index, current state, readiness docs | PRESENT |
| Governance | canonical artifact, reconciliation, gates, task graph, branch/PR controls | PRESENT |
| Product | `PRODUCT_TRUTH.md` | PRESENT |
| Architecture | scalability blueprint and governance architecture material | PRESENT |
| Audit | live DB baseline document | PRESENT |
| Registers | events, permissions, state machines, task index, phase-P shard | PARTIAL |
| Schema | schema index only | PARTIAL |
| Design | design tokens and component inventory | PRESENT |
| Application source | no `src/` observed in audited tree | ABSENT |
| Package manifest | no `package.json` observed in audited tree | ABSENT |
| Prisma executable schema | no `schema/asas-contracts.prisma` | ABSENT |
| Migration history | no migration directory observed | ABSENT |
| Application tests | no test tree observed | ABSENT |
| Deployment implementation | no application deployment configuration observed | ABSENT / UNVERIFIED |

## Canonical loading chain

`AGENTS.md → CLAUDE-START-HERE.md → ASAS-MASTER-EXECUTION-PATH.md → CURRENT-SESSION-STATE.md → task packet/dependencies → contracts/registers → architecture/source evidence → runtime/database evidence when applicable`

`SESSION_STATE.md` is historical compatibility material and is not the current checkpoint.

## Implementation authorization

The audited checkpoint explicitly blocks application code, database schema implementation, migrations, production configuration and deployment implementation. This map does not override that checkpoint.

## Runtime identity

The connected Supabase account currently exposes a project named `asas-web-site`. Because the repository canonical identity is `asas-erp-saas-1/As`, that project is **not accepted as the ASAS runtime** without explicit project-identity evidence.

## Promotion rule

When application implementation begins, this map must be updated from observed tree evidence rather than copied from architecture documents.
