import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock06 : List ℚ := [(10001/28417:ℚ),(568/1591:ℚ),(853185570505/2389472948483:ℚ),(7953/22273:ℚ),(2952/8065:ℚ),(5905/16129:ℚ),(2008/5419:ℚ),(48193/130055:ℚ),(2295/6193:ℚ),(12049/32513:ℚ),(1000/2637:ℚ),(40001/105479:ℚ),(148876688551/392550248221:ℚ),(40003/105477:ℚ),(10001/26369:ℚ),(1928/4993:ℚ),(15425/39943:ℚ),(15427/39941:ℚ),(3857/9985:ℚ),(3976/10113:ℚ),(31809/80903:ℚ),(31811/80901:ℚ),(7953/20225:ℚ),(6024/15233:ℚ)]

theorem unit_block06_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (5000/14209:ℚ) unitBlock06 =
      some ((6024/15233:ℚ),(3901734941396508885/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block06_checked
