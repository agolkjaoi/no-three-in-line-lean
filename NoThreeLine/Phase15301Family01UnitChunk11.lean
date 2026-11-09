import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock11 : List ℚ := [(811065889199/1238792689525:ℚ),(15425/23559:ℚ),(15427/23557:ℚ),(3857/5889:ℚ),(3976/6017:ℚ),(2230587366883/3375187581899:ℚ),(2651/4011:ℚ),(6024/9089:ℚ),(12049/18177:ℚ),(8072/12161:ℚ),(16145/24321:ℚ),(10120/15233:ℚ),(2249/3385:ℚ),(11144/16257:ℚ),(89153/130055:ℚ),(8105/11823:ℚ),(22289/32513:ℚ),(3032/4395:ℚ),(2599/3767:ℚ),(7048/10113:ℚ),(56385/80903:ℚ),(56387/80901:ℚ),(14097/20225:ℚ),(5000/7041:ℚ)]

theorem unit_block11_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1928/2945:ℚ) unitBlock11 =
      some ((5000/7041:ℚ),(4298128574358179073/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block11_checked
