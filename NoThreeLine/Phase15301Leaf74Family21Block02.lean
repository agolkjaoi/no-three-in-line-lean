import NoThreeLine.Phase15301Leaf74Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family21
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((11/64:ℚ),.add (.minLeft .auto) .auto),((177/1024:ℚ),.add (.minLeft .auto) .auto),((355/2048:ℚ),.add (.minLeft .auto) .auto),((89/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto),((93/512:ℚ),.add (.minLeft .auto) .auto),((47/256:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minLeft .auto) .auto),((99/512:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((53/256:ℚ),.add (.minLeft .auto) .auto),((213/1024:ℚ),.add (.minLeft .auto) .auto),((107/512:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minLeft .auto) .auto),((15/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/256:ℚ),.add (.minLeft .auto) .auto),((31/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02=
    some ((31/128:ℚ),(677173691415094255/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family21
#print axioms NoThreeLine.Phase15301Leaf74.Family21.block02_checked
