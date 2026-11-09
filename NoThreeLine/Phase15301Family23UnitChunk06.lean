import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock06 : List ℚ := [(9985/22289:ℚ),(4993/11144:ℚ),(4011/8795:ℚ),(48133/105539:ℚ),(16045/35179:ℚ),(6017/13192:ℚ),(1793/3857:ℚ),(897/1928:ℚ),(3841/7953:ℚ),(15365/31811:ℚ),(15367/31809:ℚ),(1921/3976:ℚ),(5889/12049:ℚ),(23557/48195:ℚ),(23559/48193:ℚ),(2945/6024:ℚ),(7937/16145:ℚ),(3969/8072:ℚ),(9985/20241:ℚ),(39941/80963:ℚ),(893978400663/1812043830284:ℚ),(39943/80961:ℚ),(4993/10120:ℚ),(12033/24337:ℚ)]

theorem unit_block06_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1323/3032:ℚ) unitBlock06 =
      some ((12033/24337:ℚ),(5031514728459046843/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block06_checked
