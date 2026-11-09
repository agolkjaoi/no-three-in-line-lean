import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock13 : List ℚ := [(140854109485/197750976239:ℚ),(20241/28417:ℚ),(8072/11137:ℚ),(64577/89095:ℚ),(64579/89093:ℚ),(106678971067/147171652061:ℚ),(16145/22273:ℚ),(11144/15233:ℚ),(2948970812097/4031017121705:ℚ),(22289/30465:ℚ),(328/441:ℚ),(23617/31751:ℚ),(7873/10583:ℚ),(5905/7937:ℚ),(6024/8065:ℚ),(48193/64519:ℚ),(24097/32259:ℚ),(48195/64517:ℚ),(12049/16129:ℚ),(9096/12161:ℚ),(72769/97287:ℚ),(72771/97285:ℚ),(18193/24321:ℚ),(4056/5419:ℚ)]

theorem unit_block13_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (10120/14209:ℚ) unitBlock13 =
      some ((4056/5419:ℚ),(1526701825223745659/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block13_checked
