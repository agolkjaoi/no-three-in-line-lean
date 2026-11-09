import NoThreeLine.Phase15301Leaf74Family00Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family00
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((11/64:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minLeft .auto) .auto),((15/64:ℚ),.add (.minLeft .auto) .auto),((31/128:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minLeft .auto) .auto),((9/32:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02=
    some ((15/32:ℚ),(1650290935789803743/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family00
#print axioms NoThreeLine.Phase15301Leaf74.Family00.block02_checked
