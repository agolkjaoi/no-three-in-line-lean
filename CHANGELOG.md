# Changes

## 2026-11-11 — 481-phase Lean progress

Added the exact final mass and retention comparison from Section 10 as a Lean theorem with explicit lattice mass and retention hypotheses. The [progress page](docs/FORMALIZATION_481.md) links the checked modules and describes their scope.

Completed the 112-row low-height ordinary-line capacity table in Lean. The 13 additional row checks use integer bounds with kernel evaluation, and the combined theorem covers the full common coarse table.

Formalized the general refinement from fractional exposure phases to binary masks, with exact preservation of duration and terminal exposure.

Combined the five stopping bounds into an eventual output theorem for binary schedules with explicit mass, capacity and root-deadline pair-sum hypotheses.

Proved the exact coarse-table mass and the finite-board mass and line capacity bounds for the terminal field with fine-grid boundary erasure. Connected those bounds to the conditional binary schedule theorem.

Proved that the rank-end pair bound controls refined deadlines, and that strict continuum angular slack absorbs the finite lattice error for all sufficiently large boards.

Instantiated the ranked binary schedule with the archived 481-phase input. Proved that the archived input gives the final target conditional on its per-cell continuum angular bounds. Checked the generated rank literal and all Lean decoder outputs against the archived rank file.

Checked general angular checker lemmas for integer chord slices, the external checker’s coordinate maps, the Farey partition, bin estimates and the exact cell acceptance inequality.

## 2026-11-10 — 481-phase computer-assisted proof, English Version 0.2

Added the [481-phase English manuscript and complete verification package](docs/paper/481-phase/), with a [current PDF](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf) and [downloadable ZIP](docs/paper/releases/no_three_line_481_complete_en_20261110.zip). The paper gives an ordinary mathematical, computer-assisted proof of a no-three-in-line set of size at least `ceil(1.501 n)` for every sufficiently large integer `n`. This replaces the conditional numerical application of Version 0.1 with a different, fully checked finite input of mass `1.501114506104296875`.

A fresh build and full finite replay completed in approximately 22.6 minutes: all 481 phases and 242,176 positive type/cells passed, with no missing, duplicate or failing cells. All 481 accepted per-phase CSV files were byte-for-byte identical to the supplied records. The package includes exact-arithmetic checks, capacity checks, checker soundness arguments, execution provenance, sources and data. Its reproduction driver uses a new output directory and accepts no cached phase results.

The English proof now includes the common-stopping mixed-moment argument, protected-line concentration with conditional restart, and the fixed loss budget. The finite execution checks geometric inputs; it does not automatically certify the stochastic proofs. No independent human peer review or complete formal verification is claimed.

The 3,242-module partial Lean snapshot is unchanged, and its final `Target` remains unproved in Lean. See the [paper landing page](docs/paper/README.md) and [reproduction instructions](docs/REPRODUCING.md) for the separate mathematical and formalization scopes.

## 2026-11-10 — English mathematical manuscript, Version 0.1

Added a 31-page English proof draft, its editable LaTeX sources, a small exact-arithmetic ledger and checker, and PDF build/layout records. The exposition develops the process, geometric estimates, concentration arguments and finite checking contract. At this edition, the numerical application remained conditional on complete compatible input verification. The [paper landing page](docs/paper/README.md) distinguishes it from Version 0.2.

The 45 small arithmetic checks pass, including all 15,225 pairwise coprimality checks for the 175 finite-sieve factors. These checks do not replay the full geometric certificate. All PDF pages were visually checked, and the PDF has an empty author field. AI involvement is disclosed in the manuscript.

The audited Lean sources and their proof scope are unchanged. Distribution verification now handles the explicitly identified manuscript PDF as a binary artifact, checks it against its recorded SHA-256, and retains text scanning for other files.

## 2026-11-10 — second public snapshot

The one-phase concentration gap described in the first publication has been supplied at the theorem level. Actual history-dependent cuts now feed the stopped exponential estimate, uniform one-phase power tails, and frozen clock-cause smallness. `FrozenFiveCauseOutput` derives the exact 1.501n output from explicit concrete input conditions.

- Added 94 audited modules: 3,148 → 3,242, with the original 3,148 source files unchanged.
- Low-height capacity rows: 79/112 → 99/112.
- Completed benchmark leaves at phase 15301: still 20/80, with 80/320 symmetry images. Partial family checks do not increase this count.
- Updated the remaining-work list and contribution entry points to the full concrete geometry, schedule, mass and root-deadline pair-budget obligations.
- Preserved the exact target, MIT license, AI-use disclosure and absence of named authors.

At this Lean snapshot, the final target remained unproved. The new statements retained their actual hypotheses; they were not a certification of the complete numerical input. See [STATUS.md](STATUS.md), [the audit delta](evidence/progress-update.json), and [publication validation](evidence/publication-validation.json).

This snapshot is based on the audit at 2026-11-09 15:22:46 UTC (2026-11-10 00:22:46 JST), following the first public edition (`2026-11-10-public-1`).

## 2026-11-10 — Git metadata correction

The publication history was restarted with a GitHub noreply identity for both author and committer. References to earlier Git commits were replaced by edition identifiers. All 3,242 original Lean modules, compilation evidence, MIT licensing and AI-use disclosure remain unchanged. This correction adds no mathematical claims.
