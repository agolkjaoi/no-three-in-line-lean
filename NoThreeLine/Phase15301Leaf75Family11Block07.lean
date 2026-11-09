import NoThreeLine.Phase15301Leaf75Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family11
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((39/64:ℚ),.add (.minLeft .auto) .auto),((157/256:ℚ),.add (.minLeft .auto) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((317/512:ℚ),.add (.minLeft .auto) .auto),((159/256:ℚ),.add (.minLeft .auto) .auto),((319/512:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((81/128:ℚ),.add (.minLeft .auto) .auto),((41/64:ℚ),.add (.minLeft .auto) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((339/512:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minLeft .auto) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((87/128:ℚ),.add (.minLeft .auto) .auto),((175/256:ℚ),.add (.minLeft .auto) .auto),((351/512:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((177/256:ℚ),.add (.minLeft .auto) .auto),((89/128:ℚ),.add (.minLeft .auto) .auto),((45/64:ℚ),.add (.minLeft .auto) .auto),((91/128:ℚ),.add (.minLeft .auto) .auto),((365/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((77/128:ℚ)) block07=
    some ((365/512:ℚ),(8792050610650952413/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family11
#print axioms NoThreeLine.Phase15301Leaf75.Family11.block07_checked
