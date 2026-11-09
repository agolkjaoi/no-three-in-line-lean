import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock13 : List ℚ := [(1921/1928:ℚ),(5889/5905:ℚ),(2945/2952:ℚ),(7937/7953:ℚ),(567/568:ℚ),(9985/10001:ℚ),(39941/40003:ℚ),(39943/40001:ℚ),(4993/5000:ℚ),(12033/12049:ℚ),(48133/48195:ℚ),(1822541981987/1824748152569:ℚ),(48135/48193:ℚ),(6017/6024:ℚ),(14081/14097:ℚ),(1019175960493/1020248154811:ℚ),(7041/7048:ℚ),(16129/16145:ℚ),(271423802385/271686505003:ℚ),(64517/64579:ℚ),(64519/64577:ℚ),(18177/18193:ℚ),(8065/8072:ℚ),(72709/72771:ℚ)]

theorem unit_block13_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (3841/3857:ℚ) unitBlock13 =
      some ((72709/72771:ℚ),(199478409669563379/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block13_checked
