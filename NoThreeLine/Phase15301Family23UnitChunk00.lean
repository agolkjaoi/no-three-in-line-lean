import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock00 : List ℚ := [(127/2168:ℚ),(113/1927:ℚ),(1019/17341:ℚ),(1/17:ℚ),(1793/28433:ℚ),(897/14216:ℚ),(1793/26385:ℚ),(7173/105539:ℚ),(2929979267281/43107101314759:ℚ),(1048380869475/15421928976823:ℚ),(7175/105537:ℚ),(897/13192:ℚ),(45483545/642107408:ℚ),(1793/24337:ℚ),(415168688677/5631885192503:ℚ),(23/312:ℚ),(1793/22289:ℚ),(897/11144:ℚ),(1793/20241:ℚ),(39/440:ℚ),(1793/18193:ℚ),(2391/24257:ℚ),(7175/72769:ℚ),(299/3032:ℚ)]

theorem unit_block00_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 0 unitBlock00 =
      some ((299/3032:ℚ),(24743030001560114151/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block00_checked
