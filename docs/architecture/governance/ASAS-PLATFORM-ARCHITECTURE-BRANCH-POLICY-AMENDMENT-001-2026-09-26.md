# ASAS — Platform Architecture Branch Policy Amendment 001

**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Canonical branch:** `platform-architecture-2026`  
**Status:** ACCEPTED — FOUNDER EXECUTION DECISION

## Purpose

The Engineering Conference and Platform Engineering track are being executed on one long-lived canonical working branch:

`platform-architecture-2026`

No additional working branch is created for the conference track unless the Founder explicitly changes this decision.

## Relationship to AGENTS.md

`AGENTS.md` contains the default repository policy that one coherent task should normally use one branch/PR. This amendment records a bounded founder-authorized exception for the Platform Architecture Conference track.

This amendment does **not** authorize:

- force-push;
- reset/rewrite history;
- destructive migration;
- production-data deletion;
- bypassing evidence gates;
- bypassing code review or CI where applicable;
- mixing unrelated product work into the conference branch.

## Scope of the exception

The branch may contain a sequence of tightly related architecture/platform-engineering tasks when they are part of the same canonical conference-to-implementation path:

`research → decision → contract → reconciliation → implementation → verification → checkpoint`

Every task must remain traceable through:

- ADRs;
- contracts;
- registers;
- task packets;
- research records;
- evidence reports;
- `CURRENT-SESSION-STATE.md`.

## Branch discipline

Even though the branch is long-lived, each change must remain:

1. scoped;
2. attributable to a checkpoint/task packet;
3. independently reviewable;
4. reversible unless explicitly approved otherwise;
5. evidence-labelled;
6. compatible with the canonical architecture.

## Authority

This amendment governs only the conference/platform-architecture execution branch. It does not change product scope, security policy, financial controls, schema promotion gates, or production deployment authorization.

## Decision

`platform-architecture-2026` is the sole active engineering-conference/platform-architecture branch until the Founder explicitly changes this decision.
