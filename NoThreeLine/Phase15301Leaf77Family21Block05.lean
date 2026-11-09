import NoThreeLine.Phase15301Leaf77Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family21
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((203/512:ℚ),.add (.minLeft .auto) .auto),((51/128:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto),((107/256:ℚ),.add (.minLeft .auto) .auto),((215/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((111/256:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((115/256:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((117/256:ℚ),.add (.minLeft .auto) .auto),((59/128:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((125/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((251/512:ℚ),.add (.minLeft .auto) .auto),((63/128:ℚ),.add (.minLeft .auto) .auto),((505/1024:ℚ),.add (.minLeft .auto) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((405/1024:ℚ)) block05=
    some ((127/256:ℚ),(1997179755449357383/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family21
#print axioms NoThreeLine.Phase15301Leaf77.Family21.block05_checked
