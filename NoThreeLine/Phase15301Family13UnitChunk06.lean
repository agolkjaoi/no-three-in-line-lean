import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock06 : List ℚ := [(15367/31809:ℚ),(1921/3976:ℚ),(5889/12049:ℚ),(2945/6024:ℚ),(7937/16145:ℚ),(31749/64579:ℚ),(3514474595031/7148126535601:ℚ),(31751/64577:ℚ),(3969/8072:ℚ),(9985/20241:ℚ),(4993/10120:ℚ),(12033/24337:ℚ),(6017/12168:ℚ),(14081/28433:ℚ),(56325/113731:ℚ),(56327/113729:ℚ),(7041/14216:ℚ),(14081/26385:ℚ),(7041/13192:ℚ),(12033/22289:ℚ),(48133/89155:ℚ),(48135/89153:ℚ),(6017/11144:ℚ),(9985/18193:ℚ)]

theorem unit_block06_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (15365/31811:ℚ) unitBlock06 =
      some ((9985/18193:ℚ),(5518254890422491787/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block06_checked
