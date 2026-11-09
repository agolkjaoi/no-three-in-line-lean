import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock09 : List ℚ := [(7041/10120:ℚ),(9985/14097:ℚ),(39941/56387:ℚ),(39943/56385:ℚ),(4993/7048:ℚ),(20225/28433:ℚ),(80901/113731:ℚ),(80903/113729:ℚ),(10113/14216:ℚ),(16129/22289:ℚ),(8065/11144:ℚ),(1963/2651:ℚ),(2945/3976:ℚ),(12033/16145:ℚ),(48133/64579:ℚ),(48135/64577:ℚ),(6017/8072:ℚ),(18177/24337:ℚ),(9089/12168:ℚ),(4045/5277:ℚ),(10113/13192:ℚ),(14081/18193:ℚ),(18775/24257:ℚ),(56327/72769:ℚ)]

theorem unit_block09_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (14081/20241:ℚ) unitBlock09 =
      some ((56327/72769:ℚ),(2691809497366494773/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block09_checked
