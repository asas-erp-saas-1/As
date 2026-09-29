# ASAS — DESIGN TO CODE CONTINUITY CONTRACT 2026

**Artifact ID:** ASAS-DESIGN-CONTINUITY-2026-001  
**Status:** CANONICAL DESIGN/ENGINEERING CONTRACT  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Canonical branch:** `platform-architecture-2026`

## 1. Purpose

Prevent visual design, UX behavior and implementation from becoming disconnected artifacts.

ASAS uses Figma as a design-system and experience-engineering surface and Codex as the primary implementation executor.

## 2. Source-of-truth separation

```text
Product/business semantics       → ASAS architecture/contracts
Design intent and visual system  → accepted Figma/design contracts
Executable UI                    → repository code
Runtime behavior                 → tested implementation
```

No layer silently overrides another.

## 3. Design maturity ladder

A feature passes these states in order:

`IDEA → UX MODEL → DESIGN SYSTEM CONTRACT → FIGMA DESIGN → DESIGN REVIEW → DESIGN ACCEPTED → CODE IMPLEMENTATION → VISUAL QA → ACCESSIBILITY QA → RESPONSIVE QA → ACCEPTED`

A Figma frame alone is not implementation authorization.

## 4. Figma contract

Each implementation-ready Figma feature should provide, where applicable:

- frame/screen identity;
- user journey;
- component references;
- variants and states;
- variables/tokens;
- typography;
- spacing/layout constraints;
- responsive behavior;
- RTL/LTR behavior;
- localization expectations;
- interaction states;
- empty/loading/error states;
- accessibility requirements;
- real-data density expectations;
- linked code components where Code Connect is available.

## 5. Codex implementation contract

Codex consumes accepted design context through the repository design contract and, where configured, Figma MCP/Code Connect.

Codex must not recreate components from visual appearance when an accepted ASAS component already exists.

Codex must preserve:

- design tokens;
- component APIs;
- interaction semantics;
- responsive constraints;
- accessibility;
- localization;
- RTL behavior;
- error/loading/empty states.

## 6. Visual verification loop

```text
Figma
→ Codex implementation
→ local browser
→ exact viewport matrix
→ screenshot/render comparison
→ discrepancy classification
→ correction
→ rerender
→ acceptance evidence
```

Required viewport classes include phone, tablet and desktop. Exact project-specific viewport values are defined by the design system/test plan rather than guessed globally.

## 7. Design/code drift controls

Where practical, CI or verification should detect:

- missing design tokens;
- duplicate primitives;
- unapproved component variants;
- hard-coded values replacing tokens;
- incorrect typography;
- missing localization keys;
- broken RTL layouts;
- inaccessible interactive elements;
- visual regressions.

## 8. Code Connect policy

Code Connect is introduced when the ASAS component library has stable production implementations worth mapping.

Mappings must point to real repository components and remain synchronized with component API changes.

Do not create Code Connect mappings merely to make a design appear integrated.

## 9. Design acceptance evidence

A screen is accepted only with evidence for:

`structure + responsive behavior + interaction states + localization + accessibility + real-data behavior + visual fidelity`

## 10. Official integration basis

Figma's official documentation states that its MCP server can provide structured design context to AI coding tools, generate code from selected frames, write native Figma content, and use Code Connect to improve alignment with real code components.

ASAS therefore treats Figma MCP and Code Connect as optional integration mechanisms inside the design-to-code contract, not as business-authority systems.

## 11. Stop conditions

Stop implementation when:

- Figma and canonical product semantics conflict;
- component ownership is unclear;
- responsive behavior is unspecified for a critical surface;
- accessibility requirements are missing for a critical workflow;
- a design decision changes domain behavior;
- a visual discrepancy indicates an architectural component problem rather than a CSS adjustment.

Escalate the underlying contract rather than patching around it.
