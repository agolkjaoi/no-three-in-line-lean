import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock02 : List ℚ := [(1921/11144:ℚ),(1793/10001:ℚ),(7173/40003:ℚ),(7175/40001:ℚ),(897/5000:ℚ),(3841/20241:ℚ),(1921/10120:ℚ),(5889/28433:ℚ),(23557/113731:ℚ),(23559/113729:ℚ),(2945/14216:ℚ),(167/791:ℚ),(17918656043/84871354074:ℚ),(15365/72771:ℚ),(15367/72769:ℚ),(1921/9096:ℚ),(1963/8795:ℚ),(23557/105539:ℚ),(7853/35179:ℚ),(2945/13192:ℚ),(163/723:ℚ),(897/3976:ℚ),(3841/16145:ℚ),(1921/8072:ℚ)]

theorem unit_block02_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (3841/22289:ℚ) unitBlock02 =
      some ((1921/8072:ℚ),(8901503797266835023/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block02_checked
