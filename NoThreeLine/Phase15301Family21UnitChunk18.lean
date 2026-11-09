import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock18 : List ℚ := [(120/127:ℚ),(1747128/1804543:ℚ),(14088/14209:ℚ),(28177/28417:ℚ),1]

theorem unit_block18_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (959/1017:ℚ) unitBlock18 =
      some (1,(3560252363413253965/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block18_checked
