import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock04 : List ℚ := [(5905/24321:ℚ),(3976/16257:ℚ),(294844382871/1205524344017:ℚ),(31809/130055:ℚ),(31811/130053:ℚ),(294869564669/1205499162219:ℚ),(7953/32513:ℚ),(3976/15233:ℚ),(2651/10155:ℚ),(2952/11137:ℚ),(4108991187/15501149777:ℚ),(23617/89095:ℚ),(23619/89093:ℚ),(5905/22273:ℚ),(1928/7041:ℚ),(3857/14081:ℚ),(3976/14209:ℚ),(7953/28417:ℚ),(984/3371:ℚ),(1181/4045:ℚ),(3976/13185:ℚ),(31809/105479:ℚ),(31811/105477:ℚ),(7953/26369:ℚ)]

theorem unit_block04_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2952/12161:ℚ) unitBlock04 =
      some ((7953/26369:ℚ),(178601957087357399/576460752303423488:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block04_checked
