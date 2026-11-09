import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock16 : List ℚ := [(72769/80903:ℚ),(24257/26967:ℚ),(18193/20225:ℚ),(10120/11137:ℚ),(80961/89095:ℚ),(80963/89093:ℚ),(20241/22273:ℚ),(11144/12161:ℚ),(781302412301/852597108089:ℚ),(89153/97287:ℚ),(17831/19457:ℚ),(22289/24321:ℚ),(1352/1465:ℚ),(97345/105479:ℚ),(32449/35159:ℚ),(24337/26369:ℚ),(14088/15233:ℚ),(112705/121863:ℚ),(112707/121861:ℚ),(28177/30465:ℚ),(13192/14209:ℚ),(105537/113671:ℚ),(105539/113669:ℚ),(26385/28417:ℚ)]

theorem unit_block16_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (3032/3371:ℚ) unitBlock16 =
      some ((26385/28417:ℚ),(1026323625735317653/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block16_checked
