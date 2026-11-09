import NoThreeLine.Phase15301Group7275Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family20
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((11/256:ℚ),.add (.minLeft .auto) .auto),((3/64:ℚ),.add (.minLeft .auto) .auto),((7/128:ℚ),.add (.minLeft .auto) .auto),((1/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((19/256:ℚ),.add (.minLeft .auto) .auto),((153/2048:ℚ),.add (.minLeft .auto) .auto),((77/1024:ℚ),.add (.minLeft .auto) .auto),((39/512:ℚ),.add (.minLeft .auto) .auto),((5/64:ℚ),.add (.minLeft .auto) .auto),((41/512:ℚ),.add (.minLeft .auto) .auto),((83/1024:ℚ),.add (.minLeft .auto) .auto),((21/256:ℚ),.add (.minLeft .auto) .auto),((11/128:ℚ),.add (.minLeft .auto) .auto),((89/1024:ℚ),.add (.minLeft .auto) .auto),((45/512:ℚ),.add (.minLeft .auto) .auto),((23/256:ℚ),.add (.minLeft .auto) .auto),((3/32:ℚ),.add (.minLeft .auto) .auto),((13/128:ℚ),.add (.minLeft .auto) .auto),((105/1024:ℚ),.add (.minLeft .auto) .auto),((53/512:ℚ),.add (.minLeft .auto) .auto),((27/256:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((29/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((5/128:ℚ)) block01=
    some ((29/256:ℚ),(2356128705822556243/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family20
#print axioms NoThreeLine.Phase15301Group7275.Family20.block01_checked
