import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block10 : List (ℚ × BoundTrace) := [((5905/9986:ℚ),.add (.minLeft .exact) .exact),((5906/9985:ℚ),.add (.minLeft .exact) .exact),((12049/20226:ℚ),.add (.minLeft .exact) .exact),((482/809:ℚ),.add (.minLeft .exact) .exact),((18193/30466:ℚ),.add (.minLeft .exact) .exact),((72773/121863:ℚ),.add (.minLeft .exact) .exact),((72775/121861:ℚ),.add (.minLeft .exact) .exact),((18194/30465:ℚ),.add (.minLeft .exact) .exact),((3229/5274:ℚ),.add (.minLeft .exact) .exact),((5871/9589:ℚ),.add (.minLeft .exact) .exact),((64583/105477:ℚ),.add (.minLeft .exact) .exact),((16146/26369:ℚ),.add (.minLeft .exact) .exact),((10001/16130:ℚ),.add (.minLeft .exact) .exact),((10002/16129:ℚ),.add (.minLeft .exact) .exact),((6747/10838:ℚ),.add (.minLeft .exact) .exact),((16193/26011:ℚ),.add (.minLeft .exact) .exact),((26989/43351:ℚ),.add (.minLeft .exact) .exact),((20242/32513:ℚ),.add (.minLeft .exact) .exact),((381/602:ℚ),.add (.minLeft .exact) .exact),((1741069807813/2750676786720:ℚ),.add (.minLeft .exact) .exact),((14098/22273:ℚ),.add (.minLeft .exact) .exact),((18193/28418:ℚ),.add (.minLeft .exact) .exact),((18194/28417:ℚ),.add (.minLeft .exact) .exact),((203/310:ℚ),.add (.minLeft .exact) .exact)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((14098/24321:ℚ)) block10=
    some ((203/310:ℚ),(367211780113869333/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block10_checked
