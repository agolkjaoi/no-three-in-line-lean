import NoThreeLine.Phase15301Leaf77Family13Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family13
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((63/64:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),((255/256:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((31/32:ℚ)) block06=
    some (1,(1985351706508263669/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family13
#print axioms NoThreeLine.Phase15301Leaf77.Family13.block06_checked
