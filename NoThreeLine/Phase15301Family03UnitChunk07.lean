import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock07 : List ℚ := [(12033/22289:ℚ),(6017/11144:ℚ),(9985/18193:ℚ),(39941/72771:ℚ),(39943/72769:ℚ),(4993/9096:ℚ),(7937/14097:ℚ),(3969/7048:ℚ),(16129/28433:ℚ),(64517/113731:ℚ),(9217/16247:ℚ),(8065/14216:ℚ),(14081/24337:ℚ),(2347/4056:ℚ),(5889/10001:ℚ),(658222275703/1117762059877:ℚ),(589/1000:ℚ),(1337/2249:ℚ),(48133/80963:ℚ),(16045/26987:ℚ),(547/920:ℚ),(16129/26385:ℚ),(8065/13192:ℚ),(1997/3229:ℚ)]

theorem unit_block07_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7041/13192:ℚ) unitBlock07 =
      some ((1997/3229:ℚ),(3545131889994728019/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block07_checked
