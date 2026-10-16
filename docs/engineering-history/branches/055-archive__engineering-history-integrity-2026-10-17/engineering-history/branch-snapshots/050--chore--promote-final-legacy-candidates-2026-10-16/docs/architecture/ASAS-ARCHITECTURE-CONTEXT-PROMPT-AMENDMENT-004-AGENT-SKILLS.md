# ASAS — CONTEXT PROMPT AMENDMENT 004 — AGENT SKILLS

**Status:** CANONICAL AMENDMENT  
**Effective date:** 2026-09-23

## Mandatory skill routing

When executing an ASAS task, Codex must consult:

`docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`

and select only the skills required by the task.

## Skill authority

Skills are operational procedures. They cannot override:

`Founder decisions → approved architecture → ADRs → canonical contracts/registers → authorized task → implementation`.

## Default skill selection

### Architecture / audit
`asas-repository-forensics + asas-architecture-governance + asas-domain-contracts`

### Database
`asas-repository-forensics + asas-domain-contracts + asas-database-engineering + asas-security-ai-safety + asas-testing-verification`

### UI / Figma
`asas-design-fidelity + asas-testing-verification`

### Security
`asas-security-ai-safety + asas-database-engineering + asas-testing-verification`

### Production/reliability
`asas-observability-reliability + asas-security-ai-safety + asas-testing-verification`

## Stop condition

If a skill workflow encounters unresolved authority, it stops and returns to the canonical control plane. A skill must never resolve a founder-level or protected decision by assumption.
