# ASAS — ENGINEERING RESEARCH & DECISION UPDATE — 2026-09-24

**Artifact ID:** ASAS-ARCH-RESEARCH-UPDATE-2026-09-24
**Status:** CANONICAL RESEARCH / ENGINEERING AMENDMENT
**Branch:** `platform-architecture-2026`
**Scope:** Architecture control plane, Codex operating model, repository governance, modular architecture, reliability and security
**Authority:** Subordinate to founder/product decisions, approved architecture/ADR, contracts/registers and verified runtime reality

## 1. Purpose

This record captures material external engineering research performed during the current architecture hardening cycle and converts only the defensible implications into ASAS engineering rules. External research is evidence for method, not authority over ASAS product or brownfield reality.

## 2. Current external evidence

### 2.1 DDD / bounded contexts

Martin Fowler's DDD reference describes a bounded context as a strategic boundary around a coherent model and emphasizes that large domains are divided into contexts because one unified model becomes difficult to keep internally consistent. It also notes that the same concept may legitimately have different models in different contexts.

**ASAS implication:** context count must be derived from semantic cohesion, ownership, language and integration boundaries. A numeric context target must never drive decomposition. `Bounded Context ≠ Module ≠ Aggregate ≠ Database Schema` remains mandatory.

Source: Martin Fowler, "Bounded Context".

### 2.2 Well-architected engineering

AWS Well-Architected continues to organize architecture quality around operational excellence, security, reliability, performance efficiency, cost optimization and sustainability. Its operational-excellence guidance emphasizes operations as code, small reversible changes, anticipating failure, actionable observability and continuous improvement.

**ASAS implication:** the architecture roadmap must treat verification, observability, failure rehearsal, reversibility and operational controls as first-class engineering work rather than post-launch hardening.

Sources: AWS Well-Architected Framework and Operational Excellence / Reliability guidance.

### 2.3 GitHub governance

GitHub documents branch protection/rulesets, required status checks, pull-request requirements and CODEOWNERS as mechanisms for enforcing repository controls. The existence of a documented rule is not evidence that a repository actually has the rule enabled.

**ASAS implication:** governance documents may define required controls, but gate closure requires live repository evidence that the corresponding GitHub protection/status checks actually execute.

### 2.4 Codex / agent skills

Current OpenAI developer guidance describes skills as reusable workflow instructions with optional references, scripts and assets. Current Codex guidance also recommends avoiding unnecessarily bloated instruction stacks: repository instructions should be relevant to the task rather than forcing the agent to read every document before every small change. OpenAI's current agent guidance supports reusable skills, tools, sandboxed execution, multi-agent orchestration and explicit controls.

**ASAS implication:** the Codex control plane must remain layered but selective:

```text
AGENTS.md
→ current checkpoint
→ task-relevant canonical routing
→ task-specific skill
→ required contracts/registers
→ implementation
→ verification
```

The agent must not blindly load the entire repository for every task. The control plane should route the minimum authoritative context required for the task while preserving mandatory reads for architecture-changing work.

## 3. Engineering method update

The following method is now mandatory for material engineering uncertainty:

```text
ASAS sources
→ branch/history evidence
→ source-package evidence
→ official external research
→ independent corroboration when risk warrants
→ alternatives + failure-mode analysis
→ smallest defensible engineering derivation
→ explicit provenance label
→ contract / ADR / register
→ implementation authorization
→ test / verification
→ evidence
```

This is not permission to invent project facts. Engineering derivation must remain explicitly distinguishable from source-derived fact.

## 4. New agent-quality principle

A coding agent should optimize for **decision quality and evidence quality**, not document volume.

Therefore:

- do not duplicate canonical knowledge into every task;
- route to canonical sources instead of copying them;
- use focused skills for recognizable workflows;
- require broader repository/branch research only when the task is architectural, forensic, cross-cutting or provenance-sensitive;
- require tests and evidence proportional to risk;
- stop when authority is missing rather than hallucinating closure.

## 5. ASAS implementation consequence

The current project remains architecture-first and local-first. Cloud/runtime work is downstream of reproducible local contracts, schema, tests and verification. This does not prohibit cloud research or later runtime validation; it prevents cloud state from becoming an undocumented design authority.

## 6. Current decision status

| Decision | Status |
|---|---|
| Use external research to close engineering knowledge gaps | APPROVED OPERATING METHOD |
| External research may override ASAS product/runtime authority | NO |
| Numeric context/module counts drive architecture | NO |
| Codex should read every repository document for every task | NO |
| Codex should use task-specific skills | YES |
| Architecture-changing work requires expanded provenance review | YES |
| Runtime/database claims require runtime evidence | YES |
| Historical branches may be deleted before provenance extraction | NO |
| Cloud infrastructure is required before local architecture/schema work | NO |
| Production destructive changes are autonomous | NO |

## 7. Research sources

- OpenAI Developers — Rethinking skills and prompts for GPT-6 Astra (2026-09-11): current guidance on right-sized `AGENTS.md`, skills and task prompts.
- OpenAI Developers — Skills / Build skills: reusable focused workflow instructions and supporting resources.
- OpenAI Developers — Agents / Agents API: tool use, skills, sandboxing, sessions and multi-agent orchestration.
- Martin Fowler — Bounded Context (DDD strategic design reference).
- AWS Well-Architected Framework — Operational Excellence and Reliability guidance.
- GitHub Docs — protected branches and secure use / CODEOWNERS.

## 8. Review triggers

Revisit this research record when:

- Codex instruction-loading behavior changes materially;
- repository skill architecture changes;
- branch/ruleset enforcement is enabled or changed;
- architecture decomposition is reconsidered;
- local-first development constraints change;
- a new security/reliability standard materially affects the platform.
