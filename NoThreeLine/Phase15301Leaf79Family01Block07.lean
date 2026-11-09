import NoThreeLine.Phase15301Leaf79Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family01
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((135/256:ℚ),.add (.minLeft .auto) .auto),((271/512:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((273/512:ℚ),.add (.minLeft .auto) .auto),((137/256:ℚ),.add (.minLeft .auto) .auto),((69/128:ℚ),.add (.minLeft .auto) .auto),((277/512:ℚ),.add (.minLeft .auto) .auto),((139/256:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((281/512:ℚ),.add (.minLeft .auto) .auto),((563/1024:ℚ),.add (.minLeft .auto) .auto),((141/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((71/128:ℚ),.add (.minLeft .auto) .auto),((143/256:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((289/512:ℚ),.add (.minLeft .auto) .auto),((145/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((291/512:ℚ),.add (.minLeft .auto) .auto),((73/128:ℚ),.add (.minLeft .auto) .auto),((37/64:ℚ),.add (.minLeft .auto) .auto),((297/512:ℚ),.add (.minLeft .auto) .auto),((149/256:ℚ),.add (.minLeft .auto) .auto),((75/128:ℚ),.add (.minLeft .auto) .auto),((151/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((67/128:ℚ)) block07=
    some ((151/256:ℚ),(1459182419861884541/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family01
#print axioms NoThreeLine.Phase15301Leaf79.Family01.block07_checked
