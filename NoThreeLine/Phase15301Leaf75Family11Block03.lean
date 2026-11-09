import NoThreeLine.Phase15301Leaf75Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family11
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((15/64:ℚ),.add (.minLeft .auto) .auto),((61/256:ℚ),.add (.minLeft .auto) .auto),((31/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((249/1024:ℚ),.add (.minLeft .auto) .auto),((125/512:ℚ),.add (.minLeft .auto) .auto),((63/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((65/256:ℚ),.add (.minLeft .auto) .auto),((33/128:ℚ),.add (.minLeft .auto) .auto),((67/256:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((69/256:ℚ),.add (.minLeft .auto) .auto),((35/128:ℚ),.add (.minLeft .auto) .auto),((71/256:ℚ),.add (.minLeft .auto) .auto),((143/512:ℚ),.add (.minLeft .auto) .auto),((287/1024:ℚ),.add (.minLeft .auto) .auto),((9/32:ℚ),.add (.minLeft .auto) .auto),((37/128:ℚ),.add (.minLeft .auto) .auto),((149/512:ℚ),.add (.minLeft .auto) .auto),((75/256:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((77/256:ℚ),.add (.minLeft .auto) .auto),((155/512:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((59/256:ℚ)) block03=
    some ((39/128:ℚ),(7411312314167241547/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family11
#print axioms NoThreeLine.Phase15301Leaf75.Family11.block03_checked
