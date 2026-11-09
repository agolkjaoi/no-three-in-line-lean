import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock00 : List ℚ := [(1793/28433:ℚ),(897/14216:ℚ),(49156633/750178320:ℚ),(1793/26385:ℚ),(7173/105539:ℚ),(1304040476893/19181899749809:ℚ),(7175/105537:ℚ),(897/13192:ℚ),(1793/24337:ℚ),(23/312:ℚ),(1793/22289:ℚ),(7173/89155:ℚ),(7175/89153:ℚ),(897/11144:ℚ),(38137369/451131408:ℚ),(1793/20241:ℚ),(7173/80963:ℚ),(7175/80961:ℚ),(39/440:ℚ),(1498447/16009840:ℚ),(1793/18193:ℚ),(299/3032:ℚ),(10263731/97903280:ℚ),(1793/16145:ℚ)]

theorem unit_block00_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 0 unitBlock00 =
      some ((1793/16145:ℚ),(14289497205112195851/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block00_checked
