import NoThreeLine.Phase15301Leaf77Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family21
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((125/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((63/256:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((33/128:ℚ),.add (.minLeft .auto) .auto),((67/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((135/512:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minLeft .auto) .auto),((35/128:ℚ),.add (.minLeft .auto) .auto),((71/256:ℚ),.add (.minLeft .auto) .auto),((143/512:ℚ),.add (.minLeft .auto) .auto),((9/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/128:ℚ),.add (.minLeft .auto) .auto),((149/512:ℚ),.add (.minLeft .auto) .auto),((299/1024:ℚ),.add (.minLeft .auto) .auto),((75/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((77/256:ℚ),.add (.minLeft .auto) .auto),((155/512:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minLeft .auto) .auto),((157/512:ℚ),.add (.minLeft .auto) .auto),((315/1024:ℚ),.add (.minLeft .auto) .auto),((79/256:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((31/128:ℚ)) block03=
    some ((41/128:ℚ),(1383135631693890053/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family21
#print axioms NoThreeLine.Phase15301Leaf77.Family21.block03_checked
