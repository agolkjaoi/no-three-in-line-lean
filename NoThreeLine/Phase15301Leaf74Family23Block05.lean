import NoThreeLine.Phase15301Leaf74Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family23
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((35/64:ℚ),.add (.minLeft .auto) .auto),((141/256:ℚ),.add (.minLeft .auto) .auto),((71/128:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((145/256:ℚ),.add (.minLeft .auto) .auto),((73/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/64:ℚ),.add (.minLeft .auto) .auto),((75/128:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((39/64:ℚ),.add (.minLeft .auto) .auto),((313/512:ℚ),.add (.minLeft .auto) .auto),((157/256:ℚ),.add (.minLeft .auto) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((81/128:ℚ),.add (.minLeft .auto) .auto),((41/64:ℚ),.add (.minLeft .auto) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((339/512:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minLeft .auto) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((353/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((69/128:ℚ)) block05=
    some ((353/512:ℚ),(10676695587895471025/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family23
#print axioms NoThreeLine.Phase15301Leaf74.Family23.block05_checked
