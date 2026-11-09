import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock14 : List ℚ := [(72711/72769:ℚ),(20225/20241:ℚ),(9089/9096:ℚ),(22273/22289:ℚ),(10113/10120:ℚ),(24321/24337:ℚ),(1591/1592:ℚ),(26369/26385:ℚ),(12161/12168:ℚ),(28417/28433:ℚ),(113669/113731:ℚ),(13185/13192:ℚ),(113671/113729:ℚ),(14209/14216:ℚ),1]

theorem unit_block14_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (72709/72771:ℚ) unitBlock14 =
      some (1,(51540519729537229/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block14_checked
