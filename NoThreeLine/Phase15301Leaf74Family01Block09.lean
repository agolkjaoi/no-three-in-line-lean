import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((627/1024:ℚ),.add (.minLeft .auto) .auto),((157/256:ℚ),.add (.minLeft .auto) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((317/512:ℚ),.add (.minLeft .auto) .auto),((635/1024:ℚ),.add (.minLeft .auto) .auto),((159/256:ℚ),.add (.minLeft .auto) .auto),((319/512:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((81/128:ℚ),.add (.minLeft .auto) .auto),((163/256:ℚ),.add (.minLeft .auto) .auto),((41/64:ℚ),.add (.minLeft .auto) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((167/256:ℚ),.add (.minLeft .auto) .auto),((335/512:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((677/1024:ℚ),.add (.minLeft .auto) .auto),((339/512:ℚ),.add (.minLeft .auto) .auto),((679/1024:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minLeft .auto) .auto),((171/256:ℚ),.add (.minLeft .auto) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((87/128:ℚ),.add (.minLeft .auto) .auto),((175/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((313/512:ℚ)) block09=
    some ((175/256:ℚ),(5406804858381718179/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block09_checked
