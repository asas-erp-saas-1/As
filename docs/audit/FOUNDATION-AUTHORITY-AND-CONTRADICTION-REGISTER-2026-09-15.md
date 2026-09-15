# ASAS — Foundation Authority & Contradiction Register

**Date:** 2026-09-15  
**Repository:** `asas-erp-saas-1/As`  
**Status:** ACTIVE CONTROL REGISTER — foundation only

## 1. Purpose

This register prevents Claude from resolving conflicting ASAS specifications by intuition. It identifies the source of truth, the evidence currently available, and the action required before implementation.

## 2. Authority hierarchy

1. Founder-confirmed decisions recorded in current repository state.
2. ASAS Enterprise Architecture Blueprint v1.6.1 and its explicitly authoritative machine-readable artifacts.
3. Canonical architecture/register contracts derived from that Blueprint.
4. Approved implementation task packet.
5. Supporting research/audit documents.
6. Historical drafts, examples and superseded packages — context only, never implicit requirements.
7. General engineering practice — only where it does not contradict the above.

**Reality rule:** for pre-existing production data, verified live database reality is authoritative. Until `As → Vercel → Supabase/PostgreSQL` is proven, production reality is UNKNOWN.

## 3. Canonical product truth

`docs/product/PRODUCT_TRUTH.md` is the current founder-confirmed product direction: ASAS is a Real Estate Operating System combining public digital experience/Studio, inventory, CRM, Sales, Finance/ERP, Marketing, Analytics, communications, governance, workflows and future AI. Operational data belongs to the agency/tenant; the public surface and internal OS should use canonical data rather than duplicated truths.

## 4. Canonical domain ownership

`docs/architecture/CONTEXT-MAP-CANONICALIZATION.md` defines nine bounded contexts:

1. Core / Identity & Access
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

Scheduling is CRM-hosted. Public Experience is a product surface. Integrations, workflow/approval mechanics, notifications, audit/timeline and search are platform capabilities/projections unless the authoritative register says otherwise.

## 5. Machine-readable package baseline

The delivered v1.6.1 package was independently inspected. Measured artifacts:

- 119 tasks
- 103 events
- 50 permissions
- 11 state machines
- 59 Prisma models
- 17 Prisma enums
- 42 component inventory rows
- 69 checksum entries

These measured counts override stale prose counts only as artifact facts; they do **not** authorize changing the source registers. The package consistency report records the discrepancies.

## 6. Repository artifact status

The active `As` repository currently contains the architectural/audit/handoff documentation but does **not** currently contain the package's machine-readable `registers/` and `schema/` artifacts described by `AGENTS.md`. The source ZIP does contain those artifacts under `02-HANDOFF/`.

Therefore:

- `registers/tasks.json`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `registers/events.json`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `registers/permissions.csv`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `registers/state-machines.json`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `schema/asas-contracts.prisma`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `design/design-tokens.json`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `design/component-inventory.md`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `skills/*`: SOURCE AVAILABLE, REPOSITORY COPY MISSING
- `runbooks/*`: SOURCE AVAILABLE, REPOSITORY COPY MISSING

**Required action:** restore the authoritative artifacts into the repository without editing their semantics, then verify checksums/counts and reconcile documentation claims.

## 7. Active contradictions / gaps

| ID | Conflict / gap | Current treatment | Closure |
|---|---|---|---|
| C-01 | AGENTS says 114 tasks; measured package has 119 | 119 measured artifact fact | Controlled documentation reconciliation |
| C-02 | AGENTS says 16 Prisma enums; measured package has 17 | 17 measured artifact fact | Verify against Blueprint Chapter 39 |
| C-03 | Package prose says 15 vs 16 production tables | Production reality UNKNOWN | Verify actual ASAS DB |
| C-04 | Claimed verifier is absent from delivered package | MISSING / NOT VERIFIED | Build/restore verifier only from authoritative contract |
| C-05 | Historical architecture uses different context grouping | Historical only | Nine-context map is current working contract; verify against v1.6.1 source |
| C-06 | AGENTS references machine-readable artifacts absent from repo | Source exists in ZIP, repo copy missing | Restore exact source artifacts |
| C-07 | `As` has no local app/toolchain/deployment linkage yet | Bootstrap-only | First implementation wave creates reproducible app/test harness after gates |
| C-08 | Actual ASAS Vercel/Supabase identity is unproven | BLOCKED | Founder-authoritative environment linkage required |

## 8. Non-negotiable contamination rules

- Never use `asas-web-site` as ASAS database, deployment or migration reality.
- Never choose an external project because its name looks similar.
- Never modify a register to make already-written code pass.
- Never treat historical prose as a requirement when the canonical source differs.
- Never convert an OPEN semantic into an implementation assumption.
- Never claim VERIFIED without objective evidence.

## 9. Closure rule

A contradiction is closed only when the authority is identified, the competing artifact is classified, the resolution is explicit, and the evidence is recorded. If resolution changes business meaning, legal/financial semantics, ownership, security boundaries, canonical events or permissions, it is Tier-C and requires founder decision.

## 10. Next controlled action

**Restore/reconcile the machine-readable handoff layer from the v1.6.1 source package into `As`** — starting with the registers/schema/design/skills/runbooks — without implementation code or database mutation.

Then create the first machine-readable readiness manifest linking each artifact to its checksum, authority, consumers and verification status.
