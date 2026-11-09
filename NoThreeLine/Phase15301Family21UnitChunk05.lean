import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock05 : List ℚ := [(5905/18177:ℚ),(3976/12161:ℚ),(241/737:ℚ),(5000/15233:ℚ),(40001/121863:ℚ),(40003/121861:ℚ),(10001/30465:ℚ),(5000/14209:ℚ),(10001/28417:ℚ),(568/1591:ℚ),(31809/89095:ℚ),(31811/89093:ℚ),(7953/22273:ℚ),(2952/8065:ℚ),(5905/16129:ℚ),(2008/5419:ℚ),(48193/130055:ℚ),(2295/6193:ℚ),(12049/32513:ℚ),(1000/2637:ℚ),(40001/105479:ℚ),(40003/105477:ℚ),(10001/26369:ℚ),(1928/4993:ℚ)]

theorem unit_block05_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2952/9089:ℚ) unitBlock05 =
      some ((1928/4993:ℚ),(4243839629544008419/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block05_checked
