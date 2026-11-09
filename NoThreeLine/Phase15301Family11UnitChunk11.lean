import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock11 : List ℚ := [(1470802023218/2372020837477:ℚ),(10001/16129:ℚ),(10120/16257:ℚ),(548734858907/881497351747:ℚ),(80961/130055:ℚ),(80963/130053:ℚ),(1557/2501:ℚ),(7048/11137:ℚ),(14097/22273:ℚ),(9096/14209:ℚ),(2359071786979/3685119674741:ℚ),(18193/28417:ℚ),(1928/2945:ℚ),(15425/23559:ℚ),(738328724697/1127483670893:ℚ),(15427/23557:ℚ),(3857/5889:ℚ),(3976/6017:ℚ),(417848555689/632254207466:ℚ),(2651/4011:ℚ),(6024/9089:ℚ),(12049/18177:ℚ),(8072/12161:ℚ),(64577/97287:ℚ)]

theorem unit_block11_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1000/1613:ℚ) unitBlock11 =
      some ((64577/97287:ℚ),(419152849492565119/2305843009213693952:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block11_checked
