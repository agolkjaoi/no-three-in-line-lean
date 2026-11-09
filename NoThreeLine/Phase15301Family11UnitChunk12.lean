import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock12 : List ℚ := [(64579/97285:ℚ),(16145/24321:ℚ),(10120/15233:ℚ),(26987/40621:ℚ),(80963/121861:ℚ),(2249/3385:ℚ),(11144/16257:ℚ),(89153/130055:ℚ),(8105/11823:ℚ),(22289/32513:ℚ),(3032/4395:ℚ),(72769/105479:ℚ),(24257/35159:ℚ),(2599/3767:ℚ),(7048/10113:ℚ),(56385/80903:ℚ),(56387/80901:ℚ),(14097/20225:ℚ),(5000/7041:ℚ),(40001/56327:ℚ),(2500988514489/3521459815639:ℚ),(40003/56325:ℚ),(10001/14081:ℚ),(10120/14209:ℚ)]

theorem unit_block12_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (64577/97287:ℚ) unitBlock12 =
      some ((10120/14209:ℚ),(3910458108380653421/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block12_checked
