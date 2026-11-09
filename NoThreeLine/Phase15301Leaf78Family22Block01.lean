import NoThreeLine.Phase15301Leaf78Family22Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family22
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((3/32:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((5/64:ℚ)) block01=
    some (1,(1246990428152439603/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family22
#print axioms NoThreeLine.Phase15301Leaf78.Family22.block01_checked
