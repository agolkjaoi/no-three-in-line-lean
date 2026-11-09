import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock07 : List ℚ := [(984/2347:ℚ),(243062012427/579681816799:ℚ),(5905/14081:ℚ),(6024/14209:ℚ),(12049/28417:ℚ),(7048/16257:ℚ),(11277/26011:ℚ),(56387/130053:ℚ),(14097/32513:ℚ),(3976/9089:ℚ),(2651/6059:ℚ),(5000/11137:ℚ),(10001/22273:ℚ),(2008/4395:ℚ),(12049/26369:ℚ),(7048/15233:ℚ),(2685/5803:ℚ),(56387/121861:ℚ),(4699/10155:ℚ),(8/17:ℚ),(7233/15367:ℚ),(1447/3073:ℚ),(1809/3841:ℚ),(1928/3969:ℚ)]

theorem unit_block07_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (10001/24321:ℚ) unitBlock07 =
      some ((1928/3969:ℚ),(6227390131529518449/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block07_checked
