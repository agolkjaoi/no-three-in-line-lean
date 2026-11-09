import NoThreeLine.Phase15301Leaf75Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family21
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((63/128:ℚ),.add (.minLeft .auto) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/2:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((65/128:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((67/128:ℚ),.add (.minLeft .auto) .auto),((135/256:ℚ),.add (.minLeft .auto) .auto),((271/512:ℚ),.add (.minLeft .auto) .auto),((543/1024:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((137/256:ℚ),.add (.minLeft .auto) .auto),((69/128:ℚ),.add (.minLeft .auto) .auto),((277/512:ℚ),.add (.minLeft .auto) .auto),((139/256:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((141/256:ℚ),.add (.minLeft .auto) .auto),((71/128:ℚ),.add (.minLeft .auto) .auto),((143/256:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((289/512:ℚ),.add (.minLeft .auto) .auto),((145/256:ℚ),.add (.minLeft .auto) .auto),((291/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((73/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((125/256:ℚ)) block06=
    some ((73/128:ℚ),(2988713485398855145/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family21
#print axioms NoThreeLine.Phase15301Leaf75.Family21.block06_checked
