import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((3/32:ℚ),.add (.minLeft .auto) .auto),((25/256:ℚ),.add (.minLeft .auto) .auto),((51/512:ℚ),.add (.minLeft .auto) .auto),((13/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((53/512:ℚ),.add (.minLeft .auto) .auto),((27/256:ℚ),.add (.minLeft .auto) .auto),((55/512:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((57/512:ℚ),.add (.minLeft .auto) .auto),((115/1024:ℚ),.add (.minLeft .auto) .auto),((29/256:ℚ),.add (.minLeft .auto) .auto),((15/128:ℚ),.add (.minLeft .auto) .auto),((121/1024:ℚ),.add (.minLeft .auto) .auto),((243/2048:ℚ),.add (.minLeft .auto) .auto),((61/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((31/256:ℚ),.add (.minLeft .auto) .auto),((63/512:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((65/512:ℚ),.add (.minLeft .auto) .auto),((33/256:ℚ),.add (.minLeft .auto) .auto),((67/512:ℚ),.add (.minLeft .auto) .auto),((17/128:ℚ),.add (.minLeft .auto) .auto),((69/512:ℚ),.add (.minLeft .auto) .auto),((139/1024:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((23/256:ℚ)) block01=
    some ((139/1024:ℚ),(3585683670819666471/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block01_checked
