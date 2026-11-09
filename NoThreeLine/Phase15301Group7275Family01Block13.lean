import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block13 : List (ℚ × AutoTrace) := [((18199/24321:ℚ),.add (.minLeft .auto) .auto),((455/608:ℚ),.add (.minLeft .auto) .auto),((6085/8129:ℚ),.add (.minLeft .auto) .auto),((24341/32515:ℚ),.add (.minLeft .auto) .auto),((24343/32513:ℚ),.add (.minLeft .auto) .auto),((3043/4064:ℚ),.add (.minLeft .auto) .auto),((1217/1613:ℚ),.add (.minLeft .auto) .auto),((3043/4032:ℚ),.add (.minLeft .auto) .auto),((5061/6593:ℚ),.add (.minLeft .auto) .auto),((20245/26371:ℚ),.add (.minLeft .auto) .auto),((20247/26369:ℚ),.add (.minLeft .auto) .auto),((2531/3296:ℚ),.add (.minLeft .auto) .auto),((235/303:ℚ),.add (.minLeft .auto) .auto),((1763/2272:ℚ),.add (.minLeft .auto) .auto),((5573/7105:ℚ),.add (.minLeft .auto) .auto),((7431/9473:ℚ),.add (.minLeft .auto) .auto),((22295/28417:ℚ),.add (.minLeft .auto) .auto),((929/1184:ℚ),.add (.minLeft .auto) .auto),((1989/2497:ℚ),.add (.minLeft .auto) .auto),((7957/9987:ℚ),.add (.minLeft .auto) .auto),((7959/9985:ℚ),.add (.minLeft .auto) .auto),((995/1248:ℚ),.add (.minLeft .auto) .auto),((4037/5057:ℚ),.add (.minLeft .auto) .auto),((2019/2528:ℚ),.add (.minLeft .auto) .auto)]
theorem block13_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((18197/24323:ℚ)) block13=
    some ((2019/2528:ℚ),(4075148472030307993/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block13_checked
