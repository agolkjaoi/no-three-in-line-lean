import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock03 : List ℚ := [(23559/89153:ℚ),(2945/11144:ℚ),(3841/14097:ℚ),(1921/7048:ℚ),(7937/28433:ℚ),(31749/113731:ℚ),(31751/113729:ℚ),(3969/14216:ℚ),(151/519:ℚ),(589/2024:ℚ),(7937/26385:ℚ),(31749/105539:ℚ),(31751/105537:ℚ),(3969/13192:ℚ),(1793/5905:ℚ),(2391/7873:ℚ),(7175/23617:ℚ),(299/984:ℚ),(3841/12049:ℚ),(439/1377:ℚ),(15367/48193:ℚ),(1921/6024:ℚ),(5889/18193:ℚ),(23557/72771:ℚ)]

theorem unit_block03_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (215361129875/815025035957:ℚ) unitBlock03 =
      some ((23557/72771:ℚ),(814249163570331195/2305843009213693952:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block03_checked
