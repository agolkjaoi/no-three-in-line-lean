import NoThreeLine.Phase15301Leaf75Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family23
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((11/64:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((53/256:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((115/512:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minLeft .auto) .auto),((15/64:ℚ),.add (.minLeft .auto) .auto),((61/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((31/128:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((33/128:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minLeft .auto) .auto),((69/256:ℚ),.add (.minLeft .auto) .auto),((35/128:ℚ),.add (.minLeft .auto) .auto),((9/32:ℚ),.add (.minLeft .auto) .auto),((37/128:ℚ),.add (.minLeft .auto) .auto),((149/512:ℚ),.add (.minLeft .auto) .auto),((75/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02=
    some ((75/256:ℚ),(14111079150206380687/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family23
#print axioms NoThreeLine.Phase15301Leaf75.Family23.block02_checked
