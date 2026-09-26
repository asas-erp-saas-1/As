# ASAS — H0 Foundation Gate Convergence Task Packet

**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Status:** OPEN / EVIDENCE-GATED
**Authority:** ASAS V3 + current branch governance

## Purpose

The Engineering Conference has closed a substantial set of semantic decisions through C03.12. V3, however, defines foundation gates as prerequisites to implementation authorization. This task packet therefore supersedes feature-sequence pressure and makes foundation convergence the immediate platform-engineering priority.

## Governing order

```text
GATE-00 Platform Identity
→ GATE-01 Canonical Artifacts
→ GATE-02 Architecture Conflict
→ GATE-03 Database Reality
→ GATE-04 Security Baseline
→ GATE-05 Architecture CI
→ GATE-06 Repository Hygiene
→ GATE-07 Implementation Authorization
```

Semantic conference decisions remain valid unless contradicted by stronger evidence. They do not authorize implementation by themselves.

## Work packages

### H0.1 Platform identity

Verify, with technical evidence:

- GitHub repository identity;
- architecture branch identity;
- canonical Supabase project/database identity;
- Vercel project identity;
- development/staging/production mapping;
- environment-to-project mapping;
- protection against accidental inspection or migration of the wrong project.

A written claim is insufficient. The guard must be machine-checkable for schema-touching work.

### H0.2 Canonical artifact convergence

Verify:

- one active session checkpoint;
- one architecture authority;
- one roadmap authority;
- one conference path;
- contract/register ownership;
- deprecated `SESSION_STATE.md` references are not active routing instructions;
- duplicate readiness documents are classified.

### H0.3 Architecture conflict closure

Verify the V3 decision that nine bounded contexts remain canonical and platform capabilities remain platform planes/capabilities unless a future ADR proves independent ownership and transactional boundaries.

### H0.4 Runtime/database reality

Read-only first:

- identify the actual runtime database;
- introspect schema;
- inspect constraints/indexes/triggers/RLS;
- map Unit/Apartment/Reservation/Pricing representations;
- reconcile migration history against observed reality;
- produce drift matrix.

### H0.5 Security baseline

Verify tenant/resource authorization, RLS posture, storage/job/event/search/cache/analytics isolation and service-role boundaries before implementation authorization.

### H0.6 Architecture-as-code CI

Machine-check only rules whose scripts actually exist and are evidenced. Priority checks:

- canonical paths;
- stale checkpoint references;
- wrong-project references;
- contract/register consistency;
- state/event/permission registration;
- forbidden destructive operations;
- dangerous dependency drift.

### H0.7 Repository hygiene

Reconcile branch policy, `.gitignore`, license/source provenance, readiness artifacts and repository visibility/protection findings without deleting historical evidence prematurely.

## Non-goals

This packet does not authorize:

- production schema changes;
- RLS changes;
- destructive migrations;
- reservation implementation;
- finance posting implementation;
- production deployment;
- branch creation outside `platform-architecture-2026`.

## Definition of done

H0 closes only when GATE-00 through GATE-06 have objective evidence and GATE-07 can be evaluated. Any gate without evidence remains `OPEN`, `BLOCKED`, `PARTIAL`, or `NOT_EXECUTED`.

## Required evidence bundle

- platform identity record;
- canonical artifact register reconciliation;
- architecture conflict record;
- live database introspection evidence;
- security/RLS evidence;
- CI verification output;
- repository hygiene reconciliation;
- updated checkpoint;
- explicit implementation authorization status.

## Traceability

V3 §82 requires foundation closure before feature implementation. V3 §69 defines GATE-00 through GATE-07. The Engineering Conference path remains the semantic decision workstream; this packet is its implementation/control-plane gate.
