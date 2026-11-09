import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock11 : List ℚ := [(9089/11144:ℚ),(9985/12049:ℚ),(4993/6024:ℚ),(20225/24337:ℚ),(26967/32449:ℚ),(80903/97345:ℚ),(3371/4056:ℚ),(22273/26385:ℚ),(89093/105539:ℚ),(89095/105537:ℚ),(11137/13192:ℚ),(4011/4699:ℚ),(48133/56387:ℚ),(3209/3759:ℚ),(121002776686/141741336959:ℚ),(6017/7048:ℚ),(24321/28433:ℚ),(97285/113731:ℚ),(97287/113729:ℚ),(12161/14216:ℚ),(14081/16145:ℚ),(56325/64579:ℚ),(56327/64577:ℚ),(7041/8072:ℚ)]

theorem unit_block11_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (57314835353/70278913907:ℚ) unitBlock11 =
      some ((7041/8072:ℚ),(1754153597261560679/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block11_checked
