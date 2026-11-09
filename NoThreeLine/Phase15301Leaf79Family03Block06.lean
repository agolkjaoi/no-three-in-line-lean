import NoThreeLine.Phase15301Leaf79Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family03
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((255/256:ℚ),.add (.minLeft .auto) .auto),((511/512:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((127/128:ℚ)) block06=
    some (1,(419268063657997019/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family03
#print axioms NoThreeLine.Phase15301Leaf79.Family03.block06_checked
