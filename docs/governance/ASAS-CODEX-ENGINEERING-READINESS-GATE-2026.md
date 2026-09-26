# ASAS — CODEX ENGINEERING READINESS GATE 2026

**Artifact ID:** ASAS-CODEX-READINESS-2026-001  
**Status:** ACTIVE / PRE-IMPLEMENTATION  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Canonical branch:** `platform-architecture-2026`

## Purpose

Define the minimum engineering-control environment required before Codex is authorized to write application or database implementation for ASAS.

## Gate model

### R0 — Repository control

- repository identity verified;
- canonical branch verified;
- current checkpoint unique;
- AGENTS valid;
- no hidden alternate authority.

### R1 — Architecture control

- architecture baseline identified;
- roadmap/context/execution path aligned;
- unresolved conflicts explicit;
- task is within authorized scope.

### R2 — Skill control

- `.agents/skills/` exists;
- each selected skill has valid front matter and instructions;
- skill selection is task-specific;
- skills do not override architecture authority.

### R3 — Contract control

- domain ownership closed for the task;
- commands/queries/states/events/permissions/invariants defined;
- tenant/security boundary defined;
- schema impact defined;
- failure/concurrency semantics defined.

### R4 — Design control

For UI tasks:

- design contract accepted;
- tokens/components/variants identified;
- responsive/localization/accessibility states defined;
- Figma MCP/Code Connect context verified if used.

### R5 — Implementation control

- authorized task packet exists;
- allowed files are bounded;
- database impact is explicit;
- external side effects are explicit;
- rollback/recovery is defined;
- stop conditions are defined.

### R6 — Verification control

- test strategy exists;
- independent verification path exists;
- evidence format exists;
- no document-only closure.

### R7 — Repository protection

Branch protection/rulesets must be verified before production integration. The current architecture branch is not protected according to the latest GitHub branch metadata; this is a governance finding, not an implementation blocker for local architecture work.

Required eventual controls include appropriate pull-request review, required status checks and protected history for the production integration branch.

## Authorization states

`NOT_READY | PARTIAL | AUTHORIZED_FOR_LOCAL_IMPLEMENTATION | AUTHORIZED_FOR_CONTROLLED_INTEGRATION | PRODUCTION_READY`

Current state:

`PARTIAL — ARCHITECTURE ENGINEERING ONLY`

## Hard rule

Passing this gate does not authorize production. It only authorizes the bounded scope explicitly stated in the task packet.

## External basis

OpenAI's current Codex guidance recommends persistent `AGENTS.md` context and task prompts shaped like concrete GitHub issues/PRs. OpenAI's current skill guidance recommends modular `SKILL.md` workflows with progressive disclosure. GitHub's current agent guidance distinguishes repository-wide instructions, path-specific instructions, agent instructions and skills. These practices inform this gate; ASAS authority remains repository-specific.
