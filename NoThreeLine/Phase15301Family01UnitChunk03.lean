import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock03 : List ℚ := [(1181/6093:ℚ),(2952/14209:ℚ),(1227052289683/5906164066853:ℚ),(265160747757/1276250946385:ℚ),(23617/113671:ℚ),(23619/113669:ℚ),(5905/28417:ℚ),(1928/9089:ℚ),(3857/18177:ℚ),(328/1465:ℚ),(534180201625/2385455773499:ℚ),(5905/26369:ℚ),(904/3969:ℚ),(126761082219/556525110689:ℚ),(7233/31751:ℚ),(7235/31749:ℚ),(1809/7937:ℚ),(1928/8065:ℚ),(15425/64519:ℚ),(405733259629/1696871805827:ℚ),(15427/64517:ℚ),(3857/16129:ℚ),(2952/12161:ℚ),(5905/24321:ℚ)]

theorem unit_block03_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (283792780677/1464174096368:ℚ) unitBlock03 =
      some ((5905/24321:ℚ),(1522646873122790321/4611686018427387904:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block03_checked
