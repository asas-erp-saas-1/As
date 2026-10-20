# ASAS Foundation PR Checklist

Before merging the foundation governance branch into `main`:

- [ ] Diff is limited to the foundation PR boundary.
- [ ] Canonical handoff chain is complete on the branch.
- [ ] `main` remains the only integration truth.
- [ ] No unrelated repository/deployment/database has been promoted into authority.
- [ ] No secrets or production configuration are introduced.
- [ ] Foundation verification workflow is present.
- [ ] Repository map and placement rules are present.
- [ ] Task graph/task packet/reconciliation controls are present.
- [ ] Branch hygiene findings are recorded.
- [ ] Any external GitHub administrative limitation is recorded rather than bypassed.
- [ ] Runtime/database readiness remains separately gated.
