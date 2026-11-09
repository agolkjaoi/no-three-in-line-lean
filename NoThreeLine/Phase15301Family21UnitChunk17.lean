import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock17 : List ℚ := [(89153/97287:ℚ),(17831/19457:ℚ),(22289/24321:ℚ),(1352/1465:ℚ),(97345/105479:ℚ),(32449/35159:ℚ),(24337/26369:ℚ),(14088/15233:ℚ),(112705/121863:ℚ),(112707/121861:ℚ),(417237734943/451124146115:ℚ),(28177/30465:ℚ),(13192/14209:ℚ),(105537/113671:ℚ),(105539/113669:ℚ),(26385/28417:ℚ),(14216/15233:ℚ),(2321/2487:ℚ),(113731/121861:ℚ),(28433/30465:ℚ),(239/255:ℚ),(957/1019:ℚ),(429739282/456080939:ℚ),(959/1017:ℚ)]

theorem unit_block17_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (11144/12161:ℚ) unitBlock17 =
      some ((959/1017:ℚ),(883226901485102529/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block17_checked
