import NoThreeLine.Phase15301Leaf77Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family11
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((27/32:ℚ),.add (.minLeft .auto) .auto),((433/512:ℚ),.add (.minLeft .auto) .auto),((217/256:ℚ),.add (.minLeft .auto) .auto),((435/512:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto),((439/512:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((221/256:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((447/512:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((57/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((469/512:ℚ),.add (.minLeft .auto) .auto),((235/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((473/512:ℚ),.add (.minLeft .auto) .auto),((947/1024:ℚ),.add (.minLeft .auto) .auto),((237/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((107/128:ℚ)) block09=
    some ((237/256:ℚ),(2712266598956180361/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family11
#print axioms NoThreeLine.Phase15301Leaf77.Family11.block09_checked
