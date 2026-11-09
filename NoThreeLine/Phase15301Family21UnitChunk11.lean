import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock11 : List ℚ := [(1928/2945:ℚ),(15425/23559:ℚ),(15427/23557:ℚ),(3857/5889:ℚ),(3976/6017:ℚ),(10603/16045:ℚ),(31811/48133:ℚ),(2651/4011:ℚ),(6024/9089:ℚ),(48193/72711:ℚ),(1082798698043/1633578794261:ℚ),(405/611:ℚ),(457180313683/689715604611:ℚ),(12049/18177:ℚ),(8072/12161:ℚ),(16145/24321:ℚ),(10120/15233:ℚ),(2249/3385:ℚ),(11144/16257:ℚ),(89153/130055:ℚ),(8105/11823:ℚ),(22289/32513:ℚ),(3032/4395:ℚ),(2599/3767:ℚ)]

theorem unit_block11_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (18193/28417:ℚ) unitBlock11 =
      some ((2599/3767:ℚ),(911252924195932823/4611686018427387904:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block11_checked
