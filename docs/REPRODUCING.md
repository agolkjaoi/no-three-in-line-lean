# Reproducing this snapshot

The [current English paper](paper/481-phase/output/pdf/no_three_in_line_481_en.pdf) and the partial Lean development have separate verification paths. Reading or reproducing the paper's finite computation does not require a Lean build. The [complete paper ZIP](paper/releases/no_three_line_481_complete_en_20261110.zip) contains the same mathematical sources, input and verification package.

Run the distribution check from the repository root first:

```text
python scripts/verify_snapshot.py
```

This checks the published files and recorded evidence. It is not a replacement for running the geometric checker or Lean.

## Reproduce reverse rank 205

This phase contains the cell with the largest angular upper bound recorded in the full 481-phase replay. From the repository root, run the following in Bash on Linux or WSL. It requires `g++` with OpenMP and UndefinedBehaviorSanitizer. The build and output go into a temporary directory.

```bash
set -euo pipefail
src="$PWD/docs/paper/481-phase/verification"
out=$(mktemp -d)
g++ -O3 -std=c++17 -fopenmp -fsanitize=undefined -fno-sanitize-recover=all "$src/independent/check_phase.cpp" -o "$out/check_phase"
OMP_NUM_THREADS=4 "$out/check_phase" "$src/data" 205 2048 "$out/phase_205_farey.csv" farey
cmp "$out/phase_205_farey.csv" "$src/evidence/phase_205_farey.csv"
echo "CSV matches the published record."
```

The checker reports **542 cells, 0 failures**. The maximum is at **type 2, cell `(5, 238)`**, with integer upper bound **`39469715636744`**. This gives the exact risk upper bound `93740574637267/93750000000000`, below the acceptance threshold `9999/10000`. A successful `cmp` confirms that all 542 recomputed rows match the published CSV byte for byte. [Published phase report](paper/481-phase/verification/evidence/accepted_205.json) · [Expected CSV](paper/481-phase/verification/evidence/phase_205_farey.csv)

## The 481-phase paper

For a quick exact-arithmetic and input reconstruction check, run from the repository root:

```text
python docs/paper/481-phase/scripts/check_arithmetic.py --require-replay --output ../no-three-481-arithmetic.json
```

Python 3.11 or newer is sufficient, with no third-party Python packages. The report is written outside the repository, so it does not alter the packaged evidence or its hashes. This command reconstructs the mass and phase durations from the actual field and rank files, checks the fixed error budgets, and checks consistency with the complete geometric report. The `--require-replay` option requires that report; it does not execute the angular checker or establish the report's freshness.

To rebuild the checker and replay every phase, use Linux or WSL with `g++`, OpenMP and UndefinedBehaviorSanitizer available:

```text
python3 docs/paper/481-phase/verification/reproduce.py --output ../no-three-481-replay --threads 4
```

The output directory must not already exist. The driver copies the required fixed input and sources there, builds the C++17 checker, reruns the capacities and clock constants, evaluates all 481 phases, and checks complete per-cell coverage and exact risk thresholds. It does not reuse cached phase results. The new directory contains the logs, reports, compiler information, source/input hashes and executable hash. `--cxx` selects a compatible compiler if it is not named `g++`.

The publication's fresh run took approximately 22.6 minutes in its recorded environment. All 481 phases and 242,176 positive type/cells passed, with no missing, duplicate or failing cells; all 481 accepted per-phase CSV files matched the supplied records byte for byte. This is an observed run time, not a bound for other machines. Platform-dependent timing and provenance records need not be byte-identical.

The driver includes `check_report_integrity.py`, which checks every recorded row, its hash, its exact threshold and its rank-class coverage. That script writes `evidence/FINAL_REPORT.json` beside its input. Run it in the fresh output directory, or in a separate copy, if repeating it manually; do not overwrite packaged evidence merely to inspect it. A row-integrity check alone does not recompute the chord bounds.

The finite computation checks the geometric input. The English manuscript supplies the probability arguments and their connection to the output bound. No complete Lean verification or independent human peer review of that combined proof is claimed. The [paper landing page](paper/README.md) identifies the current and historical editions.

## Lean versions

- Lean toolchain: `leanprover/lean4:v4.32.2`.
- mathlib commit: `905b95818eb32af7874a58b427f50c1711a5e96c`.
- Transitive dependency revisions are recorded in `lake-manifest.json`, using the manifest from that pinned mathlib checkout.
- Python 3.11 or newer for the standard-library-only packaging checks.

The repository uses ordinary Lake dependency configuration. See the [official Lake reference](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/) for the package/build interface. The committed version pins, rather than the moving documentation version, determine the intended environment.

## Lean reading paths

