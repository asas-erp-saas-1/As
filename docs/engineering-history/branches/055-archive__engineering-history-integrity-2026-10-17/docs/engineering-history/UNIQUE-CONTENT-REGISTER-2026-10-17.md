# Unique historical content register — 2026-10-17

## Identified content absent from the current root by exact blob identity

Exactly one distinct file blob was found in the branch snapshots that does not occur anywhere in the current canonical root outside `docs/engineering-history/**`:

- Original path: `.github/workflows/foundation-verify.yml`
- Historical blob SHA: `baaae4cde9dbb357ac968239e921930559e7b51e`
- Exact byte size: 8,649 bytes
- Present in snapshot orders 051 and 052:
  - `branches/051-platform-architecture-2026/.github/workflows/foundation-verify.yml`
  - `branches/052-archive__engineering-history-2026-10-16/.github/workflows/foundation-verify.yml`
- Standalone preservation path: `recovered-content/pre-archive-exclusion-foundation-verify.yml`

The current workflow is blob `b0d1c02bd83554e119316c52711a76e281150cdb`, 8,695 bytes. The historical version predates the line excluding `docs/engineering-history/**` from the active-state grep. Keeping both versions is intentional: the old one documents the state before the archival safeguard, while the current version prevents archived historical snapshots from being misclassified as active instructions. Do not promote the historical workflow over the current one.

**Meaning of “one unique blob”:** this is an exact full-file comparison using Git blob IDs, not a semantic assessment of all sentences. The other changed file versions are preserved in the snapshots too; their exact blob content is also present elsewhere in the current root.
