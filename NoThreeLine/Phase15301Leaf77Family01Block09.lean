import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block09 : List (ℚ × BoundTrace) := [((2014/3767:ℚ),.add (.minLeft .exact) .exact),((12049/22274:ℚ),.add (.minLeft .exact) .exact),((48197/89095:ℚ),.add (.minLeft .exact) .exact),((48199/89093:ℚ),.add (.minLeft .exact) .exact),((12050/22273:ℚ),.add (.minLeft .exact) .exact),((10001/18178:ℚ),.add (.minLeft .exact) .exact),((4445/8079:ℚ),.add (.minLeft .exact) .exact),((40007/72709:ℚ),.add (.minLeft .exact) .exact),((3334/6059:ℚ),.add (.minLeft .exact) .exact),((18193/32514:ℚ),.add (.minLeft .exact) .exact),((18194/32513:ℚ),.add (.minLeft .exact) .exact),((2651/4694:ℚ),.add (.minLeft .exact) .exact),((2341711339412/4146255485083:ℚ),.add (.minLeft .exact) .exact),((31813/56327:ℚ),.add (.minLeft .exact) .exact),((2121/3755:ℚ),.add (.minLeft .exact) .exact),((7954/14081:ℚ),.add (.minLeft .exact) .exact),((16145/28418:ℚ),.add (.minLeft .exact) .exact),((64581/113671:ℚ),.add (.minLeft .exact) .exact),((64583/113669:ℚ),.add (.minLeft .exact) .exact),((16146/28417:ℚ),.add (.minLeft .exact) .exact),((14097/24322:ℚ),.add (.minLeft .exact) .exact),((56389/97287:ℚ),.add (.minLeft .exact) .exact),((56391/97285:ℚ),.add (.minLeft .exact) .exact),((14098/24321:ℚ),.add (.minLeft .exact) .exact)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((4699/8790:ℚ)) block09=
    some ((14098/24321:ℚ),(31322435072704615/144115188075855872:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block09_checked
