import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock03 : List ℚ := [(163/723:ℚ),(67163362863/297831251924:ℚ),(897/3976:ℚ),(3841/16145:ℚ),(15365/64579:ℚ),(642282508793/2699243844265:ℚ),(15367/64577:ℚ),(1921/8072:ℚ),(5889/24337:ℚ),(23557/97347:ℚ),(23559/97345:ℚ),(2945/12168:ℚ),(137298457/542425104:ℚ),(5889/22289:ℚ),(2945/11144:ℚ),(3841/14097:ℚ),(23979756027/87998666392:ℚ),(1921/7048:ℚ),(7937/28433:ℚ),(3969/14216:ℚ),(151/519:ℚ),(23557/80963:ℚ),(199868301059/686868508861:ℚ),(7853/26987:ℚ)]

theorem unit_block03_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2945/13192:ℚ) unitBlock03 =
      some ((7853/26987:ℚ),(104199284167141845/288230376151711744:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block03_checked
