import NoThreeLine.Phase15301Leaf75Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((17/128:ℚ),.add (.minLeft .auto) .auto),((69/512:ℚ),.add (.minLeft .auto) .auto),((139/1024:ℚ),.add (.minLeft .auto) .auto),((557/4096:ℚ),.add (.minLeft .auto) .auto),((279/2048:ℚ),.add (.minLeft .auto) .auto),((35/256:ℚ),.add (.minLeft .auto) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((75/512:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((81/512:ℚ),.add (.minLeft .auto) .auto),((41/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((21/128:ℚ),.add (.minLeft .auto) .auto),((43/256:ℚ),.add (.minLeft .auto) .auto),((11/64:ℚ),.add (.minLeft .auto) .auto),((177/1024:ℚ),.add (.minLeft .auto) .auto),((355/2048:ℚ),.add (.minLeft .auto) .auto),((89/512:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto),((93/512:ℚ),.add (.minLeft .auto) .auto),((187/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((47/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((67/512:ℚ)) block02=
    some ((47/256:ℚ),(7065925544853282549/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family01
#print axioms NoThreeLine.Phase15301Leaf75.Family01.block02_checked
