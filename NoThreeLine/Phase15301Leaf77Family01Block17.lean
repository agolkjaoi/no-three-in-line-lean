import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block17 : List (ℚ × BoundTrace) := [((14/15:ℚ),.add (.minLeft .exact) .exact),((953/1019:ℚ),.add (.minLeft .exact) .exact),((955/1017:ℚ),.add (.minLeft .exact) .exact),((239/254:ℚ),.add (.minLeft .exact) .exact),((3487215/3609086:ℚ),.add (.minLeft .exact) .exact),((28177/28418:ℚ),.add (.minLeft .exact) .exact),((28178/28417:ℚ),.add (.minLeft .exact) .exact),(1,.add (.minLeft .exact) .exact)]
theorem block17_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((26386/28417:ℚ)) block17=
    some (1,(1089750928412886277/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block17_checked
