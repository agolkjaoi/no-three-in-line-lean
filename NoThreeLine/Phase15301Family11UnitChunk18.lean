import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock18 : List ℚ := [(105537/113671:ℚ),(105539/113669:ℚ),(26385/28417:ℚ),(239/255:ℚ),(957/1019:ℚ),(46657235403/49487109023:ℚ),(959/1017:ℚ),(120/127:ℚ),(1747128/1804543:ℚ),(14088/14209:ℚ),(28177/28417:ℚ),1]

theorem unit_block18_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (13192/14209:ℚ) unitBlock18 =
      some (1,(18867316762812889/72057594037927936:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block18_checked
