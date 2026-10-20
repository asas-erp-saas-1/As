# Latest branch-head snapshots — 2026-10-20

The live branch census contains 54 refs and 26 distinct head commits. The previous manifest already contained every current branch name; two refs had advanced beyond their archived heads. The full source root tree is stored as the snapshot folder's root tree object, without rewriting file content.

| Order | Branch | Source head | Commit date (UTC) | Source tree SHA | Verification |
|---:|---|---|---|---|---|
| 057 | `platform-architecture-2026` | `2672247aab8ce830091db1df83d1b233aa88d17f` | 2026-10-16 23:59:28 | `bc362b385189deb42618bb624c1a857b62c55c88` | PASS_TREE_SHA |
| 058 | `archive/engineering-history-integrity-2026-10-17` | `e54e5726a09070fa91899c32cf6848b5cc728b36` | 2026-10-17 00:07:12 | `274493a3cceea1a8100d07ce8b2e4e6667643cd1` | PASS_TREE_SHA |

GitHub's recursive tree enumeration is truncated for these nested archive trees. No file count is claimed. Each snapshot folder's tree SHA equals its source commit's root tree SHA, which preserves the entire tracked tree as a Git object. Orders 055 and 056 remain intact as historical checkpoints; 057 and 058 preserve the newer tips.

The updated verification register records the tree-SHA checks. Four newly identified historical file blobs from order 058 are preserved under `recovered-content/by-blob/` and listed in the unique-content manifest.
