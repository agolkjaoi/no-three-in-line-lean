import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((51/128:ℚ),.add (.minLeft .auto) .auto),((103/256:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((421/1024:ℚ),.add (.minLeft .auto) .auto),((211/512:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto),((107/256:ℚ),.add (.minLeft .auto) .auto),((215/512:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((217/512:ℚ),.add (.minLeft .auto) .auto),((109/256:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minLeft .auto) .auto),((111/256:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((115/256:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((117/256:ℚ),.add (.minLeft .auto) .auto),((59/128:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((121/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((203/512:ℚ)) block06=
    some ((31/64:ℚ),(463066680372528057/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block06_checked
