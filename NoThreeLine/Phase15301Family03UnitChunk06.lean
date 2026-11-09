import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock06 : List ℚ := [(897/1928:ℚ),(3841/7953:ℚ),(15365/31811:ℚ),(15367/31809:ℚ),(1921/3976:ℚ),(5889/12049:ℚ),(2945/6024:ℚ),(7937/16145:ℚ),(31749/64579:ℚ),(31751/64577:ℚ),(3969/8072:ℚ),(9985/20241:ℚ),(4993/10120:ℚ),(12033/24337:ℚ),(6017/12168:ℚ),(14081/28433:ℚ),(56325/113731:ℚ),(56327/113729:ℚ),(7041/14216:ℚ),(385952281/750178320:ℚ),(14081/26385:ℚ),(56325/105539:ℚ),(56327/105537:ℚ),(7041/13192:ℚ)]

theorem unit_block06_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1793/3857:ℚ) unitBlock06 =
      some ((7041/13192:ℚ),(3202752991611186711/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block06_checked
