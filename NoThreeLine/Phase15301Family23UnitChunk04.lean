import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock04 : List ℚ := [(589/2024:ℚ),(7937/26385:ℚ),(127949696519/425290534189:ℚ),(3969/13192:ℚ),(1793/5905:ℚ),(2391/7873:ℚ),(68360868806/225096047965:ℚ),(7175/23617:ℚ),(299/984:ℚ),(3841/12049:ℚ),(439/1377:ℚ),(15367/48193:ℚ),(1921/6024:ℚ),(5889/18193:ℚ),(2945/9096:ℚ),(7937/24337:ℚ),(441/1352:ℚ),(9985/28433:ℚ),(711558573371/2026065078469:ℚ),(4993/14216:ℚ),(7937/22289:ℚ),(31749/89155:ℚ),(673399427829/1890942977131:ℚ),(31751/89153:ℚ)]

theorem unit_block04_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7853/26987:ℚ) unitBlock04 =
      some ((31751/89153:ℚ),(5701186155411794587/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block04_checked
