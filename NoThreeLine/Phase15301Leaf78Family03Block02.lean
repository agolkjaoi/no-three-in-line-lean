import NoThreeLine.Phase15301Leaf78Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family03
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((61/256:ℚ),.add (.minLeft .auto) .auto),((31/128:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((69/256:ℚ),.add (.minLeft .auto) .auto),((35/128:ℚ),.add (.minLeft .auto) .auto),((9/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/128:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((77/256:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto),((83/256:ℚ),.add (.minLeft .auto) .auto),((167/512:ℚ),.add (.minLeft .auto) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((97/256:ℚ),.add (.minLeft .auto) .auto),((49/128:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((15/64:ℚ)) block02=
    some ((25/64:ℚ),(1108412356154688707/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family03
#print axioms NoThreeLine.Phase15301Leaf78.Family03.block02_checked
