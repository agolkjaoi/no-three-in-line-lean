# No-three-in-line: a 1.501n proof manuscript and partial Lean formalization

The [36-page English manuscript](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf) presents a computer-assisted proof that every sufficiently large `n × n` integer grid contains at least `ceil(1.501 * n)` points with no three distinct points collinear. Its concrete 481-phase geometric input has been freshly checked in full. **The separate Lean development still does not prove `NoThreeLine.Target`.**

This is an AI-assisted hobby research project, with no named author. The manuscript has not undergone independent human peer review. Its mathematical arguments, the finite computations, and the partial formalization have distinct verification scopes, described below.

[日本語](README_JA.md) · [Paper and downloads](docs/paper/README.md) · [Status](STATUS.md) · [481-phase Lean progress](docs/FORMALIZATION_481.md) · [Lean build](docs/REPRODUCING.md) · [Contributing](CONTRIBUTING.md) · [AI use](AI_USAGE.md)

## Read or reproduce the paper

- [English PDF, version 0.2: the 481-phase construction](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf)
- [Complete ZIP: paper, editable sources, input, checkers and execution evidence](docs/paper/releases/no_three_line_481_complete_en_20261110.zip)
- [Bundle contents and reproduction commands](docs/paper/481-phase/README.txt)
- [Fresh execution provenance](docs/paper/481-phase/verification/evidence/EXECUTION_PROVENANCE.json) and [finite-check summary](docs/paper/481-phase/verification/evidence/FINAL_REPORT.json)

The paper gives the process, saved-credit identity, uniform lattice comparison, common-stopping moment argument, all five stopping-loss estimates, and exact numerical closure in English. Its input mass is `3842853135627/2560000000000 = 1.501114506104296875`. It uses fixed moment orders and a fixed loss budget to obtain the bound for all sufficiently large integers `n`, with no parity or divisibility restriction. It does not give a numerical threshold for the full theorem or a practical small-grid construction guarantee.

The new input has **481 phases and 242,176 positive type/cells**. A fresh build and complete angular replay, using no cached phase results, accepted every phase in **1,355.4 seconds** on the recorded GCC 13.3.0 / Ubuntu-WSL / four-thread environment. All 481 accepted CSVs were byte-identical to the supplied dossier records. Capacity checks, finite clock constants and report integrity also passed. The [comparison report](docs/paper/481-phase/evidence/replay_comparison.json) records the output comparison.

This is a new finite construction replacing the historical 15,348-phase candidate in the paper. The earlier [31-page conditional draft](docs/paper/output/pdf/no_three_in_line_proof_draft_en.pdf) remains as a historical version; its outstanding-input status does not describe the current manuscript.

## What each kind of evidence establishes

| Component | Current scope |
| --- | --- |
| English mathematical manuscript | Presents an ordinary computer-assisted proof of the sufficiently-large-`n` lower bound. The stochastic arguments are natural-language mathematics, not certified by running the numerical checker. |
| Fresh finite computation | Rebuilds and checks all 481 phases and 242,176 type/cells, all 144 finite capacity rows and six direction-tail bounds, with exact arithmetic and recorded provenance. |
| Lean snapshot | Contains 3,242 audited modules, including substantial conditional geometric, probabilistic and output results. It does **not** prove `NoThreeLine.Target` or formally certify the new 481-phase application. |

No independent human peer review or complete Lean formalization is claimed. Hashes identify files and executions; they do not replace mathematical arguments or Lean proof checking.

## The formal target and fixed Lean snapshot

The exact target is defined in [Target.lean](NoThreeLine/Target.lean):

```lean
def Target : Prop :=
  ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
    ∃ s : Finset (Grid n), NoThree s ∧ 1501 * n ≤ 1000 * s.card
```

`Target` remains a definition, not a proved theorem. The Lean sources are unchanged by the paper update. Their frozen audit is from **2026-11-09 15:22 UTC (2026-11-10 00:22 JST)**: **3,242 modules / 839,734 source lines**, with matching source and compilation-log hashes and included local imports. The 33 modules not verified in that audit are listed separately, not shipped as completed proofs. These counts are not a completion percentage.

