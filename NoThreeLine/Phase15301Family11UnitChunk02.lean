import NoThreeLine.Phase15301Family11UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

def unitBlock02 : List ℚ := [(904/6017:ℚ),(18435535211/122698791016:ℚ),(201/1337:ℚ),(1928/12161:ℚ),(355059618997/2239429900071:ℚ),(15425/97287:ℚ),(340324778275/2146314798337:ℚ),(15427/97285:ℚ),(3857/24321:ℚ),(1928/11137:ℚ),(611796452233/3533513729507:ℚ),(3857/22273:ℚ),(904/4993:ℚ),(7233/39943:ℚ),(7235/39941:ℚ),(1809/9985:ℚ),(984/5419:ℚ),(5905/32513:ℚ),(1928/10113:ℚ),(15425/80903:ℚ),(221570950161/1161954856597:ℚ),(15427/80901:ℚ),(3857/20225:ℚ),(2952/15233:ℚ)]

theorem unit_block02_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (551/3767:ℚ) unitBlock02 =
      some ((2952/15233:ℚ),(2920175825593705513/9223372036854775808:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_block02_checked
