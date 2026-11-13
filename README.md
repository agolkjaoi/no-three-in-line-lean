# No-three-in-line: a 1.501n proof manuscript and partial Lean formalization

The English manuscript presents a computer-assisted proof that every sufficiently large `n × n` integer grid contains at least `ceil(1.501 * n)` points with no three collinear. This is an AI-assisted hobby research project with no named author. The manuscript is unrefereed.

**[Read the English PDF](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf)** · **[Reproduce reverse rank 205](docs/REPRODUCING.md#reproduce-reverse-rank-205)** · **[Download the complete ZIP](docs/paper/releases/no_three_line_481_complete_en_20261110.zip)** · **[日本語](README_JA.md)**

The single-phase replay rebuilds the checker and verifies 542 cells on Linux or WSL. It includes the cell with the largest recorded angular upper bound in the 481-phase construction.

The complete finite replay accepted **all 481 phases and 242,176 positive typed cells**. Its 481 accepted CSVs matched the original records byte for byte. The [paper page](docs/paper/README.md) links to the editable manuscript, exact arithmetic checks, full replay and execution records.

## Lean formalization

`target_of_archived481_cell_certificate` derives the exact `NoThreeLine.Target` from the continuum angular bound for every positive typed cell in the published input. The schedule, mass, line capacities and probability argument are connected in Lean. The angular certificate remains the premise for an unconditional Lean proof. [Conditional theorem](NoThreeLine481/Archived481.lean) · [Lean progress and compilation records](docs/FORMALIZATION_481.md)

The 3,242-module audit covers the original Lean snapshot. Its 15,348-phase construction and coverage counts are documented in [STATUS.md](STATUS.md). The newer 481-phase formalization is in [`NoThreeLine481`](NoThreeLine481/).

## Build or contribute

With Elan, Git and the pinned Lean dependencies available, `lake build NoThreeLine.Target NoThreeLine.AffineBranch` checks two small entry points. See the [Lean setup and build commands](docs/REPRODUCING.md#first-lean-build-on-a-new-machine) for dependencies and larger builds. [Lean reading paths](docs/REPRODUCING.md#lean-reading-paths) list useful proof entry points.

[Contribution guide](CONTRIBUTING.md) · [Research notes](docs/research-notes/README.md) · [Changelog](CHANGELOG.md) · [AI use](AI_USAGE.md) · [MIT license](LICENSE)
