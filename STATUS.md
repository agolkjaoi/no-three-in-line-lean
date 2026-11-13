# Mathematical, computational and formalization status

For the archived 481-phase input, [Lean derives the target](NoThreeLine481/Archived481.lean) conditional on the continuum angular certificate for all positive typed cells. The [481-phase Lean progress page](docs/FORMALIZATION_481.md) documents the checked steps and the remaining angle checker work.

The **10 November 2026 English manuscript** uses the 481-phase input. The historical Lean audit below covers the snapshot taken at **2026-11-09 15:22:46 UTC (2026-11-10 00:22:46 JST)**.

## Current English manuscript

The [36-page paper](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf) presents an ordinary computer-assisted mathematical proof that, for every sufficiently large integer `n`, there is a set in `{0,...,n-1}²` with no three distinct collinear points and at least `ceil(1501*n/1000)` points. [Sources, input, checkers and reproduction instructions](docs/paper/README.md) and a [complete ZIP](docs/paper/releases/no_three_line_481_complete_en_20261110.zip) accompany it.

Its mathematical argument includes the stopped process, saved-credit identity, uniform lattice comparison, common-stopping moment bounds, protected-clock concentration and all five stopping-loss estimates. The final application uses fixed moment orders and a fixed total loss budget `10^-5`. The concrete input mass is

```text
A = 3842853135627/2560000000000 = 1.501114506104296875.
```

For `n ≥ 2^24`, in addition to the sufficiently-large-`n` probability thresholds, the final exact comparison is

```text
(1 - 10^-5) * A * (1 - 2^-15)^2 - 1501/1000
  = 2165079963272809251797/274877906944000000000000000 > 0.
```

The proof concerns all sufficiently large integers, without parity or divisibility restrictions. A numerical threshold for the entire theorem has not been computed. No practical small-grid generation guarantee is asserted.

The new manuscript uses a **481-phase input**, replacing the earlier paper's 15,348-phase candidate. The [31-page conditional version](docs/paper/output/pdf/no_three_in_line_proof_draft_en.pdf) is retained as history. Its unresolved concrete-input status should not be copied forward as the status of the new mathematical manuscript.

This is a mathematical proof claim in a research manuscript. The probability lemmas are justified by the written arguments, not certified by the numerical program. There has been no independent human peer review and no complete Lean verification of the manuscript.

## Fresh finite computation for the 481-phase input

The new run built the checker from source and used **no cached phase results**. It evaluated all four direction families directly, without assuming reflection or type symmetry, using exact integer arithmetic with UBSan enabled.

| Check | Recorded result |
| --- | --- |
| Angular phases | All 481 accepted |
| Positive type/cells | All 242,176 covered; no missing, duplicate or failing cell |
| Accepted methods | 385 tube, 95 Farey, one global tube |
| Finite capacity rows | All 144 checked, including axes |
| Infinite-direction tail | All six type-pair bounds checked |
| Arithmetic and actual input reconstruction | 69 exact checks passed |
| Fresh accepted CSV comparison | All 481 byte-identical to the supplied dossier records |
| Fresh angular replay time | 1,355.4 seconds on the recorded GCC 13.3.0 / Ubuntu-WSL / four-thread environment |

The maximum angular upper bound is `93740574637267/93750000000000`, strictly below `9999/10000` by `50362733/93750000000000`. It occurs at reverse rank 205, type 2, microcell `(5,238)`.

The [final finite report](docs/paper/481-phase/verification/evidence/FINAL_REPORT.json), [complete phase summary](docs/paper/481-phase/verification/evidence/REPLAY_0_481.json), [execution provenance](docs/paper/481-phase/verification/evidence/EXECUTION_PROVENANCE.json), [output comparison](docs/paper/481-phase/evidence/replay_comparison.json) and [arithmetic ledger](docs/paper/481-phase/evidence/arithmetic.json) record these checks. The bundle contains the individual phase CSVs, logs, source and input. The reproduction driver requires a fresh output directory and rebuilds the executable.

These are complete finite execution checks for the new input. They are not a programmatic certification of the stochastic proofs, a human review, or a Lean proof of the final target. Source and output hashes establish identity and provenance; the paper's checker-soundness argument explains their mathematical use.

## Established Lean interfaces in the fixed snapshot

**`NoThreeLine.Target` remains unproved in Lean.** The snapshot contains 3,242 modules / 839,734 source lines from its frozen audit. The descriptions below are reading aids; the actual hypotheses in the linked source determine each theorem's scope.

