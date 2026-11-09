import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock09 : List ℚ := [(14097/26369:ℚ),(6024/11137:ℚ),(48193/89095:ℚ),(48195/89093:ℚ),(12049/22273:ℚ),(5000/9089:ℚ),(40001/72711:ℚ),(40003/72709:ℚ),(137/249:ℚ),(3032/5419:ℚ),(18193/32513:ℚ),(3976/7041:ℚ),(2341416900255/4146255485083:ℚ),(1383/2449:ℚ),(31811/56325:ℚ),(7953/14081:ℚ),(8072/14209:ℚ),(64577/113671:ℚ),(64579/113669:ℚ),(16145/28417:ℚ),(7048/12161:ℚ),(18795/32429:ℚ),(56387/97285:ℚ),(4699/8107:ℚ)]

theorem unit_block09_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7048/13185:ℚ) unitBlock09 =
      some ((4699/8107:ℚ),(4009052304267130571/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block09_checked
