# ASAS Foundation Technology Research — September 2026

**Date:** 2026-09-14
**Status:** Research / architecture support; no implementation authorization.
**Method:** primary vendor documentation first, per the ASAS research doctrine.

## 1. Figma MCP + Claude Code

**Verified fact:** Figma's current official documentation describes an MCP server that gives Claude Code structured access to Figma files, including components, variables and layout data. It also supports generating code from selected frames, Code Connect alignment, and writing native Figma content. Figma documents both remote and desktop servers and recommends the remote server for most users because it has the broadest feature set. citeturn0search1turn0search13turn0search15

**ASAS implication:** the existing Figma contract is technically aligned with the current vendor direction. Claude should use structured Figma context rather than screenshot-only prompting. The integration remains subordinate to ASAS domain, authorization, token and UX contracts.

**Decision:** retain remote Figma MCP as the preferred future Claude workflow; treat desktop MCP as an environment-specific option, not the default architecture.

## 2. Next.js App Router

**Verified fact:** current Next.js documentation continues to position the App Router as the newer router supporting modern React features including Server Components; the official docs also maintain accessibility guidance. citeturn0search4

**ASAS implication:** the existing server-first UI direction remains compatible with current Next.js architecture. The implementation should keep client components narrowly scoped where interactivity requires them rather than turning enterprise screens into one large client application.

**Decision:** no architecture change required from this research pass.

## 3. Prisma migration/drift discipline

**Verified fact:** current Prisma documentation emphasizes migration history as a reviewable, repeatable artifact and documents schema-drift detection workflows. Current Prisma 8 documentation also describes migration graphs for parallel development and explicit migration status/check workflows. citeturn0search2turn0search3turn0search5turn0search12

**ASAS implication:** the Blueprint's insistence on reality-first introspection, baseline/drift detection and reproducible migrations is reinforced by current vendor guidance. The live production schema must still outrank the target contract for the pre-existing tables, as ASAS policy requires.

**Decision:** preserve the Phase 0 migration/reality gate. Do not introduce a migration reset or destructive shortcut to make drift disappear.

## 4. Supabase / PostgreSQL RLS

**Verified fact:** current Supabase documentation states that PostgreSQL RLS provides granular database authorization, should be enabled for exposed tables, and should be tested explicitly for select/insert/update/delete. Supabase also distinguishes database roles/grants from application authorization and recommends RLS for database-level protection. citeturn0search0turn0search7turn0search16

**ASAS implication:** the current defense-in-depth model is correct: application authorization is not enough, and RLS is not enough by itself. Both must be designed and tested.

**Decision:** retain tenant guard + application authorization + RLS as layered controls. Phase 0 must prove them against the real database rather than a hypothetical schema.

## 5. Research conclusion

No current primary-source finding requires a change to the ASAS foundation architecture in this pass.

The more important conclusion is methodological: the Blueprint's research doctrine should remain active. Version-sensitive claims about frameworks, APIs, provider behavior, plans, limits or security controls must be re-verified at the time the corresponding implementation task starts.

The repository should record the fact, source, date and confidence rather than treating today's vendor behavior as a permanent architectural truth.
