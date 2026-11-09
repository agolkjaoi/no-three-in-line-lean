import NoThreeLine.Phase15301Leaf75Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((195/1024:ℚ),.add (.minLeft .auto) .auto),((391/2048:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((99/512:ℚ),.add (.minLeft .auto) .auto),((397/2048:ℚ),.add (.minLeft .auto) .auto),((199/1024:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((51/256:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((53/256:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((217/1024:ℚ),.add (.minLeft .auto) .auto),((435/2048:ℚ),.add (.minLeft .auto) .auto),((109/512:ℚ),.add (.minLeft .auto) .auto),((55/256:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((229/1024:ℚ),.add (.minLeft .auto) .auto),((459/2048:ℚ),.add (.minLeft .auto) .auto),((115/512:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minLeft .auto) .auto),((15/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((47/256:ℚ)) block03=
    some ((15/64:ℚ),(3200965132212097663/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family01
#print axioms NoThreeLine.Phase15301Leaf75.Family01.block03_checked
