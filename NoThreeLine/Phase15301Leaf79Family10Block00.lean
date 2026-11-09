import NoThreeLine.Phase15301Leaf79Family10Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family10
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((1/256:ℚ),.add (.minLeft .auto) .auto),((3/512:ℚ),.add (.minLeft .auto) .auto),((7/1024:ℚ),.add (.minLeft .auto) .auto),((1/128:ℚ),.add (.minLeft .auto) .auto),((17/2048:ℚ),.add (.minLeft .auto) .auto),((9/1024:ℚ),.add (.minLeft .auto) .auto),((5/512:ℚ),.add (.minLeft .auto) .auto),((11/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/256:ℚ),.add (.minLeft .auto) .auto),((7/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/64:ℚ),.add (.minLeft .auto) .auto),((9/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5/256:ℚ),.add (.minLeft .auto) .auto),((3/128:ℚ),.add (.minLeft .auto) .auto),((7/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/256:ℚ),.add (.minLeft .auto) .auto),((5/128:ℚ),.add (.minLeft .auto) .auto),((11/256:ℚ),.add (.minLeft .auto) .auto),((3/64:ℚ),.add (.minLeft .auto) .auto),((1/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((19/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((77/1024:ℚ),.add (.minLeft .auto) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((77/1024:ℚ),(12467464005324962199/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family10
#print axioms NoThreeLine.Phase15301Leaf79.Family10.block00_checked
