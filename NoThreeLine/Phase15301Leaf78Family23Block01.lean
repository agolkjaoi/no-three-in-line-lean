import NoThreeLine.Phase15301Leaf78Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family23
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((25/256:ℚ),.add (.minLeft .auto) .auto),((101/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((51/512:ℚ),.add (.minLeft .auto) .auto),((13/128:ℚ),.add (.minLeft .auto) .auto),((27/256:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((57/512:ℚ),.add (.minLeft .auto) .auto),((29/256:ℚ),.add (.minLeft .auto) .auto),((15/128:ℚ),.add (.minLeft .auto) .auto),((31/256:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((65/512:ℚ),.add (.minLeft .auto) .auto),((33/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((17/128:ℚ),.add (.minLeft .auto) .auto),((69/512:ℚ),.add (.minLeft .auto) .auto),((35/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((149/1024:ℚ),.add (.minLeft .auto) .auto),((75/512:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minLeft .auto) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((81/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3/32:ℚ)) block01=
    some ((81/512:ℚ),(2843559423306472967/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family23
#print axioms NoThreeLine.Phase15301Leaf78.Family23.block01_checked
