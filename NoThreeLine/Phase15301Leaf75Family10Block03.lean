import NoThreeLine.Phase15301Leaf75Family10Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family10
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((3/4:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((11/16:ℚ)) block03=
    some (1,(495214149586313891/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family10
#print axioms NoThreeLine.Phase15301Leaf75.Family10.block03_checked
