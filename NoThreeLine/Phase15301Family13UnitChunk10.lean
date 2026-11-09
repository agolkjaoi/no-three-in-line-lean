import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock10 : List ℚ := [(2347/3032:ℚ),(22273/28433:ℚ),(89093/113731:ℚ),(89095/113729:ℚ),(11137/14216:ℚ),(7937/10001:ℚ),(3969/5000:ℚ),(16129/20241:ℚ),(64517/80963:ℚ),(64519/80961:ℚ),(1613/2024:ℚ),(18177/22289:ℚ),(9089/11144:ℚ),(9985/12049:ℚ),(4993/6024:ℚ),(20225/24337:ℚ),(26967/32449:ℚ),(80903/97345:ℚ),(3371/4056:ℚ),(22273/26385:ℚ),(89093/105539:ℚ),(89095/105537:ℚ),(11137/13192:ℚ),(4011/4699:ℚ)]

theorem unit_block10_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (56327/72769:ℚ) unitBlock10 =
      some ((4011/4699:ℚ),(5043900726573759685/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block10_checked
