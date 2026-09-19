# ASAS Canonical Architecture Decisions

**Status:** FOUNDATION WORKING CONTRACT — architecture reconciliation
**Repository:** `asas-erp-saas-1/As`
**Date:** 2026-09-19

## 1. Purpose

This document converts verified source evidence into explicit engineering decisions without copying the source package verbatim. It is the working architectural baseline for the transition from foundation hardening to implementation readiness.

## 2. Decisions

### A1 — System shape
**Decision:** ASAS is a **modular monolith** for the current product and foreseeable SaaS expansion.

**Rationale:** The source architecture explicitly describes a modular monolith and the current scale/complexity does not justify operationally expensive microservices. Module boundaries must remain enforceable in code and contracts so that later extraction remains possible if evidence requires it.

**Constraint:** No Kafka/Kubernetes/event-mesh or service-per-context architecture is introduced without a measured requirement and an approved ADR.

### A2 — Bounded-context baseline
**Decision:** The architecture reconciliation baseline is **9 bounded contexts**, subject to formal acceptance of ADR-0021.

**Contexts:**
1. Core / Platform
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

**Important:** The historical 15-context roadmap claim and 13-context draft remain preserved as provenance. They are not silently deleted or reinterpreted.

### A3 — Modules are not contexts
Implementation modules, PostgreSQL schemas, aggregates, read models, workers, and event consumers are separate architectural concepts. A module may implement part of a context or cross-context capability; a read model/worker does not become a bounded context merely because it has a directory or process.

### A4 — Tenant boundary
The SaaS tenancy model is Agency → Workspace → Branch, with authorization evaluated at the workspace/tenant scope and database-level isolation enforced through RLS. Application filtering alone is insufficient.

### A5 — Domain authority
Business state changes belong to domain/application services and state-machine transitions. Direct status mutation is prohibited. Business facts are emitted as domain events through the transactional outbox pattern.

### A6 — Financial authority
Money is represented as integer DZD centimes. Posted financial entries are immutable; corrections are compensating entries. Financial invariants are enforced in the domain and persistence layers, not trusted to clients.

### A7 — Inventory correctness
Inventory availability, reservation, expiry, and release are correctness-critical operations. The design must prevent double allocation under concurrency and must have an executable race-condition test before the relevant slice is considered complete.

### A8 — Contract before implementation
Canonical contracts precede implementation: permissions, state machines, event envelopes, task contracts, schema contracts, and acceptance evidence. Code does not become authoritative by existing.

### A9 — Database reality
The live database is authoritative for current runtime reality, not future design. No schema implementation or migration may be justified from a target Prisma contract alone. Before schema-touching work: identify environment, introspect reality, establish drift, verify recovery evidence, then authorize the smallest forward-only change.

### A10 — Public/external boundaries
WhatsApp-first, Arabic-first, French-second, English-third are product operating assumptions from the current specification. External APIs, legal rules, platform limits, and technology versions must be re-verified from primary sources when implementation depends on them.

### A11 — AI boundary
AI is an augmentation layer, not the authority for permissions, money, inventory locks, contractual state, or audit facts. AI actions must execute through the same authorization, validation, idempotency, and audit controls as human-triggered operations.

### A12 — Implementation sequencing
The first implementation slice must be bounded and evidence-driven. No global authorization to implement the entire platform is implied by this document.

## 3. Non-decisions intentionally preserved

The following are **not** yet canonicalized here:

- exact mapping of all implementation modules to contexts;
- final aggregate ownership matrix;
- final event producer/consumer ownership;
- canonical task count until 114-vs-119 reconciliation closes;
- canonical schema contract until 59/16/15-vs-59/17/56 reconciliation closes;
- live Supabase project identity;
- production database schema reality;
- production deployment readiness.

## 4. Required evidence before implementation authorization

- ADR-0021 accepted and verified;
- context → module ownership matrix approved;
- task reconciliation closed;
- schema contract reconciliation closed;
- security/tenancy controls traced to canonical contexts;
- platform identity GATE-00 verified;
- Foundation CI execution evidence captured;
- database reality/backup/restore evidence established before schema mutation;
- first bounded implementation slice has a complete task contract.

## 5. Engineering rule

When a source conflicts with this working baseline, do not silently edit this document. Record the conflict, identify authority, update the relevant ADR/contract, and only then change the baseline.
