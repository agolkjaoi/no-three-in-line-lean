import NoThreeLine.Phase15301Leaf78Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family01
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((87/128:ℚ),.add (.minLeft .auto) .auto),((175/256:ℚ),.add (.minLeft .auto) .auto),((351/512:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((353/512:ℚ),.add (.minLeft .auto) .auto),((177/256:ℚ),.add (.minLeft .auto) .auto),((89/128:ℚ),.add (.minLeft .auto) .auto),((45/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((181/256:ℚ),.add (.minLeft .auto) .auto),((91/128:ℚ),.add (.minLeft .auto) .auto),((183/256:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((185/256:ℚ),.add (.minLeft .auto) .auto),((371/512:ℚ),.add (.minLeft .auto) .auto),((93/128:ℚ),.add (.minLeft .auto) .auto),((187/256:ℚ),.add (.minLeft .auto) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minLeft .auto) .auto),((381/512:ℚ),.add (.minLeft .auto) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((765/1024:ℚ),.add (.minLeft .auto) .auto),((383/512:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((193/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((43/64:ℚ)) block09=
    some ((193/256:ℚ),(6775637770303439837/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family01
#print axioms NoThreeLine.Phase15301Leaf78.Family01.block09_checked
