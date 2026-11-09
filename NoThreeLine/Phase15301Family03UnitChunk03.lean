import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock03 : List ℚ := [(5889/24337:ℚ),(2945/12168:ℚ),(5889/22289:ℚ),(23557/89155:ℚ),(916954182963/3470160465949:ℚ),(23559/89153:ℚ),(2945/11144:ℚ),(3841/14097:ℚ),(8974056715/32929882619:ℚ),(1921/7048:ℚ),(7937/28433:ℚ),(31749/113731:ℚ),(1412107842/5058176987:ℚ),(31751/113729:ℚ),(3969/14216:ℚ),(151/519:ℚ),(589/2024:ℚ),(7937/26385:ℚ),(31749/105539:ℚ),(31751/105537:ℚ),(3969/13192:ℚ),(1793/5905:ℚ),(2391/7873:ℚ),(7175/23617:ℚ)]

theorem unit_block03_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1921/8072:ℚ) unitBlock03 =
      some ((7175/23617:ℚ),(3830491331562970335/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block03_checked
