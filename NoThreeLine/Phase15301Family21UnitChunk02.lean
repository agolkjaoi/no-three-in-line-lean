import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock02 : List ℚ := [(201/1337:ℚ),(1928/12161:ℚ),(3857/24321:ℚ),(1928/11137:ℚ),(144897896504/836943381641:ℚ),(3085/17819:ℚ),(15427/89093:ℚ),(3857/22273:ℚ),(904/4993:ℚ),(1809/9985:ℚ),(984/5419:ℚ),(28050431179/154457812277:ℚ),(5905/32513:ℚ),(1928/10113:ℚ),(3857/20225:ℚ),(2952/15233:ℚ),(23617/121863:ℚ),(23619/121861:ℚ),(58621123037/302445085221:ℚ),(1181/6093:ℚ),(2952/14209:ℚ),(256142236914/1232846635063:ℚ),(5905/28417:ℚ),(1928/9089:ℚ)]

theorem unit_block02_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7235/48133:ℚ) unitBlock02 =
      some ((1928/9089:ℚ),(2140073577432238255/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block02_checked
