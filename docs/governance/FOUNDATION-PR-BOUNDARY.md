# ASAS Foundation Governance PR Boundary

This pull request is intentionally limited to repository engineering controls and Claude handoff readiness.

## Included
- governance and branch policies;
- Claude handoff/index/boundaries;
- task graph/task packet definitions;
- contract reconciliation rules;
- repository structure and placement rules;
- foundation verification workflow/contract;
- current-state and platform findings;
- branch hygiene register.

## Excluded
- application implementation;
- database schema/migrations;
- production secrets/configuration;
- deployment mutation;
- destructive cleanup of historical repository objects;
- adoption of unrelated repositories or runtime projects.

## Merge criterion

Merge only after the PR diff is reviewed as one coherent foundation layer and the resulting `main` remains internally consistent with the canonical handoff chain.
