import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock05 : List ℚ := [(567/1592:ℚ),(5889/16145:ℚ),(2945/8072:ℚ),(1997/5277:ℚ),(39941/105539:ℚ),(39943/105537:ℚ),(4993/13192:ℚ),(3841/10001:ℚ),(1921/5000:ℚ),(7937/20241:ℚ),(938122325365/2392097337901:ℚ),(3969/10120:ℚ),(9985/24337:ℚ),(4993/12168:ℚ),(1963/4699:ℚ),(23557/56387:ℚ),(7853/18795:ℚ),(2945/7048:ℚ),(12033/28433:ℚ),(6017/14216:ℚ),(7937/18193:ℚ),(10583/24257:ℚ),(31751/72769:ℚ),(1323/3032:ℚ)]

theorem unit_block05_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (31751/89153:ℚ) unitBlock05 =
      some ((1323/3032:ℚ),(6648155327203102631/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block05_checked
