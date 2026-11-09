import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block02 : List (ℚ × BoundTrace) := [((7237/48135:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((57/379:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1810/12033:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3857/24322:ℚ),.add (.minLeft .exact) .exact),((5143/32429:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((15431/97285:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((1286/8107:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((551/3182:ℚ),.add (.minLeft .exact) .exact),((3858/22273:ℚ),.add (.minLeft .exact) .exact),((1809/9986:ℚ),.add (.minLeft .exact) .exact),((142661942104/787146789531:ℚ),.add (.minLeft .exact) .exact),((362/1997:ℚ),.add (.minLeft .exact) .exact),((5905/32514:ℚ),.add (.minLeft .exact) .exact),((23621/130055:ℚ),.add (.minLeft .exact) .exact),((203695085321/1121440730180:ℚ),.add (.minLeft .exact) .exact),((23623/130053:ℚ),.add (.minLeft .exact) .exact),((5906/32513:ℚ),.add (.minLeft .exact) .exact),((3857/20226:ℚ),.add (.minLeft .exact) .exact),((15429/80903:ℚ),.add (.minLeft .exact) .exact),((540253857315/2832653041873:ℚ),.add (.minLeft .exact) .exact),((15431/80901:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((3858/20225:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((5905/30466:ℚ),.add (.minLeft .exact) .exact),((567681682711/2928348192736:ℚ),.add (.minLeft .exact) .exact)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((86995626943/578712734170:ℚ)) block02=
    some ((567681682711/2928348192736:ℚ),(5709352436627273737/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block02_checked
