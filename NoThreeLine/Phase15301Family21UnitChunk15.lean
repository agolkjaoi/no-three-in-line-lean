import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock15 : List ℚ := [(11144/13185:ℚ),(22289/26369:ℚ),(13064/15361:ℚ),(104513/122887:ℚ),(20903/24577:ℚ),(26129/30721:ℚ),(2008/2347:ℚ),(48193/56327:ℚ),(3213/3755:ℚ),(12049/14081:ℚ),(936/1093:ℚ),(24337/28417:ℚ),(13064/15233:ℚ),(26129/30465:ℚ),(13192/15361:ℚ),(26385/30721:ℚ),(13064/15105:ℚ),(2216882081091/2563113444403:ℚ),(1537/1777:ℚ),(13192/15233:ℚ),(1759/2031:ℚ),(13192/15105:ℚ),(26385/30209:ℚ),(7048/8065:ℚ)]

theorem unit_block15_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (6747/8107:ℚ) unitBlock15 =
      some ((7048/8065:ℚ),(2510437651623045341/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block15_checked
