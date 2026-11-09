import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block08 : List (ℚ × BoundTrace) := [((3858/7937:ℚ),.add (.minLeft .exact) .exact),((5905/12034:ℚ),.add (.minLeft .exact) .exact),((23621/48135:ℚ),.add (.minLeft .exact) .exact),((23623/48133:ℚ),.add (.minLeft .exact) .exact),((5906/12033:ℚ),.add (.minLeft .exact) .exact),((7953/16130:ℚ),.add (.minLeft .exact) .exact),((7954/16129:ℚ),.add (.minLeft .exact) .exact),((10001/20226:ℚ),.add (.minLeft .exact) .exact),((10002/20225:ℚ),.add (.minLeft .exact) .exact),((12049/24322:ℚ),.add (.minLeft .exact) .exact),((48197/97287:ℚ),.add (.minLeft .exact) .exact),((48199/97285:ℚ),.add (.minLeft .exact) .exact),((12050/24321:ℚ),.add (.minLeft .exact) .exact),((14097/28418:ℚ),.add (.minLeft .exact) .exact),((56389/113671:ℚ),.add (.minLeft .exact) .exact),((56391/113669:ℚ),.add (.minLeft .exact) .exact),((14098/28417:ℚ),.add (.minLeft .exact) .exact),((16145/32514:ℚ),.add (.minLeft .exact) .exact),((3399/6845:ℚ),.add (.minLeft .exact) .exact),((64583/130053:ℚ),.add (.minLeft .exact) .exact),((1242/2501:ℚ),.add (.minLeft .exact) .exact),((16145/30466:ℚ),.add (.minLeft .exact) .exact),((1794/3385:ℚ),.add (.minLeft .exact) .exact),((4699/8790:ℚ),.add (.minLeft .exact) .exact)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((551/1134:ℚ)) block08=
    some ((4699/8790:ℚ),(4201741923048709459/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block08_checked
