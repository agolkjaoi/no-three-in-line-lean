import NoThreeLine.Phase15301Leaf78Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family01
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((45/128:ℚ),.add (.minLeft .auto) .auto),((181/512:ℚ),.add (.minLeft .auto) .auto),((91/256:ℚ),.add (.minLeft .auto) .auto),((183/512:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((93/256:ℚ),.add (.minLeft .auto) .auto),((187/512:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((95/256:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((201/512:ℚ),.add (.minLeft .auto) .auto),((101/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((203/512:ℚ),.add (.minLeft .auto) .auto),((51/128:ℚ),.add (.minLeft .auto) .auto),((103/256:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((421/1024:ℚ),.add (.minLeft .auto) .auto),((211/512:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto),((107/256:ℚ),.add (.minLeft .auto) .auto),((215/512:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((11/32:ℚ)) block05=
    some ((27/64:ℚ),(3612195854932959191/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family01
#print axioms NoThreeLine.Phase15301Leaf78.Family01.block05_checked
