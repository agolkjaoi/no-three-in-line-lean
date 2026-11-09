# No-three-in-line: partial Lean formalization toward 1.501n

**Work in progress. The final 1.501n theorem has not been proved in this repository.**

This is an AI-assisted research snapshot containing a dependency-closed collection of completed Lean modules. It is intended to make the existing work inspectable and allow further development. No named author is supplied.

[日本語](README_JA.md) · [Proof status](STATUS.md) · [Build instructions](docs/REPRODUCING.md) · [Start contributing](CONTRIBUTING.md) · [AI use](AI_USAGE.md)

## English proof draft

The [31-page English manuscript](docs/paper/output/pdf/no_three_in_line_proof_draft_en.pdf) presents the construction, saved-credit identity, geometric and probabilistic arguments, and numerical checking contract without requiring Lean. [Editable LaTeX sources, exact-arithmetic checks and reading instructions](docs/paper/README.md) accompany it.

**The numerical application is conditional.** Complete compatible geometric input checking, phase matching, mass and root-deadline pair bounds remain obligations. This research draft is not an unconditional proof of the target or a new independent proof audit. It has no named author and discloses substantial AI use.

## Target and present scope

The intended target is a set of at least `1.501 * n` points in every sufficiently large `n × n` integer grid, with no three distinct points collinear. The exact definition is in [Target.lean](NoThreeLine/Target.lean):

```lean
def Target : Prop :=
  ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
    ∃ s : Finset (Grid n), NoThree s ∧ 1501 * n ≤ 1000 * s.card
```

`Target` is a definition, not a theorem. The snapshot contains geometric checkers, finite-sieve and lattice estimates, a concrete stochastic construction, and substantial conditional stopping and output results. Their hypotheses matter: none of the intermediate results substitutes for a proof of `Target`.

The frozen audit is from **2026-11-09 15:22 UTC (2026-11-10 00:22 JST)**. This package includes **3,242 modules / 839,734 source lines** whose source and compilation-log hashes match that audit and whose local imports are also included. Most of the bulk is explicit data and supporting proofs. These counts are not a completion percentage. The 33 modules not verified in that audit are listed separately and are not shipped as completed proofs.

This update adds 94 audited modules. It supplies the continuous one-phase concentration link and its frozen clock-cause application, then derives the exact 1.501n output from explicit accepted-schedule, mass, capacity and actual pair-budget inputs. Those concrete premises are not yet fully supplied. See [the changelog](CHANGELOG.md).

## Reading paths

| Area | Entry point | What to look for |
| --- | --- | --- |
| Exact target | [Target](NoThreeLine/Target.lean) | Quantifiers, integer determinant, cardinality inequality |
| Small concrete geometric example | [Concrete](NoThreeLine/Concrete.lean) | Actual rectangles, four charts, rational checking and a uniform margin |
| One analytic branch | [AffineBranch](NoThreeLine/AffineBranch.lean) | A concrete `a+b/u` branch bounded by a rational integral expression |
| Finite-sieve/lattice connection | [FiniteS6](NoThreeLine/FiniteS6.lean) | `masked_board_sieve_upper` and its explicit assumptions |
| Actual probabilistic risk | [ScheduledRiskTailSmall](NoThreeLine/ScheduledRiskTailSmall.lean) | Uniform tail estimate under a deterministic angular budget |
| Expected size and legal output | [ScheduledCutOutputExistence](NoThreeLine/ScheduledCutOutputExistence.lean) | Actual exposure minus loss, and a no-three output attaining that bound |
| Continuous one-phase concentration | [ProtectedCellOnePhasePowerTail](NoThreeLine/ProtectedCellOnePhasePowerTail.lean) | Uniform bound by `2*n^(-r)` on actual one-phase exceedance, with the stated readiness, cap and gap conditions |
| Frozen clock stopping | [FrozenClockCauseSmall](NoThreeLine/FrozenClockCauseSmall.lean) | Uniformly small actual clock-cause probability under frozen matching and duration inputs |
| Final conditional assembly | [FrozenFiveCauseOutput](NoThreeLine/FrozenFiveCauseOutput.lean) | Exact 1.501n output once all low rows, accepted-schedule matching, mass and actual root-deadline pair bounds are supplied |

[STATUS.md](STATUS.md) identifies the remaining links. [The research notes](docs/research-notes/README.md) provide the mathematical background; they are historical working arguments, not a certification of their every assertion.

## Try a bounded first build

With Lean managed by Elan, Python 3.11+, Git and the pinned dependencies available:

```text
python scripts/verify_snapshot.py
lake update
lake exe cache get
lake build NoThreeLine.Target NoThreeLine.AffineBranch
lake build NoThreeLine.Concrete
```

The toolchain is Lean **4.32.2**; mathlib is pinned to commit **905b95818eb32af7874a58b427f50c1711a5e96c**. The default `lake build` builds the small entry library, not every numerical certificate. See [reproduction instructions](docs/REPRODUCING.md) for the full snapshot and an explicit offline reuse mode.

## Evidence and limitations

- [snapshot.json](snapshot.json) fixes the scope and capture time.
- [compilation.json](evidence/compilation.json) binds each original source, compilation log and recorded artifact, including direct-import versions. Early legacy records use the saved dependency audit, and are labelled as such.
- [MANIFEST.json](MANIFEST.json) binds the public files. Verifying hashes checks package identity; it does not re-prove Lean theorems.
- Existing compilation records were checked during packaging. A fresh rebuild of all 3,242 modules on a second machine has not been performed. [Publication validation](evidence/publication-validation.json) distinguishes newly compiled samples from inherited evidence.
- The numerical coverage described in [STATUS.md](STATUS.md) is partial. It must not be presented as certification of all phases or all leaves.

The active development workspace continues separately. The audited Lean snapshot stays fixed; accompanying mathematical exposition may be added. Before starting a large contribution, compare it with any newer snapshot.

## License and continued development

The original code and associated documentation are available under the [MIT License](LICENSE). Forks, fixes and further formalization are welcome; retain the license notices. See [CONTRIBUTING.md](CONTRIBUTING.md) for concrete starting points and [LICENSE_DECISION.md](LICENSE_DECISION.md) for scope.

This public edition preserves the proof sources from the fixed preparation snapshot. The historical preparation records describe checks made before publication; [publication.json](publication.json) records this edition's intended repository and licensing decision. The active research task continues separately.
