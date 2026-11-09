import NoThreeLine.Phase15301Leaf77Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family21
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((19/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((305/512:ℚ),.add (.minLeft .auto) .auto),((153/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((77/128:ℚ),.add (.minLeft .auto) .auto),((39/64:ℚ),.add (.minLeft .auto) .auto),((313/512:ℚ),.add (.minLeft .auto) .auto),((627/1024:ℚ),.add (.minLeft .auto) .auto),((157/256:ℚ),.add (.minLeft .auto) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((159/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((319/512:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((81/128:ℚ),.add (.minLeft .auto) .auto),((163/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((41/64:ℚ),.add (.minLeft .auto) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((167/256:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((339/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((85/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((171/256:ℚ),.add (.minLeft .auto) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((87/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((151/256:ℚ)) block07=
    some ((87/128:ℚ),(3610395292070672483/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family21
#print axioms NoThreeLine.Phase15301Leaf77.Family21.block07_checked
