import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((2307/4645:ℚ),.add (.minLeft .auto) .auto),((16151/32513:ℚ),.add (.minLeft .auto) .auto),((2019/4064:ℚ),.add (.minLeft .auto) .auto),((4037/7617:ℚ),.add (.minLeft .auto) .auto),((2019/3808:ℚ),.add (.minLeft .auto) .auto),((3525/6593:ℚ),.add (.minLeft .auto) .auto),((1763/3296:ℚ),.add (.minLeft .auto) .auto),((3013/5569:ℚ),.add (.minLeft .auto) .auto),((1507/2784:ℚ),.add (.minLeft .auto) .auto),((2501/4545:ℚ),.add (.minLeft .auto) .auto),((10005/18179:ℚ),.add (.minLeft .auto) .auto),((10007/18177:ℚ),.add (.minLeft .auto) .auto),((1251/2272:ℚ),.add (.minLeft .auto) .auto),((4549/8129:ℚ),.add (.minLeft .auto) .auto),((18197/32515:ℚ),.add (.minLeft .auto) .auto),((18199/32513:ℚ),.add (.minLeft .auto) .auto),((2275/4064:ℚ),.add (.minLeft .auto) .auto),((1989/3521:ℚ),.add (.minLeft .auto) .auto),((7957/14083:ℚ),.add (.minLeft .auto) .auto),((35203287097/62284696593:ℚ),.add (.minLeft .auto) .auto),((7959/14081:ℚ),.add (.minLeft .auto) .auto),((199/352:ℚ),.add (.minLeft .auto) .auto),((4037/7105:ℚ),.add (.minLeft .auto) .auto),((5383/9473:ℚ),.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((367/739:ℚ)) block09=
    some ((5383/9473:ℚ),(3000443040800019637/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block09_checked
