import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock13 : List ℚ := [(45225348226/60422650859:ℚ),(19469/26011:ℚ),(32449/43351:ℚ),(24337/32513:ℚ),(12168/16129:ℚ),(4684912048759/6209548233219:ℚ),(24337/32257:ℚ),(2024/2637:ℚ),(232238328859/302573023823:ℚ),(80961/105479:ℚ),(80963/105477:ℚ),(20241/26369:ℚ),(7048/9089:ℚ),(6265/8079:ℚ),(56387/72709:ℚ),(4699/6059:ℚ),(11144/14209:ℚ),(89153/113671:ℚ),(89155/113669:ℚ),(22289/28417:ℚ),(3976/4993:ℚ),(7953/9985:ℚ),(8072/10113:ℚ),(64577/80903:ℚ)]

theorem unit_block13_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (4056/5419:ℚ) unitBlock13 =
      some ((64577/80903:ℚ),(1811186016705802267/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block13_checked
