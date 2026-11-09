import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock07 : List ℚ := [(12049/30465:ℚ),(5000/12161:ℚ),(174456194336/424295231465:ℚ),(10001/24321:ℚ),(984/2347:ℚ),(5905/14081:ℚ),(6024/14209:ℚ),(48193/113671:ℚ),(48195/113669:ℚ),(12049/28417:ℚ),(7048/16257:ℚ),(11277/26011:ℚ),(56387/130053:ℚ),(14097/32513:ℚ),(3976/9089:ℚ),(2651/6059:ℚ),(5000/11137:ℚ),(40001/89095:ℚ),(40003/89093:ℚ),(10001/22273:ℚ),(2008/4395:ℚ),(12049/26369:ℚ),(7048/15233:ℚ),(2685/5803:ℚ)]

theorem unit_block07_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (6024/15233:ℚ) unitBlock07 =
      some ((2685/5803:ℚ),(2882054250777827695/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block07_checked
