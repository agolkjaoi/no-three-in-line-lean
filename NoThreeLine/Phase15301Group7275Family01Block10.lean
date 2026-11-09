import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((14101/24323:ℚ),.add (.minLeft .auto) .auto),((4701/8107:ℚ),.add (.minLeft .auto) .auto),((1763/3040:ℚ),.add (.minLeft .auto) .auto),((1477/2497:ℚ),.add (.minLeft .auto) .auto),((739/1248:ℚ),.add (.minLeft .auto) .auto),((3013/5057:ℚ),.add (.minLeft .auto) .auto),((1507/2528:ℚ),.add (.minLeft .auto) .auto),((4549/7617:ℚ),.add (.minLeft .auto) .auto),((18197/30467:ℚ),.add (.minLeft .auto) .auto),((18199/30465:ℚ),.add (.minLeft .auto) .auto),((325/544:ℚ),.add (.minLeft .auto) .auto),((4037/6593:ℚ),.add (.minLeft .auto) .auto),((16149/26371:ℚ),.add (.minLeft .auto) .auto),((16151/26369:ℚ),.add (.minLeft .auto) .auto),((2019/3296:ℚ),.add (.minLeft .auto) .auto),((2501/4033:ℚ),.add (.minLeft .auto) .auto),((139/224:ℚ),.add (.minLeft .auto) .auto),((5061/8129:ℚ),.add (.minLeft .auto) .auto),((4049/6503:ℚ),.add (.minLeft .auto) .auto),((20247/32513:ℚ),.add (.minLeft .auto) .auto),((2531/4064:ℚ),.add (.minLeft .auto) .auto),((3525/5569:ℚ),.add (.minLeft .auto) .auto),((435448708657/687642312505:ℚ),.add (.minLeft .auto) .auto),((1763/2784:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1175/2027:ℚ)) block10=
    some ((1763/2784:ℚ),(2144860447196752867/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block10_checked
