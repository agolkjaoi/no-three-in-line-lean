import NoThreeLine.Phase15301Leaf79Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family01
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((191/256:ℚ),.add (.minLeft .auto) .auto),((765/1024:ℚ),.add (.minLeft .auto) .auto),((383/512:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((193/256:ℚ),.add (.minLeft .auto) .auto),((773/1024:ℚ),.add (.minLeft .auto) .auto),((387/512:ℚ),.add (.minLeft .auto) .auto),((97/128:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((397/512:ℚ),.add (.minLeft .auto) .auto),((199/256:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((401/512:ℚ),.add (.minLeft .auto) .auto),((803/1024:ℚ),.add (.minLeft .auto) .auto),((201/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((101/128:ℚ),.add (.minLeft .auto) .auto),((203/256:ℚ),.add (.minLeft .auto) .auto),((51/64:ℚ),.add (.minLeft .auto) .auto),((409/512:ℚ),.add (.minLeft .auto) .auto),((205/256:ℚ),.add (.minLeft .auto) .auto),((103/128:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((209/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((381/512:ℚ)) block10=
    some ((209/256:ℚ),(1418439936767657321/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family01
#print axioms NoThreeLine.Phase15301Leaf79.Family01.block10_checked
