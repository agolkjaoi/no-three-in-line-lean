import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock04 : List ℚ := [(299/984:ℚ),(3841/12049:ℚ),(1921/6024:ℚ),(5889/18193:ℚ),(2945/9096:ℚ),(7937/24337:ℚ),(83323732997/255481847575:ℚ),(441/1352:ℚ),(9985/28433:ℚ),(39941/113731:ℚ),(39943/113729:ℚ),(4993/14216:ℚ),(7937/22289:ℚ),(567/1592:ℚ),(5889/16145:ℚ),(2945/8072:ℚ),(1997/5277:ℚ),(4993/13192:ℚ),(3841/10001:ℚ),(15365/40003:ℚ),(15367/40001:ℚ),(1921/5000:ℚ),(7937/20241:ℚ),(31749/80963:ℚ)]

theorem unit_block04_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7175/23617:ℚ) unitBlock04 =
      some ((31749/80963:ℚ),(4910106463405204521/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block04_checked
