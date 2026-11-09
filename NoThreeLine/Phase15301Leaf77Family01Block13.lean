import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block13 : List (ℚ × BoundTrace) := [((97351/130053:ℚ),.add (.minLeft .exact) .exact),((24338/32513:ℚ),.add (.minLeft .exact) .exact),((24337/32258:ℚ),.add (.minLeft .exact) .exact),((24338/32257:ℚ),.add (.minLeft .exact) .exact),((2249/2930:ℚ),.add (.minLeft .exact) .exact),((80965/105479:ℚ),.add (.minLeft .exact) .exact),((26989/35159:ℚ),.add (.minLeft .exact) .exact),((20242/26369:ℚ),.add (.minLeft .exact) .exact),((14097/18178:ℚ),.add (.minLeft .exact) .exact),((14098/18177:ℚ),.add (.minLeft .exact) .exact),((22289/28418:ℚ),.add (.minLeft .exact) .exact),((89157/113671:ℚ),.add (.minLeft .exact) .exact),((89159/113669:ℚ),.add (.minLeft .exact) .exact),((22290/28417:ℚ),.add (.minLeft .exact) .exact),((7953/9986:ℚ),.add (.minLeft .exact) .exact),((31813/39943:ℚ),.add (.minLeft .exact) .exact),((31815/39941:ℚ),.add (.minLeft .exact) .exact),((7954/9985:ℚ),.add (.minLeft .exact) .exact),((16145/20226:ℚ),.add (.minLeft .exact) .exact),((16146/20225:ℚ),.add (.minLeft .exact) .exact),((24337/30466:ℚ),.add (.minLeft .exact) .exact),((13907/17409:ℚ),.add (.minLeft .exact) .exact),((97351/121861:ℚ),.add (.minLeft .exact) .exact),((24338/30465:ℚ),.add (.minLeft .exact) .exact)]
theorem block13_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((97349/130055:ℚ)) block13=
    some ((24338/30465:ℚ),(2027408968783653971/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block13_checked
