import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((17354234891/75892570361:ℚ),.add (.minLeft .auto) .auto),((1815/7937:ℚ),.add (.minLeft .auto) .auto),((227/992:ℚ),.add (.minLeft .auto) .auto),((965/4033:ℚ),.add (.minLeft .auto) .auto),((1287/5377:ℚ),.add (.minLeft .auto) .auto),((3863/16129:ℚ),.add (.minLeft .auto) .auto),((23/96:ℚ),.add (.minLeft .auto) .auto),((1477/6081:ℚ),.add (.minLeft .auto) .auto),((5909/24323:ℚ),.add (.minLeft .auto) .auto),((564518710637/2323157672779:ℚ),.add (.minLeft .auto) .auto),((5911/24321:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((739/3040:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1989/8129:ℚ),.add (.minLeft .auto) .auto),((995/4064:ℚ),.add (.minLeft .auto) .auto),((663/2539:ℚ),.add (.minLeft .auto) .auto),((7957/30467:ℚ),.add (.minLeft .auto) .auto),((2653/10155:ℚ),.add (.minLeft .auto) .auto),((995/3808:ℚ),.add (.minLeft .auto) .auto),((1477/5569:ℚ),.add (.minLeft .auto) .auto),((229811440357/865763504055:ℚ),.add (.minLeft .auto) .auto),((739/2784:ℚ),.add (.minLeft .auto) .auto),((965/3521:ℚ),.add (.minLeft .auto) .auto),((483/1760:ℚ),.add (.minLeft .auto) .auto),((1989/7105:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1813/7939:ℚ)) block03=
    some ((1989/7105:ℚ),(231686500099699997/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block03_checked
