import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock10 : List ℚ := [(3976/7041:ℚ),(1383/2449:ℚ),(70353081547/124569807076:ℚ),(31811/56325:ℚ),(7953/14081:ℚ),(8072/14209:ℚ),(64577/113671:ℚ),(64579/113669:ℚ),(16145/28417:ℚ),(7048/12161:ℚ),(4699/8107:ℚ),(2952/4993:ℚ),(1181/1997:ℚ),(2008/3371:ℚ),(48193/80903:ℚ),(5355/8989:ℚ),(12049/20225:ℚ),(9096/15233:ℚ),(72769/121863:ℚ),(72771/121861:ℚ),(18193/30465:ℚ),(8072/13185:ℚ),(16145/26369:ℚ),(1000/1613:ℚ)]

theorem unit_block10_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (18193/32513:ℚ) unitBlock10 =
      some ((1000/1613:ℚ),(5057782805070822039/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block10_checked
