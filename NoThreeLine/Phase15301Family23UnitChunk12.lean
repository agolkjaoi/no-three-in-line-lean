import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock12 : List ℚ := [(16129/18193:ℚ),(3486244974997/3931952644991:ℚ),(8065/9096:ℚ),(6059/6747:ℚ),(9089/10120:ℚ),(20225/22289:ℚ),(80901/89155:ℚ),(80903/89153:ℚ),(1466133562045/1615630282923:ℚ),(10113/11144:ℚ),(22273/24337:ℚ),(89093/97347:ℚ),(17819/19469:ℚ),(11137/12168:ℚ),(8107/8795:ℚ),(1910237970596/2072242681771:ℚ),(12161/13192:ℚ),(26369/28433:ℚ),(105477/113731:ℚ),(9589/10339:ℚ),(13185/14216:ℚ),(1793/1809:ℚ),(897/904:ℚ),(3841/3857:ℚ)]

theorem unit_block12_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7041/8072:ℚ) unitBlock12 =
      some ((3841/3857:ℚ),(7426154202905885709/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block12_checked
