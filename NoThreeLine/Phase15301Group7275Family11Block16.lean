import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block16 : List (ℚ × AutoTrace) := [((635007993289/739264048854:ℚ),.add (.minLeft .auto) .auto),((3299/3840:ℚ),.add (.minLeft .auto) .auto),((6533/7553:ℚ),.add (.minLeft .auto) .auto),((3267/3776:ℚ),.add (.minLeft .auto) .auto),((2199/2539:ℚ),.add (.minLeft .auto) .auto),((26389/30467:ℚ),.add (.minLeft .auto) .auto),((8797/10155:ℚ),.add (.minLeft .auto) .auto),((3299/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7553:ℚ),.add (.minLeft .auto) .auto),((3299/3776:ℚ),.add (.minLeft .auto) .auto),((3525/4033:ℚ),.add (.minLeft .auto) .auto),((6661/7617:ℚ),.add (.minLeft .auto) .auto),((1763/2016:ℚ),.add (.minLeft .auto) .auto),((3331/3808:ℚ),.add (.minLeft .auto) .auto),((6661/7553:ℚ),.add (.minLeft .auto) .auto),((26645/30211:ℚ),.add (.minLeft .auto) .auto),((26647/30209:ℚ),.add (.minLeft .auto) .auto),((3331/3776:ℚ),.add (.minLeft .auto) .auto),((4037/4545:ℚ),.add (.minLeft .auto) .auto),((2307/2597:ℚ),.add (.minLeft .auto) .auto),((16151/18177:ℚ),.add (.minLeft .auto) .auto),((2019/2272:ℚ),.add (.minLeft .auto) .auto),((4549/5057:ℚ),.add (.minLeft .auto) .auto),((18197/20227:ℚ),.add (.minLeft .auto) .auto)]
theorem block16_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((6597/7681:ℚ)) block16=
    some ((18197/20227:ℚ),(1177582546857891173/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block16_checked
