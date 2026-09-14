# ASAS v1.6.1 Package Consistency Report

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Source:** direct inspection of the delivered `ASAS-AI-PACKAGE-v1.6.1.zip` artifacts.

## 1. Purpose

The package README and AGENTS protocol contain several prose counts and claims. This report distinguishes **measured artifact facts** from prose claims so Claude cannot accidentally use a stale count as a contract.

## 2. Measured artifact facts

Direct inspection of the delivered ZIP produced:

| Artifact | Measured |
|---|---:|
| Tasks | 119 |
| Registered events | 103 |
| Permission keys | 50 |
| Persona columns | 8 |
| State machines | 11 |
| Component inventory rows | 42 |
| Prisma models | 59 |
| Prisma enums | 17 |
| Checksum entries | 69 |

The 17 enum names in `schema/asas-contracts.prisma` are:

`AccessScope, CommercialStatus, ConstructionStatus, LeadLifecycle, LeadWorking, OpportunityStage, ReservationStatus, ContractStatus, ScheduleItemStatus, ApprovalStatus, FinancingType, PaymentChannel, TriggerType, StudioPageStatus, OfferStatus, AppointmentStatus, AppointmentType`.

## 3. Package prose mismatches

### M-01 — Task count

AGENTS prose describes the task register as **114** playbook tasks. Direct inspection of `registers/tasks.json` yields **119** tasks across the 14 phase entries.

**Treatment:** 119 is the measured current artifact count. Do not edit the register merely to make the prose count match. The prose documentation should be corrected by a controlled documentation update if the count is intended to be normative.

### M-02 — Prisma enum count

AGENTS prose describes the consolidated schema as **16 enums**. Direct inspection yields **17 enums**.

**Treatment:** 17 is the measured schema artifact count. The missing enum in prose must be reconciled against the exact Blueprint/Chapter 39 source before anyone changes schema or documentation.

### M-03 — Production table count

The package contains conflicting prose: one section states the production database has **15 live tables** and lists them; another platform-authority section refers to a **16-table business**.

**Treatment:** neither prose count is treated as live production evidence. N1 requires actual database introspection; the live database is authoritative for pre-existing tables.

### M-04 — Verifier artifact

The package prose claims a verifier script/quantified verification set, but the delivered ZIP does not contain the claimed verifier script.

**Treatment:** verifier status is **MISSING / NOT VERIFIED**.

## 4. Governance consequence

These mismatches are documentation/package-quality defects, not reasons to alter the machine-readable registers without source authority.

The authority chain remains:

`Blueprint → registers/schema → repository implementation`

Never invert it by modifying a register to make code or prose look consistent.

## 5. Required Gate-00 action

Before implementation, Claude must:

1. measure the package/register counts again;
2. compare them with the authoritative Blueprint version actually loaded;
3. record each mismatch;
4. correct stale documentation through an approved documentation change;
5. never change a machine-readable register solely to satisfy a prose count;
6. treat production table count as UNKNOWN until real database introspection is available.

## 6. Current verdict

**Package content:** substantially complete but contains measurable documentation/count inconsistencies.

**Register authority:** preserved.

**Production database reality:** BLOCKED / NOT VERIFIED.

**Verifier claim:** MISSING / NOT VERIFIED.

**Implementation authorization:** none.
