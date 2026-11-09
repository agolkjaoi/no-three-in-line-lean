import NoThreeLine.Phase15301Family21UnitExpr
import NoThreeLine.BenchmarkPartitionChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

def unitBlock07 : List ℚ := [(5000/11137:ℚ),(10001/22273:ℚ),(2008/4395:ℚ),(48193/105479:ℚ),(16065/35159:ℚ),(12049/26369:ℚ),(7048/15233:ℚ),(2685/5803:ℚ),(2004481258555/4332107827811:ℚ),(56387/121861:ℚ),(4699/10155:ℚ),(8/17:ℚ),(7233/15367:ℚ),(1447/3073:ℚ),(1809/3841:ℚ),(1928/3969:ℚ),(15425/31751:ℚ),(15427/31749:ℚ),(3857/7937:ℚ),(2952/6017:ℚ),(5905/12033:ℚ),(3976/8065:ℚ),(31809/64519:ℚ),(31811/64517:ℚ)]

theorem unit_block07_checked :
    checkPartitionBlock unitSparseExpr 18446744073709551616 (2651/6059:ℚ) unitBlock07 =
      some ((31811/64517:ℚ),(4525553574577646761/18446744073709551616:ℚ)) := by
  decide +kernel

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_block07_checked
