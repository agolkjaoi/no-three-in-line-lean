import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock04 : List ℚ := [(23559/72769:ℚ),(2945/9096:ℚ),(7937/24337:ℚ),(441/1352:ℚ),(9985/28433:ℚ),(4993/14216:ℚ),(7937/22289:ℚ),(15510203967/43553289158:ℚ),(567/1592:ℚ),(5889/16145:ℚ),(23557/64579:ℚ),(23559/64577:ℚ),(2945/8072:ℚ),(1997/5277:ℚ),(4993/13192:ℚ),(3841/10001:ℚ),(1921/5000:ℚ),(7937/20241:ℚ),(31749/80963:ℚ),(31751/80961:ℚ),(3969/10120:ℚ),(9985/24337:ℚ),(2041965630863/4976973395743:ℚ),(39941/97347:ℚ)]

theorem unit_block04_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (23557/72771:ℚ) unitBlock04 =
      some ((39941/97347:ℚ),(9013065438052523471/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block04_checked
