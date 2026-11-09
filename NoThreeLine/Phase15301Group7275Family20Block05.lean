import NoThreeLine.Phase15301Group7275Family20Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family20
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((25/32:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3/4:ℚ)) block05=
    some (1,(1736080793631051931/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family20
#print axioms NoThreeLine.Phase15301Group7275.Family20.block05_checked
