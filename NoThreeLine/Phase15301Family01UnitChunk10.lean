import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock10 : List ℚ := [(2952/4993:ℚ),(1181/1997:ℚ),(2008/3371:ℚ),(12049/20225:ℚ),(9096/15233:ℚ),(72769/121863:ℚ),(72771/121861:ℚ),(18193/30465:ℚ),(8072/13185:ℚ),(64577/105479:ℚ),(64579/105477:ℚ),(16145/26369:ℚ),(1000/1613:ℚ),(10001/16129:ℚ),(10120/16257:ℚ),(80961/130055:ℚ),(80963/130053:ℚ),(1557/2501:ℚ),(7048/11137:ℚ),(174094630979/275067678672:ℚ),(14097/22273:ℚ),(9096/14209:ℚ),(18193/28417:ℚ),(1928/2945:ℚ)]

theorem unit_block10_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (4699/8107:ℚ) unitBlock10 =
      some ((1928/2945:ℚ),(2933045096081409623/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block10_checked
