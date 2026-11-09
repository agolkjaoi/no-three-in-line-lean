import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock08 : List ℚ := [(3857/7937:ℚ),(2952/6017:ℚ),(23617/48135:ℚ),(23619/48133:ℚ),(5905/12033:ℚ),(3976/8065:ℚ),(7953/16129:ℚ),(5000/10113:ℚ),(10001/20225:ℚ),(6024/12161:ℚ),(48193/97287:ℚ),(9639/19457:ℚ),(12049/24321:ℚ),(7048/14209:ℚ),(56385/113671:ℚ),(56387/113669:ℚ),(14097/28417:ℚ),(8072/16257:ℚ),(64577/130055:ℚ),(64579/130053:ℚ),(16145/32513:ℚ),(8072/15233:ℚ),(3229/6093:ℚ),(7048/13185:ℚ)]

theorem unit_block08_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1928/3969:ℚ) unitBlock08 =
      some ((7048/13185:ℚ),(4209578203841266567/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block08_checked
