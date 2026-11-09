import NoThreeLine.Phase15301Leaf75Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family11
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((21/128:ℚ),.add (.minLeft .auto) .auto),((11/64:ℚ),.add (.minLeft .auto) .auto),((177/1024:ℚ),.add (.minLeft .auto) .auto),((89/512:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto),((93/512:ℚ),.add (.minLeft .auto) .auto),((47/256:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((99/512:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((53/256:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((109/512:ℚ),.add (.minLeft .auto) .auto),((55/256:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((115/512:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minLeft .auto) .auto),((117/512:ℚ),.add (.minLeft .auto) .auto),((59/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((41/256:ℚ)) block02=
    some ((59/256:ℚ),(4369953953881922845/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family11
#print axioms NoThreeLine.Phase15301Leaf75.Family11.block02_checked
