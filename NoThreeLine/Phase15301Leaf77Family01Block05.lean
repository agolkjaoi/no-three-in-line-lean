import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block05 : List (ℚ × BoundTrace) := [((684434397807/2227552659535:ℚ),.add (.minLeft .exact) .exact),((1810/5889:ℚ),.add (.minLeft .exact) .exact),((10001/32514:ℚ),.add (.minLeft .exact) .exact),((8001/26011:ℚ),.add (.minLeft .exact) .exact),((3637/11823:ℚ),.add (.minLeft .exact) .exact),((10002/32513:ℚ),.add (.minLeft .exact) .exact),((3857/12034:ℚ),.add (.minLeft .exact) .exact),((1286/4011:ℚ),.add (.minLeft .exact) .exact),((5905/18178:ℚ),.add (.minLeft .exact) .exact),((5906/18177:ℚ),.add (.minLeft .exact) .exact),((7953/24322:ℚ),.add (.minLeft .exact) .exact),((31813/97287:ℚ),.add (.minLeft .exact) .exact),((6363/19457:ℚ),.add (.minLeft .exact) .exact),((7954/24321:ℚ),.add (.minLeft .exact) .exact),((10001/30466:ℚ),.add (.minLeft .exact) .exact),((1905/5803:ℚ),.add (.minLeft .exact) .exact),((40007/121861:ℚ),.add (.minLeft .exact) .exact),((3334/10155:ℚ),.add (.minLeft .exact) .exact),((10001/28418:ℚ),.add (.minLeft .exact) .exact),((10002/28417:ℚ),.add (.minLeft .exact) .exact),((7953/22274:ℚ),.add (.minLeft .exact) .exact),((7954/22273:ℚ),.add (.minLeft .exact) .exact),((1181/3226:ℚ),.add (.minLeft .exact) .exact),((1817/4963:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1809/5890:ℚ)) block05=
    some ((1817/4963:ℚ),(1388572986556362921/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block05_checked
