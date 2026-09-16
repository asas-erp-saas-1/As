# Branch and Pull Request Definition of Done

A branch is ready for review only when all applicable conditions are true:

- [ ] Branch has one bounded objective and references a task ID.
- [ ] Base branch is correct and current enough for the task.
- [ ] Authoritative contracts and dependencies were inspected.
- [ ] No unrelated changes are included.
- [ ] Security and tenant boundaries are preserved and tested.
- [ ] State, command and event behavior is covered where applicable.
- [ ] Idempotency and concurrency behavior is covered where applicable.
- [ ] Database/migration safety is demonstrated where applicable.
- [ ] External side effects are authenticated, idempotent and observable where applicable.
- [ ] Positive and negative tests pass.
- [ ] Required CI checks pass.
- [ ] Documentation/contracts/checkpoints are updated.
- [ ] Residual risks are explicitly recorded.
- [ ] PR description explains what changed, why, evidence, and rollback/forward-fix considerations.

A reviewer may reject the branch even when automated tests pass if the task contract or architectural invariants are not demonstrated.
