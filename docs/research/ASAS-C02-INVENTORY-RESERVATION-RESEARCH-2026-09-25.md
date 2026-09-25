# ASAS C02 Inventory / Reservation Research — 2026-09-25

## Question

How should ASAS model developer-owned inventory, partner allocation, reservation concurrency, authorization and historical attribution without duplicating the authoritative inventory?

## External evidence

### OWASP Authorization Cheat Sheet

Least privilege and deny-by-default are recommended. Authorization must distinguish authenticated identity from permitted resource/action access.

### OWASP Transaction Authorization Cheat Sheet

Transaction authorization should be enforced server-side and must not be alterable by client-supplied transaction parameters.

### AWS SaaS Architecture Fundamentals

Tenant isolation is distinct from authentication/authorization. SaaS systems need explicit isolation mechanisms that block access to another tenant's resources.

### AWS Prescriptive Guidance

Multi-tenant API authorization can combine RBAC and ABAC/contextual conditions and should be applied consistently across APIs rather than through ad-hoc endpoint logic.

### PostgreSQL documentation

PostgreSQL documents row-level locking, including `FOR UPDATE`, as a mechanism to block conflicting writes/locks on the same rows until transaction end. PostgreSQL also documents explicit blocking locks as a mechanism for application-level consistency when concurrent writes are possible.

## ASAS engineering derivation

The above supports, but does not dictate, the following ASAS decisions:

1. Inventory ownership and partner visibility are separate concepts.
2. Allocation cannot itself be treated as reservation.
3. Reservation is a transactionally protected state transition on canonical inventory.
4. Authorization must evaluate resource scope before the reservation command is allowed.
5. Reservation attribution must be snapshotted so later reassignment cannot rewrite history.
6. Partner performance must be an authorized projection over canonical facts, not a second database of copied truth.
7. The exact PostgreSQL locking/isolation strategy must be validated with concurrency tests before implementation.

## Sources

- https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html
- https://cheatsheetseries.owasp.org/cheatsheets/Transaction_Authorization_Cheat_Sheet.html
- https://docs.aws.amazon.com/whitepapers/latest/saas-architecture-fundamentals/tenant-isolation.html
- https://docs.aws.amazon.com/prescriptive-guidance/latest/saas-multitenant-api-access-authorization/introduction.html
- https://www.postgresql.org/docs/17/explicit-locking.html
- https://www.postgresql.org/docs/17/applevel-consistency.html
