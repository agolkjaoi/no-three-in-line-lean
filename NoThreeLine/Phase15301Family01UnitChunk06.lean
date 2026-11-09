import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock06 : List ℚ := [(16898415417/46160348135:ℚ),(23619/64517:ℚ),(5905/16129:ℚ),(2008/5419:ℚ),(48193/130055:ℚ),(2295/6193:ℚ),(12049/32513:ℚ),(1000/2637:ℚ),(40001/105479:ℚ),(40003/105477:ℚ),(563890044886/1486819366469:ℚ),(10001/26369:ℚ),(1928/4993:ℚ),(15425/39943:ℚ),(15427/39941:ℚ),(3857/9985:ℚ),(3976/10113:ℚ),(31809/80903:ℚ),(31811/80901:ℚ),(7953/20225:ℚ),(6024/15233:ℚ),(12049/30465:ℚ),(5000/12161:ℚ),(10001/24321:ℚ)]

theorem unit_block06_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (23617/64519:ℚ) unitBlock06 =
      some ((10001/24321:ℚ),(2108409469548179085/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block06_checked
