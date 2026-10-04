# C03 — Open Questions

**Status:** ACTIVE — all items below remain governed questions, not implementation TODOs.

## Blocking

1. **Apartment ↔ Unit identity:** Is `apartment` in the normative commercial state machine exactly the canonical `Unit` object, including identity, tenant scope and lifecycle ownership?
2. **Inventory ownership:** Is availability a Unit-owned state, a separate inventory object, or another Real Estate contract?
3. **Commercial vs availability:** Which state machine is authoritative for each transition, and which events synchronize the two?
4. **Reservation concurrency:** What is the exact exclusive-inventory invariant, hold expiry rule, idempotency scope and conflict outcome?
5. **Pricing commitment:** Which action creates a price commitment and what immutable/versioned evidence preserves it?
6. **Cross-context command/event contract:** What exact commands/events cross Real Estate ↔ Sales ↔ Finance boundaries, with transaction, retry and audit semantics?
7. **Brownfield runtime identity:** Which Supabase project is the canonical ASAS runtime/database project, and what read-only evidence proves it?
8. **Independent closure evidence:** Who/what provides the genuinely independent review required by the C-track protocol, distinct from the current authoring stream?

## Non-blocking / follow-up

9. Floor identity and lifecycle semantics.
10. Structural detach/archive/restore commands.
11. Exact cross-context event naming after the above boundaries are frozen.
12. Projection invalidation/rebuild policy after transactional mutations.

## Rule

No answer is inferred from UI behavior, historical implementation, database convenience, naming alone, or a previous assistant answer. Each answer requires authoritative evidence or an explicit governed architecture decision.
