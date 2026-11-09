import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((965/3009:ℚ),.add (.minLeft .auto) .auto),((3861/12035:ℚ),.add (.minLeft .auto) .auto),((3863/12033:ℚ),.add (.minLeft .auto) .auto),((483/1504:ℚ),.add (.minLeft .auto) .auto),((1477/4545:ℚ),.add (.minLeft .auto) .auto),((5909/18179:ℚ),.add (.minLeft .auto) .auto),((5911/18177:ℚ),.add (.minLeft .auto) .auto),((739/2272:ℚ),.add (.minLeft .auto) .auto),((663/2027:ℚ),.add (.minLeft .auto) .auto),((171413838326/524025904669:ℚ),.add (.minLeft .auto) .auto),((7957/24323:ℚ),.add (.minLeft .auto) .auto),((2653/8107:ℚ),.add (.minLeft .auto) .auto),((199/608:ℚ),.add (.minLeft .auto) .auto),((2501/7617:ℚ),.add (.minLeft .auto) .auto),((1251/3808:ℚ),.add (.minLeft .auto) .auto),((2630309/7730240:ℚ),.add (.minLeft .auto) .auto),((2501/7105:ℚ),.add (.minLeft .auto) .auto),((417/1184:ℚ),.add (.minLeft .auto) .auto),((1989/5569:ℚ),.add (.minLeft .auto) .auto),((213472318711/597353231693:ℚ),.add (.minLeft .auto) .auto),((995/2784:ℚ),.add (.minLeft .auto) .auto),((1477/4033:ℚ),.add (.minLeft .auto) .auto),((739/2016:ℚ),.add (.minLeft .auto) .auto),((3013/8129:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((227/736:ℚ)) block05=
    some ((3013/8129:ℚ),(2942008367445592449/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block05_checked
