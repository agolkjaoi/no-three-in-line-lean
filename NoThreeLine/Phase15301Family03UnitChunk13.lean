import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock13 : List ℚ := [(3155784653871/3159143334763:ℚ),(56327/56385:ℚ),(7041/7048:ℚ),(16129/16145:ℚ),(2283351305107/2285395121885:ℚ),(18177/18193:ℚ),(8065/8072:ℚ),(20225/20241:ℚ),(9089/9096:ℚ),(22273/22289:ℚ),(10113/10120:ℚ),(24321/24337:ℚ),(1591/1592:ℚ),(26369/26385:ℚ),(12161/12168:ℚ),(28417/28433:ℚ),(113669/113731:ℚ),(13185/13192:ℚ),(113671/113729:ℚ),(14209/14216:ℚ),1]

theorem unit_block13_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (56325/56387:ℚ) unitBlock13 =
      some (1,(7333449854324981/2305843009213693952:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block13_checked
