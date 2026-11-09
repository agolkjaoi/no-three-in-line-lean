import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block12 : List (ℚ × BoundTrace) := [((10002/14081:ℚ),.add (.minLeft .exact) .exact),((1557/2186:ℚ),.add (.minLeft .exact) .exact),((20242/28417:ℚ),.add (.minLeft .exact) .exact),((16145/22274:ℚ),.add (.minLeft .exact) .exact),((627/865:ℚ),.add (.minLeft .exact) .exact),((64583/89093:ℚ),.add (.minLeft .exact) .exact),((16146/22273:ℚ),.add (.minLeft .exact) .exact),((22289/30466:ℚ),.add (.minLeft .exact) .exact),((1486/2031:ℚ),.add (.minLeft .exact) .exact),((5905/7938:ℚ),.add (.minLeft .exact) .exact),((23621/31751:ℚ),.add (.minLeft .exact) .exact),((23623/31749:ℚ),.add (.minLeft .exact) .exact),((5906/7937:ℚ),.add (.minLeft .exact) .exact),((12049/16130:ℚ),.add (.minLeft .exact) .exact),((48197/64519:ℚ),.add (.minLeft .exact) .exact),((8033/10753:ℚ),.add (.minLeft .exact) .exact),((48199/64517:ℚ),.add (.minLeft .exact) .exact),((12050/16129:ℚ),.add (.minLeft .exact) .exact),((18193/24322:ℚ),.add (.minLeft .exact) .exact),((72773/97287:ℚ),.add (.minLeft .exact) .exact),((14555/19457:ℚ),.add (.minLeft .exact) .exact),((1654/2211:ℚ),.add (.minLeft .exact) .exact),((24337/32514:ℚ),.add (.minLeft .exact) .exact),((97349/130055:ℚ),.add (.minLeft .exact) .exact)]
theorem block12_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((10001/14082:ℚ)) block12=
    some ((97349/130055:ℚ),(3268459679902060341/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block12_checked
