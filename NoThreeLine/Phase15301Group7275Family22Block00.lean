import NoThreeLine.Phase15301Group7275Family22Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family22
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((1/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((19/2048:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((39/4096:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5/512:ℚ),.add (.minLeft .auto) .auto),((21/2048:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((11/1024:ℚ),.add (.minLeft .auto) .auto),((23/2048:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/256:ℚ),.add (.minLeft .auto) .auto),((13/1024:ℚ),.add (.minLeft .auto) .auto),((7/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((29/2048:ℚ),.add (.minLeft .auto) .auto),((15/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((17/1024:ℚ),.add (.minLeft .auto) .auto),((9/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((19/1024:ℚ),.add (.minLeft .auto) .auto),((5/256:ℚ),.add (.minLeft .auto) .auto),((11/512:ℚ),.add (.minLeft .auto) .auto),((3/128:ℚ),.add (.minLeft .auto) .auto),((13/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((13/512:ℚ),(2328322645909234307/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family22
#print axioms NoThreeLine.Phase15301Group7275.Family22.block00_checked
