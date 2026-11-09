import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block07 : List (ℚ × BoundTrace) := [((5905/14082:ℚ),.add (.minLeft .exact) .exact),((729309535304/1739045450397:ℚ),.add (.minLeft .exact) .exact),((5906/14081:ℚ),.add (.minLeft .exact) .exact),((12049/28418:ℚ),.add (.minLeft .exact) .exact),((12050/28417:ℚ),.add (.minLeft .exact) .exact),((4699/10838:ℚ),.add (.minLeft .exact) .exact),((56389/130055:ℚ),.add (.minLeft .exact) .exact),((18797/43351:ℚ),.add (.minLeft .exact) .exact),((14098/32513:ℚ),.add (.minLeft .exact) .exact),((7953/18178:ℚ),.add (.minLeft .exact) .exact),((7954/18177:ℚ),.add (.minLeft .exact) .exact),((10001/22274:ℚ),.add (.minLeft .exact) .exact),((10002/22273:ℚ),.add (.minLeft .exact) .exact),((12049/26370:ℚ),.add (.minLeft .exact) .exact),((12050/26369:ℚ),.add (.minLeft .exact) .exact),((14097/30466:ℚ),.add (.minLeft .exact) .exact),((56389/121863:ℚ),.add (.minLeft .exact) .exact),((56391/121861:ℚ),.add (.minLeft .exact) .exact),((14098/30465:ℚ),.add (.minLeft .exact) .exact),((1809/3842:ℚ),.add (.minLeft .exact) .exact),((7237/15367:ℚ),.add (.minLeft .exact) .exact),((7239/15365:ℚ),.add (.minLeft .exact) .exact),((1810/3841:ℚ),.add (.minLeft .exact) .exact),((551/1134:ℚ),.add (.minLeft .exact) .exact)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3334/8107:ℚ)) block07=
    some ((551/1134:ℚ),(6234142383480975263/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block07_checked
