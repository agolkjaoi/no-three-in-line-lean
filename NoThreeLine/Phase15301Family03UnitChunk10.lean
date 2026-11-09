import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock10 : List ℚ := [(14081/18193:ℚ),(2347/3032:ℚ),(22273/28433:ℚ),(12115702291/15466206704:ℚ),(11137/14216:ℚ),(7937/10001:ℚ),(31749/40003:ℚ),(20218794341/25472968949:ℚ),(31751/40001:ℚ),(3969/5000:ℚ),(16129/20241:ℚ),(64517/80963:ℚ),(64519/80961:ℚ),(1613/2024:ℚ),(18177/22289:ℚ),(9089/11144:ℚ),(9985/12049:ℚ),(39941/48195:ℚ),(39943/48193:ℚ),(4993/6024:ℚ),(20225/24337:ℚ),(26967/32449:ℚ),(80903/97345:ℚ),(3371/4056:ℚ)]

theorem unit_block10_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (10113/13192:ℚ) unitBlock10 =
      some ((3371/4056:ℚ),(4560455760204267577/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block10_checked
