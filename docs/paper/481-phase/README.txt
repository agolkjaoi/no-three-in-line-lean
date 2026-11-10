A computer-assisted lower bound for the no-three-in-line problem
Version 0.2, 10 November 2026: the 481-phase construction

START HERE
  output/pdf/no_three_in_line_481_en.pdf

The paper proves, by ordinary mathematical arguments and a finite exact
geometric computation, that every sufficiently large n admits at least
ceil(1.501 n) points in the n by n integer grid with no three collinear.
It gives the process, saved-credit identity, uniform lattice estimates,
common-stopping mixed moments, protected-clock argument, all five loss
bounds, concrete input and complete finite-checker contract in English.

The final application uses a new 481-phase input of mass
3842853135627/2560000000000 = 1.501114506104296875.
It replaces the historical 15,348-phase candidate. Old candidate inputs,
parameters and verification statuses are not prerequisites of this edition.
All four types use the same root deadline in each risk bound.

This is a computer-assisted mathematical proof manuscript, not a complete
Lean formalization. The stochastic lemmas are justified in the paper;
the checker certifies the finite geometric input. There has been no
independent human peer review. No effective threshold for the full theorem
or practical small-grid generation guarantee is claimed.

CONTENTS
  main.tex, sections/       Editable English mathematical text
  data/parameters.json     Exact rational parameters
  scripts/check_arithmetic.py
                           Small exact arithmetic and input checks
  scripts/build.ps1        Windows LaTeX build helper
  verification/            Exact input, C++/Python checkers, fresh evidence
  verification/reproduce.py
                           Fresh build and complete rerun in a new directory
  evidence/                Arithmetic, text/layout and execution comparison
  SOURCE_MAP.json          Provenance and hashes of the source material
  MANIFEST.sha256          Integrity list for the delivered files
  LICENSE                  MIT license

REPRODUCE THE FINITE GEOMETRIC COMPUTATION
Use Linux or WSL, Python 3.10 or later, and g++ with OpenMP and UBSan.
From this project directory, choose an output directory that does not exist:

  python3 verification/reproduce.py --output ../replay-481-new --threads 4

The driver copies only source and input into a fresh directory, compiles
with -O3 -g -std=c++17 -fopenmp -fsanitize=undefined
-fno-sanitize-recover=all, and reruns capacities, finite clock constants,
every phase's angular bounds, and complete report integrity checks.
It records compiler, build flags, executable/input/source hashes, commands,
exit codes, timestamps and result hashes in EXECUTION_PROVENANCE.json.
It accepts no cached phase result. The low-level replay script has no
resume mode in this edition. A tube failure is an inconclusive coarse
upper bound and triggers the rigorous Farey fallback; only accepted
outputs appear in the final summary.

verification/evidence/ contains the fresh execution supplied with this
edition. FINAL_REPORT.json and EXECUTION_PROVENANCE.json summarize it;
REPLAY_0_481.json and the per-phase CSV/JSON/log files give all results.
The 10 November run accepted all 481 phases and 242,176 type-cells, with
no missing, duplicate or failing cell. All 481 accepted CSVs are byte-identical
to the incoming dossier's records. The fresh angular replay took about
22.6 minutes using GCC 13.3.0 and four threads under Ubuntu/WSL.
evidence/replay_comparison.json records this comparison and the absence
of sanitizer-error diagnostics. The arithmetic ledger passed 69 checks.
The compiled machine-specific executable is omitted from the distribution;
its SHA-256 is recorded and the driver rebuilds from source. Hashes record
identity, not mathematical correctness or human peer review.

The following lightweight checks inspect existing data/results. They do
not recompute the angular bounds:

  python3 scripts/check_arithmetic.py --output evidence/arithmetic.json
  python3 verification/check_report_integrity.py

Check distributed file identity with:
  python3 scripts/check_package.py

BUILD THE PAPER
Use a standard LaTeX installation with the packages listed in main.tex.
Create output/pdf if needed, then run the following command three times:

  pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -jobname=no_three_in_line_481_en -output-directory=output/pdf main.tex

On Windows, scripts/build.ps1 runs the arithmetic checks and the three
LaTeX passes. The source can also be opened in a LaTeX editor.

AI USE AND AUTHORSHIP
AI systems contributed substantially to mathematical proposals and
derivations, numerical input construction, verification code, Lean code,
reviews, translation, writing and editing. This edition was integrated,
checked and freshly replayed with OpenAI ChatGPT/Codex; the incoming
materials included further AI-assisted proofs and code supplied by the
maintainer. AI cross-checks are not described as independent human review.
The maintainer directed the project and requested experiments and revisions
as a hobby project. No named mathematical author, affiliation or personal
contact is supplied. MIT terms and original notices are preserved.

PUBLIC PROJECT
  https://github.com/agolkjaoi/no-three-in-line-lean

This local edition does not itself update or publish to that repository.
The hosting account is public; no anonymous-hosting claim is made.
