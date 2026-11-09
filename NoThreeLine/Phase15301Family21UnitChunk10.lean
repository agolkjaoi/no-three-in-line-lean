import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock10 : List ℚ := [(72769/121863:ℚ),(72771/121861:ℚ),(18193/30465:ℚ),(8072/13185:ℚ),(64577/105479:ℚ),(64579/105477:ℚ),(16145/26369:ℚ),(1000/1613:ℚ),(3077/4963:ℚ),(302066862508/487206053417:ℚ),(40003/64517:ℚ),(10001/16129:ℚ),(10120/16257:ℚ),(80961/130055:ℚ),(80963/130053:ℚ),(1557/2501:ℚ),(7048/11137:ℚ),(11277/17819:ℚ),(56387/89093:ℚ),(14097/22273:ℚ),(9096/14209:ℚ),(72769/113671:ℚ),(72771/113669:ℚ),(18193/28417:ℚ)]

theorem unit_block10_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (9096/15233:ℚ) unitBlock10 =
      some ((18193/28417:ℚ),(228733944250931537/1152921504606846976:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block10_checked
