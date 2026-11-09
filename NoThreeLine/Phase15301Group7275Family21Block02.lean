import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((13/75:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/22273:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((161/928:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/2497:ℚ),.add (.minLeft .auto) .auto),((1477/8129:ℚ),.add (.minLeft .auto) .auto),((148691562614/817813666491:ℚ),.add (.minLeft .auto) .auto),((739/4064:ℚ),.add (.minLeft .auto) .auto),((227/1248:ℚ),.add (.minLeft .auto) .auto),((965/5057:ℚ),.add (.minLeft .auto) .auto),((483/2528:ℚ),.add (.minLeft .auto) .auto),((1477/7617:ℚ),.add (.minLeft .auto) .auto),((5909/30467:ℚ),.add (.minLeft .auto) .auto),((5911/30465:ℚ),.add (.minLeft .auto) .auto),((36679278313/189024330286:ℚ),.add (.minLeft .auto) .auto),((739/3808:ℚ),.add (.minLeft .auto) .auto),((211/1015:ℚ),.add (.minLeft .auto) .auto),((128172024889/616452559885:ℚ),.add (.minLeft .auto) .auto),((739/3552:ℚ),.add (.minLeft .auto) .auto),((193/909:ℚ),.add (.minLeft .auto) .auto),((483/2272:ℚ),.add (.minLeft .auto) .auto),((1477/6593:ℚ),.add (.minLeft .auto) .auto),((739/3296:ℚ),.add (.minLeft .auto) .auto),((453/1985:ℚ),.add (.minLeft .auto) .auto),((1813/7939:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((217607095415/1255492999051:ℚ)) block02=
    some ((1813/7939:ℚ),(235787433016468059/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block02_checked
