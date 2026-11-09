import NoThreeLine.Phase15301Group7275Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family23
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((63/64:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),((255/256:ℚ),.add (.minLeft .auto) .auto),((511/512:ℚ),.add (.minLeft .auto) .auto),((1023/1024:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((31/32:ℚ)) block09=
    some (1,(1885990445318912313/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family23
#print axioms NoThreeLine.Phase15301Group7275.Family23.block09_checked
