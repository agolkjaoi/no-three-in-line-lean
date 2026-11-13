# Continuing the work

Start with the [paper and its verification package](docs/paper/README.md) or the [481-phase Lean progress page](docs/FORMALIZATION_481.md). The current Lean route uses the archived 481-phase input and derives the final target conditional on its continuum angular certificate. [STATUS.md](STATUS.md) records the older 15,348-phase route and its 3,242-module audit.

## A bounded first contribution

Run `python scripts/verify_snapshot.py`. For the paper, [reproduce reverse rank 205](docs/REPRODUCING.md#reproduce-reverse-rank-205) or follow the [arithmetic checks and full finite replay](docs/REPRODUCING.md#the-481-phase-paper). A fresh replay checks all 481 phases in a new directory; preserve its source, input and executable hashes and its complete coverage report.

For work on Lean, build `NoThreeLine.Target`, `NoThreeLine.AffineBranch` and `NoThreeLine.Concrete` with the pinned toolchain. Record the operating system, compiler version, mathlib commit, exact command and result. A fresh-machine reproduction of either part is useful without extending a proof.

For a mathematical contribution, select one explicit obligation:

| Task | Start reading | Completion condition |
| --- | --- | --- |
| Reproduce the 481-phase input | `docs/paper/481-phase/verification/reproduce.py` and the English checker section | Fresh build, all 481 phases, 242,176 positive type/cells, complete coverage, exact risk comparisons and capacity checks; distinguish this from checking the stochastic proof |
| Review the English probability argument | `docs/paper/481-phase/sections/04a_moments.tex` through `04d_tags.tex` | Identify a precise statement, prove a correction or document the checked dependency; retain the actual common stopping times, saved credits and point laws |
| Certify the 481-phase angular bounds | [Conditional target](NoThreeLine481/Archived481.lean) and [current angular lemmas](docs/FORMALIZATION_481.md) | Connect the checker’s integer data to the real chord bounds, starting with one positive typed cell. The full goal is `FineCellAngularCertificate archivedRanks481`. |
| Review/reproduce the Lean concentration chain | `ProtectedCellOnePhasePowerTail.lean`, `FrozenClockCauseSmall.lean` | Independently reproduce the existing bounds and review actual stopping events, uniform thresholds, readiness and frozen-input hypotheses |
| Expand the older Lean certificate | `Phase15301Group4750Risk.lean` and its imports | Add a new group with all families, exact risk aggregation and actual child-region containment; deduplicate coverage within that input |
| Assemble the existing Lean input | `FrozenFiveCauseOutput.lean` | Supply all low rows, complete accepted-schedule matching, actual input mass and root-deadline pair bounds for every sufficiently large n |
| Build/verification tooling | `scripts/verify_snapshot.py`, `scripts/build_snapshot.py` | Demonstrate reproducible checks and more efficient execution without weakening the accepted mathematical conditions |

## Review information to include

- The mathematical statement added or changed, and its exact assumptions.
- Which remaining obligation it supplies and which obligations remain.
- For Lean work, compiler and mathlib versions, newly compiled modules and their dependencies.
- For Lean work, `#print axioms` output for the important new endpoints.
- For numerical work, source-data provenance, exact acceptance conditions and coverage counts.

Preserve the definitions of `Grid`, `NoThree` and `Target`. Do not substitute a weaker target, add an unproved axiom, or count a conclusion-equivalent hypothesis as a completed proof. Keep actual physical state, deadlines and probability measures aligned when composing stochastic lemmas.

Avoid loading all generated numerical proofs for a small local change. Build the relevant dependency closure first. The [issue drafts](docs/ISSUE_DRAFTS.md) give suggested scopes; no GitHub issues have been created by this preparation.

The project is a hobby effort. Forks, local experiments and occasional contributions are welcome; there is no promised response time or planned expert outreach. AI use should be described accurately in contributions, with no invented author credit or claim of human review.
