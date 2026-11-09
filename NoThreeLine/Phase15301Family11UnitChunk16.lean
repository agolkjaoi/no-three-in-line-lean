import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock16 : List ℚ := [(24337/28417:ℚ),(13064/15233:ℚ),(26129/30465:ℚ),(13192/15361:ℚ),(5079053792697/5913967532225:ℚ),(26385/30721:ℚ),(13064/15105:ℚ),(1537/1777:ℚ),(13192/15233:ℚ),(35179/40621:ℚ),(105539/121861:ℚ),(1759/2031:ℚ),(13192/15105:ℚ),(26385/30209:ℚ),(7048/8065:ℚ),(111/127:ℚ),(13320/15233:ℚ),(26641/30465:ℚ),(888/1007:ℚ),(106561/120839:ℚ),(35521/40279:ℚ),(26641/30209:ℚ),(8072/9089:ℚ),(64577/72711:ℚ)]

theorem unit_block16_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (936/1093:ℚ) unitBlock16 =
      some ((64577/72711:ℚ),(441709766059675249/4611686018427387904:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block16_checked
