import NoThreeLine.Phase15301Leaf74Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family11
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((27/256:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((57/512:ℚ),.add (.minLeft .auto) .auto),((29/256:ℚ),.add (.minLeft .auto) .auto),((15/128:ℚ),.add (.minLeft .auto) .auto),((121/1024:ℚ),.add (.minLeft .auto) .auto),((243/2048:ℚ),.add (.minLeft .auto) .auto),((61/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((31/256:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((65/512:ℚ),.add (.minLeft .auto) .auto),((33/256:ℚ),.add (.minLeft .auto) .auto),((17/128:ℚ),.add (.minLeft .auto) .auto),((69/512:ℚ),.add (.minLeft .auto) .auto),((139/1024:ℚ),.add (.minLeft .auto) .auto),((35/256:ℚ),.add (.minLeft .auto) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((75/512:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minLeft .auto) .auto),((77/512:ℚ),.add (.minLeft .auto) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((81/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((13/128:ℚ)) block01=
    some ((81/512:ℚ),(943402669356701995/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family11
#print axioms NoThreeLine.Phase15301Leaf74.Family11.block01_checked
