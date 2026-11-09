import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block12 : List (ℚ × AutoTrace) := [((53/64:ℚ),.add (.minLeft .auto) .auto),((425/512:ℚ),.add (.minLeft .auto) .auto),((851/1024:ℚ),.add (.minLeft .auto) .auto),((213/256:ℚ),.add (.minLeft .auto) .auto),((427/512:ℚ),.add (.minLeft .auto) .auto),((107/128:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((433/512:ℚ),.add (.minLeft .auto) .auto),((217/256:ℚ),.add (.minLeft .auto) .auto),((435/512:ℚ),.add (.minLeft .auto) .auto),((871/1024:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minLeft .auto) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto),((877/1024:ℚ),.add (.minLeft .auto) .auto),((439/512:ℚ),.add (.minLeft .auto) .auto),((879/1024:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((221/256:ℚ),.add (.minLeft .auto) .auto),((443/512:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((447/512:ℚ),.add (.minLeft .auto) .auto),((895/1024:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto)]
theorem block12_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((105/128:ℚ)) block12=
    some ((7/8:ℚ),(3314189539957332685/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block12_checked
