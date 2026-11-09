import NoThreeLine.Phase15301Group7275Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family23
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((109/256:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minLeft .auto) .auto),((111/256:ℚ),.add (.minLeft .auto) .auto),((223/512:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((117/256:ℚ),.add (.minLeft .auto) .auto),((59/128:ℚ),.add (.minLeft .auto) .auto),((119/256:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((125/256:ℚ),.add (.minLeft .auto) .auto),((63/128:ℚ),.add (.minLeft .auto) .auto),((505/1024:ℚ),.add (.minLeft .auto) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((65/128:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((67/128:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((273/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((217/512:ℚ)) block05=
    some ((273/512:ℚ),(2327088962889939487/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family23
#print axioms NoThreeLine.Phase15301Group7275.Family23.block05_checked
