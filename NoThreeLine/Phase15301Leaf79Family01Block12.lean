import NoThreeLine.Phase15301Leaf79Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family01
open AutoEnvelope

def block12 : List (ℚ × AutoTrace) := [((113/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/256:ℚ),.add (.minLeft .auto) .auto),((455/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((231/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((465/512:ℚ),.add (.minLeft .auto) .auto),((233/256:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minLeft .auto) .auto),((469/512:ℚ),.add (.minLeft .auto) .auto),((235/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((945/1024:ℚ),.add (.minLeft .auto) .auto),((473/512:ℚ),.add (.minLeft .auto) .auto),((947/1024:ℚ),.add (.minLeft .auto) .auto),((237/256:ℚ),.add (.minLeft .auto) .auto),((119/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),((121/128:ℚ),.add (.minLeft .auto) .auto),((61/64:ℚ),.add (.minLeft .auto) .auto),((123/128:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),((125/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block12_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((225/256:ℚ)) block12=
    some ((125/128:ℚ),(6482546302713633775/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family01
#print axioms NoThreeLine.Phase15301Leaf79.Family01.block12_checked
