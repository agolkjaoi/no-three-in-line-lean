import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block14 : List (ℚ × AutoTrace) := [((20245/26371:ℚ),.add (.minLeft .auto) .auto),((20247/26369:ℚ),.add (.minLeft .auto) .auto),((2531/3296:ℚ),.add (.minLeft .auto) .auto),((235/303:ℚ),.add (.minLeft .auto) .auto),((14101/18179:ℚ),.add (.minLeft .auto) .auto),((4701/6059:ℚ),.add (.minLeft .auto) .auto),((1763/2272:ℚ),.add (.minLeft .auto) .auto),((5573/7105:ℚ),.add (.minLeft .auto) .auto),((7431/9473:ℚ),.add (.minLeft .auto) .auto),((22295/28417:ℚ),.add (.minLeft .auto) .auto),((929/1184:ℚ),.add (.minLeft .auto) .auto),((1989/2497:ℚ),.add (.minLeft .auto) .auto),((7957/9987:ℚ),.add (.minLeft .auto) .auto),((7959/9985:ℚ),.add (.minLeft .auto) .auto),((995/1248:ℚ),.add (.minLeft .auto) .auto),((4037/5057:ℚ),.add (.minLeft .auto) .auto),((2019/2528:ℚ),.add (.minLeft .auto) .auto),((6085/7617:ℚ),.add (.minLeft .auto) .auto),((24341/30467:ℚ),.add (.minLeft .auto) .auto),((24343/30465:ℚ),.add (.minLeft .auto) .auto),((179/224:ℚ),.add (.minLeft .auto) .auto),((2015827/2494912:ℚ),.add (.minLeft .auto) .auto),((4549/5569:ℚ),.add (.minLeft .auto) .auto),((2275/2784:ℚ),.add (.minLeft .auto) .auto)]
theorem block14_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((5061/6593:ℚ)) block14=
    some ((2275/2784:ℚ),(3871533448764401209/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block14_checked
