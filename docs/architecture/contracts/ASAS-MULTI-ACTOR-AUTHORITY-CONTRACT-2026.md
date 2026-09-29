# ASAS Multi-Actor Authority Contract — 2026

**Status:** Semantic contract closed / implementation gated  
**ADR:** ADR-0030  
**Branch:** `platform-architecture-2026`

## Authority evaluation

For an actor `A`, action `X`, resource `R`, tenant/organization context `O`, and purpose `P`:

`ALLOW = identity ∧ tenant_scope ∧ relationship_scope ∧ role/team_scope ∧ resource_scope ∧ purpose_policy ∧ action_permission ∧ domain_invariants`

A missing required predicate is a denial by default.

## Resource authority dimensions

| Dimension | Meaning |
|---|---|
| Visibility | Can the actor discover/read the resource or permitted fields? |
| Operational control | Can the actor edit/manage it? |
| Allocation | Can the actor receive/assign commercial allocation? |
| Reservation | Can the actor initiate/control reservation actions? |
| Publication | Can the actor publish/unpublish an approved projection? |
| Contract | Can the actor prepare/execute permitted contract actions? |
| Finance | Can the actor perform permitted payment/financial actions? |
| Commission | Can the actor view/manage entitlement or payout actions? |
| Administration | Can the actor manage policy/configuration? |

These dimensions are independent unless a canonical permission explicitly composes them.

## Canonical relationship patterns

### Development
`Organization → Project → [Building] → [Floor] → Unit`

Authority can be narrowed by project, inventory batch, team, allocation and explicit exception.

### Brokerage
`Owner → Mandate → Listing → Property`

Mandate/relationship semantics determine what the brokerage may do; Listing itself does not create authority.

### Public
`Published Projection → Public Consumer`

Only published/public fields are exposed. Public visibility never implies operational authority.

## Non-negotiable invariants

- Organization type does not determine priority.
- Ownership does not automatically imply every operational permission.
- Visibility does not imply mutation.
- Allocation does not imply reservation authority unless explicitly granted.
- Publication does not imply inventory ownership.
- Tenant scope cannot be bypassed by relationship, role, cache, search, event, job, analytics or AI.
- AI cannot widen caller authority.
- Configuration cannot weaken core security/domain invariants.
- Historical transactions remain auditable when access or publication is revoked.

## Required denial cases

1. Cross-tenant read.
2. Cross-organization read without relationship/scope.
3. Agency accessing developer inventory outside its project/batch scope.
4. User seeing a Listing without valid mandate/relationship scope where operational access is required.
5. Public consumer attempting operational mutation.
6. User with visibility but without mutation permission attempting an update.
7. Agent attempting reservation outside authorized project/inventory scope.
8. AI tool attempting an action unavailable to the human caller.
9. Revoked membership retaining access through stale cache/search.
10. Workflow attempting an action after its authority has expired.

## Implementation status

The contract is semantic authority only. Exact permission keys, RLS predicates, repository services, and database representations remain implementation-gated until runtime/brownfield reconciliation is complete.
