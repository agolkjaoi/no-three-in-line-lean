import NoThreeLine.Phase15301Leaf79Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family01
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((55/256:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((229/1024:ℚ),.add (.minLeft .auto) .auto),((115/512:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minLeft .auto) .auto),((233/1024:ℚ),.add (.minLeft .auto) .auto),((467/2048:ℚ),.add (.minLeft .auto) .auto),((117/512:ℚ),.add (.minLeft .auto) .auto),((59/256:ℚ),.add (.minLeft .auto) .auto),((15/64:ℚ),.add (.minLeft .auto) .auto),((61/256:ℚ),.add (.minLeft .auto) .auto),((31/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((249/1024:ℚ),.add (.minLeft .auto) .auto),((125/512:ℚ),.add (.minLeft .auto) .auto),((63/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((65/256:ℚ),.add (.minLeft .auto) .auto),((33/128:ℚ),.add (.minLeft .auto) .auto),((133/512:ℚ),.add (.minLeft .auto) .auto),((267/1024:ℚ),.add (.minLeft .auto) .auto),((67/256:ℚ),.add (.minLeft .auto) .auto),((135/512:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((109/512:ℚ)) block03=
    some ((17/64:ℚ),(6226585716583781881/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family01
#print axioms NoThreeLine.Phase15301Leaf79.Family01.block03_checked
