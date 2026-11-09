import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((995/3296:ℚ),.add (.minLeft .auto) .auto),((151/491:ℚ),.add (.minLeft .auto) .auto),((2501/8129:ℚ),.add (.minLeft .auto) .auto),((2001/6503:ℚ),.add (.minLeft .auto) .auto),((10007/32513:ℚ),.add (.minLeft .auto) .auto),((1251/4064:ℚ),.add (.minLeft .auto) .auto),((9537397807/30933132799:ℚ),.add (.minLeft .auto) .auto),((227/736:ℚ),.add (.minLeft .auto) .auto),((965/3009:ℚ),.add (.minLeft .auto) .auto),((483/1504:ℚ),.add (.minLeft .auto) .auto),((1477/4545:ℚ),.add (.minLeft .auto) .auto),((739/2272:ℚ),.add (.minLeft .auto) .auto),((663/2027:ℚ),.add (.minLeft .auto) .auto),((7957/24323:ℚ),.add (.minLeft .auto) .auto),((2653/8107:ℚ),.add (.minLeft .auto) .auto),((199/608:ℚ),.add (.minLeft .auto) .auto),((2501/7617:ℚ),.add (.minLeft .auto) .auto),((10005/30467:ℚ),.add (.minLeft .auto) .auto),((10007/30465:ℚ),.add (.minLeft .auto) .auto),((1251/3808:ℚ),.add (.minLeft .auto) .auto),((2501/7105:ℚ),.add (.minLeft .auto) .auto),((417/1184:ℚ),.add (.minLeft .auto) .auto),((1989/5569:ℚ),.add (.minLeft .auto) .auto),((995/2784:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1989/6593:ℚ)) block05=
    some ((995/2784:ℚ),(5243476592368844635/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block05_checked
