import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock13 : List ℚ := [(32449/43351:ℚ),(24337/32513:ℚ),(12168/16129:ℚ),(24337/32257:ℚ),(2024/2637:ℚ),(80961/105479:ℚ),(80963/105477:ℚ),(20241/26369:ℚ),(7048/9089:ℚ),(4699/6059:ℚ),(11144/14209:ℚ),(89153/113671:ℚ),(89155/113669:ℚ),(22289/28417:ℚ),(3976/4993:ℚ),(31809/39943:ℚ),(31811/39941:ℚ),(7953/9985:ℚ),(8072/10113:ℚ),(3229/4045:ℚ),(12168/15233:ℚ),(97345/121863:ℚ),(97347/121861:ℚ),(24337/30465:ℚ)]

theorem unit_block13_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (19469/26011:ℚ) unitBlock13 =
      some ((24337/30465:ℚ),(506813862857801709/2305843009213693952:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block13_checked
