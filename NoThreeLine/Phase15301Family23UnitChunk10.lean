import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock10 : List ℚ := [(1963/2651:ℚ),(23557/31811:ℚ),(7853/10603:ℚ),(2945/3976:ℚ),(12033/16145:ℚ),(6017/8072:ℚ),(18177/24337:ℚ),(9089/12168:ℚ),(4045/5277:ℚ),(10113/13192:ℚ),(14081/18193:ℚ),(2347/3032:ℚ),(22273/28433:ℚ),(11137/14216:ℚ),(7937/10001:ℚ),(163476041153/205950987865:ℚ),(3969/5000:ℚ),(16129/20241:ℚ),(64517/80963:ℚ),(275160511877/345291430033:ℚ),(64519/80961:ℚ),(1613/2024:ℚ),(18177/22289:ℚ),(57314835353/70278913907:ℚ)]

theorem unit_block10_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (8065/11144:ℚ) unitBlock10 =
      some ((57314835353/70278913907:ℚ),(2774681591919065915/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block10_checked
