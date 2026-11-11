# Lean progress for the 481-phase construction

`NoThreeLine481` contains work checked after the 3,242-module snapshot. It imports the relevant snapshot results. The target is the existence of a legal set of size at least `ceil(1.501 n)` for all sufficiently large grids.

## Checked milestones

- [Numerical margin](../NoThreeLine481/NumericalMargin.lean) proves the exact rational margin in Section 10, converts the manuscript's lattice mass estimate to a fixed mass floor for `n ≥ 2^24`, and converts the retained exposure bound to the integer cardinality inequality. The lattice mass and retention bounds are explicit hypotheses.

- [Ordinary-line capacity rows](../NoThreeLine481/CapacityRows.lean) certifies all 112 low-height rows of the common coarse capacity table. It adds 13 integer checker proofs and assembles them with the previously checked rows into a single theorem on every row.

- [Binary phase refinement](../NoThreeLine481/PhaseRefinement.lean) turns a list of fractional exposure phases into a finite schedule of binary masks. For each phase the construction uses the successive differences of its sorted positive weights. It preserves the total schedule duration and the terminal exposure at each point.

- [Conditional output theorem](../NoThreeLine481/BinaryOutput.lean) combines the five stopping bounds for any finite binary schedule. The [clock bound](../NoThreeLine481/BinaryClock.lean) is uniform over schedules of fixed phase count and bounded total time with strict designated-line capacity slack. The output theorem requires terminal line capacities and board mass, together with a discrete pair-sum bound at each root’s deadline. A family supplying these inputs for all sufficiently large boards implies `NoThreeLine.Target`.

- [Terminal field](../NoThreeLine481/FineGridOutput.lean) supplies the mass and both line capacities for any binary schedule realizing the manuscript’s terminal field. The [mass proof](../NoThreeLine481/TerminalMass.lean) evaluates the 1,024 common coarse weights in the kernel and controls the erased fine-grid lines. The [capacity proof](../NoThreeLine481/TerminalCapacity.lean) transfers the certified coarse bounds to the actual lattice line sums. The pair-sum premise is still explicit.

The [compilation records](../evidence/481-progress/) identify the modules and their axiom reports. The checks used the pinned Lean toolchain and saved local compiled dependencies. To rebuild the entry module in a Lake checkout, run `lake build NoThreeLine481`.

The remaining work includes the instantiation of the binary refinement and terminal-field identity on the 481 phases, and the certified angular bounds at the root deadlines. The unconditional `NoThreeLine.Target` remains open in Lean.
