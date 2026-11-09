import NoThreeLine.Phase15301Leaf74Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family20
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((7/8:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((13/16:ℚ)) block04=
    some (1,(610571273596728085/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family20
#print axioms NoThreeLine.Phase15301Leaf74.Family20.block04_checked
