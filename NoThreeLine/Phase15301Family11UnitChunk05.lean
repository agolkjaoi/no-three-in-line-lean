import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock05 : List ℚ := [(904/2945:ℚ),(619246222099/2017099700519:ℚ),(603/1963:ℚ),(5000/16257:ℚ),(40001/130055:ℚ),(40003/130053:ℚ),(10001/32513:ℚ),(1928/6017:ℚ),(3085/9627:ℚ),(15427/48133:ℚ),(551/1719:ℚ),(2952/9089:ℚ),(23617/72711:ℚ),(23619/72709:ℚ),(5905/18177:ℚ),(3976/12161:ℚ),(1370561799943/4191922032875:ℚ),(10603/32429:ℚ),(31811/97285:ℚ),(241/737:ℚ),(5000/15233:ℚ),(10001/30465:ℚ),(294429209/865754370:ℚ),(5000/14209:ℚ)]

theorem unit_block05_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7953/26369:ℚ) unitBlock05 =
      some ((5000/14209:ℚ),(4838045847491662221/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block05_checked
