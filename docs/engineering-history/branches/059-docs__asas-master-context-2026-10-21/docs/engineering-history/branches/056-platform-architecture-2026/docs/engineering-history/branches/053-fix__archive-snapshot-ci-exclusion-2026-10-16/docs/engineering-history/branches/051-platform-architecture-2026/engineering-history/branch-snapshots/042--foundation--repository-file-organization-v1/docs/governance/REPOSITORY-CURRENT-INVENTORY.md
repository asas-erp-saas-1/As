# ASAS Repository Current Inventory

**Status:** FOUNDATION BASELINE — REVIEW / RECONCILIATION IN PROGRESS  
**Ref audited:** `main` at `0b8a0e3e80056bffb93f4edc37a61fe6185ce28d`  
**Purpose:** durable inventory and ownership map used before file rename/consolidation.

## 1. Classification vocabulary

- `CANONICAL` — authoritative current artifact for its concern.
- `DERIVED` — source-derived shadow; may not override its source.
- `OPERATIONAL` — current procedure/state used by agents.
- `EVIDENCE` — verification or forensic record.
- `COMPATIBILITY` — retained only for legacy path/reference continuity.
- `HISTORICAL` — provenance only; never current truth.
- `RECONCILIATION` — actively comparing conflicting or incomplete sources.
- `DUPLICATE-CANDIDATE` — possible overlap; never delete without reference analysis.

## 2. Top-level ownership

| Path | Owner/purpose | State |
|---|---|---|
| `AGENTS.md` | Root AI engineering operating contract | CANONICAL |
| `CODEOWNERS` | Repository ownership | CANONICAL |
| `.github/` | PR/CI automation | CANONICAL |
| `design/` | Design-system executable shadows | DERIVED |
| `docs/handoff/` | Claude entrypoint, execution path, durable state | CANONICAL/OPERATIONAL |
| `docs/governance/` | Rules, gates, reconciliation and repository controls | CANONICAL/RECONCILIATION |
| `docs/architecture/` | System architecture and phase architecture | RECONCILIATION |
| `docs/product/` | Product truth | CANONICAL |
| `docs/domains/` | Domain/bounded-context contracts | RECONCILIATION |
| `docs/contracts/` | Cross-cutting behavioral contracts | RECONCILIATION |
| `docs/decisions/` | ADRs | CANONICAL decision record location |
| `docs/research/` | External research/evidence | EVIDENCE |
| `docs/audit/` | Audits and reality evidence | EVIDENCE |
| `registers/` | Machine-readable source-derived registries | DERIVED/RECONCILIATION |
| `schema/` | Target schema contract/index | RECONCILIATION |
| `src/` | Application implementation | IMPLEMENTATION GATE |
| `prisma/` | Database implementation/migrations | IMPLEMENTATION GATE |
| `tests/` | Automated verification | IMPLEMENTATION GATE |
| `scripts/` | Deterministic engineering tooling | OPERATIONAL / implementation-gated |

## 3. Handoff canonical set

The stable current sequence is:

```text
AGENTS.md
→ docs/handoff/CLAUDE-START-HERE.md
→ docs/handoff/CLAUDE-IMPLEMENTATION-BOUNDARY.md
→ docs/handoff/ASAS-MASTER-EXECUTION-PATH.md
→ docs/handoff/CURRENT-SESSION-STATE.md
→ current task packet
→ dependencies
→ canonical contracts
```

`docs/handoff/SESSION_STATE.md` is a compatibility pointer only. `docs/handoff/SESSION-STATE-HISTORICAL.md` is explicit historical provenance.

## 4. Governance ownership map

### Source / derivation

- `BLUEPRINT-DERIVATION-PROVENANCE.md` — source-to-shadow derivation policy.
- `BLUEPRINT-REGISTER-INGESTION-PLAN.md` — controlled ingestion plan.
- `BLUEPRINT-REGISTER-VALIDATION-MATRIX.md` — validation requirements.
- `SOURCE-REGISTER-RECONCILIATION-REPORT.md` — dated source baseline.

### Canonical repository controls

- `CANONICAL-ARTIFACT-REGISTER.md` — artifact authority/status.
- `CANONICAL-REPO-OPERATING-MODE.md` — repository operating model.
- `REPOSITORY-STRUCTURE-CONTRACT.md` — directory semantics.
- `REPOSITORY-HANDOFF-MAP.md` — navigation/handoff.
- `REPOSITORY-FILE-ORGANIZATION-AND-NAMING-STANDARD.md` — naming/placement proposal.

