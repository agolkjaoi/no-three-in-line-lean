import NoThreeLine.Phase15301Leaf79Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family11
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((211/512:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((111/256:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((115/256:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((117/256:ℚ),.add (.minLeft .auto) .auto),((59/128:ℚ),.add (.minLeft .auto) .auto),((237/512:ℚ),.add (.minLeft .auto) .auto),((119/256:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((241/512:ℚ),.add (.minLeft .auto) .auto),((121/256:ℚ),.add (.minLeft .auto) .auto),((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((249/512:ℚ),.add (.minLeft .auto) .auto),((125/256:ℚ),.add (.minLeft .auto) .auto),((63/128:ℚ),.add (.minLeft .auto) .auto),((505/1024:ℚ),.add (.minLeft .auto) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((105/256:ℚ)) block05=
    some ((127/256:ℚ),(3654388485019972715/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family11
#print axioms NoThreeLine.Phase15301Leaf79.Family11.block05_checked
