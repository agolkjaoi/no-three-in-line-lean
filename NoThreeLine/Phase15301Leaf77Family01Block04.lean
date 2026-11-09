import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block04 : List (ℚ × BoundTrace) := [((2651/10838:ℚ),.add (.minLeft .exact) .exact),((31813/130055:ℚ),.add (.minLeft .exact) .exact),((1515/6193:ℚ),.add (.minLeft .exact) .exact),((194/793:ℚ),.add (.minLeft .exact) .exact),((7953/30466:ℚ),.add (.minLeft .exact) .exact),((31813/121863:ℚ),.add (.minLeft .exact) .exact),((31815/121861:ℚ),.add (.minLeft .exact) .exact),((7954/30465:ℚ),.add (.minLeft .exact) .exact),((5905/22274:ℚ),.add (.minLeft .exact) .exact),((23621/89095:ℚ),.add (.minLeft .exact) .exact),((619994760743/2338494666181:ℚ),.add (.minLeft .exact) .exact),((23623/89093:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((5906/22273:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3857/14082:ℚ),.add (.minLeft .exact) .exact),((15429/56327:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((15431/56325:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3858/14081:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((7953/28418:ℚ),.add (.minLeft .exact) .exact),((7954/28417:ℚ),.add (.minLeft .exact) .exact),((5905/20226:ℚ),.add (.minLeft .exact) .exact),((5906/20225:ℚ),.add (.minLeft .exact) .exact),((2651/8790:ℚ),.add (.minLeft .exact) .exact),((7954/26369:ℚ),.add (.minLeft .exact) .exact),((1809/5890:ℚ),.add (.minLeft .exact) .exact)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((5906/24321:ℚ)) block04=
    some ((1809/5890:ℚ),(1668753762485228705/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block04_checked
