import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock01 : List ℚ := [(897/8072:ℚ),(27118105/227581968:ℚ),(1793/14097:ℚ),(897/7048:ℚ),(3841/28433:ℚ),(15365/113731:ℚ),(1397/10339:ℚ),(1921/14216:ℚ),(3841/26385:ℚ),(113/776:ℚ),(1793/12049:ℚ),(299/2008:ℚ),(3841/24337:ℚ),(15365/97347:ℚ),(15367/97345:ℚ),(1921/12168:ℚ),(89554457/542425104:ℚ),(3841/22289:ℚ),(1921/11144:ℚ),(1793/10001:ℚ),(7173/40003:ℚ),(7175/40001:ℚ),(897/5000:ℚ),(3841/20241:ℚ)]

theorem unit_block01_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1793/16145:ℚ) unitBlock01 =
      some ((3841/20241:ℚ),(1654150712118210179/2305843009213693952:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block01_checked
