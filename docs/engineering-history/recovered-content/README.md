# Recovered historical content

The corrected review has identified **222 distinct historical Git blob versions** whose exact content does not occur in the active canonical root (the root comparison contains 417 non-archival tracked files).

- `by-blob/` contains a one-copy-per-blob view of every distinct historical version. Each copy preserves the original blob content and uses the source path beneath its SHA directory.
- `UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv` maps each copy to source branch refs, commit SHAs, snapshot folders, byte counts, and original paths.
- `pre-archive-exclusion-foundation-verify.yml` is the specifically named historic workflow version from before the archive exclusion. It must not replace the active workflow.

The numbered branch snapshots remain the authoritative full-tree copies, including original object modes and surrounding context. Recovered content is not automatically approved for current architecture.
