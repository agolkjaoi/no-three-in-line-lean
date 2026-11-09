import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock00 : List ℚ := [(904/16257:ℚ),(7233/130055:ℚ),(7235/130053:ℚ),(1809/32513:ℚ),(904/15233:ℚ),(201/3385:ℚ),(904/14209:ℚ),(7233/113671:ℚ),(7235/113669:ℚ),(1809/28417:ℚ),(904/13185:ℚ),(22193705933/323552805553:ℚ),(1809/26369:ℚ),(904/12161:ℚ),(5113057371/68781676789:ℚ),(2411/32429:ℚ),(1447/19457:ℚ),(9/121:ℚ),(904/11137:ℚ),(1809/22273:ℚ),(904/10113:ℚ),(1809/20225:ℚ),(904/9089:ℚ),(2411/24237:ℚ)]

theorem unit_block00_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 0 unitBlock00 =
      some ((2411/24237:ℚ),(4913028066810338915/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block00_checked
