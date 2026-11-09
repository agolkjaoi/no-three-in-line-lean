import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock09 : List ℚ := [(137/249:ℚ),(3032/5419:ℚ),(18193/32513:ℚ),(3976/7041:ℚ),(7953/14081:ℚ),(8072/14209:ℚ),(204625241771/360195288091:ℚ),(64577/113671:ℚ),(64579/113669:ℚ),(716225264288/1260646590229:ℚ),(16145/28417:ℚ),(7048/12161:ℚ),(4699/8107:ℚ),(2952/4993:ℚ),(297131274397/502546513883:ℚ),(23617/39943:ℚ),(1125461170291/1903416582309:ℚ),(23619/39941:ℚ),(1181/1997:ℚ),(2008/3371:ℚ),(48193/80903:ℚ),(5355/8989:ℚ),(12049/20225:ℚ),(9096/15233:ℚ)]

theorem unit_block09_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (5000/9089:ℚ) unitBlock09 =
      some ((9096/15233:ℚ),(1814428302178456855/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block09_checked
