import NoThreeLine.Phase15301Leaf79Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family01
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((109/256:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minLeft .auto) .auto),((111/256:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((115/256:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((117/256:ℚ),.add (.minLeft .auto) .auto),((59/128:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((241/512:ℚ),.add (.minLeft .auto) .auto),((121/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((249/512:ℚ),.add (.minLeft .auto) .auto),((125/256:ℚ),.add (.minLeft .auto) .auto),((251/512:ℚ),.add (.minLeft .auto) .auto),((63/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((507/1024:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((67/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((217/512:ℚ)) block06=
    some ((67/128:ℚ),(4205070739591602029/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family01
#print axioms NoThreeLine.Phase15301Leaf79.Family01.block06_checked
