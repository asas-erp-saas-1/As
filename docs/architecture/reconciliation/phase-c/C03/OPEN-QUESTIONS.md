# C03 — Open Questions

**Status:** ACTIVE — all items below remain governed questions, not implementation TODOs.

## Blocking

1. **Apartment ↔ Unit identity:** Is `apartment` in the normative commercial state machine exactly the canonical `Unit` object, including identity, tenant scope and lifecycle ownership?
2. **Inventory ownership:** Is availability a Unit-owned state, a separate inventory object, or another Real Estate contract?
3. **Commercial vs availability:** Which state machine is authoritative for each transition, and which events synchronize the two?
4. **Reservation concurrency:** What is the exact exclusive-inventory invariant, hold expiry rule, idempotency scope and conflict outcome?
5. **Pricing commitment:** Which action creates a price commitment and what immutable/versioned evidence preserves it?

## Non-blocking / follow-up

6. Floor identity and lifecycle semantics.
7. Structural detach/archive/restore commands.
8. Exact cross-context event naming after the above boundaries are frozen.
9. Projection invalidation/rebuild policy after transactional mutations.

## Rule

No answer is inferred from UI behavior, historical implementation, database convenience or naming alone. Each answer requires authoritative evidence or an explicit governed architecture decision.
