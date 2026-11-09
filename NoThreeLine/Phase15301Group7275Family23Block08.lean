import NoThreeLine.Phase15301Group7275Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family23
open AutoEnvelope

def block08 : List (ℚ × AutoTrace) := [((51/64:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((105/128:ℚ),.add (.minLeft .auto) .auto),((53/64:ℚ),.add (.minLeft .auto) .auto),((213/256:ℚ),.add (.minLeft .auto) .auto),((107/128:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minLeft .auto) .auto),((437/512:ℚ),.add (.minLeft .auto) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto),((55/64:ℚ),.add (.minLeft .auto) .auto),((111/128:ℚ),.add (.minLeft .auto) .auto),((223/256:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minLeft .auto) .auto),((227/256:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minLeft .auto) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((119/128:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((101/128:ℚ)) block08=
    some ((31/32:ℚ),(10886234461409385939/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family23
#print axioms NoThreeLine.Phase15301Group7275.Family23.block08_checked
