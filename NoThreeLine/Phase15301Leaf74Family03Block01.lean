import NoThreeLine.Phase15301Leaf74Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family03
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((1/8:ℚ),.add (.minLeft .auto) .auto),((17/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((35/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((81/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((41/256:ℚ),.add (.minLeft .auto) .auto),((21/128:ℚ),.add (.minLeft .auto) .auto),((43/256:ℚ),.add (.minLeft .auto) .auto),((11/64:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((31/256:ℚ)) block01=
    some ((29/128:ℚ),(2076406721468352483/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family03
#print axioms NoThreeLine.Phase15301Leaf74.Family03.block01_checked
