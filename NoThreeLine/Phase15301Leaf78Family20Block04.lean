import NoThreeLine.Phase15301Leaf78Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family20
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((11/16:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((21/32:ℚ)) block04=
    some (1,(2670033823888064561/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family20
#print axioms NoThreeLine.Phase15301Leaf78.Family20.block04_checked
