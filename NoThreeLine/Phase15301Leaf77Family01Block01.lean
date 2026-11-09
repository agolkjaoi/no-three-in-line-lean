import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block01 : List (ℚ × BoundTrace) := [((7237/72711:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((408079462789/4099759855853:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((7239/72709:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1810/18177:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1809/16130:ℚ),.add (.minLeft .exact) .exact),((1810/16129:ℚ),.add (.minLeft .exact) .exact),((3857/32514:ℚ),.add (.minLeft .exact) .exact),((417/3515:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((15431/130053:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3858/32513:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3857/30466:ℚ),.add (.minLeft .exact) .exact),((5143/40621:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((15431/121861:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1286/10155:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((603/4694:ℚ),.add (.minLeft .exact) .exact),((1810/14081:ℚ),.add (.minLeft .exact) .exact),((3857/28418:ℚ),.add (.minLeft .exact) .exact),((3858/28417:ℚ),.add (.minLeft .exact) .exact),((3857/26370:ℚ),.add (.minLeft .exact) .exact),((13225472331/90406164911:ℚ),.add (.minLeft .exact) .exact),((3858/26369:ℚ),.add (.minLeft .exact) .exact),((1809/12034:ℚ),.add (.minLeft .exact) .exact),((170321597343/1133018087819:ℚ),.add (.minLeft .exact) .exact),((86995626943/578712734170:ℚ),.add (.minLeft .exact) .exact)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1809/18178:ℚ)) block01=
    some ((86995626943/578712734170:ℚ),(7557539858323874645/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block01_checked
