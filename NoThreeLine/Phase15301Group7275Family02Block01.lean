import NoThreeLine.Phase15301Group7275Family02Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family02
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((5/32:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1/8:ℚ)) block01=
    some (1,(769983417864824707/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family02
#print axioms NoThreeLine.Phase15301Group7275.Family02.block01_checked
