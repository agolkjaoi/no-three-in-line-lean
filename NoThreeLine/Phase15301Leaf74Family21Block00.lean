import NoThreeLine.Phase15301Leaf74Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family21
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((1/32:ℚ),.add (.minLeft .auto) .auto),((3/64:ℚ),.add (.minLeft .auto) .auto),((7/128:ℚ),.add (.minLeft .auto) .auto),((15/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/1024:ℚ),.add (.minLeft .auto) .auto),((31/512:ℚ),.add (.minLeft .auto) .auto),((1/16:ℚ),.add (.minLeft .auto) .auto),((33/512:ℚ),.add (.minLeft .auto) .auto),((17/256:ℚ),.add (.minLeft .auto) .auto),((35/512:ℚ),.add (.minLeft .auto) .auto),((9/128:ℚ),.add (.minLeft .auto) .auto),((19/256:ℚ),.add (.minLeft .auto) .auto),((39/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5/64:ℚ),.add (.minLeft .auto) .auto),((41/512:ℚ),.add (.minLeft .auto) .auto),((21/256:ℚ),.add (.minLeft .auto) .auto),((43/512:ℚ),.add (.minLeft .auto) .auto),((11/128:ℚ),.add (.minLeft .auto) .auto),((45/512:ℚ),.add (.minLeft .auto) .auto),((23/256:ℚ),.add (.minLeft .auto) .auto),((3/32:ℚ),.add (.minLeft .auto) .auto),((25/256:ℚ),.add (.minLeft .auto) .auto),((51/512:ℚ),.add (.minLeft .auto) .auto),((13/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((13/128:ℚ),(4997597543442027965/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family21
#print axioms NoThreeLine.Phase15301Leaf74.Family21.block00_checked
