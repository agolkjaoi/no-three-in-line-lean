import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock15 : List ℚ := [(13192/15361:ℚ),(2539507613683/2957003048778:ℚ),(26385/30721:ℚ),(13064/15105:ℚ),(1537/1777:ℚ),(13192/15233:ℚ),(35179/40621:ℚ),(105539/121861:ℚ),(1759/2031:ℚ),(13192/15105:ℚ),(26385/30209:ℚ),(7048/8065:ℚ),(111/127:ℚ),(13320/15233:ℚ),(26641/30465:ℚ),(888/1007:ℚ),(106561/120839:ℚ),(35521/40279:ℚ),(26641/30209:ℚ),(8072/9089:ℚ),(64577/72711:ℚ),(64579/72709:ℚ),(16145/18177:ℚ),(3032/3371:ℚ)]

theorem unit_block15_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (26129/30465:ℚ) unitBlock15 =
      some ((3032/3371:ℚ),(2624449682832608145/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block15_checked
