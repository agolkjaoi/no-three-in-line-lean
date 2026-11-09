import NoThreeLine.Phase15301Leaf78Family02Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family02
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((5/8:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1/2:ℚ)) block01=
    some (1,(127758098968708893/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family02
#print axioms NoThreeLine.Phase15301Leaf78.Family02.block01_checked
