import NoThreeLine.Phase15301Leaf77Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family11
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((315/1024:ℚ),.add (.minLeft .auto) .auto),((79/256:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto),((83/256:ℚ),.add (.minLeft .auto) .auto),((167/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((335/1024:ℚ),.add (.minLeft .auto) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((43/128:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minLeft .auto) .auto),((91/256:ℚ),.add (.minLeft .auto) .auto),((183/512:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((93/256:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minLeft .auto) .auto),((95/256:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((101/256:ℚ),.add (.minLeft .auto) .auto),((51/128:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((211/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((157/512:ℚ)) block04=
    some ((211/512:ℚ),(2424416148203150649/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family11
#print axioms NoThreeLine.Phase15301Leaf77.Family11.block04_checked
