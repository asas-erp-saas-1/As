---
name: asas-design-fidelity
description: Turn accepted ASAS Figma design-system intent into implementation-ready contracts and verify responsive, RTL, accessibility and visual fidelity in Codex.
---

# Design Fidelity

## Design authority

Product/business semantics come from ASAS architecture/contracts. Visual/design intent comes from accepted Figma/design contracts. Executable UI is repository code. Runtime behavior is tested implementation.

## Pipeline

`IDEA → UX MODEL → TOKENS → PRIMITIVES → COMPONENTS → PATTERNS → FIGMA → DESIGN REVIEW → DESIGN ACCEPTED → CODEX IMPLEMENTATION → BROWSER QA → VISUAL QA → ACCESSIBILITY QA → RESPONSIVE QA → ACCEPTED`.

## Figma MCP

Use official Figma MCP when configured. It provides structured design context; it does not guarantee perfect code. Use Code Connect when real ASAS components are stable and mappings are trustworthy.

## Acceptance

Check:
- component reuse;
- variables/tokens;
- typography;
- spacing/layout constraints;
- interaction states;
- loading/empty/error states;
- Arabic/RTL/French/English;
- keyboard/focus/accessibility;
- responsive behavior;
- real-data density;
- mobile/tablet/desktop;
- visual regression.

Never fix an architectural component problem with arbitrary CSS. Escalate the contract when design and domain semantics conflict.
