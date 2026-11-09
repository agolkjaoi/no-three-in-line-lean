import NoThreeLine.Phase15301Leaf74Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family21
open AutoEnvelope

def block11 : List (ℚ × AutoTrace) := [((473/512:ℚ),.add (.minLeft .auto) .auto),((947/1024:ℚ),.add (.minLeft .auto) .auto),((237/256:ℚ),.add (.minLeft .auto) .auto),((119/128:ℚ),.add (.minLeft .auto) .auto),((239/256:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),((61/64:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),((63/64:ℚ),.add (.minLeft .auto) .auto),((253/256:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((59/64:ℚ)) block11=
    some (1,(4960691524199841551/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family21
#print axioms NoThreeLine.Phase15301Leaf74.Family21.block11_checked
