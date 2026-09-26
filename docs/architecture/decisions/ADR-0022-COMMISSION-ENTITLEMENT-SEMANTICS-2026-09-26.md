# ADR-0022 — Commission Entitlement Semantics

**Status:** ACCEPTED / SEMANTICALLY CLOSED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Decision owner:** Founder, delegated through Engineering Conference
**Scope:** Commercial attribution, commission rules, accrual, payout, adjustments

## Context

ASAS separates lead ownership, operational assignment, source attribution, commercial attribution and commission entitlement. V3 defines a dedicated Finance commission engine with CommissionPlan, CommissionRule, CommissionParticipant, CommissionAccrual, CommissionPayout, Adjustment and Approval. Rules may depend on project, unit, agent, team, campaign, source, deal value, collection status and contract state. Final payable commission must never be calculated only in the frontend.

The conference therefore needs to establish the semantic boundary without hard-coding a universal percentage or payment schedule.

## Decision

Commission entitlement is a **Finance-owned derived financial fact** produced from authoritative commercial milestones and a versioned commission policy.

The canonical flow is:

`Commercial attribution / qualifying milestone → Commission policy snapshot → Commission entitlement/accrual → Approval/adjustment where required → Payout eligibility → Payout`

### 1. Policy is versioned

A CommissionPlan/CommissionRule version effective at the governing milestone is captured with the entitlement. Later edits to a plan do not rewrite an existing entitlement.

### 2. Attribution is snapshotted

The participants credited for a qualifying milestone are captured at that milestone. Current CRM ownership, current assignment or later organization relationships do not retroactively change the historical commercial attribution.

### 3. Entitlement and payout are distinct

An accrued entitlement is not automatically a paid commission. Payout eligibility may depend on configured conditions such as contract state, collection status, approval, cancellation/clawback rules and other project/organization policy.

### 4. Multiple participants are supported

A commission may have multiple participants. Each participant receives an explicit share/amount according to the applicable rule. The allocation must reconcile to the commission basis and cannot exceed the distributable commission defined by the governing policy unless an authorized adjustment exists.

### 5. Adjustments are additive and audited

A correction, clawback, dispute resolution or approved exception creates an adjustment record. It must not silently rewrite the original attribution or posted financial history.

### 6. Finance owns the monetary consequence

CRM and Sales may provide the commercial facts and attribution inputs. They do not own the payable monetary truth. Finance owns commission accrual, payout, adjustment and financial posting semantics.

### 7. Configuration controls policy, not invariants

Projects, organizations and agreements may configure commission rules, percentages, participant formulas and payout conditions within platform invariants. Configuration cannot bypass authorization, auditability, accounting integrity or historical snapshot rules.

## Canonical distinctions

`Lead Ownership ≠ Operational Assignment ≠ Source Attribution ≠ Commercial Attribution ≠ Commission Entitlement ≠ Commission Payout`

## Required invariants

- A commission entitlement references an authoritative commercial milestone.
- The governing policy version is immutable for that entitlement.
- Participant attribution is immutable after the milestone except through an audited adjudication/adjustment workflow.
- Payable calculations are server/domain/Finance controlled.
- Posted financial entries are immutable and corrected through new entries.
- Every adjustment has actor, reason, timestamp and evidence.
- A payout cannot exceed the approved payable entitlement after adjustments.
- Cancellation/clawback must not erase the original entitlement; it creates a compensating financial/commercial fact.

## Deliberately NOT decided here

This ADR does not prescribe a universal commission percentage, exact payout timing, tax treatment, Algerian statutory accounting treatment or legal entitlement. Those are policy/country/project agreement concerns and require appropriate authoritative sources or organization configuration.

## Alternatives rejected

### CRM-owned commission
Rejected because commission is a financial consequence and must remain independently auditable from mutable CRM assignment.

### Agent-profile commission percentage
Rejected because commission can vary by project, unit, team, campaign, source, agreement and collection/contract state.

### Frontend calculation
Rejected because client calculations cannot provide authoritative financial integrity.

### Mutable historical attribution
Rejected because later assignment or relationship changes would corrupt commercial history.

## Verification before implementation

- reconcile existing commission-related schema and migrations;
- map current attribution fields to this contract;
- map the 50 permission keys and approval thresholds to commission actions;
- register required commission events;
- define currency/rounding rules;
- define cancellation/clawback behavior per project policy;
- create property-based and invariant tests for participant allocation;
- create audit and financial reconciliation tests.
