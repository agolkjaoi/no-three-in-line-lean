import NoThreeLine.Phase15301Leaf75Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope

def block11 : List (ℚ × AutoTrace) := [((335/512:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((677/1024:ℚ),.add (.minLeft .auto) .auto),((339/512:ℚ),.add (.minLeft .auto) .auto),((679/1024:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minLeft .auto) .auto),((171/256:ℚ),.add (.minLeft .auto) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((87/128:ℚ),.add (.minLeft .auto) .auto),((175/256:ℚ),.add (.minLeft .auto) .auto),((351/512:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((353/512:ℚ),.add (.minLeft .auto) .auto),((707/1024:ℚ),.add (.minLeft .auto) .auto),((177/256:ℚ),.add (.minLeft .auto) .auto),((89/128:ℚ),.add (.minLeft .auto) .auto),((45/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((181/256:ℚ),.add (.minLeft .auto) .auto),((91/128:ℚ),.add (.minLeft .auto) .auto),((365/512:ℚ),.add (.minLeft .auto) .auto),((183/256:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((185/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((167/256:ℚ)) block11=
    some ((185/256:ℚ),(172307630294924691/576460752303423488:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family01
#print axioms NoThreeLine.Phase15301Leaf75.Family01.block11_checked
