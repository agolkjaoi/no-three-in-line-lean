import NoThreeLine.Phase15301Leaf74Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family21
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((439/512:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((221/256:ℚ),.add (.minLeft .auto) .auto),((443/512:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((447/512:ℚ),.add (.minLeft .auto) .auto),((895/1024:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((225/256:ℚ),.add (.minLeft .auto) .auto),((451/512:ℚ),.add (.minLeft .auto) .auto),((903/1024:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minLeft .auto) .auto),((227/256:ℚ),.add (.minLeft .auto) .auto),((455/512:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((231/256:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((233/256:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minLeft .auto) .auto),((469/512:ℚ),.add (.minLeft .auto) .auto),((235/256:ℚ),.add (.minLeft .auto) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((219/256:ℚ)) block10=
    some ((59/64:ℚ),(2044384702237303641/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family21
#print axioms NoThreeLine.Phase15301Leaf74.Family21.block10_checked
