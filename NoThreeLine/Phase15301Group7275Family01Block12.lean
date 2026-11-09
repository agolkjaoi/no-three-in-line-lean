import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block12 : List (ℚ × AutoTrace) := [((14101/20227:ℚ),.add (.minLeft .auto) .auto),((14103/20225:ℚ),.add (.minLeft .auto) .auto),((1763/2528:ℚ),.add (.minLeft .auto) .auto),((2501/3521:ℚ),.add (.minLeft .auto) .auto),((1251/1760:ℚ),.add (.minLeft .auto) .auto),((723/1015:ℚ),.add (.minLeft .auto) .auto),((2531/3552:ℚ),.add (.minLeft .auto) .auto),((4037/5569:ℚ),.add (.minLeft .auto) .auto),((5383/7425:ℚ),.add (.minLeft .auto) .auto),((16151/22273:ℚ),.add (.minLeft .auto) .auto),((673/928:ℚ),.add (.minLeft .auto) .auto),((5573/7617:ℚ),.add (.minLeft .auto) .auto),((2787/3808:ℚ),.add (.minLeft .auto) .auto),((1477/1985:ℚ),.add (.minLeft .auto) .auto),((5909/7939:ℚ),.add (.minLeft .auto) .auto),((5911/7937:ℚ),.add (.minLeft .auto) .auto),((739/992:ℚ),.add (.minLeft .auto) .auto),((3013/4033:ℚ),.add (.minLeft .auto) .auto),((12053/16131:ℚ),.add (.minLeft .auto) .auto),((6027/8065:ℚ),.add (.minLeft .auto) .auto),((12055/16129:ℚ),.add (.minLeft .auto) .auto),((1507/2016:ℚ),.add (.minLeft .auto) .auto),((4549/6081:ℚ),.add (.minLeft .auto) .auto),((18197/24323:ℚ),.add (.minLeft .auto) .auto)]
theorem block12_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3525/5057:ℚ)) block12=
    some ((18197/24323:ℚ),(2156923587011843011/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block12_checked
