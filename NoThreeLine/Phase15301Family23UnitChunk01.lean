import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock01 : List ℚ := [(45445/433576:ℚ),(127/1144:ℚ),(1793/16145:ℚ),(7173/64579:ℚ),(7175/64577:ℚ),(897/8072:ℚ),(1017/9151:ℚ),(1019/9149:ℚ),(255/2287:ℚ),(3847663/32239839:ℚ),(1793/14097:ℚ),(276042998933/2170061535367:ℚ),(7173/56387:ℚ),(205/1611:ℚ),(897/7048:ℚ),(3841/28433:ℚ),(15365/113731:ℚ),(1397/10339:ℚ),(1921/14216:ℚ),(105289241/750178320:ℚ),(3841/26385:ℚ),(113/776:ℚ),(1793/12049:ℚ),(259328025935/1742144142997:ℚ)]

theorem unit_block01_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (299/3032:ℚ) unitBlock01 =
      some ((259328025935/1742144142997:ℚ),(4513802875866276229/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block01_checked
