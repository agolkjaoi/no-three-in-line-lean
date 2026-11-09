import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock04 : List ℚ := [(3976/16257:ℚ),(31809/130055:ℚ),(31811/130053:ℚ),(7953/32513:ℚ),(3976/15233:ℚ),(10603/40621:ℚ),(31811/121861:ℚ),(2651/10155:ℚ),(2952/11137:ℚ),(23617/89095:ℚ),(619889771587/2338494666181:ℚ),(23619/89093:ℚ),(5905/22273:ℚ),(1928/7041:ℚ),(15425/56327:ℚ),(15427/56325:ℚ),(3857/14081:ℚ),(3976/14209:ℚ),(7953/28417:ℚ),(984/3371:ℚ),(1181/4045:ℚ),(3976/13185:ℚ),(7953/26369:ℚ),(904/2945:ℚ)]

theorem unit_block04_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (5905/24321:ℚ) unitBlock04 =
      some ((904/2945:ℚ),(6661605233839059379/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block04_checked
