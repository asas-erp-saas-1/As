# ASAS CI Verification Contract

**Status:** FOUNDATION CONTROL
**Repository:** `asas-erp-saas-1/As`

## Purpose

CI is evidence collection and a merge gate. It is not a substitute for domain review, security review, or runtime verification.

## Gate layers

### Gate 0 — Repository integrity

Verify repository identity, required control documents, forbidden historical project references, and machine-readable artifact syntax where artifacts exist.

### Gate 1 — Static correctness

For implementation branches, the project CI must eventually verify formatting, linting, type safety, dependency policy and build correctness using the versions actually pinned by the repository.

### Gate 2 — Contract correctness

Validate canonical commands, events, permissions, state machines, schema contracts, API contracts and design tokens against their declared schemas and cross-references.

### Gate 3 — Automated behavior

Run unit, integration and end-to-end tests appropriate to the changed bounded context. Tests must cover both successful and rejected paths.

### Gate 4 — Security and isolation

For security-sensitive changes, verify authentication, authorization, tenant isolation, RLS/database enforcement, secret handling, webhook authenticity and replay protection as applicable.

### Gate 5 — Data/migration safety

For database changes, require migration review, expand/contract compatibility where applicable, backup/recovery consideration, invariant checks and evidence that destructive reinterpretation is not occurring.

### Gate 6 — Adversarial verification

Where the task changes business mutations, deliberately exercise duplicate requests, stale versions, concurrency races, retries, partial failures, unauthorized tenants/users and malformed external input as applicable.

## Required merge evidence

A PR may be considered merge-ready only when its task packet and CI evidence together establish:

- exact task identity;
- bounded scope;
- authoritative contract references;
- dependency closure;
- tests executed and outcomes;
- relevant security/isolation evidence;
- migration evidence if applicable;
- residual risks;
- reviewer ownership.

## Important bootstrap rule

The initial foundation workflow intentionally does not pretend that application build/test checks exist. It establishes the repository gate first. Application-specific checks become required only after the implementation stack and package scripts are canonicalized.

## Failure semantics

A failed required check blocks merge. A missing check is not silently treated as passing. A check that is irrelevant to a task must be explicitly classified as such by the task/gate design rather than bypassed ad hoc.
