import NoThreeLine.Phase15301Group7275Family22Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family22
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((5/8:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((9/16:ℚ)) block02=
    some (1,(145828640358513171/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family22
#print axioms NoThreeLine.Phase15301Group7275.Family22.block02_checked