| Component | Scope established in Lean | Remaining restriction |
| --- | --- | --- |
| Rectangle and branch checking | Actual rectangle fields lead to rational branch checks, integral bounds and uniform margins; a small concrete example is included | Full formal numerical coverage remains incomplete |
| Sieve and lattice estimates | Finite pairwise-coprime odd-factor sieve, parity sums and uniform lattice/BV estimates reach the actual pair sum | Structural hypotheses and the large-n range remain explicit |
| Long-line and short-star risks | Repetitions, exceptional configurations, integral errors and combined tail estimates are connected to the actual process | A uniform deterministic root-deadline angular budget is an input |
| Saved credit and output | Expected cardinality equals exposure minus stopping/retirement loss, with extraction of a legal output | The identity alone does not give the numerical lower bound |
| Protected credit | History-dependent stopped exponential bounds, continuous one-phase tails and uniform bounds by `2*n^(-r)` for every fixed positive r | Horizon/direction/cap/gap constants, readiness and the large-n range remain explicit |
| Clock stopping | The one-phase estimates feed the actual finite schedule and frozen clock-cause smallness theorem | Frozen matching, chronology, duration caps and a fixed total-time bound are inputs |
| Tag stopping | General all-time/height estimates under explicit discrete-input slack | 99/112 concrete low-height rows are included in the historical formal route; its final assembly requires all 112 |
| Conditional 1.501n output | Five actual causes share the schedule and point law and imply the integer cardinality target | Concrete formal premises listed below still need to be supplied |

The concentration and output endpoints are [ProtectedCellOnePhasePowerTail](NoThreeLine/ProtectedCellOnePhasePowerTail.lean), [FrozenClockCauseSmall](NoThreeLine/FrozenClockCauseSmall.lean) and [FrozenFiveCauseOutput](NoThreeLine/FrozenFiveCauseOutput.lean). [ScheduleFiveCauseOutput](NoThreeLine/ScheduleFiveCauseOutput.lean) remains the general loss-assembly interface. These were included in the previous snapshot update; this paper publication does not newly formalize them.

## Historical Lean numerical coverage

The following counts belong to the **15,348-phase formalization route**, not the new 481-phase external replay:

- At benchmark **phase 15301**, 20 of 80 canonical reference leaves are certified, with their 80 of 320 symmetry images. The leaf indices are 47–50, 55–58, 65–68 and 72–79.
- This is one benchmark phase, not 25% of the complete 155,402-leaf certificate.
- The low-height capacity computation has 99 of 112 rows completed at the cutoff. The specified non-axis capacity table has 28 of 28 rows completed.
- Additional family checks for benchmark group 22–25 are included, but its final complete-leaf certificate is not; these do not increase the 20/80 count. [coverage.json](evidence/coverage.json) records the distinction.
- Full matching, accepted-union mass and all root-deadline pair bounds have not been assembled into a Lean proof of the target.

Lean literals in the data modules are build inputs. Their extraction is not certified by a general JSON-parser theorem. Proven lookup, field-matching and certificate statements must be used at their stated scope. The successful 481-phase C++/Python replay does not create new Lean proofs for these data or transfer automatically to the old formal input.

## Remaining work on the historical 15,348-phase route

The theorem `exists_uniform_accepted_frozen_output_of_inputs` supplies probabilistic estimates and loss assembly under concrete assumptions. To prove `NoThreeLine.Target` using the existing frozen interface, construct the required inputs for every sufficiently large `n` and discharge:

1. `RowAccepted i` for all 112 low-height rows.
2. Checked accepted phases matching the frozen reference, strictly increasing reference indices, phase-duration caps and a fixed total-time bound.
3. Actual board input mass at least a fixed `mass > 1501/1000`.
4. The actual normalized pair-sum bound at every used root's deadline, at most `a*log n`, with admissible fixed `0 <= a < d < gamma < 1` and `0 < zeta < 1-d`.

For the archived 481-phase route, see the [current Lean progress and remaining angular certificate](docs/FORMALIZATION_481.md).

The earlier one-phase concentration gap is no longer an unsupplied theorem premise in this Lean snapshot. Complete formal input assembly remains substantial work. A conditional output theorem is an interface, not the unconditional formal target. Corrections or necessary amendments to either the manuscript or the formalization should be recorded openly.

## What the Lean compilation evidence means

All 3,242 Lean sources retain their audited contents. The preceding snapshot update preserved the first publication's 3,148 sources and added 94 modules. This paper update changes neither set. Original successful compilation records and public, path-redacted logs remain in `evidence/`. The 24 early modules with local imports use a saved dependency-hash/timestamp audit instead of compile-time import-digest records; that difference is recorded per module.

Packaging checks source/log hashes and dependency closure. It does not regenerate every `.olean` or independently reconstruct the entire toolchain. Compiled Lean imports are not shipped. The bounded reproduction probes are reported in [publication-validation.json](evidence/publication-validation.json); a fresh rebuild of all modules on a second machine has not been performed. [Lean reproduction instructions](docs/REPRODUCING.md) remain separate from the paper's C++/Python replay instructions.

The project discloses substantial AI use, has no named author, and distributes original code and associated documents under the [MIT License](LICENSE). Historical research notes preserve earlier stages; inclusion alone does not formally prove their prose assertions.
