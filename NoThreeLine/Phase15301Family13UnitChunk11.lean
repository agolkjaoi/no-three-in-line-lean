import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock11 : List ℚ := [(6017/7048:ℚ),(24321/28433:ℚ),(97285/113731:ℚ),(97287/113729:ℚ),(12161/14216:ℚ),(14081/16145:ℚ),(413389130837/473931232187:ℚ),(7041/8072:ℚ),(16129/18193:ℚ),(8065/9096:ℚ),(6059/6747:ℚ),(9089/10120:ℚ),(20225/22289:ℚ),(10113/11144:ℚ),(22273/24337:ℚ),(11137/12168:ℚ),(8107/8795:ℚ),(97285/105539:ℚ),(32429/35179:ℚ),(12161/13192:ℚ),(26369/28433:ℚ),(105477/113731:ℚ),(9589/10339:ℚ),(13185/14216:ℚ)]

theorem unit_block11_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (4011/4699:ℚ) unitBlock11 =
      some ((13185/14216:ℚ),(2148183512378181341/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block11_checked
