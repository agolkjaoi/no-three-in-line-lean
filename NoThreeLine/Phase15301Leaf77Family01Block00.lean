import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block00 : List (ℚ × BoundTrace) := [((603/10838:ℚ),.add (.minLeft .exact) .exact),((7237/130055:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((2413/43351:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1810/32513:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1809/30466:ℚ),.add (.minLeft .exact) .exact),((7237/121863:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((7239/121861:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((362/6093:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1809/28418:ℚ),.add (.minLeft .exact) .exact),((206219429484/3238295060773:ℚ),.add (.minLeft .exact) .exact),((10/157:ℚ),.add (.minLeft .exact) .exact),((201/2930:ℚ),.add (.minLeft .exact) .exact),((7237/105479:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((139370992199/2031020589664:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((2413/35159:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1810/26369:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1809/24322:ℚ),.add (.minLeft .exact) .exact),((1810/24321:ℚ),.add (.minLeft .exact) .exact),((1809/22274:ℚ),.add (.minLeft .exact) .exact),((163684092959/2014961045199:ℚ),.add (.minLeft .exact) .exact),((1810/22273:ℚ),.add (.minLeft .exact) .exact),((603/6742:ℚ),.add (.minLeft .exact) .exact),((362/4045:ℚ),.add (.minLeft .exact) .exact),((1809/18178:ℚ),.add (.minLeft .exact) .exact)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((1809/18178:ℚ),(16458963035839605411/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block00_checked
