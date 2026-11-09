import NoThreeLine.Phase15301Leaf79Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family21
open AutoEnvelope

def block11 : List (ℚ × AutoTrace) := [((63/64:ℚ),.add (.minLeft .auto) .auto),((253/256:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((31/32:ℚ)) block11=
    some (1,(477737066256464011/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family21
#print axioms NoThreeLine.Phase15301Leaf79.Family21.block11_checked
