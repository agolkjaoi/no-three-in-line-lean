import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock11 : List ℚ := [(22273/26385:ℚ),(89093/105539:ℚ),(89095/105537:ℚ),(11137/13192:ℚ),(4011/4699:ℚ),(6017/7048:ℚ),(24321/28433:ℚ),(97285/113731:ℚ),(97287/113729:ℚ),(12161/14216:ℚ),(14081/16145:ℚ),(7041/8072:ℚ),(16129/18193:ℚ),(64517/72771:ℚ),(64519/72769:ℚ),(8065/9096:ℚ),(6059/6747:ℚ),(72709/80963:ℚ),(24237/26987:ℚ),(9089/10120:ℚ),(20225/22289:ℚ),(80901/89155:ℚ),(80903/89153:ℚ),(10113/11144:ℚ)]

theorem unit_block11_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (3371/4056:ℚ) unitBlock11 =
      some ((10113/11144:ℚ),(5248070719494866989/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block11_checked
