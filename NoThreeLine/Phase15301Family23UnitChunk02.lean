import NoThreeLine.Phase15301Family23UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

def unitBlock02 : List ℚ := [(299/2008:ℚ),(3841/24337:ℚ),(15365/97347:ℚ),(15367/97345:ℚ),(1921/12168:ℚ),(3841/22289:ℚ),(3073/17831:ℚ),(15367/89153:ℚ),(1921/11144:ℚ),(1793/10001:ℚ),(127483826985/711052725286:ℚ),(7173/40003:ℚ),(7175/40001:ℚ),(897/5000:ℚ),(3841/20241:ℚ),(1921/10120:ℚ),(5889/28433:ℚ),(23557/113731:ℚ),(23559/113729:ℚ),(2945/14216:ℚ),(167/791:ℚ),(1921/9096:ℚ),(1963/8795:ℚ),(2945/13192:ℚ)]

theorem unit_block02_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (259328025935/1742144142997:ℚ) unitBlock02 =
      some ((2945/13192:ℚ),(1176116038161534205/2305843009213693952:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_block02_checked
