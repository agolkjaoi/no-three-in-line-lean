import NoThreeLine.Phase15301Group7275Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family20
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((43/128:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((29/64:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((21/64:ℚ)) block04=
    some ((3/4:ℚ),(8449871247467233223/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family20
#print axioms NoThreeLine.Phase15301Group7275.Family20.block04_checked
