# ASAS Engineering Conference Decision Log — 2026-09-24

## Confirmed founder decision

**Decision:** D — Hybrid employee authorization model.

### Model

```text
Organization relationship
        +
Team / Role scope
        +
Project assignment
        +
Individual exception
```

### Product intent

A Developer and an Agency remain independent organizations. A commercial relationship makes collaboration possible, but it does not expose the Developer's resources to every Agency employee automatically.

### Employee visibility principle

**Users see only what is relevant and authorized for their responsibility.**

### Example

Agency A works with Developer X and Developer Y.

- Sales Team 1 -> Project X
- Sales Team 2 -> Project Y
- Ahmed -> Team 1
- Karim -> Team 2
- Director -> broader performance visibility when policy permits

Ahmed must not automatically see Project Y merely because Agency A has a relationship with Developer Y.

### Developer-side product value

The Developer can receive controlled visibility into authorized commercial performance: leads, visits, offers, reservations, sales, attribution, conversion, and inventory velocity. Visibility should use configurable defaults with explicit policy overrides.

### Architectural implications

- Membership, relationship, assignment, permission, and tenant isolation are distinct concepts.
- UI hiding is not an authorization mechanism.
- Cross-organization access must be resource-scoped and auditable.
- Ambiguous access must fail closed.
- No production schema/RLS implementation is authorized by this decision alone.

### Next conference topic

Determine whether the collaboration boundary is the **Project**, a dedicated **Collaboration Space**, or a more general **Resource Scope** abstraction, and reconcile this with existing ASAS repository evidence before schema design.
