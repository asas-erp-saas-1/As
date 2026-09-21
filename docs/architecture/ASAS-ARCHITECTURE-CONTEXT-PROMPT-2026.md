# ASAS Architecture Context Prompt 2026

**Artifact ID:** ASAS-ARCH-CONTEXT-2026-001  
**Status:** CANONICAL AGENT OPERATING PROMPT FOR ARCHITECTURE WORK  
**Version:** 1.9.0  
**Canonical branch:** `platform-architecture-2026`

## Operating mission

Operate ASAS through evidence-first architectural engineering. Never infer implementation authority from document naming, branch age, or model memory.

The agent's responsibility is not merely to find a plausible implementation. It must reconstruct the current engineering truth from repository evidence, branch provenance, source-package evidence, approved architecture, runtime evidence where authorized, and authoritative external engineering sources.

## Mandatory loading order

`repository identity → branch → commit → AGENTS.md → CURRENT-SESSION-STATE.md → this prompt → ASAS-CANONICAL-EVIDENCE-CONTROL-2026.md → blueprint → roadmap → relevant contracts/registers → source packages when provenance is required → live runtime/database only when identity and authorization are verified`

## Deep repository reading standard

When a task requests repository audit, reconciliation, organization, architecture review or continuation, do not summarize from filenames alone.

The agent MUST:

1. enumerate the complete repository tree;
2. read `AGENTS.md` completely before making a plan;
3. read the current checkpoint completely;
4. read the complete active architecture control plane required by the checkpoint;
5. inspect relevant governance, handoff, architecture, audit, contracts, registers, schema, design, CI and command/script artifacts;
6. inspect headers, versions, status fields, authority labels, identifiers, tables, commands, references and cross-document claims;
7. compare active branch state with `main` and relevant historical branches;
8. extract unique information from divergent branches before any consolidation or deletion;
9. search for all active references to canonical files, historical filenames, old version numbers and superseded terminology;
10. identify duplicates, stale references, contradictory metadata, orphan artifacts and unresolved ownership;
11. distinguish documentation presence from implementation/runtime evidence;
12. produce a finding record with evidence and verification requirements before making a material correction.

`Read carefully` means literal evidence inspection: file path, file name, header, version, status, owner, references, content claims and relationships are all part of the audit surface.

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

## Mandatory branch and repository audit command

When performing repository audit, consolidation or continuation, execute this exact conceptual sequence before deciding what to change:

```text
IDENTIFY
→ repository / branch / HEAD / merge-base

READ
→ AGENTS.md
→ CURRENT-SESSION-STATE.md
→ Source of Truth
→ Blueprint
→ Roadmap
→ Context Prompt
→ required contracts/registers

ENUMERATE
→ complete tree
→ canonical files
→ historical files
→ machine-readable artifacts
→ CI/scripts/configuration

COMPARE
→ platform-architecture-2026 vs main
→ relevant historical branches
→ commits / PRs / unique SHAs

TRACE
→ references to every canonical and legacy filename
→ version numbers
→ status/authority labels
→ duplicated concepts

CLASSIFY
→ SOURCE-VERIFIED
→ RUNTIME-VERIFIED
→ TEST-VERIFIED
→ EXTERNALLY-VERIFIED
→ ENGINEERING-DERIVATION
→ PROPOSED
→ UNVERIFIED
→ CONFLICT
→ BLOCKED
→ FOUNDER-DECISION-REQUIRED

DECIDE
→ use the first unresolved dependency from CURRENT-SESSION-STATE
→ do not invent missing authority
→ do not choose based on document age/count/name

CHANGE
→ smallest coherent correction
→ update canonical owner
→ update consumers/references
→ preserve historical provenance

VERIFY
→ reference search
→ structural validation
→ tests/CI
→ exact commit evidence

CONVERGE
→ update checkpoint
→ update affected canonical routing artifacts
→ record remaining blockers
```

### Repository reading command examples

```bash
git fetch --all --prune
git branch -a --no-color
git ls-remote --heads origin
git log --all --oneline --decorate --graph --date-order
git log --all --follow -- <path>
git diff --name-status main...platform-architecture-2026
git diff --stat main...platform-architecture-2026
rg -n "SESSION_STATE|CURRENT-SESSION-STATE|ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT|Version:|Status:|C2-001|C2-002|ADR-|Scheduling|building_id" .
```

For branch-level comparison, use the GitHub compare/commit history when available. For source-package provenance, inspect the supplied package directly. For technical claims, prefer official documentation and standards. Do not treat branch existence as authority.

Do not delete branches solely because they are old. Classify provenance first and preserve unique evidence until its authority is reconciled.

## Current work sequence

`Evidence control → canonical artifact/branch provenance → Building → Offer → Payment/Receipt/Ledger → Scheduling decision → cross-domain reconciliation → schema authority → implementation authorization`

## Safety boundaries

Do not guess or autonomously execute unresolved founder-level product scope, bounded-context ownership, legal interpretation, destructive database strategy, financial correction semantics, autonomous AI authority, tenant deletion, or material production/security changes.

## Closure rule

A finding is closed only when root cause, corrective action, references, verification, evidence, and canonical reconciliation exist.

## Current checkpoint

**ARCH-2026-H1.4.3-BUILDING-CONTRACT-CLOSURE**

Current blockers include live DB identity, security/runtime verification, implementation authorization, unresolved Scheduling ownership, incomplete Offer/Building/Finance contract closure, and control-plane version metadata reconciliation.
