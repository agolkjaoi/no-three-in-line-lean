# Continuing the work

Start with [STATUS.md](STATUS.md). This is a fixed intermediate snapshot; the active development task may already have progressed beyond it. Compare versions before undertaking a large extension.

## A bounded first contribution

Run `python scripts/verify_snapshot.py`, then build `NoThreeLine.Target`, `NoThreeLine.AffineBranch` and `NoThreeLine.Concrete` using the pinned toolchain. Record the operating system, compiler version, mathlib commit, exact command and result. A fresh-machine reproduction is useful even without extending a proof.

For a mathematical contribution, select one explicit obligation:

| Task | Start reading | Completion condition |
| --- | --- | --- |
| Review/reproduce the new concentration chain | `ProtectedCellOnePhasePowerTail.lean`, `FrozenClockCauseSmall.lean` | Independently reproduce the existing bounds and review actual stopping events, uniform thresholds, readiness and frozen-input hypotheses |
| Concrete certificate expansion | `Phase15301Group4750Risk.lean` and its imports | Add a new group with all families, exact risk aggregation and actual child-region containment; deduplicate coverage |
| Full concrete input assembly | `FrozenFiveCauseOutput.lean` | Supply all low rows, complete accepted-schedule matching, actual input mass and root-deadline pair bounds for every sufficiently large n |
| Build/verification tooling | `scripts/verify_snapshot.py`, `scripts/build_snapshot.py` | Demonstrate reproducible checks and more efficient execution without weakening the accepted mathematical conditions |

## Review information to include

- The mathematical statement added or changed, and its exact assumptions.
- Which remaining obligation it supplies and which obligations remain.
- Compiler and mathlib versions; newly compiled modules and their dependencies.
- `#print axioms` output for the important new endpoints.
- For numerical work, source-data provenance, exact acceptance conditions and coverage counts.

Preserve the definitions of `Grid`, `NoThree` and `Target`. Do not substitute a weaker target, add an unproved axiom, or count a conclusion-equivalent hypothesis as a completed proof. Keep actual physical state, deadlines and probability measures aligned when composing stochastic lemmas.

Avoid loading all generated numerical proofs for a small local change. Build the relevant dependency closure first. The [issue drafts](docs/ISSUE_DRAFTS.md) give suggested scopes; no GitHub issues have been created by this preparation.

The project is a hobby effort. There is no promised response time or planned expert outreach. AI use should be described accurately in contributions.
