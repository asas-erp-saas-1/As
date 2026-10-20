# ASAS Architecture Engineering Roadmap — Amendment 003

**Status:** CANONICAL AMENDMENT  
**Effective date:** 2026-09-23  
**Supersedes:** conflicting Codex/Claude executor wording in earlier roadmap text only  
**Scope:** agent execution authority and Q0 closure

## 1. Executor authority correction

Where the roadmap previously describes implementation as being executed by "Claude Code", the canonical executor is now:

**Codex = primary ASAS engineering executor.**

This includes authorized:

- application implementation;
- local database/schema engineering;
- forward migrations;
- tests and verification;
- CI and architecture-as-code;
- integration and refactoring.

Claude is retained as a specialized design/visual collaboration agent, primarily for Figma, UX, design-system refinement and visual review. It is not the default repository/database implementation writer.

## 2. Design-to-code boundary

The accepted design flow is:

`UX intent → design system → Figma → design review → accepted design contract → Figma MCP/Code Connect where configured → Codex implementation → browser/visual/accessibility verification`.

Figma output does not override domain architecture, contracts or authorization.

## 3. Q0 closure

Q0 control-plane work is now:

`REPOSITORY IDENTITY → AGENTS ROUTING → CODEX ENTRYPOINT → SKILL CATALOG → 9 SKILL MANIFESTS → CANONICAL REGISTER → CI ENFORCEMENT → CHECKPOINT`

Repository-side verification is closed. Live Codex discovery/execution remains `NOT_EXECUTED` until a Codex session produces evidence.

## 4. Next dependency

`Q1 Building Contract Closure`

No schema/model/migration promotion is authorized merely because historical Building evidence exists.
