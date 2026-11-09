import NoThreeLine.Phase15301Leaf78Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family03
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((17/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((35/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((37/256:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((81/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((41/256:ℚ),.add (.minLeft .auto) .auto),((21/128:ℚ),.add (.minLeft .auto) .auto),((43/256:ℚ),.add (.minLeft .auto) .auto),((11/64:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((15/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1/8:ℚ)) block01=
    some ((15/64:ℚ),(16804915008036997051/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family03
#print axioms NoThreeLine.Phase15301Leaf78.Family03.block01_checked
