import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock07 : List ℚ := [(48133/97347:ℚ),(9627/19469:ℚ),(6017/12168:ℚ),(14081/28433:ℚ),(7041/14216:ℚ),(385952281/750178320:ℚ),(14081/26385:ℚ),(56325/105539:ℚ),(56327/105537:ℚ),(7041/13192:ℚ),(12033/22289:ℚ),(6017/11144:ℚ),(9985/18193:ℚ),(4993/9096:ℚ),(7937/14097:ℚ),(3969/7048:ℚ),(16129/28433:ℚ),(64517/113731:ℚ),(9217/16247:ℚ),(8065/14216:ℚ),(14081/24337:ℚ),(2347/4056:ℚ),(5889/10001:ℚ),(204263354501/346868742399:ℚ)]

theorem unit_block07_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (12033/24337:ℚ) unitBlock07 =
      some ((204263354501/346868742399:ℚ),(7291582682786814985/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block07_checked
