import NoThreeLine.Phase15301Leaf78Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family11
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((51/64:ℚ),.add (.minLeft .auto) .auto),((103/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((209/256:ℚ),.add (.minLeft .auto) .auto),((419/512:ℚ),.add (.minLeft .auto) .auto),((105/128:ℚ),.add (.minLeft .auto) .auto),((53/64:ℚ),.add (.minLeft .auto) .auto),((213/256:ℚ),.add (.minLeft .auto) .auto),((107/128:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((433/512:ℚ),.add (.minLeft .auto) .auto),((217/256:ℚ),.add (.minLeft .auto) .auto),((435/512:ℚ),.add (.minLeft .auto) .auto),((871/1024:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minLeft .auto) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto),((439/512:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((221/256:ℚ),.add (.minLeft .auto) .auto),((443/512:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((447/512:ℚ),.add (.minLeft .auto) .auto),((895/1024:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((101/128:ℚ)) block10=
    some ((895/1024:ℚ),(5352043442723355603/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family11
#print axioms NoThreeLine.Phase15301Leaf78.Family11.block10_checked
