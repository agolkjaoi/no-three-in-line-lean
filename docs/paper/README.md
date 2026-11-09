# English mathematical manuscript

[Read the 31-page PDF](output/pdf/no_three_in_line_proof_draft_en.pdf)

**A compensated-process approach to the no-three-in-line problem**

An English proof draft for the target 1.501n

10 November 2026, version 0.1

The manuscript explains the construction and its proof arguments without requiring Lean. It develops the exact remaining-exposure loss identity, lattice and mixed-moment estimates, concentration and stopping arguments, and a finite rational geometric checking contract.

**The concrete numerical application is conditional, and the final 1.501n theorem remains unproved.** Complete compatible geometric input checking, phase matching, mass and root-deadline pair bounds are still required. The mathematical arguments remain a research draft under review. The final section describes its correspondence with the fixed Lean snapshot and the remaining obligations.

## Reading and reproduction

- [PDF](output/pdf/no_three_in_line_proof_draft_en.pdf): start here.
- [Main LaTeX source](main.tex) and [section files](sections): edit or examine the mathematical text.
- [Build instructions and disclosure](README.txt): compile the paper with a standard LaTeX installation.
- [Exact parameters](data/parameters.json) and [arithmetic checker](scripts/check_arithmetic.py): a small Python standard-library check, without a large geometry calculation.
- [Arithmetic report](evidence/arithmetic.json) and [PDF review record](evidence/pdf_qa.json): the precise scope of the checks performed for this edition.
- [Source map](SOURCE_MAP.json): relative identifiers, hashes and public source links.
- [Bundle manifest](MANIFEST.json): byte identities of the original companion files. This navigation page is covered by the repository's root manifest.

From this directory:

    python scripts/check_arithmetic.py

The report contains 45 exact-arithmetic checks and checks all 15,225 coprimality pairs. It does not verify the complete geometric certificate, the entire stochastic proof or a Lean build. Large reference fields and all numerical leaves are not included in this small manuscript directory.

## Attribution and license

No named author, affiliation or personal contact address is supplied. AI systems contributed substantially to the research and this exposition; see the manuscript's disclosure and the repository's [AI-use statement](../../AI_USAGE.md). No new independent human review or full independent proof audit is claimed.

The manuscript and its companion code use the project's [MIT license](LICENSE).
