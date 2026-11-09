import NoThreeLine.Phase15301Family13UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

def unitBlock07 : List ℚ := [(39941/72771:ℚ),(39943/72769:ℚ),(4993/9096:ℚ),(7937/14097:ℚ),(3969/7048:ℚ),(16129/28433:ℚ),(64517/113731:ℚ),(9217/16247:ℚ),(8065/14216:ℚ),(14081/24337:ℚ),(2347/4056:ℚ),(5889/10001:ℚ),(589/1000:ℚ),(1337/2249:ℚ),(48133/80963:ℚ),(3564047276311/5994714872273:ℚ),(16045/26987:ℚ),(21125488216/35531534921:ℚ),(547/920:ℚ),(16129/26385:ℚ),(8065/13192:ℚ),(1997/3229:ℚ),(4993/8072:ℚ),(14081/22289:ℚ)]

theorem unit_block07_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (9985/18193:ℚ) unitBlock07 =
      some ((14081/22289:ℚ),(3329649227001918773/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_block07_checked
