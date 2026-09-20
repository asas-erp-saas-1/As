# ASAS Architecture Context Prompt 2026

**Artifact ID:** ASAS-ARCH-CONTEXT-2026-001  
**Status:** CANONICAL AGENT OPERATING PROMPT FOR ARCHITECTURE WORK  
**Version:** 1.8.0  
**Canonical branch:** `platform-architecture-2026`

## Operating mission

Operate ASAS through evidence-first architectural engineering. Never infer implementation authority from document naming, branch age, or model memory.

## Mandatory loading order

`repository identity → branch → commit → AGENTS.md → CURRENT-SESSION-STATE.md → this prompt → ASAS-CANONICAL-EVIDENCE-CONTROL-2026.md → blueprint → roadmap → relevant contracts/registers → source packages when provenance is required → live runtime/database only when identity and authorization are verified`

## Cross-source discovery rule

Before a load-bearing architectural decision inspect, as applicable:

1. canonical repository and current branch;
2. all relevant remote branches and their provenance;
3. commits, PRs and workflow evidence;
4. repository source/configuration;
5. supplied source packages/files;
6. canonical contracts/registers;
7. current official external documentation/standards for technical or legal facts;
8. independent authoritative corroboration where risk warrants.

Branch contents are evidence, not authority. Historical artifacts remain historical unless explicitly promoted.

## Reconciliation algorithm

`locate → classify → identify authority → preserve conflicting evidence → decide only within authority → update canonical artifact → verify → record evidence`

Use only:

`VERIFIED | SUPPORTED | PARTIAL | BLOCKED | NOT_EXECUTED | OPEN | CONFLICT | FOUNDER DECISION REQUIRED | ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

## Authority

Brownfield reality:
`LIVE RUNTIME / DATABASE > IMPLEMENTATION > APPROVED CONTRACT > APPROVED ARCHITECTURE > HISTORY > INFERENCE`

Future behavior:
`FOUNDER/PRODUCT DECISION > APPROVED ARCHITECTURE > APPROVED ADR > CONTRACT/REGISTER > IMPLEMENTATION`

External facts:
`OFFICIAL DOCUMENTATION / STANDARD > PRIMARY ENGINEERING SOURCE > AUTHORITATIVE RESEARCH > REPUTABLE SECONDARY SOURCE > COMMUNITY`

Conflicts are never silently averaged.

## Architecture distinctions

`Bounded Context ≠ Module ≠ Aggregate ≠ Entity ≠ Value Object ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer ≠ Platform Capability`

Counts are observations, not quotas.

## Current target architecture

Nine bounded contexts remain the supported target view:

`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

Scheduling, Integrations, Workflow, AI, Search, Media, Notifications and SaaS Control remain platform capabilities/subdomains unless an approved ADR proves an independent bounded-context boundary.

### Scheduling conflict — explicit authority stop

The supplied Blueprint v1.6.1 explicitly states that Scheduling is the **CRM context's scheduling submodule** and gives the intended repository home as `src/modules/crm/scheduling/`. The same source package contains ADR-0018, which records Scheduling as a **Core-hosted** submodule. The current `AGENTS.md` also states CRM ownership. These sources are materially inconsistent.

Therefore the status is:

`FOUNDER DECISION REQUIRED`

No implementation ownership, persistence ownership, event ownership, permission ownership or dependency rule for Scheduling may be changed until an explicit ADR confirms or supersedes the historical decision.

## Contract-first execution

`Discover → Inspect → Research → Reconcile → Model → Decide → Contract → Plan → Implement → Test → Red Team → Verify → Converge → Evidence`

No schema or application implementation is authorized merely because a domain concept appears in a document.

Critical domain work must close:

`owner / invariant / command / state transition / authorization / tenant scope / concurrency / event / audit / test / evidence`

## Current work sequence

`Evidence control → canonical artifact/branch provenance → Building → Offer → Payment/Receipt/Ledger → Scheduling decision → cross-domain reconciliation → schema authority → implementation authorization`

## Branch and research commands

```bash
git fetch --all --prune
git branch -a --no-color
git ls-remote --heads origin
git log --all --oneline --decorate --graph --date-order
git log --all --follow -- <path>
git diff --name-status <canonical>...<candidate>
git show <branch>:<path>
rg -n "SESSION_STATE|CURRENT-SESSION-STATE|CANONICAL-ARTIFACT|ADR-|events\.json|permissions\.csv|state-machines\.json|Scheduling|building_id" .
```

For branch-level comparison, use the GitHub compare/commit history when available. For source-package provenance, inspect the supplied package directly. For technical claims, prefer official documentation and standards. Do not treat branch existence as authority.

Do not delete branches solely because they are old. Classify provenance first and preserve unique evidence until its authority is reconciled.

## Safety boundaries

Do not guess or autonomously execute unresolved founder-level product scope, bounded-context ownership, legal interpretation, destructive database strategy, financial correction semantics, autonomous AI authority, tenant deletion, or material production/security changes.

## Closure rule

A finding is closed only when root cause, corrective action, references, verification, evidence, and canonical reconciliation exist.

## Current checkpoint

**ARCH-2026-H1.4-CROSS-SOURCE-CONTRACT-CLOSURE**

Current blockers include live DB identity, security/runtime verification, implementation authorization, unresolved Scheduling ownership, and incomplete Offer/Building/Finance contract closure.
