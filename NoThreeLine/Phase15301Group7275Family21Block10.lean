import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((16149/26371:ℚ),.add (.minLeft .auto) .auto),((16151/26369:ℚ),.add (.minLeft .auto) .auto),((2019/3296:ℚ),.add (.minLeft .auto) .auto),((2501/4033:ℚ),.add (.minLeft .auto) .auto),((3335/5377:ℚ),.add (.minLeft .auto) .auto),((151109798761/243617276069:ℚ),.add (.minLeft .auto) .auto),((10007/16129:ℚ),.add (.minLeft .auto) .auto),((139/224:ℚ),.add (.minLeft .auto) .auto),((5061/8129:ℚ),.add (.minLeft .auto) .auto),((4049/6503:ℚ),.add (.minLeft .auto) .auto),((20247/32513:ℚ),.add (.minLeft .auto) .auto),((2531/4064:ℚ),.add (.minLeft .auto) .auto),((3525/5569:ℚ),.add (.minLeft .auto) .auto),((14101/22275:ℚ),.add (.minLeft .auto) .auto),((14103/22273:ℚ),.add (.minLeft .auto) .auto),((1763/2784:ℚ),.add (.minLeft .auto) .auto),((4549/7105:ℚ),.add (.minLeft .auto) .auto),((18197/28419:ℚ),.add (.minLeft .auto) .auto),((18199/28417:ℚ),.add (.minLeft .auto) .auto),((2275/3552:ℚ),.add (.minLeft .auto) .auto),((753195/1162688:ℚ),.add (.minLeft .auto) .auto),((965/1473:ℚ),.add (.minLeft .auto) .auto),((3861/5891:ℚ),.add (.minLeft .auto) .auto),((3863/5889:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((4037/6593:ℚ)) block10=
    some ((3863/5889:ℚ),(3613726022415582527/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block10_checked
