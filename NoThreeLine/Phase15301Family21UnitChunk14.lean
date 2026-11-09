import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock14 : List ℚ := [(64579/80901:ℚ),(3229/4045:ℚ),(12168/15233:ℚ),(97345/121863:ℚ),(97347/121861:ℚ),(24337/30465:ℚ),(13192/16257:ℚ),(105537/130055:ℚ),(15077/18579:ℚ),(26385/32513:ℚ),(9096/11137:ℚ),(72769/89095:ℚ),(72771/89093:ℚ),(18193/22273:ℚ),(13192/16129:ℚ),(105537/129031:ℚ),(105539/129029:ℚ),(26385/32257:ℚ),(5000/6017:ℚ),(10001/12033:ℚ),(10120/12161:ℚ),(26987/32429:ℚ),(80963/97285:ℚ),(6747/8107:ℚ)]

theorem unit_block14_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (64577/80903:ℚ) unitBlock14 =
      some ((6747/8107:ℚ),(2381829340701471265/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block14_checked
