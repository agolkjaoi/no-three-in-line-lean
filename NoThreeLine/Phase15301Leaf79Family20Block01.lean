import NoThreeLine.Phase15301Leaf79Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family20
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((77/1024:ℚ),.add (.minLeft .auto) .auto),((39/512:ℚ),.add (.minLeft .auto) .auto),((5/64:ℚ),.add (.minLeft .auto) .auto),((41/512:ℚ),.add (.minLeft .auto) .auto),((21/256:ℚ),.add (.minLeft .auto) .auto),((11/128:ℚ),.add (.minLeft .auto) .auto),((23/256:ℚ),.add (.minLeft .auto) .auto),((3/32:ℚ),.add (.minLeft .auto) .auto),((13/128:ℚ),.add (.minLeft .auto) .auto),((53/512:ℚ),.add (.minLeft .auto) .auto),((27/256:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((29/256:ℚ),.add (.minLeft .auto) .auto),((15/128:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((33/256:ℚ),.add (.minLeft .auto) .auto),((17/128:ℚ),.add (.minLeft .auto) .auto),((35/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((73/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minLeft .auto) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((19/256:ℚ)) block01=
    some ((5/32:ℚ),(12333712370054681731/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family20
#print axioms NoThreeLine.Phase15301Leaf79.Family20.block01_checked
