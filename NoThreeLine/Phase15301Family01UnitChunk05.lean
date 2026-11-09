import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock05 : List ℚ := [(684056168549/2227552659535:ℚ),(603/1963:ℚ),(5000/16257:ℚ),(40001/130055:ℚ),(40003/130053:ℚ),(10001/32513:ℚ),(1928/6017:ℚ),(551/1719:ℚ),(2952/9089:ℚ),(5905/18177:ℚ),(3976/12161:ℚ),(10603/32429:ℚ),(31811/97285:ℚ),(241/737:ℚ),(5000/15233:ℚ),(40001/121863:ℚ),(40003/121861:ℚ),(10001/30465:ℚ),(5000/14209:ℚ),(10001/28417:ℚ),(568/1591:ℚ),(7953/22273:ℚ),(2952/8065:ℚ),(23617/64519:ℚ)]

theorem unit_block05_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (904/2945:ℚ) unitBlock05 =
      some ((23617/64519:ℚ),(5565330576165159701/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block05_checked
