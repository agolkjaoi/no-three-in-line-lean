import NoThreeLine.Phase15301Leaf78Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family11
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((181/256:ℚ),.add (.minLeft .auto) .auto),((91/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((365/512:ℚ),.add (.minLeft .auto) .auto),((183/256:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((93/128:ℚ),.add (.minLeft .auto) .auto),((187/256:ℚ),.add (.minLeft .auto) .auto),((375/512:ℚ),.add (.minLeft .auto) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minLeft .auto) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((765/1024:ℚ),.add (.minLeft .auto) .auto),((383/512:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((193/256:ℚ),.add (.minLeft .auto) .auto),((387/512:ℚ),.add (.minLeft .auto) .auto),((97/128:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((25/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((401/512:ℚ),.add (.minLeft .auto) .auto),((803/1024:ℚ),.add (.minLeft .auto) .auto),((201/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((101/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((45/64:ℚ)) block09=
    some ((101/128:ℚ),(903750853834858579/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family11
#print axioms NoThreeLine.Phase15301Leaf78.Family11.block09_checked
