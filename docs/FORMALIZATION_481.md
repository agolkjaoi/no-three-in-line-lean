# Lean progress for the 481-phase construction

`NoThreeLine481` contains work checked after the 3,242-module snapshot. It imports the relevant snapshot results. The target is the existence of a legal set of size at least `ceil(1.501 n)` for all sufficiently large grids.

## Checked milestones

- [Numerical margin](../NoThreeLine481/NumericalMargin.lean) proves the exact rational margin in Section 10, converts the manuscript's lattice mass estimate to a fixed mass floor for `n ≥ 2^24`, and converts the retained exposure bound to the integer cardinality inequality. The lattice mass and retention bounds are explicit hypotheses.

- [Ordinary-line capacity rows](../NoThreeLine481/CapacityRows.lean) certifies all 112 low-height rows of the common coarse capacity table. It adds 13 integer checker proofs and assembles them with the previously checked rows into a single theorem on every row.

The [compilation records](../evidence/481-progress/) identify the modules and their axiom reports. The checks used the pinned Lean toolchain and saved local compiled dependencies. To rebuild the entry module in a Lake checkout, run `lake build NoThreeLine481`.

The remaining work includes the actual lattice mass estimate, the (0/1) phase refinement, the transfer from the concrete masks to the line capacities, and the certified angular bounds. The unconditional `NoThreeLine.Target` remains open in Lean.
