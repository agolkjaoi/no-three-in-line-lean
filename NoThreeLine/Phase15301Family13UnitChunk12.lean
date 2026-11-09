import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock12 : List ℚ := [(49340953/51433488:ℚ),(1793/1809:ℚ),(897/904:ℚ),(3841/3857:ℚ),(1921/1928:ℚ),(5889/5905:ℚ),(23557/23619:ℚ),(23559/23617:ℚ),(2945/2952:ℚ),(7937/7953:ℚ),(31749/31811:ℚ),(31751/31809:ℚ),(567/568:ℚ),(9985/10001:ℚ),(4993/5000:ℚ),(12033/12049:ℚ),(48133/48195:ℚ),(48135/48193:ℚ),(6017/6024:ℚ),(14081/14097:ℚ),(56325/56387:ℚ),(56327/56385:ℚ),(7041/7048:ℚ),(16129/16145:ℚ)]

theorem unit_block12_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (13185/14216:ℚ) unitBlock12 =
      some ((16129/16145:ℚ),(4441918713037527881/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block12_checked
