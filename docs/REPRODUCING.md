# Reproducing this snapshot

## Versions

- Lean toolchain: `leanprover/lean4:v4.32.2`.
- mathlib commit: `905b95818eb32af7874a58b427f50c1711a5e96c`.
- Transitive dependency revisions are recorded in `lake-manifest.json`, using the manifest from that pinned mathlib checkout.
- Python 3.11 or newer for the standard-library-only packaging checks.

The repository uses ordinary Lake dependency configuration. See the [official Lake reference](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/) for the package/build interface. The committed version pins, rather than the moving documentation version, determine the intended environment.

## First build on a new machine

Install Elan and Git using their official distributions, then run these commands from the repository root:

```text
python scripts/verify_snapshot.py
lake update
lake exe cache get
lake build NoThreeLine.Target NoThreeLine.AffineBranch
lake build NoThreeLine.Concrete
```

The dependency setup/cache commands require network access. `Concrete` verifies a small, actual rectangle-field example with a positive uniform margin. It is not the entire numerical certificate or the final target.

`lake build` without targets builds the small `NoThreeLine` entry library. It does not automatically compile every shipped generated data module. To request the complete published collection:

```text
python scripts/build_snapshot.py --all
```

This is substantial work. The helper asks Lake to build modules one at a time in dependency order and stops on the first failure. Already built dependencies can be reused. No complete build time or memory bound is claimed.

## Explicit reuse of a local dependency installation

For a machine that already has the pinned Lean and compiled mathlib packages:

```text
python scripts/build_snapshot.py --packages /path/to/packages --lean /path/to/lean NoThreeLine.Target NoThreeLine.AffineBranch
```

`--packages` is a directory containing `mathlib` and the other mathlib dependency directories, each with `.lake/build/lib/lean`. The helper checks the mathlib Git commit and Lean version, writes only into this repository's `.build/`, and compiles local modules sequentially.

An optional `--artifact-cache /path/to/prior/build` reuses local `.olean` files only when their SHA256 equals the artifact recorded for this exact snapshot source. Requested targets are still freshly compiled. Reused artifacts and fresh compiles are distinguished in the resulting report. This mode is useful for a bounded packaging check, and is not a fresh-from-source rebuild of every dependency.

An optional `--dependency-artifacts /path/to/map.json` accepts a Lean `importArts` mapping for individually missing mathlib artifacts. This is explicit local configuration; the package contains no private machine paths. The original environment used three such locally rebuilt, unmodified mathlib modules. A normal Lake build can obtain or build the corresponding dependencies instead.

## Trust and evidence

`scripts/verify_snapshot.py` checks file identity, local dependency closure, compilation-record consistency and forbidden source markers. It is not a proof checker. Only running Lean checks the proof terms, under Lean's normal trust boundary and the actual theorem hypotheses.

The publication reuses original compilation evidence for the full collection and performs bounded reproduction probes reported in `evidence/publication-validation.json`. It does not freshly compile all 3,242 modules. Compiler logs have local paths redacted; their original and public hashes are recorded separately. No `.olean`, dependency cache, secret, Git history or local conversation archive is part of the published files.

The initial publication's probe freshly compiled `Target`, `AffineBranch`, `Concrete`, and the new `NoThreeLine` entry module, reusing eight hash-matched local dependency artifacts. That dated report remains in `evidence/reproduction-build.json`.

The second edition's probe freshly compiles `ProtectedCellOnePhasePowerTail`, `FrozenClockCauseSmall`, and `FrozenFiveCauseOutput` in the new public copy, using hash-matched prior project dependency artifacts and the pinned compiled mathlib installation. Its separate report is `evidence/update-reproduction-build.json`. This is not a fresh rebuild of their entire dependency closure. A full Lake build after downloading dependencies on a clean second machine has not been tested.

## Input scope

The Lean data modules contain the explicit values used by their theorems. Original full search runs, abandoned attempts and unaccepted leaves are outside this completed-source snapshot. Reproducing the supplied Lean statements does not require rerunning the numerical search. Extending the full data set or claiming the final bound requires the additional provenance and complete coverage described in `STATUS.md`.
