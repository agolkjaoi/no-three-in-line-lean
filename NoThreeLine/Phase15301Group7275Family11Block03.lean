import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((1477/6593:ℚ),.add (.minLeft .auto) .auto),((5909/26371:ℚ),.add (.minLeft .auto) .auto),((5911/26369:ℚ),.add (.minLeft .auto) .auto),((739/3296:ℚ),.add (.minLeft .auto) .auto),((453/1985:ℚ),.add (.minLeft .auto) .auto),((86732212689/380008052081:ℚ),.add (.minLeft .auto) .auto),((1813/7939:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1815/7937:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((43453709108/189916423277:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/992:ℚ),.add (.minLeft .auto) .auto),((965/4033:ℚ),.add (.minLeft .auto) .auto),((3418931927/14285151106:ℚ),.add (.minLeft .auto) .auto),((1287/5377:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/16129:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/96:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1477/6081:ℚ),.add (.minLeft .auto) .auto),((739/3040:ℚ),.add (.minLeft .auto) .auto),((1989/8129:ℚ),.add (.minLeft .auto) .auto),((73752633787/301395163837:ℚ),.add (.minLeft .auto) .auto),((7957/32515:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7959/32513:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((73777815585/301369982039:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((995/4064:ℚ),.add (.minLeft .auto) .auto),((5220737/20636992:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((483/2272:ℚ)) block03=
    some ((5220737/20636992:ℚ),(2336948939071475311/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block03_checked
