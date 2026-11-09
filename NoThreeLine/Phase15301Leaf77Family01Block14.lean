import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block14 : List (ℚ × BoundTrace) := [((2599/3182:ℚ),.add (.minLeft .exact) .exact),((18194/22273:ℚ),.add (.minLeft .exact) .exact),((26385/32258:ℚ),.add (.minLeft .exact) .exact),((105541/129031:ℚ),.add (.minLeft .exact) .exact),((105543/129029:ℚ),.add (.minLeft .exact) .exact),((26386/32257:ℚ),.add (.minLeft .exact) .exact),((10001/12034:ℚ),.add (.minLeft .exact) .exact),((2667/3209:ℚ),.add (.minLeft .exact) .exact),((40007/48133:ℚ),.add (.minLeft .exact) .exact),((3334/4011:ℚ),.add (.minLeft .exact) .exact),((20241/24322:ℚ),.add (.minLeft .exact) .exact),((20242/24321:ℚ),.add (.minLeft .exact) .exact),((22289/26370:ℚ),.add (.minLeft .exact) .exact),((22290/26369:ℚ),.add (.minLeft .exact) .exact),((26129/30722:ℚ),.add (.minLeft .exact) .exact),((104517/122887:ℚ),.add (.minLeft .exact) .exact),((104519/122885:ℚ),.add (.minLeft .exact) .exact),((26130/30721:ℚ),.add (.minLeft .exact) .exact),((12049/14082:ℚ),.add (.minLeft .exact) .exact),((12050/14081:ℚ),.add (.minLeft .exact) .exact),((24337/28418:ℚ),.add (.minLeft .exact) .exact),((24338/28417:ℚ),.add (.minLeft .exact) .exact),((26129/30466:ℚ),.add (.minLeft .exact) .exact),((1742/2031:ℚ),.add (.minLeft .exact) .exact)]
theorem block14_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((24338/30465:ℚ)) block14=
    some ((1742/2031:ℚ),(59328896968810027/288230376151711744:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block14_checked
