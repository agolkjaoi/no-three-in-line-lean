import NoThreeLine.Phase15301Leaf75Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family03
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((51/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto),((107/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((115/256:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((117/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((59/128:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((63/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((69/128:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((25/64:ℚ)) block03=
    some ((35/64:ℚ),(1985804535257950751/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family03
#print axioms NoThreeLine.Phase15301Leaf75.Family03.block03_checked
