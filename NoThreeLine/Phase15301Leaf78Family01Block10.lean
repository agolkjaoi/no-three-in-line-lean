import NoThreeLine.Phase15301Leaf78Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family01
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((773/1024:ℚ),.add (.minLeft .auto) .auto),((387/512:ℚ),.add (.minLeft .auto) .auto),((97/128:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((397/512:ℚ),.add (.minLeft .auto) .auto),((199/256:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((401/512:ℚ),.add (.minLeft .auto) .auto),((803/1024:ℚ),.add (.minLeft .auto) .auto),((201/256:ℚ),.add (.minLeft .auto) .auto),((101/128:ℚ),.add (.minLeft .auto) .auto),((203/256:ℚ),.add (.minLeft .auto) .auto),((51/64:ℚ),.add (.minLeft .auto) .auto),((409/512:ℚ),.add (.minLeft .auto) .auto),((205/256:ℚ),.add (.minLeft .auto) .auto),((103/128:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((209/256:ℚ),.add (.minLeft .auto) .auto),((419/512:ℚ),.add (.minLeft .auto) .auto),((105/128:ℚ),.add (.minLeft .auto) .auto),((53/64:ℚ),.add (.minLeft .auto) .auto),((425/512:ℚ),.add (.minLeft .auto) .auto),((851/1024:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((193/256:ℚ)) block10=
    some ((851/1024:ℚ),(5795806814757947945/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family01
#print axioms NoThreeLine.Phase15301Leaf78.Family01.block10_checked
