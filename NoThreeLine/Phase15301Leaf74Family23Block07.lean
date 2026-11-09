import NoThreeLine.Phase15301Leaf74Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family23
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((55/64:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minLeft .auto) .auto),((227/256:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minLeft .auto) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((119/128:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),((63/64:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),((255/256:ℚ),.add (.minLeft .auto) .auto),((511/512:ℚ),.add (.minLeft .auto) .auto),((1023/1024:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((219/256:ℚ)) block07=
    some (1,(4360364803936249593/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family23
#print axioms NoThreeLine.Phase15301Leaf74.Family23.block07_checked
