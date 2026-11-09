import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock06 : List ℚ := [(15425/39943:ℚ),(15427/39941:ℚ),(3857/9985:ℚ),(3976/10113:ℚ),(7953/20225:ℚ),(6024/15233:ℚ),(12049/30465:ℚ),(5000/12161:ℚ),(10001/24321:ℚ),(984/2347:ℚ),(23617/56327:ℚ),(7873/18775:ℚ),(430218272774/1025946327985:ℚ),(5905/14081:ℚ),(6024/14209:ℚ),(48193/113671:ℚ),(48195/113669:ℚ),(12049/28417:ℚ),(7048/16257:ℚ),(14097/32513:ℚ),(3976/9089:ℚ),(10603/24237:ℚ),(2447/5593:ℚ),(2651/6059:ℚ)]

theorem unit_block06_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (1928/4993:ℚ) unitBlock06 =
      some ((2651/6059:ℚ),(3884550817965399185/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block06_checked
