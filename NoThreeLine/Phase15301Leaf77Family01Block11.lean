import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block11 : List (ℚ × BoundTrace) := [((811276217393/1238792689525:ℚ),.add (.minLeft .exact) .exact),((5143/7853:ℚ),.add (.minLeft .exact) .exact),((15431/23557:ℚ),.add (.minLeft .exact) .exact),((1286/1963:ℚ),.add (.minLeft .exact) .exact),((723/1094:ℚ),.add (.minLeft .exact) .exact),((2230867851970/3375187581899:ℚ),.add (.minLeft .exact) .exact),((7954/12033:ℚ),.add (.minLeft .exact) .exact),((12049/18178:ℚ),.add (.minLeft .exact) .exact),((12050/18177:ℚ),.add (.minLeft .exact) .exact),((16145/24322:ℚ),.add (.minLeft .exact) .exact),((5382/8107:ℚ),.add (.minLeft .exact) .exact),((20241/30466:ℚ),.add (.minLeft .exact) .exact),((20242/30465:ℚ),.add (.minLeft .exact) .exact),((22289/32514:ℚ),.add (.minLeft .exact) .exact),((89157/130055:ℚ),.add (.minLeft .exact) .exact),((12737/18579:ℚ),.add (.minLeft .exact) .exact),((22290/32513:ℚ),.add (.minLeft .exact) .exact),((18193/26370:ℚ),.add (.minLeft .exact) .exact),((18194/26369:ℚ),.add (.minLeft .exact) .exact),((4699/6742:ℚ),.add (.minLeft .exact) .exact),((3317/4759:ℚ),.add (.minLeft .exact) .exact),((18797/26967:ℚ),.add (.minLeft .exact) .exact),((14098/20225:ℚ),.add (.minLeft .exact) .exact),((10001/14082:ℚ),.add (.minLeft .exact) .exact)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((203/310:ℚ)) block11=
    some ((10001/14082:ℚ),(1072755038493230069/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block11_checked
