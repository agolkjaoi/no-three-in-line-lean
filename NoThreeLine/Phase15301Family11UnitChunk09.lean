import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock09 : List ℚ := [(82864453099/167271007493:ℚ),(9639/19457:ℚ),(12049/24321:ℚ),(7048/14209:ℚ),(902481653361/1819390425565:ℚ),(14097/28417:ℚ),(8072/16257:ℚ),(64577/130055:ℚ),(64579/130053:ℚ),(16145/32513:ℚ),(8072/15233:ℚ),(3229/6093:ℚ),(7048/13185:ℚ),(14097/26369:ℚ),(6024/11137:ℚ),(12049/22273:ℚ),(5000/9089:ℚ),(40001/72711:ℚ),(40003/72709:ℚ),(137/249:ℚ),(3032/5419:ℚ),(72769/130055:ℚ),(24257/43351:ℚ),(18193/32513:ℚ)]

theorem unit_block09_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (48193/97287:ℚ) unitBlock09 =
      some ((18193/32513:ℚ),(5351229048539272535/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block09_checked
