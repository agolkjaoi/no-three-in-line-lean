import NoThreeLine.Phase15301Leaf78Family13Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family13
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((93/128:ℚ),.add (.minLeft .auto) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minLeft .auto) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((101/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((51/64:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((53/64:ℚ),.add (.minLeft .auto) .auto),((213/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((107/128:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((23/32:ℚ)) block05=
    some ((115/128:ℚ),(355554640224521509/576460752303423488:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family13
#print axioms NoThreeLine.Phase15301Leaf78.Family13.block05_checked
