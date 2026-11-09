A compensated-process approach to the no-three-in-line problem
English proof draft, 10 November 2026, version 0.1

START HERE
  output/pdf/no_three_in_line_proof_draft_en.pdf

This is a human-readable mathematical draft for the target 1.501n.
It explains the process, exact remaining-exposure loss identity,
geometric estimates, concentration arguments and certificate contract.
It does not claim an unconditional proof of the numerical target.
The concrete application remains conditional on complete compatible
input checking. The final section distinguishes this scope from the
partial Lean snapshot and lists the remaining obligations.

CONTENTS
  main.tex, sections/       Editable mathematical text
  data/parameters.json     Curated rational constants and finite factors
  scripts/check_arithmetic.py
                           Standard-library Python exact checks
  scripts/build.ps1        Optional Windows PDF build helper
  evidence/arithmetic.json Exact arithmetic report, with explicit scope
  evidence/pdf_qa.json     Build and layout check record
  SOURCE_MAP.json          Relative source identifiers, hashes and links
  LICENSE                  MIT license and original project notices

BUILD
Use a standard LaTeX installation containing the packages named in
main.tex. Run from this project directory:

  pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -jobname=no_three_in_line_proof_draft_en -output-directory=output/pdf main.tex

Run three times initially to settle the table of contents, labels and
citations. Create output/pdf first if it is missing.
On Windows, scripts/build.ps1 does this and checks the arithmetic.
You can also open this project folder in Codex's LaTeX editor.

EXACT CHECKS
Requires Python 3.10 or later and no third-party modules:

  python scripts/check_arithmetic.py --output evidence/arithmetic.json

The script checks the finite arithmetic ledger. It does not recheck
the full geometry, phase matching, stochastic proof, or Lean sources.
Large reference fields and the full numerical certificate are not
included in this small source archive.

AI USE AND AUTHORSHIP
AI systems contributed substantially to this project, including
mathematical proposals and derivations, numerical code and checks,
Lean material, reviews, translation and exposition. This edition
was assembled and checked by OpenAI ChatGPT/Codex; earlier AI reviews
were supplied by the maintainer. It has no new independent human
review and no new full independent proof audit. The maintainer chose
the direction and requested experiments and revisions as a hobby
project. No named author, affiliation or personal contact is supplied.

PUBLIC PROJECT
https://github.com/agolkjaoi/no-three-in-line-lean
Snapshot used here: 282b636c160d049e3ef4d82f619fd44d98f8cf1d
The hosting account is public. This draft does not claim anonymous
hosting. See the paper for precise correspondence and remaining work.
