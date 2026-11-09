import NoThreeLine.Phase15301Leaf79Family10Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family10
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((39/512:ℚ),.add (.minLeft .auto) .auto),((5/64:ℚ),.add (.minLeft .auto) .auto),((41/512:ℚ),.add (.minLeft .auto) .auto),((21/256:ℚ),.add (.minLeft .auto) .auto),((11/128:ℚ),.add (.minLeft .auto) .auto),((23/256:ℚ),.add (.minLeft .auto) .auto),((3/32:ℚ),.add (.minLeft .auto) .auto),((13/128:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((29/256:ℚ),.add (.minLeft .auto) .auto),((15/128:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((17/128:ℚ),.add (.minLeft .auto) .auto),((9/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((73/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minLeft .auto) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((41/256:ℚ),.add (.minLeft .auto) .auto),((21/128:ℚ),.add (.minLeft .auto) .auto),((11/64:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((77/1024:ℚ)) block01=
    some ((23/128:ℚ),(9084295600344583013/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family10
#print axioms NoThreeLine.Phase15301Leaf79.Family10.block01_checked
