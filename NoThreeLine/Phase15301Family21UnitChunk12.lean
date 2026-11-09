import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock12 : List ℚ := [(7048/10113:ℚ),(14097/20225:ℚ),(5000/7041:ℚ),(40001/56327:ℚ),(40003/56325:ℚ),(10001/14081:ℚ),(10120/14209:ℚ),(20241/28417:ℚ),(8072/11137:ℚ),(16145/22273:ℚ),(11144/15233:ℚ),(22289/30465:ℚ),(328/441:ℚ),(23617/31751:ℚ),(7873/10583:ℚ),(5905/7937:ℚ),(6024/8065:ℚ),(24097/32259:ℚ),(12049/16129:ℚ),(9096/12161:ℚ),(72769/97287:ℚ),(72771/97285:ℚ),(18193/24321:ℚ),(4056/5419:ℚ)]

theorem unit_block12_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2599/3767:ℚ) unitBlock12 =
      some ((4056/5419:ℚ),(1987816268824241289/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block12_checked
