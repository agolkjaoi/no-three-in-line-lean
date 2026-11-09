import NoThreeLine.Phase15301Family03UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

def unitBlock12 : List ℚ := [(22273/24337:ℚ),(11137/12168:ℚ),(8107/8795:ℚ),(12161/13192:ℚ),(26369/28433:ℚ),(105477/113731:ℚ),(9589/10339:ℚ),(13185/14216:ℚ),(49340953/51433488:ℚ),(1793/1809:ℚ),(897/904:ℚ),(3841/3857:ℚ),(1921/1928:ℚ),(5889/5905:ℚ),(2945/2952:ℚ),(7937/7953:ℚ),(567/568:ℚ),(9985/10001:ℚ),(4993/5000:ℚ),(12033/12049:ℚ),(851717024947/852821480581:ℚ),(6017/6024:ℚ),(14081/14097:ℚ),(56325/56387:ℚ)]

theorem unit_block12_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (10113/11144:ℚ) unitBlock12 =
      some ((56325/56387:ℚ),(2689916175580332221/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_block12_checked
