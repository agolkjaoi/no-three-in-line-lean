import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock00 : List ℚ := [(904/16257:ℚ),(7233/130055:ℚ),(7235/130053:ℚ),(1809/32513:ℚ),(904/15233:ℚ),(2411/40621:ℚ),(7235/121861:ℚ),(201/3385:ℚ),(904/14209:ℚ),(10980477539/172525588519:ℚ),(1809/28417:ℚ),(904/13185:ℚ),(7233/105479:ℚ),(24800163035/361594649152:ℚ),(7235/105477:ℚ),(1809/26369:ℚ),(904/12161:ℚ),(38874405877/522781778498:ℚ),(9/121:ℚ),(904/11137:ℚ),(7233/89095:ℚ),(7235/89093:ℚ),(1809/22273:ℚ),(904/10113:ℚ)]

theorem unit_block00_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 0 unitBlock00 =
      some ((904/10113:ℚ),(1713013400973320939/2305843009213693952:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block00_checked
