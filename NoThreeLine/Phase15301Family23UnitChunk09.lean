import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock09 : List ℚ := [(379/573:ℚ),(192032003335/290323542239:ℚ),(48135/72769:ℚ),(6017/9096:ℚ),(16129/24337:ℚ),(64517/97347:ℚ),(64519/97345:ℚ),(8065/12168:ℚ),(6059/8795:ℚ),(10387/15077:ℚ),(24237/35179:ℚ),(9089/13192:ℚ),(14081/20241:ℚ),(7041/10120:ℚ),(9985/14097:ℚ),(4993/7048:ℚ),(20225/28433:ℚ),(80901/113731:ℚ),(80903/113729:ℚ),(10113/14216:ℚ),(16129/22289:ℚ),(64517/89155:ℚ),(64519/89153:ℚ),(8065/11144:ℚ)]

theorem unit_block09_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1719/2599:ℚ) unitBlock09 =
      some ((8065/11144:ℚ),(4340562019624333561/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block09_checked
