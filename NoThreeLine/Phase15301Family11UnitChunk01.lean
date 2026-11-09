import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock01 : List ℚ := [(7233/80903:ℚ),(20983256559/234645296141:ℚ),(7235/80901:ℚ),(1809/20225:ℚ),(904/9089:ℚ),(2411/24237:ℚ),(7235/72709:ℚ),(603/6059:ℚ),(904/8065:ℚ),(1809/16129:ℚ),(1928/16257:ℚ),(3085/26011:ℚ),(15427/130053:ℚ),(3857/32513:ℚ),(1928/15233:ℚ),(15425/121863:ℚ),(15427/121861:ℚ),(3857/30465:ℚ),(904/7041:ℚ),(1809/14081:ℚ),(1928/14209:ℚ),(3857/28417:ℚ),(1928/13185:ℚ),(551/3767:ℚ)]

theorem unit_block01_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (904/10113:ℚ) unitBlock01 =
      some ((551/3767:ℚ),(7912700324304645343/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block01_checked
