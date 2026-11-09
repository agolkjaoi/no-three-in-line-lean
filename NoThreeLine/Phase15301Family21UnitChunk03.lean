import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock03 : List ℚ := [(3857/18177:ℚ),(328/1465:ℚ),(5905/26369:ℚ),(904/3969:ℚ),(7233/31751:ℚ),(69179264061/303578473423:ℚ),(7235/31749:ℚ),(1809/7937:ℚ),(1928/8065:ℚ),(15425/64519:ℚ),(15427/64517:ℚ),(3857/16129:ℚ),(2952/12161:ℚ),(23617/97287:ℚ),(2255937518441/9292475602111:ℚ),(23619/97285:ℚ),(5905/24321:ℚ),(3976/16257:ℚ),(7953/32513:ℚ),(3976/15233:ℚ),(10603/40621:ℚ),(31811/121861:ℚ),(2651/10155:ℚ),(2952/11137:ℚ)]

theorem unit_block03_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1928/9089:ℚ) unitBlock03 =
      some ((2952/11137:ℚ),(3765130579763565327/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block03_checked
