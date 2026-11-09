import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block03 : List (ℚ × BoundTrace) := [((5906/30465:ℚ),.add (.minLeft .exact) .exact),((5905/28418:ℚ),.add (.minLeft .exact) .exact),((1227260121871/5906164066853:ℚ),.add (.minLeft .exact) .exact),((265205658068/1276250946385:ℚ),.add (.minLeft .exact) .exact),((23621/113671:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((23623/113669:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((5906/28417:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3857/18178:ℚ),.add (.minLeft .exact) .exact),((1286/6059:ℚ),.add (.minLeft .exact) .exact),((1181/5274:ℚ),.add (.minLeft .exact) .exact),((534270665651/2385455773499:ℚ),.add (.minLeft .exact) .exact),((5906/26369:ℚ),.add (.minLeft .exact) .exact),((67/294:ℚ),.add (.minLeft .exact) .exact),((126831191617/556525110689:ℚ),.add (.minLeft .exact) .exact),((7237/31751:ℚ),.add (.minLeft .exact) .exact),((127/557:ℚ),.add (.minLeft .exact) .exact),((1810/7937:ℚ),.add (.minLeft .exact) .exact),((3857/16130:ℚ),.add (.minLeft .exact) .exact),((15429/64519:ℚ),.add (.minLeft .exact) .exact),((36894405775/154261073257:ℚ),.add (.minLeft .exact) .exact),((15431/64517:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3858/16129:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((5905/24322:ℚ),.add (.minLeft .exact) .exact),((5906/24321:ℚ),.add (.minLeft .exact) .exact)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((567681682711/2928348192736:ℚ)) block03=
    some ((5906/24321:ℚ),(6091883423264221461/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block03_checked