| Area | Entry point | Scope to inspect |
| --- | --- | --- |
| 481-phase target | [Archived481](../NoThreeLine481/Archived481.lean) | The final target conditional on the archived angular certificate |
| Exact target | [Target](../NoThreeLine/Target.lean) | Quantifiers, integer determinant and cardinality inequality |
| Small concrete geometry | [Concrete](../NoThreeLine/Concrete.lean) | Actual rectangles, four charts, rational checks and a uniform margin |
| One analytic branch | [AffineBranch](../NoThreeLine/AffineBranch.lean) | A concrete `a+b/u` branch and rational integral bound |
| Finite sieve and lattice | [FiniteS6](../NoThreeLine/FiniteS6.lean) | `masked_board_sieve_upper` and its assumptions |
| Probabilistic risk | [ScheduledRiskTailSmall](../NoThreeLine/ScheduledRiskTailSmall.lean) | Uniform tails under a deterministic angular budget |
| Expected size and legality | [ScheduledCutOutputExistence](../NoThreeLine/ScheduledCutOutputExistence.lean) | Exposure minus loss and extraction of a legal output |
| One-phase concentration | [ProtectedCellOnePhasePowerTail](../NoThreeLine/ProtectedCellOnePhasePowerTail.lean) | Actual exceedance bounds with readiness, cap and gap conditions |
| Frozen clock stopping | [FrozenClockCauseSmall](../NoThreeLine/FrozenClockCauseSmall.lean) | Small clock-cause probability under matching and duration inputs |
| Conditional final assembly | [FrozenFiveCauseOutput](../NoThreeLine/FrozenFiveCauseOutput.lean) | Exact target once concrete schedule, capacity, mass and pair bounds are supplied |

## First Lean build on a new machine

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

## Explicit reuse of a local Lean dependency installation

For a machine that already has the pinned Lean and compiled mathlib packages:

```text
python scripts/build_snapshot.py --packages /path/to/packages --lean /path/to/lean NoThreeLine.Target NoThreeLine.AffineBranch
```

`--packages` is a directory containing `mathlib` and the other mathlib dependency directories, each with `.lake/build/lib/lean`. The helper checks the mathlib Git commit and Lean version, writes only into this repository's `.build/`, and compiles local modules sequentially.

An optional `--artifact-cache /path/to/prior/build` reuses local `.olean` files only when their SHA256 equals the artifact recorded for this exact snapshot source. Requested targets are still freshly compiled. Reused artifacts and fresh compiles are distinguished in the resulting report. This mode is useful for a bounded packaging check, and is not a fresh-from-source rebuild of every dependency.

An optional `--dependency-artifacts /path/to/map.json` accepts a Lean `importArts` mapping for individually missing mathlib artifacts. This is explicit local configuration; the package contains no private machine paths. The original environment used three such locally rebuilt, unmodified mathlib modules. A normal Lake build can obtain or build the corresponding dependencies instead.

## Lean trust and evidence

`scripts/verify_snapshot.py` checks file identity, local dependency closure, compilation-record consistency and forbidden source markers. It is not a proof checker. Only running Lean checks the proof terms, under Lean's normal trust boundary and the actual theorem hypotheses.

The publication reuses original compilation evidence for the full collection and performs bounded reproduction probes reported in `evidence/publication-validation.json`. It does not freshly compile all 3,242 modules. Compiler logs have local paths redacted; their original and public hashes are recorded separately. No `.olean`, dependency cache, secret, Git history or local conversation archive is part of the published files.

The initial publication's probe freshly compiled `Target`, `AffineBranch`, `Concrete`, and the new `NoThreeLine` entry module, reusing eight hash-matched local dependency artifacts. That dated report remains in `evidence/reproduction-build.json`.

The second edition's probe freshly compiles `ProtectedCellOnePhasePowerTail`, `FrozenClockCauseSmall`, and `FrozenFiveCauseOutput` in the new public copy, using hash-matched prior project dependency artifacts and the pinned compiled mathlib installation. Its separate report is `evidence/update-reproduction-build.json`. This is not a fresh rebuild of their entire dependency closure. A full Lake build after downloading dependencies on a clean second machine has not been tested.

## Lean input scope

The Lean data modules contain the explicit values used by their theorems. Original full search runs, abandoned attempts and unaccepted leaves are outside this completed-source snapshot. Reproducing the supplied Lean statements does not require rerunning the numerical search. For the archived 481-phase input, [the current Lean proof](../NoThreeLine481/Archived481.lean) reduces `NoThreeLine.Target` to `FineCellAngularCertificate archivedRanks481`. The [481-phase Lean progress page](FORMALIZATION_481.md) records the checked geometry and the remaining angular checker work.
