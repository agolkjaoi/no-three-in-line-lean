import NoThreeLine.Phase15301Leaf78Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family11
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((1/32:ℚ),.add (.minLeft .auto) .auto),((3/64:ℚ),.add (.minLeft .auto) .auto),((7/128:ℚ),.add (.minLeft .auto) .auto),((57/1024:ℚ),.add (.minLeft .auto) .auto),((29/512:ℚ),.add (.minLeft .auto) .auto),((15/256:ℚ),.add (.minLeft .auto) .auto),((121/2048:ℚ),.add (.minLeft .auto) .auto),((243/4096:ℚ),.add (.minLeft .auto) .auto),((61/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((31/512:ℚ),.add (.minLeft .auto) .auto),((1/16:ℚ),.add (.minLeft .auto) .auto),((65/1024:ℚ),.add (.minLeft .auto) .auto),((131/2048:ℚ),.add (.minLeft .auto) .auto),((33/512:ℚ),.add (.minLeft .auto) .auto),((17/256:ℚ),.add (.minLeft .auto) .auto),((35/512:ℚ),.add (.minLeft .auto) .auto),((9/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((19/256:ℚ),.add (.minLeft .auto) .auto),((77/1024:ℚ),.add (.minLeft .auto) .auto),((39/512:ℚ),.add (.minLeft .auto) .auto),((5/64:ℚ),.add (.minLeft .auto) .auto),((21/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((11/128:ℚ),.add (.minLeft .auto) .auto),((23/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((23/256:ℚ),(3443020217357376163/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family11
#print axioms NoThreeLine.Phase15301Leaf78.Family11.block00_checked
