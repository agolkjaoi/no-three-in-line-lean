import NoThreeLine.Phase15301Leaf78Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family21
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((75/128:ℚ),.add (.minLeft .auto) .auto),((151/256:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((39/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((313/512:ℚ),.add (.minLeft .auto) .auto),((157/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((159/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5/8:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((81/128:ℚ),.add (.minLeft .auto) .auto),((163/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((41/64:ℚ),.add (.minLeft .auto) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((167/256:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((339/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((85/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((171/256:ℚ),.add (.minLeft .auto) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((87/128:ℚ),.add (.minLeft .auto) .auto),((175/256:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((353/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((149/256:ℚ)) block07=
    some ((353/512:ℚ),(8516154174298935189/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family21
#print axioms NoThreeLine.Phase15301Leaf78.Family21.block07_checked
