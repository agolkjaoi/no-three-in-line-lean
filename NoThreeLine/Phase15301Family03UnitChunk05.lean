import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock05 : List ℚ := [(31751/80961:ℚ),(3969/10120:ℚ),(9985/24337:ℚ),(39941/97347:ℚ),(86471167708/210746180481:ℚ),(39943/97345:ℚ),(4993/12168:ℚ),(1963/4699:ℚ),(23557/56387:ℚ),(7853/18795:ℚ),(2945/7048:ℚ),(12033/28433:ℚ),(48133/113731:ℚ),(48135/113729:ℚ),(6017/14216:ℚ),(7937/18193:ℚ),(1323/3032:ℚ),(9985/22289:ℚ),(4993/11144:ℚ),(4011/8795:ℚ),(48133/105539:ℚ),(16045/35179:ℚ),(6017/13192:ℚ),(1793/3857:ℚ)]

theorem unit_block05_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (31749/80963:ℚ) unitBlock05 =
      some ((1793/3857:ℚ),(2042197445938811299/4611686018427387904:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block05_checked
