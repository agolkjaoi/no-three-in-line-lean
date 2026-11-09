import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock02 : List ℚ := [(1921/10120:ℚ),(5889/28433:ℚ),(23557/113731:ℚ),(23559/113729:ℚ),(2945/14216:ℚ),(167/791:ℚ),(306959818345/1453856069477:ℚ),(15365/72771:ℚ),(15367/72769:ℚ),(1921/9096:ℚ),(1963/8795:ℚ),(23557/105539:ℚ),(7853/35179:ℚ),(2945/13192:ℚ),(163/723:ℚ),(897/3976:ℚ),(3841/16145:ℚ),(1921/8072:ℚ),(5889/24337:ℚ),(333732610361/1378990672847:ℚ),(2945/12168:ℚ),(5889/22289:ℚ),(23557/89155:ℚ),(215361129875/815025035957:ℚ)]

theorem unit_block02_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (3841/20241:ℚ) unitBlock02 =
      some ((215361129875/815025035957:ℚ),(9096025913365675673/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block02_checked
