import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock15 : List ℚ := [(97345/121863:ℚ),(97347/121861:ℚ),(24337/30465:ℚ),(9096/11137:ℚ),(18193/22273:ℚ),(13192/16129:ℚ),(105537/129031:ℚ),(105539/129029:ℚ),(26385/32257:ℚ),(5000/6017:ℚ),(40001/48135:ℚ),(40003/48133:ℚ),(10001/12033:ℚ),(10120/12161:ℚ),(6747/8107:ℚ),(11144/13185:ℚ),(22289/26369:ℚ),(13064/15361:ℚ),(104513/122887:ℚ),(20903/24577:ℚ),(26129/30721:ℚ),(2008/2347:ℚ),(12049/14081:ℚ),(936/1093:ℚ)]

theorem unit_block15_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (12168/15233:ℚ) unitBlock15 =
      some ((936/1093:ℚ),(3645655136184046553/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block15_checked
