import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock08 : List ℚ := [(7953/16129:ℚ),(5000/10113:ℚ),(2353/4759:ℚ),(40003/80901:ℚ),(10001/20225:ℚ),(6024/12161:ℚ),(48193/97287:ℚ),(9639/19457:ℚ),(12049/24321:ℚ),(7048/14209:ℚ),(14097/28417:ℚ),(8072/16257:ℚ),(64577/130055:ℚ),(64579/130053:ℚ),(16145/32513:ℚ),(508381721/990541058:ℚ),(8072/15233:ℚ),(3229/6093:ℚ),(7048/13185:ℚ),(14097/26369:ℚ),(6024/11137:ℚ),(1302055972331/2407042837663:ℚ),(12049/22273:ℚ),(5000/9089:ℚ)]

theorem unit_block08_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (31811/64517:ℚ) unitBlock08 =
      some ((5000/9089:ℚ),(4122999046232678583/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block08_checked
