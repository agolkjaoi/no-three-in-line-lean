import NoThreeLine.PositiveEdgeExample

set_option autoImplicit false

namespace NoThreeLine

/-- Verify that the exact decision procedure used for the large benchmark is
kernel reducible on the same signed-completion input format. -/
theorem positive_witness_kernel_reduction_smoke :
    qPositiveEdgeWitnessCheck edgeExampleRects edgeExampleWeights
      edgeExamplePositive edgeExampleNegative = true := by
  decide +kernel

end NoThreeLine

#print axioms NoThreeLine.positive_witness_kernel_reduction_smoke
