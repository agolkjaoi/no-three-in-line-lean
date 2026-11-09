import NoThreeLine.Phase15301Family01UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

def unitBlock02 : List ℚ := [(2411/16045:ℚ),(7235/48133:ℚ),(201/1337:ℚ),(1928/12161:ℚ),(15425/97287:ℚ),(15427/97285:ℚ),(3857/24321:ℚ),(1928/11137:ℚ),(3857/22273:ℚ),(904/4993:ℚ),(142583111351/787146789531:ℚ),(1809/9985:ℚ),(984/5419:ℚ),(1243/6845:ℚ),(101830296821/560720365090:ℚ),(7873/43351:ℚ),(5905/32513:ℚ),(1928/10113:ℚ),(15425/80903:ℚ),(540113803879/2832653041873:ℚ),(15427/80901:ℚ),(3857/20225:ℚ),(2952/15233:ℚ),(283792780677/1464174096368:ℚ)]

theorem unit_block02_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (43473768526/289356367085:ℚ) unitBlock02 =
      some ((283792780677/1464174096368:ℚ),(5715867389880598569/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_block02_checked
