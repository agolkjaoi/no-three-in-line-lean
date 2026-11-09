import NoThreeLine.Phase15301Leaf79Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family20
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((39/128:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((19/64:ℚ)) block03=
    some ((13/16:ℚ),(5335599030667038813/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family20
#print axioms NoThreeLine.Phase15301Leaf79.Family20.block03_checked
