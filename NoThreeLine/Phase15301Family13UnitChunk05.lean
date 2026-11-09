import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock05 : List ℚ := [(39943/97345:ℚ),(4993/12168:ℚ),(1963/4699:ℚ),(23557/56387:ℚ),(7853/18795:ℚ),(2945/7048:ℚ),(12033/28433:ℚ),(48133/113731:ℚ),(48135/113729:ℚ),(6017/14216:ℚ),(7937/18193:ℚ),(1323/3032:ℚ),(9985/22289:ℚ),(3631/8105:ℚ),(39943/89153:ℚ),(4993/11144:ℚ),(4011/8795:ℚ),(6017/13192:ℚ),(1793/3857:ℚ),(7173/15427:ℚ),(287/617:ℚ),(897/1928:ℚ),(3841/7953:ℚ),(15365/31811:ℚ)]

theorem unit_block05_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (39941/97347:ℚ) unitBlock05 =
      some ((15365/31811:ℚ),(3540367265148964299/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block05_checked
