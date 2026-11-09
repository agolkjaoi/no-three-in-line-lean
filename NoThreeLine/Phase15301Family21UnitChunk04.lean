import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock04 : List ℚ := [(918160898051/3463205946065:ℚ),(5905/22273:ℚ),(1928/7041:ℚ),(3857/14081:ℚ),(3976/14209:ℚ),(31809/113671:ℚ),(1329563918737/4751258329873:ℚ),(31811/113669:ℚ),(7953/28417:ℚ),(984/3371:ℚ),(23617/80903:ℚ),(130722955633/447783313007:ℚ),(7873/26967:ℚ),(1181/4045:ℚ),(3976/13185:ℚ),(7953/26369:ℚ),(904/2945:ℚ),(603/1963:ℚ),(5000/16257:ℚ),(171668992087/558136110133:ℚ),(10001/32513:ℚ),(1928/6017:ℚ),(551/1719:ℚ),(2952/9089:ℚ)]

theorem unit_block04_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2952/11137:ℚ) unitBlock04 =
      some ((2952/9089:ℚ),(2100839991789649479/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block04_checked
