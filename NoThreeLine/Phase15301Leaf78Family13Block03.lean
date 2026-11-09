import NoThreeLine.Phase15301Leaf78Family13Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family13
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((91/256:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((49/128:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((51/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((107/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((111/256:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((59/128:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((63/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((45/128:ℚ)) block03=
    some ((127/256:ℚ),(14385350382665015521/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family13
#print axioms NoThreeLine.Phase15301Leaf78.Family13.block03_checked
