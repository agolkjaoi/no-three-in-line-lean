import NoThreeLine.Phase15301Leaf75Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((61/256:ℚ),.add (.minLeft .auto) .auto),((245/1024:ℚ),.add (.minLeft .auto) .auto),((123/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((31/128:ℚ),.add (.minLeft .auto) .auto),((249/1024:ℚ),.add (.minLeft .auto) .auto),((125/512:ℚ),.add (.minLeft .auto) .auto),((501/2048:ℚ),.add (.minLeft .auto) .auto),((251/1024:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((63/256:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((65/256:ℚ),.add (.minLeft .auto) .auto),((33/128:ℚ),.add (.minLeft .auto) .auto),((133/512:ℚ),.add (.minLeft .auto) .auto),((267/1024:ℚ),.add (.minLeft .auto) .auto),((67/256:ℚ),.add (.minLeft .auto) .auto),((135/512:ℚ),.add (.minLeft .auto) .auto),((271/1024:ℚ),.add (.minLeft .auto) .auto),((543/2048:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minLeft .auto) .auto),((69/256:ℚ),.add (.minLeft .auto) .auto),((35/128:ℚ),.add (.minLeft .auto) .auto),((281/1024:ℚ),.add (.minLeft .auto) .auto),((141/512:ℚ),.add (.minLeft .auto) .auto),((71/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((15/64:ℚ)) block04=
    some ((71/256:ℚ),(4809139495289774745/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family01
#print axioms NoThreeLine.Phase15301Leaf75.Family01.block04_checked
