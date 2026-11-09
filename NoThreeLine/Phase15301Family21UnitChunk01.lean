import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock01 : List ℚ := [(7235/72709:ℚ),(603/6059:ℚ),(904/8065:ℚ),(7233/64519:ℚ),(7235/64517:ℚ),(1809/16129:ℚ),(1928/16257:ℚ),(3857/32513:ℚ),(1928/15233:ℚ),(3857/30465:ℚ),(904/7041:ℚ),(8960810321/69772346379:ℚ),(1809/14081:ℚ),(1928/14209:ℚ),(3857/28417:ℚ),(1928/13185:ℚ),(654301831537/4474382978383:ℚ),(15425/105479:ℚ),(377525878991/2581348735887:ℚ),(15427/105477:ℚ),(551/3767:ℚ),(904/6017:ℚ),(2411/16045:ℚ),(7235/48133:ℚ)]

theorem unit_block01_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2411/24237:ℚ) unitBlock01 =
      some ((7235/48133:ℚ),(3807489846933563801/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block01_checked
