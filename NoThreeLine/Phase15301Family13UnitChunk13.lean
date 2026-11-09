import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock13 : List ℚ := [(619219722983/619828155844:ℚ),(64517/64579:ℚ),(64519/64577:ℚ),(18177/18193:ℚ),(8065/8072:ℚ),(20225/20241:ℚ),(9089/9096:ℚ),(80901/80963:ℚ),(22273/22289:ℚ),(80903/80961:ℚ),(89093/89155:ℚ),(10113/10120:ℚ),(24321/24337:ℚ),(89095/89153:ℚ),(1591/1592:ℚ),(26369/26385:ℚ),(12161/12168:ℚ),(28417/28433:ℚ),(113669/113731:ℚ),(13185/13192:ℚ),(113671/113729:ℚ),(14209/14216:ℚ),1]

theorem unit_block13_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (16129/16145:ℚ) unitBlock13 =
      some (1,(63847993738014033/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block13_checked
