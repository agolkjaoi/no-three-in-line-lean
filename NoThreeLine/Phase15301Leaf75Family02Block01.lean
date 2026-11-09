import NoThreeLine.Phase15301Leaf75Family02Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family02
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [(1,.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((15/16:ℚ)) block01=
    some (1,(75246337833948941/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family02
#print axioms NoThreeLine.Phase15301Leaf75.Family02.block01_checked
