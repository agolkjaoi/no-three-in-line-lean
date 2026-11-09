import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock01 : List ℚ := [(2411/24237:ℚ),(407853924223/4099759855853:ℚ),(7235/72709:ℚ),(603/6059:ℚ),(904/8065:ℚ),(1809/16129:ℚ),(1928/16257:ℚ),(3085/26011:ℚ),(15427/130053:ℚ),(3857/32513:ℚ),(1928/15233:ℚ),(15425/121863:ℚ),(15427/121861:ℚ),(3857/30465:ℚ),(904/7041:ℚ),(1809/14081:ℚ),(1928/14209:ℚ),(3857/28417:ℚ),(1928/13185:ℚ),(13222043885/90406164911:ℚ),(551/3767:ℚ),(904/6017:ℚ),(170227445809/1133018087819:ℚ),(43473768526/289356367085:ℚ)]

theorem unit_block01_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (904/9089:ℚ) unitBlock01 =
      some ((43473768526/289356367085:ℚ),(7553923483102834455/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block01_checked
