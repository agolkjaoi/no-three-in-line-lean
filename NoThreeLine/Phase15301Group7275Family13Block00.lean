import NoThreeLine.Phase15301Group7275Family13Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family13
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((1/16:ℚ),.add (.minLeft .auto) .auto),((129/2048:ℚ),.add (.minLeft .auto) .auto),((65/1024:ℚ),.add (.minLeft .auto) .auto),((33/512:ℚ),.add (.minLeft .auto) .auto),((17/256:ℚ),.add (.minLeft .auto) .auto),((35/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/128:ℚ),.add (.minLeft .auto) .auto),((37/512:ℚ),.add (.minLeft .auto) .auto),((75/1024:ℚ),.add (.minLeft .auto) .auto),((19/256:ℚ),.add (.minLeft .auto) .auto),((39/512:ℚ),.add (.minLeft .auto) .auto),((5/64:ℚ),.add (.minLeft .auto) .auto),((41/512:ℚ),.add (.minLeft .auto) .auto),((21/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((43/512:ℚ),.add (.minLeft .auto) .auto),((11/128:ℚ),.add (.minLeft .auto) .auto),((45/512:ℚ),.add (.minLeft .auto) .auto),((23/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((47/512:ℚ),.add (.minLeft .auto) .auto),((3/32:ℚ),.add (.minLeft .auto) .auto),((49/512:ℚ),.add (.minLeft .auto) .auto),((25/256:ℚ),.add (.minLeft .auto) .auto),((51/512:ℚ),.add (.minLeft .auto) .auto),((13/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((13/128:ℚ),(26559991975767877575/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family13
#print axioms NoThreeLine.Phase15301Group7275.Family13.block00_checked
