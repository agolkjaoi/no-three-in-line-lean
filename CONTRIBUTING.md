# Continuing the work

Start with [STATUS.md](STATUS.md) and the [paper landing page](docs/paper/README.md). The repository contains an English computer-assisted proof using a 481-phase input and a separate, unchanged partial Lean snapshot of 3,242 modules. The paper's final theorem is not yet a theorem of that Lean development. Compare the input and edition before extending either part.

## A bounded first contribution

Run `python scripts/verify_snapshot.py`. For the paper, follow the [lightweight arithmetic checks or full finite replay](docs/REPRODUCING.md#the-481-phase-paper). Neither requires building Lean. A fresh replay checks all 481 phases in a new directory; preserve its source, input and executable hashes and its complete coverage report.

For work on Lean, build `NoThreeLine.Target`, `NoThreeLine.AffineBranch` and `NoThreeLine.Concrete` with the pinned toolchain. Record the operating system, compiler version, mathlib commit, exact command and result. A fresh-machine reproduction of either part is useful without extending a proof.

For a mathematical contribution, select one explicit obligation:

| Task | Start reading | Completion condition |
| --- | --- | --- |
| Reproduce the 481-phase input | `docs/paper/481-phase/verification/reproduce.py` and the English checker section | Fresh build, all 481 phases, 242,176 positive type/cells, complete coverage, exact risk comparisons and capacity checks; distinguish this from checking the stochastic proof |
| Review the English probability argument | `docs/paper/481-phase/sections/04a_moments.tex` through `04d_tags.tex` | Identify a precise statement, prove a correction or document the checked dependency; retain the actual common stopping times, saved credits and point laws |
| Formalize the 481-phase application | The English manuscript and the existing Lean interfaces | Supply explicit bridges to the new finite schedule; do not treat old certificate coverage as coverage of the new input |
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
