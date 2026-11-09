import NoThreeLine.Phase15301Group7275Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family20
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((15/128:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((65/512:ℚ),.add (.minLeft .auto) .auto),((33/256:ℚ),.add (.minLeft .auto) .auto),((17/128:ℚ),.add (.minLeft .auto) .auto),((273/2048:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((137/1024:ℚ),.add (.minLeft .auto) .auto),((69/512:ℚ),.add (.minLeft .auto) .auto),((35/256:ℚ),.add (.minLeft .auto) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((145/1024:ℚ),.add (.minLeft .auto) .auto),((73/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minLeft .auto) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((41/256:ℚ),.add (.minLeft .auto) .auto),((83/512:ℚ),.add (.minLeft .auto) .auto),((21/128:ℚ),.add (.minLeft .auto) .auto),((11/64:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((29/256:ℚ)) block02=
    some ((49/256:ℚ),(11421742119345277211/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family20
#print axioms NoThreeLine.Phase15301Group7275.Family20.block02_checked
