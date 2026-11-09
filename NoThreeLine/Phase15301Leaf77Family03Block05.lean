import NoThreeLine.Phase15301Leaf77Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family03
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((57/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/64:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),((63/64:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),((255/256:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((7/8:ℚ)) block05=
    some (1,(7611405865835516887/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family03
#print axioms NoThreeLine.Phase15301Leaf77.Family03.block05_checked
