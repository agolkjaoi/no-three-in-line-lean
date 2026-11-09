import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((16151/28417:ℚ),.add (.minLeft .auto) .auto),((673/1184:ℚ),.add (.minLeft .auto) .auto),((1175/2027:ℚ),.add (.minLeft .auto) .auto),((1763/3040:ℚ),.add (.minLeft .auto) .auto),((1477/2497:ℚ),.add (.minLeft .auto) .auto),((739/1248:ℚ),.add (.minLeft .auto) .auto),((3013/5057:ℚ),.add (.minLeft .auto) .auto),((12053/20227:ℚ),.add (.minLeft .auto) .auto),((2411/4045:ℚ),.add (.minLeft .auto) .auto),((1507/2528:ℚ),.add (.minLeft .auto) .auto),((4549/7617:ℚ),.add (.minLeft .auto) .auto),((18197/30467:ℚ),.add (.minLeft .auto) .auto),((18199/30465:ℚ),.add (.minLeft .auto) .auto),((325/544:ℚ),.add (.minLeft .auto) .auto),((4037/6593:ℚ),.add (.minLeft .auto) .auto),((2019/3296:ℚ),.add (.minLeft .auto) .auto),((2501/4033:ℚ),.add (.minLeft .auto) .auto),((735914905039/1185937721963:ℚ),.add (.minLeft .auto) .auto),((139/224:ℚ),.add (.minLeft .auto) .auto),((5061/8129:ℚ),.add (.minLeft .auto) .auto),((68605831039/110193528806:ℚ),.add (.minLeft .auto) .auto),((4049/6503:ℚ),.add (.minLeft .auto) .auto),((20247/32513:ℚ),.add (.minLeft .auto) .auto),((2531/4064:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((5383/9473:ℚ)) block10=
    some ((2531/4064:ℚ),(2263001189297120963/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block10_checked
