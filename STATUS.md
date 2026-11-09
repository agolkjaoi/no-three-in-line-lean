# Status of this fixed snapshot

Cutoff: **2026-11-09 15:22:46 UTC (2026-11-10 00:22:46 JST)**. This document describes the packaged snapshot rather than later work. It supersedes the first publication's statement that the one-phase concentration link was still open; see [CHANGELOG.md](CHANGELOG.md).

## Established interfaces in the snapshot

The listed Lean results have their actual hypotheses in the linked source files. The descriptions here are reading aids, not stronger theorem statements.

| Component | Scope established | Remaining restriction |
| --- | --- | --- |
| Rectangle and branch checking | Actual rectangle fields lead to rational branch checks, integral bounds and uniform margins; a small concrete example is included | Full numerical coverage remains incomplete |
| Sieve and lattice estimates | Finite pairwise-coprime odd-factor sieve, parity sums and uniform lattice/BV estimates reach the actual pair sum | Structural hypotheses and the large-n range remain explicit |
| Long-line and short-star risks | Repetitions, exceptional configurations, integral errors and combined tail estimates are connected to the actual process | A uniform deterministic root-deadline angular budget is an input |
| Saved credit and output | Actual expected cardinality equals exposure minus actual stopping/retirement loss, with extraction of a legal output | This identity alone does not give the numerical lower bound 1.501n |
| Protected credit | Actual history-dependent stopped exponential bounds, continuous one-phase exponential tails, and uniform bounds by `2*n^(-r)` for every fixed positive r | Fixed horizon/direction/cap/gap constants, readiness and the large-n range remain explicit |
| Clock stopping | The one-phase estimates feed the actual finite schedule and frozen clock-cause smallness theorem | Frozen phase matching, chronology, duration caps and a fixed total-time bound are inputs |
| Tag stopping | General all-time/height estimates under explicit discrete-input slack | 99/112 concrete low-height rows are included; the final theorem requires all 112 |
| Conditional 1.501n output | Five actual causes share the schedule and point law and imply the exact integer cardinality target | All concrete premises listed below must still be supplied |

The new endpoints are [ProtectedCellOnePhasePowerTail](NoThreeLine/ProtectedCellOnePhasePowerTail.lean), [FrozenClockCauseSmall](NoThreeLine/FrozenClockCauseSmall.lean), and [FrozenFiveCauseOutput](NoThreeLine/FrozenFiveCauseOutput.lean). The earlier [ScheduleFiveCauseOutput](NoThreeLine/ScheduleFiveCauseOutput.lean) remains the general loss-assembly interface.

## Numerical coverage

- For the benchmark at **phase 15301**, 20 of its 80 canonical reference leaves are certified, together with their 80 of 320 symmetry images. The included leaf indices are 47–50, 55–58, 65–68, and 72–79.
- This is coverage of one benchmark phase, not 25% of the complete 155,402-leaf certificate. The full input has 15,348 phases.
- The separate low-height capacity computation has 99 of 112 rows completed at this cutoff. The specified non-axis capacity table has 28 of 28 rows completed.
- Additional family checks for benchmark group 22–25 are included, but its final complete-leaf certificate is not included. It does not increase the 20/80 completed-leaf count. [coverage.json](evidence/coverage.json) records the distinction.
- Claims of full schedule matching, full accepted-union mass, all angular budgets, and final point count remain outstanding.

Lean literals in the included data modules are build inputs. Their extraction is not itself certified by a general JSON-parser theorem. Proven lookup, field-matching and certificate statements must be used at their stated scope.

## Remaining mathematical work

The theorem `exists_uniform_accepted_frozen_output_of_inputs` now supplies the probabilistic estimates and loss assembly under concrete input assumptions. To derive the unconditional `NoThreeLine.Target`, construct suitable inputs for every sufficiently large n and discharge:

1. `RowAccepted i` for all 112 low-height rows.
2. Checked accepted phases matching the frozen reference, a strictly increasing reference index, the stated phase-duration caps and a fixed total-time bound.
3. An actual board input mass at least a fixed `mass > 1501/1000`.
4. The actual normalized pair-sum bound at each used root's deadline, at most `a*log n`, with admissible fixed exponents `0 <= a < d < gamma < 1` and `0 < zeta < 1-d`.

Complete geometric certificates, full schedule matching and the transfer to actual mass/pair bounds remain substantial work. The new theorem does not replace those obligations with an unconditional lower bound. Reproducing and reviewing the new probabilistic chain is also useful, but the earlier one-phase concentration gap is no longer listed here as an unsupplied theorem premise.

These are proof obligations. A theorem accepting the missing bounds as hypotheses is an interface, not a completion of the final target. Any future contradiction or necessary amendment should be recorded openly.

## What the compilation evidence means

The package preserves all 3,242 included Lean source files byte for byte against their audited versions. The 3,148 sources in the first publication are unchanged, and 94 modules are added. Their original successful compilation records and public, path-redacted logs are in `evidence/`. The 24 early modules with local imports use a saved dependency-hash/timestamp audit instead of compile-time import-digest records; this difference is recorded per module.

The packaging step rechecked source and log hashes and dependency closure. It did not regenerate every `.olean` or independently reconstruct the entire toolchain. Imported compiled files are not shipped. The small reproduction probe is reported separately in `evidence/publication-validation.json`.

The research notes contain older assertions and descriptions of intermediate stages. They are context for the formalization. Their prose is not made formally proved by inclusion in this snapshot.
