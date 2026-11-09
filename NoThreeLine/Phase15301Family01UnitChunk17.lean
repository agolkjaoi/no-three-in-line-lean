import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock17 : List ℚ := [(239/255:ℚ),(957/1019:ℚ),(959/1017:ℚ),(120/127:ℚ),(1747128/1804543:ℚ),(14088/14209:ℚ),(28177/28417:ℚ),1]

theorem unit_block17_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (26385/28417:ℚ) unitBlock17 =
      some (1,(4360574271124383373/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block17_checked
