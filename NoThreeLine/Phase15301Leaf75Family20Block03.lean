import NoThreeLine.Phase15301Leaf75Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family20
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((23/64:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((11/32:ℚ)) block03=
    some (1,(9468008582364943069/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family20
#print axioms NoThreeLine.Phase15301Leaf75.Family20.block03_checked
