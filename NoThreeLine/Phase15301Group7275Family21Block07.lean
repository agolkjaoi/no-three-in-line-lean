import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((12055/26369:ℚ),.add (.minLeft .auto) .auto),((1507/3296:ℚ),.add (.minLeft .auto) .auto),((1175/2539:ℚ),.add (.minLeft .auto) .auto),((14101/30467:ℚ),.add (.minLeft .auto) .auto),((83552543317/180507551234:ℚ),.add (.minLeft .auto) .auto),((1567/3385:ℚ),.add (.minLeft .auto) .auto),((1763/3808:ℚ),.add (.minLeft .auto) .auto),((453/961:ℚ),.add (.minLeft .auto) .auto),((259/549:ℚ),.add (.minLeft .auto) .auto),((1815/3841:ℚ),.add (.minLeft .auto) .auto),((227/480:ℚ),.add (.minLeft .auto) .auto),((193/397:ℚ),.add (.minLeft .auto) .auto),((3861/7939:ℚ),.add (.minLeft .auto) .auto),((3863/7937:ℚ),.add (.minLeft .auto) .auto),((483/992:ℚ),.add (.minLeft .auto) .auto),((1477/3009:ℚ),.add (.minLeft .auto) .auto),((739/1504:ℚ),.add (.minLeft .auto) .auto),((1989/4033:ℚ),.add (.minLeft .auto) .auto),((7957/16131:ℚ),.add (.minLeft .auto) .auto),((7959/16129:ℚ),.add (.minLeft .auto) .auto),((995/2016:ℚ),.add (.minLeft .auto) .auto),((2501/5057:ℚ),.add (.minLeft .auto) .auto),((10005/20227:ℚ),.add (.minLeft .auto) .auto),((10007/20225:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((12053/26371:ℚ)) block07=
    some ((10007/20225:ℚ),(3065782746452429843/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block07_checked
