import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock12 : List ℚ := [(10001/14081:ℚ),(10120/14209:ℚ),(20241/28417:ℚ),(8072/11137:ℚ),(64577/89095:ℚ),(64579/89093:ℚ),(16145/22273:ℚ),(11144/15233:ℚ),(22289/30465:ℚ),(328/441:ℚ),(23617/31751:ℚ),(7873/10583:ℚ),(5905/7937:ℚ),(6024/8065:ℚ),(48193/64519:ℚ),(24097/32259:ℚ),(48195/64517:ℚ),(12049/16129:ℚ),(9096/12161:ℚ),(72769/97287:ℚ),(72771/97285:ℚ),(18193/24321:ℚ),(4056/5419:ℚ),(19469/26011:ℚ)]

theorem unit_block12_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (5000/7041:ℚ) unitBlock12 =
      some ((19469/26011:ℚ),(3271975145994807021/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block12_checked
