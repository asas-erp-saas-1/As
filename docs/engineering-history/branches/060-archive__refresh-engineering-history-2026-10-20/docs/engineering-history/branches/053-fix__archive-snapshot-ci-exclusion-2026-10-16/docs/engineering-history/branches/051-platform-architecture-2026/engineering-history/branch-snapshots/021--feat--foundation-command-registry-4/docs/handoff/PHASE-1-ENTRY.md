# Phase 1 Entry Gate — IAM

## Canonical package phase

In the current v1.6.1 task register, **Phase 1 = Identity & Access Management**. Its objective is to ship the permission spine that everything else is checked against.

Entry requirement: **Phase 0 gate passed.**

Exit gate:

- all admin routes permission-mapped
- audit chain verifying nightly
- sessions + lockout proven by test

## Phase 1 tasks

- T-1.1 Permission registry
- T-1.2 Roles and grants
- T-1.3 Organization tree and users
- T-1.4 Sessions and login
- T-1.5 AuthorizationService.can()
- T-1.6 Audit chain v2
- T-1.7 Route→permission registry
- T-1.8 Permission-matrix release gate
- T-1.9 Audited impersonation

## Current status

**BLOCKED for implementation until Phase 0 is proven complete.**

The repository itself was empty at initialization, so no application or production schema work is being represented as complete here. The Phase 1 branch is a controlled preparation branch. Phase P and Phase 0 evidence must be established against the actual platform/database before schema-touching IAM implementation begins.

## Important reconciliation

Older ASAS documents use different phase numbering and describe a high-level "Phase 1 — Business Analysis & Requirements." The current v1.6.1 machine-readable task register is authoritative for execution order and labels Phase 1 as IAM. The historical business-analysis material remains product input, not an authorization to skip the current delivery gates.
