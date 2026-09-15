# ASAS — Pre-Claude Repository Readiness Gap Register

**Date:** 2026-09-15  
**Repository:** `asas-erp-saas-1/As`  
**Branch:** `feat/foundation-command-registry`  
**Purpose:** determine whether the repository is safe and sufficiently specified for Claude to begin real implementation.

## 1. Verdict

**NOT READY FOR GLOBAL AUTONOMOUS IMPLEMENTATION.**

The architecture/governance material is substantial, but the repository currently does not contain all machine-readable implementation artifacts described by the authoritative developer protocol. Platform identity is also not independently proven. Therefore Claude must not be instructed to build the whole application/database yet.

## 2. Evidence-backed gaps

### G-01 — Platform identity
**Status:** BLOCKED  
The canonical repository is verified as `asas-erp-saas-1/As`, but the actual ASAS Vercel deployment and Supabase/PostgreSQL environment are not independently proven. `asas-web-site` is a separate project and is explicitly excluded.

**Closure evidence required:** authoritative repository→deployment→database linkage, environment inventory, read-only database identity inspection, migration inventory and recovery posture.

### G-02 — Machine-readable task register
**Status:** OPEN  
The developer protocol states that `registers/tasks.json` contains the permanent implementation playbook (114 tasks plus recurring intelligence rituals), but that file is not currently present in this branch.

**Closure:** restore/generate the authoritative task register from the Blueprint package without inventing tasks; verify count, IDs, dependencies and acceptance evidence.

### G-03 — Canonical schema contract
**Status:** OPEN  
The developer protocol states that `schema/asas-contracts.prisma` is the consolidated target schema (59 models + 16 enums), but the file is not currently present in this branch.

**Closure:** establish the authoritative schema artifact from the designated Blueprint/package source and reconcile it against the final canonical architecture. Do not write database migrations before this gate is closed.

### G-04 — Executable register layer
**Status:** OPEN  
The protocol references `registers/events.json`, `registers/permissions.csv`, `registers/state-machines.json`, design tokens, component inventory, skills and runbooks. These must be verified individually in the actual repository rather than assumed to exist because the protocol describes them.

**Closure:** inventory every referenced artifact; mark PRESENT / MISSING / STALE / CONFLICTING; restore only from authoritative sources.

### G-05 — Historical specification contamination
**Status:** OPEN  
The uploaded/historical material contains multiple generations of architecture, including a 15-context domain model and later nine-context architecture. The current AGENTS protocol says the v1.6 Blueprint and machine-readable package are authoritative. Historical drafts must not silently become requirements.

**Closure:** create a canonical authority map and contradiction register identifying historical-only documents and the current source of truth for each major decision.

### G-06 — Task-level acceptance evidence
**Status:** OPEN  
The handoff protocol requires every task to have explicit contract, non-goals, dependencies, security/tenancy, invariants, transaction/idempotency/concurrency behavior, tests, evidence and DoD. The repository needs a machine-readable or structured task-packet layer that Claude can execute without reconstructing requirements from prose.

**Closure:** produce task packets for the first implementation wave only after upstream contracts are closed.

### G-07 — Preflight contradiction between protocol and current reality
**Status:** OPEN  
The uploaded AGENTS protocol describes an existing production database with 15 live tables and says live introspection is the arbiter. Current repository evidence does not prove which external database is attached to `As`. This is a documentation/reality mismatch, not permission to use `asas-web-site`.

**Closure:** verify the actual environment. If the production database statement is obsolete, amend the protocol through the authority chain rather than allowing Claude to assume it.

## 3. Required closure order

`G-01 → G-04 inventory → G-05 authority/contradiction closure → G-02 task register → G-03 schema contract → G-06 first-wave task packets → G-07 protocol reconciliation → CLAUDE HANDOFF GATE`

Some G-04 inventory work can proceed in parallel with G-01 because it does not mutate runtime or database.

## 4. Implementation boundary while gaps remain

Allowed:
- repository inspection;
- documentation/audit updates;
- canonical contract reconciliation;
- machine-readable register restoration from authoritative sources;
- research and design work;
- test strategy and task-packet preparation.

Not authorized by this gap register:
- production database reset/drop/rename;
- using `asas-web-site` as ASAS reality;
- uncontrolled `db push`;
- application-wide implementation based on inferred requirements;
- changing a register to match code that was already written;
- deployment of an unverified ASAS environment.

## 5. Closure definition

This register is closed only when every G-01…G-07 item is either **GREEN with evidence** or explicitly superseded by a newer canonical task/register that records the same evidence and decision. The final Claude handoff must link to that evidence and state the exact first executable task.