### Claude execution controls

- `CLAUDE-CONTEXT-LOADING-PROTOCOL.md` — context loading.
- `CLAUDE-ENGINEERING-OPERATING-MODE.md` — execution behavior/autonomy.
- `CLAUDE-TASK-PACKET-SPEC.md` — task packet schema.
- `CLAUDE-TASK-PACKET-TEMPLATE.md` — task packet template.
- `CLAUDE-WORKSPACE-PROTOCOL.md` — workspace rules.
- `BLUEPRINT-TO-CLAUDE-EXECUTION-CONTRACT.md` — source-to-agent execution contract.

### Foundation gates / closure

- `FOUNDATION-GATE-MATRIX.md` — gate definitions/dependencies; it must not compete with the operational status register.
- `FOUNDATION-GATE-REGISTER.md` — single operational gate status authority.
- `FOUNDATION-CLOSURE-PROTOCOL.md` — closure rules.
- `FOUNDATION-CLOSURE-CHECKLIST.md` — closure execution checklist.
- `FOUNDATION-READINESS-REPORT.md` — readiness narrative snapshot.
- `FOUNDATION-ENVIRONMENT-STATUS.md` — environment status snapshot.
- `FOUNDATION-HANDOFF-READINESS.md` — handoff readiness view.
- `FOUNDATION-SESSION-CLOSURE.md` — session closure record.
- `FOUNDATION-PR-BOUNDARY.md` / `FOUNDATION-PR-CHECKLIST.md` — PR-specific controls.

These are overlap candidates for later content reconciliation, not automatic deletion candidates.

## 5. Machine-register state

| Path | Current fact |
|---|---|
| `registers/events.json` | Present; Blueprint-derived; 103 events |
| `registers/permissions.csv` | Present; Blueprint-derived; 50 permission rows |
| `registers/state-machines.json` | Present; Blueprint-derived; 11 machines |
| `registers/tasks.index.json` | Present; index; count discrepancy remains open |
| `registers/tasks/phase-P.json` | Present; Phase P shard; 9 tasks |
| `schema/asas-contracts.index.json` | Present; target-contract index; body absent |
| `schema/asas-contracts.prisma` | Not present |
| `registers/tasks.json` | Not present; source task body remains sharded/reconciliation-controlled |
| `design/design-tokens.json` | Present; Blueprint-derived |
| `design/component-inventory.md` | Present; Blueprint-derived |

## 6. Naming findings

### Confirmed correction
The active Claude engineering loader previously referenced `docs/handoff/SESSION_STATE.md`. The canonical current checkpoint is `CURRENT-SESSION-STATE.md`; the legacy file is now explicitly a compatibility pointer and a separately named historical artifact exists.

### Stale-count risk
Some governance documents still contain earlier declarations such as `114 tasks` or `59 models / 16 enums / 15 indexes`. The current reconciliation baseline records 119 top-level phase task entries / 121 IDs including nested records and a schema observation of 59 models / 17 enums / 56 `@@index` declarations. These discrepancies remain OPEN and must not be silently normalized.

### Naming policy
Canonical governance/handoff Markdown uses uppercase kebab-case. Machine artifacts use stable consumer-required extensions and stable identifiers. Dates belong in evidence snapshots, not canonical contract filenames. `FINAL`, `NEW`, `OLD`, `TEMP`, `COPY`, and vague canonical filenames are prohibited.

## 7. Safe consolidation order

```text
Inventory
→ reference search
→ authority classification
→ canonical owner
→ content comparison
→ destination/reference plan
→ rename/consolidate
→ CI/reference verification
→ artifact-register update
→ checkpoint update
```

No deletion or mass rename is authorized by this inventory alone.

## 8. Current blockers to organization closure

1. Some governance artifacts contain stale numerical claims.
2. The source/approved architecture lineage still needs reconciliation.
3. The target Prisma contract body is not present.
4. The full task register remains controlled sharding/reconciliation work.
5. Foundation gate definitions and operational status are represented in more than one document and require explicit ownership discipline.

## 9. Closure criterion

This inventory is complete for the current foundation wave only when every repository path has a classification, canonical owner, lifecycle state, and reference impact recorded. Organization closure additionally requires foundation CI evidence and an updated canonical artifact register.
