Finite geometric verification for the 481-phase construction

The mathematical contract is stated in the accompanying English paper.
Inputs: data/field_units.txt (1024 integers) and data/full_rank.bin
(262144 little-endian signed 32-bit ranks). The positive ranks are 0..480;
forward exposure uses these ranks in decreasing order. Every positive
type-cell is used exactly once. The fixed time scale is 249/250.

Run from the paper root using a NEW output directory:
  python3 verification/reproduce.py --output ../replay-481-new --threads 4

Requires g++, OpenMP, UBSan and Python 3.10+. No external Python package is
needed. No old result or acceptance CSV is used to derive fresh bounds.

The C++ mathematical checker is byte-identical to the independent checker
in the supplied 2026-11-10 dossier. The low-level Python replay wrapper was
changed to remove unsafe cached resumption and reject pre-existing phase
results. reproduce.py adds a fresh-directory build and provenance record.
The mathematical input and bound algorithms were not changed.

Scope: this computation establishes the finite mass, capacity and geometric
risk conditions. It does not execute the stochastic process, certify the
probabilistic arguments in a proof assistant, or compute the theorem's final
n0. Read the ordinary mathematical proofs in the paper for those reductions.
