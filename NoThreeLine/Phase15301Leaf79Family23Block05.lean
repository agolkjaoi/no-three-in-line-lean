import NoThreeLine.Phase15301Leaf79Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family23
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((141/256:ℚ),.add (.minLeft .auto) .auto),((71/128:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((145/256:ℚ),.add (.minLeft .auto) .auto),((73/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/64:ℚ),.add (.minLeft .auto) .auto),((75/128:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((39/64:ℚ),.add (.minLeft .auto) .auto),((313/512:ℚ),.add (.minLeft .auto) .auto),((157/256:ℚ),.add (.minLeft .auto) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((81/128:ℚ),.add (.minLeft .auto) .auto),((41/64:ℚ),.add (.minLeft .auto) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((353/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((177/256:ℚ),.add (.minLeft .auto) .auto),((89/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((281/512:ℚ)) block05=
    some ((89/128:ℚ),(2586939228602152429/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family23
#print axioms NoThreeLine.Phase15301Leaf79.Family23.block05_checked