The earlier snapshot update added 94 audited modules, including continuous one-phase concentration, frozen clock-cause smallness and conditional exact 1.501n output. Its concrete-input hypotheses remain unsupplied in Lean. In particular, the historical 15,348-phase route still has only 20 of 80 canonical leaves at benchmark phase 15301 certified, together with their 80 symmetry images. The new complete external 481-phase check does not increase those Lean coverage counts. See [STATUS.md](STATUS.md) and [CHANGELOG.md](CHANGELOG.md).

## Lean reading paths

| Area | Entry point | Scope to inspect |
| --- | --- | --- |
| Exact target | [Target](NoThreeLine/Target.lean) | Quantifiers, integer determinant and cardinality inequality |
| Small concrete geometry | [Concrete](NoThreeLine/Concrete.lean) | Actual rectangles, four charts, rational checks and a uniform margin |
| One analytic branch | [AffineBranch](NoThreeLine/AffineBranch.lean) | A concrete `a+b/u` branch and rational integral bound |
| Finite sieve and lattice | [FiniteS6](NoThreeLine/FiniteS6.lean) | `masked_board_sieve_upper` and its assumptions |
| Probabilistic risk | [ScheduledRiskTailSmall](NoThreeLine/ScheduledRiskTailSmall.lean) | Uniform tails under a deterministic angular budget |
| Expected size and legality | [ScheduledCutOutputExistence](NoThreeLine/ScheduledCutOutputExistence.lean) | Exposure minus loss and extraction of a legal output |
| One-phase concentration | [ProtectedCellOnePhasePowerTail](NoThreeLine/ProtectedCellOnePhasePowerTail.lean) | Actual exceedance bounds with readiness, cap and gap conditions |
| Frozen clock stopping | [FrozenClockCauseSmall](NoThreeLine/FrozenClockCauseSmall.lean) | Small clock-cause probability under matching and duration inputs |
| Conditional final assembly | [FrozenFiveCauseOutput](NoThreeLine/FrozenFiveCauseOutput.lean) | Exact target once concrete schedule, capacity, mass and pair bounds are supplied |

The [research notes](docs/research-notes/README.md) are historical background. The current mathematical reading route is the [481-phase paper](docs/paper/README.md); inclusion of an older note does not certify every assertion in it.

## Try a bounded Lean build

With Elan, Python 3.11+, Git and the pinned dependencies available:

```text
python scripts/verify_snapshot.py
lake update
lake exe cache get
lake build NoThreeLine.Target NoThreeLine.AffineBranch
lake build NoThreeLine.Concrete
```

The toolchain is Lean **4.32.2**; mathlib is pinned to **905b95818eb32af7874a58b427f50c1711a5e96c**. The default `lake build` builds the small entry library, not every numerical certificate. [Reproduction instructions](docs/REPRODUCING.md) cover the full snapshot and explicit offline reuse. The paper's C++/Python replay has [separate instructions](docs/paper/481-phase/README.txt) and does not require Lean.

## Snapshot evidence and continued development

- [snapshot.json](snapshot.json) fixes the Lean capture scope and time.
- [compilation.json](evidence/compilation.json) binds original sources, compilation logs, artifacts and recorded import versions. Early legacy records use a labelled saved dependency audit.
- [MANIFEST.json](MANIFEST.json) binds public files. [Publication validation](evidence/publication-validation.json) distinguishes inherited compilation evidence from newly compiled samples.
- A fresh rebuild of all 3,242 Lean modules on a second machine has not been performed. The complete fresh C++/Python replay is a separate result for the new paper.

The project is a hobby effort, with no planned expert outreach. Forks, fixes and further formalization are welcome under the [MIT License](LICENSE); retain its notices. [CONTRIBUTING.md](CONTRIBUTING.md) describes entry points for the fixed Lean snapshot. Compare versions before extending its historical numerical route. AI use should be described accurately; [AI_USAGE.md](AI_USAGE.md) and the paper disclose substantial AI contributions. No named mathematical author, affiliation or personal contact address is supplied.
