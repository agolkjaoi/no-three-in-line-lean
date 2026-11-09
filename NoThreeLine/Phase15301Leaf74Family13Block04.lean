import NoThreeLine.Phase15301Leaf74Family13Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family13
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((63/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((69/128:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((73/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/64:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((77/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((39/64:ℚ),.add (.minLeft .auto) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((81/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((41/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((15/32:ℚ)) block04=
    some ((85/128:ℚ),(15888301909416546225/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family13
#print axioms NoThreeLine.Phase15301Leaf74.Family13.block04_checked
