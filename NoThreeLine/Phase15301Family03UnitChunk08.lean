import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock08 : List ℚ := [(4993/8072:ℚ),(14081/22289:ℚ),(11265/17831:ℚ),(264656533653/418913270132:ℚ),(56327/89153:ℚ),(7041/11144:ℚ),(18177/28433:ℚ),(72709/113731:ℚ),(72711/113729:ℚ),(9089/14216:ℚ),(3841/5905:ℚ),(1921/2952:ℚ),(7937/12049:ℚ),(10583/16065:ℚ),(31751/48193:ℚ),(1323/2008:ℚ),(1719/2599:ℚ),(6017/9096:ℚ),(16129/24337:ℚ),(8065/12168:ℚ),(6059/8795:ℚ),(10387/15077:ℚ),(24237/35179:ℚ),(9089/13192:ℚ)]

theorem unit_block08_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1997/3229:ℚ) unitBlock08 =
      some ((9089/13192:ℚ),(2832901253111213089/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block08_checked
