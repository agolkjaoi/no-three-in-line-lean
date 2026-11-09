import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock08 : List ℚ := [(56387/121861:ℚ),(4699/10155:ℚ),(8/17:ℚ),(7233/15367:ℚ),(83988444619/178436413256:ℚ),(1447/3073:ℚ),(1809/3841:ℚ),(1928/3969:ℚ),(361866302405/744733852697:ℚ),(3857/7937:ℚ),(2952/6017:ℚ),(23617/48135:ℚ),(23619/48133:ℚ),(5905/12033:ℚ),(3976/8065:ℚ),(915890683316/1857742986317:ℚ),(31809/64519:ℚ),(31811/64517:ℚ),(7953/16129:ℚ),(5000/10113:ℚ),(2055118809057/4156123732111:ℚ),(10001/20225:ℚ),(6024/12161:ℚ),(48193/97287:ℚ)]

theorem unit_block08_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2685/5803:ℚ) unitBlock08 =
      some ((48193/97287:ℚ),(2752551564300442271/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block08_checked
