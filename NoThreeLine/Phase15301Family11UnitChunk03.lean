import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock03 : List ℚ := [(1181/6093:ℚ),(2952/14209:ℚ),(23617/113671:ℚ),(1858141395277/8943238436683:ℚ),(23619/113669:ℚ),(5905/28417:ℚ),(1928/9089:ℚ),(3857/18177:ℚ),(328/1465:ℚ),(2147/9589:ℚ),(7873/35159:ℚ),(5905/26369:ℚ),(904/3969:ℚ),(173069358757/759836839038:ℚ),(7233/31751:ℚ),(7235/31749:ℚ),(346313923041/1519498472549:ℚ),(1809/7937:ℚ),(1928/8065:ℚ),(27319057951/114271099511:ℚ),(15425/64519:ℚ),(15427/64517:ℚ),(3857/16129:ℚ),(2952/12161:ℚ)]

theorem unit_block03_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2952/15233:ℚ) unitBlock03 =
      some ((2952/12161:ℚ),(1496756590471920719/4611686018427387904:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block03_checked
