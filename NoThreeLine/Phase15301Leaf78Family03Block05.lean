import NoThreeLine.Phase15301Leaf78Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family03
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((99/128:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((51/64:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((209/256:ℚ),.add (.minLeft .auto) .auto),((105/128:ℚ),.add (.minLeft .auto) .auto),((53/64:ℚ),.add (.minLeft .auto) .auto),((213/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((107/128:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/64:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),((63/64:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((49/64:ℚ)) block05=
    some ((127/128:ℚ),(14896846469450205725/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family03
#print axioms NoThreeLine.Phase15301Leaf78.Family03.block05_checked
