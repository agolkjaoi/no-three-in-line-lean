import NoThreeLine.Phase15301Leaf75Family12Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family12
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((7/8:ℚ)) block01=
    some (1,(73205677094390005/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family12
#print axioms NoThreeLine.Phase15301Leaf75.Family12.block01_checked
