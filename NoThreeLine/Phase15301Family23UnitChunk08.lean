import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock08 : List ℚ := [(589/1000:ℚ),(1337/2249:ℚ),(547/920:ℚ),(16129/26385:ℚ),(8065/13192:ℚ),(1997/3229:ℚ),(39941/64579:ℚ),(39943/64577:ℚ),(4993/8072:ℚ),(14081/22289:ℚ),(11265/17831:ℚ),(56327/89153:ℚ),(7041/11144:ℚ),(18177/28433:ℚ),(9089/14216:ℚ),(3841/5905:ℚ),(15365/23619:ℚ),(1397/2147:ℚ),(1921/2952:ℚ),(7937/12049:ℚ),(10583/16065:ℚ),(31751/48193:ℚ),(1323/2008:ℚ),(1719/2599:ℚ)]

theorem unit_block08_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (204263354501/346868742399:ℚ) unitBlock08 =
      some ((1719/2599:ℚ),(2529596518634657277/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block08_checked
