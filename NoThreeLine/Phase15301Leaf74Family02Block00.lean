import NoThreeLine.Phase15301Leaf74Family02Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family02
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((1/512:ℚ),.add (.minLeft .auto) .auto),((1/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((19/2048:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5/512:ℚ),.add (.minLeft .auto) .auto),((11/1024:ℚ),.add (.minLeft .auto) .auto),((3/256:ℚ),.add (.minLeft .auto) .auto),((13/1024:ℚ),.add (.minLeft .auto) .auto),((7/512:ℚ),.add (.minLeft .auto) .auto),((1/64:ℚ),.add (.minLeft .auto) .auto),((9/512:ℚ),.add (.minLeft .auto) .auto),((5/256:ℚ),.add (.minLeft .auto) .auto),((3/128:ℚ),.add (.minLeft .auto) .auto),((1/32:ℚ),.add (.minLeft .auto) .auto),((5/128:ℚ),.add (.minLeft .auto) .auto),((3/64:ℚ),.add (.minLeft .auto) .auto),((1/16:ℚ),.add (.minLeft .auto) .auto),((3/32:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((7/16:ℚ),(3779274333888024279/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family02
#print axioms NoThreeLine.Phase15301Leaf74.Family02.block00_checked
