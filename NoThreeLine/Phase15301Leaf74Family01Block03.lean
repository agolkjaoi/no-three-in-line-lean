import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((53/256:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((217/1024:ℚ),.add (.minLeft .auto) .auto),((109/512:ℚ),.add (.minLeft .auto) .auto),((55/256:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((229/1024:ℚ),.add (.minLeft .auto) .auto),((459/2048:ℚ),.add (.minLeft .auto) .auto),((115/512:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minLeft .auto) .auto),((15/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/256:ℚ),.add (.minLeft .auto) .auto),((31/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((249/1024:ℚ),.add (.minLeft .auto) .auto),((125/512:ℚ),.add (.minLeft .auto) .auto),((63/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((65/256:ℚ),.add (.minLeft .auto) .auto),((33/128:ℚ),.add (.minLeft .auto) .auto),((133/512:ℚ),.add (.minLeft .auto) .auto),((267/1024:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((199/1024:ℚ)) block03=
    some ((267/1024:ℚ),(2020229845081297451/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block03_checked
