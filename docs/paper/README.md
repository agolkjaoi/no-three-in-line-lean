# English manuscript and reproducible finite computation

**[Read the current 36-page PDF](481-phase/output/pdf/no_three_in_line_481_en.pdf)** · **[Download the complete ZIP (3.6 MB)](releases/no_three_line_481_complete_en_20261110.zip)**

## Version 0.2: the 481-phase construction

**A computer-assisted lower bound for the no-three-in-line problem**, 10 November 2026.

The manuscript gives an ordinary mathematical, computer-assisted proof that every sufficiently large integer `n` admits at least `ceil(1.501*n)` points in the `n × n` grid with no three collinear. Its probabilistic arguments and the final fixed error budget are developed in English. A separate exact finite computation supplies the geometric input. No Lean knowledge is needed to read or rerun this part.

The new input has **481 phases and 242,176 positive type-cells**, with mass **1.501114506104296875**. A fresh GCC 13.3.0 build with OpenMP and undefined-behavior sanitization accepted every phase in about **22.6 minutes**. There were no missing, duplicate or failing cells, and all 481 accepted CSV files were byte-identical to the incoming dossier's records. Capacity and clock-constant checks also passed; the arithmetic ledger has 69 checks.

These are finite computation results. The stochastic lemmas are mathematical proofs in the manuscript, and the [Lean target remains unproved](../../STATUS.md). No independent human peer review or complete formal verification is claimed. The theorem is asymptotic; the final numerical threshold for `n` has not been computed.

## Current files

| Purpose | Files |
| --- | --- |
| Read the argument | [PDF](481-phase/output/pdf/no_three_in_line_481_en.pdf) |
| Inspect or edit the text | [Main LaTeX source](481-phase/main.tex), [sections](481-phase/sections), [build instructions](481-phase/README.txt) |
| Reproduce the geometry | [Fresh-build driver](481-phase/verification/reproduce.py), [checker sources](481-phase/verification/independent), [input data](481-phase/verification/data), [instructions](481-phase/verification/README.txt) |
| Inspect execution evidence | [Final report](481-phase/verification/evidence/FINAL_REPORT.json), [build and execution provenance](481-phase/verification/evidence/EXECUTION_PROVENANCE.json), [all phase reports](481-phase/verification/evidence/REPLAY_0_481.json), [comparison with prior results](481-phase/evidence/replay_comparison.json) |
| Run small exact checks | [Parameters](481-phase/data/parameters.json), [checker](481-phase/scripts/check_arithmetic.py), [69-check report](481-phase/evidence/arithmetic.json) |
| Verify artifact identity | [Bundle manifest](481-phase/MANIFEST.sha256), [file checker](481-phase/scripts/check_package.py), [source map](481-phase/SOURCE_MAP.json), [publication record](../../evidence/paper-481-integration.json) |

From the repository root, the small checks require only Python's standard library:

```text
python docs/paper/481-phase/scripts/check_package.py
python docs/paper/481-phase/scripts/check_arithmetic.py --require-replay
```

For a fresh complete calculation, use Linux/WSL with Python 3.10+ and g++ with OpenMP/UBSan. Choose an output directory that does not exist:

```text
python3 docs/paper/481-phase/verification/reproduce.py --output ../no-three-481-replay --threads 4
```

The driver builds from source and accepts no cached phase result. Its output stays outside the frozen published bundle. The package includes all data and recorded results; it excludes the machine-specific executable, which the driver rebuilds. The complete ZIP has the same reviewed contents as the `481-phase/` directory. See [repository reproduction instructions](../REPRODUCING.md) for the separate Lean build.

## Historical version 0.1

The [31-page version 0.1 PDF](output/pdf/no_three_in_line_proof_draft_en.pdf), its [sources](main.tex), [reading notes](README.txt) and [manifest](MANIFEST.json) are retained at their original paths. That version used the older 15,348-phase candidate and left its numerical application conditional. It is a historical draft, superseded for the current ordinary-language argument by version 0.2. The 481-phase input is a separate construction; its successful replay does not complete the old Lean certificate.

## Attribution and license

There is no named mathematical author, affiliation or personal contact address. Substantial AI work in mathematics, code, checking, review and exposition is disclosed in the manuscript and [AI_USAGE.md](../../AI_USAGE.md). Separate AI reviews are not independent human peer review. The manuscript, input and checker sources retain the project's [MIT license](481-phase/LICENSE).
