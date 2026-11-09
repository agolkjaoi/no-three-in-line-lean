import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock16 : List ℚ := [(8055/9217:ℚ),(56387/64517:ℚ),(111/127:ℚ),(13320/15233:ℚ),(14216/16257:ℚ),(113729/130055:ℚ),(26641/30465:ℚ),(113731/130053:ℚ),(28433/32513:ℚ),(888/1007:ℚ),(106561/120839:ℚ),(35521/40279:ℚ),(1709478882191/1938434718959:ℚ),(26641/30209:ℚ),(8072/9089:ℚ),(2040869218516/2297989777331:ℚ),(16145/18177:ℚ),(3032/3371:ℚ),(18193/20225:ℚ),(10120/11137:ℚ),(80961/89095:ℚ),(80963/89093:ℚ),(20241/22273:ℚ),(11144/12161:ℚ)]

theorem unit_block16_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (7048/8065:ℚ) unitBlock16 =
      some ((11144/12161:ℚ),(2648371600973802515/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block16_checked
