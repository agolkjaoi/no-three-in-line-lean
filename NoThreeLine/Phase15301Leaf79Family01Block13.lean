import NoThreeLine.Phase15301Leaf79Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family01
open AutoEnvelope

def block13 : List (ℚ × AutoTrace) := [((63/64:ℚ),.add (.minLeft .auto) .auto),((253/256:ℚ),.add (.minLeft .auto) .auto),((507/512:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block13_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((125/128:ℚ)) block13=
    some (1,(1294728238742378507/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family01
#print axioms NoThreeLine.Phase15301Leaf79.Family01.block13_checked
