import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block13 : List (ℚ × AutoTrace) := [((24343/32513:ℚ),.add (.minLeft .auto) .auto),((3043/4064:ℚ),.add (.minLeft .auto) .auto),((1217/1613:ℚ),.add (.minLeft .auto) .auto),((585778685736/776173226039:ℚ),.add (.minLeft .auto) .auto),((3043/4032:ℚ),.add (.minLeft .auto) .auto),((5061/6593:ℚ),.add (.minLeft .auto) .auto),((145179520798/189120602789:ℚ),.add (.minLeft .auto) .auto),((20245/26371:ℚ),.add (.minLeft .auto) .auto),((20247/26369:ℚ),.add (.minLeft .auto) .auto),((2531/3296:ℚ),.add (.minLeft .auto) .auto),((235/303:ℚ),.add (.minLeft .auto) .auto),((14101/18179:ℚ),.add (.minLeft .auto) .auto),((4701/6059:ℚ),.add (.minLeft .auto) .auto),((1763/2272:ℚ),.add (.minLeft .auto) .auto),((5573/7105:ℚ),.add (.minLeft .auto) .auto),((7431/9473:ℚ),.add (.minLeft .auto) .auto),((22295/28417:ℚ),.add (.minLeft .auto) .auto),((929/1184:ℚ),.add (.minLeft .auto) .auto),((1989/2497:ℚ),.add (.minLeft .auto) .auto),((995/1248:ℚ),.add (.minLeft .auto) .auto),((4037/5057:ℚ),.add (.minLeft .auto) .auto),((16149/20227:ℚ),.add (.minLeft .auto) .auto),((16151/20225:ℚ),.add (.minLeft .auto) .auto),((2019/2528:ℚ),.add (.minLeft .auto) .auto)]
theorem block13_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((24341/32515:ℚ)) block13=
    some ((2019/2528:ℚ),(3647686719168091243/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block13_checked
