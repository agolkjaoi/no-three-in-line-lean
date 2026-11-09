import NoThreeLine.Phase15301Leaf78Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family01
open AutoEnvelope

def block11 : List (ℚ × AutoTrace) := [((213/256:ℚ),.add (.minLeft .auto) .auto),((107/128:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((433/512:ℚ),.add (.minLeft .auto) .auto),((217/256:ℚ),.add (.minLeft .auto) .auto),((435/512:ℚ),.add (.minLeft .auto) .auto),((871/1024:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minLeft .auto) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto),((439/512:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((221/256:ℚ),.add (.minLeft .auto) .auto),((443/512:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((447/512:ℚ),.add (.minLeft .auto) .auto),((895/1024:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((225/256:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/256:ℚ),.add (.minLeft .auto) .auto),((455/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((851/1024:ℚ)) block11=
    some ((115/128:ℚ),(4147611597493160553/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family01
#print axioms NoThreeLine.Phase15301Leaf78.Family01.block11_checked
